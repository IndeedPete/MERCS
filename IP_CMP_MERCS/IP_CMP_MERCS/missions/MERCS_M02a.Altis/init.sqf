IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Cars = [IP_Car1, IP_Car2, IP_Car3, IP_Car4];
IP_AAFCalled = false;
IP_AAFSupport = true;

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Checkpoint Charlie"];

// Buddy Setup
[] call IP_fnc_buddyInit;

// Team Setup - Moved to mission start
//[] call IP_fnc_spawnTeam;

// Officer Setup
IP_Officer allowDamage false;
(group IP_Officer) setGroupID ["Gamma-1"];
IP_Officer setVariable ["IP_LiveFeed", true];

// Briefing
["The CLIENT requests additional manpower to guard his important checkpoints and structures. The CONTRACTOR is obligated to deploy at the CLIENT's 'Checkpoint Charlie' and guard this strategic important position. Furthermore, the CONTRACTOR has to check incoming unknown vehicles.<br/><br/>This check includes: <br/><br/>- determining and verifying the identities of drivers and passengers <br/>- searching the vehicle and additional cargo for dangerous substances <br/>- questioning for start and destination of the ride.<br/><br/>In case of: <br/><br/>- the driver and/or passengers carrying firearms, ammunition and/or explosives<br/>- the cargo containing firearms, ammunition and/or explosives<br/>- an active arrest warrant against the driver and/or one of the passengers<br/>- other suspicious behaviour<br/><br/>driving on must be denied. In one of the prior stated cases or in a case of defence the CONTRACTOR may request support at the nearest CLIENT base. The CONTRACTOR must not -under any circumstances- leave the checkpoint to hostile forces."] call IP_fnc_createBriefing;
[player, "tGuard", ["Guard the <marker name=""mCheckpoint"">AAF Checkpoint Charlie</marker>! Check all passing vehicles!", "Guard Checkpoint", "Checkpoint Charlie"], "mCheckpoint", true, 1] call BIS_fnc_taskCreate;	

// Music
[] call BIS_fnc_jukebox;

// Cars setup
IP_CarsGo = 0;
{
	_x allowDamage false;
	[_x] call IP_fnc_track;
	(driver _x) addEventHandler ["Killed", {
		_unit = _this select 0;
		_vehicle = vehicle _unit;
		_vehicle lock 0;
		[_unit, "carOpener"] call IP_fnc_removeConversation;
		_nul = [IP_Buddy, "Really?! Was that necessary? Now we have to get the car out of the way and hide the body!", "DIRECT"] spawn IP_fnc_simpleSentence;
		_nul = _unit spawn {
			waitUntil {!(triggerActivated trgCarWaiting) && (vehicle player == player)};
			IP_CarPassed = true;
			sleep 2;
			deleteVehicle _this;
		};
	}];
	[(driver _x), "carOpener", _x] call IP_fnc_addConversation;
} forEach IP_Cars;

// All Units
{
	if  (side _x == resistance) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				player addRating -999999;
				//West setFriend [Resistance, 0];
				if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
			};
		}];
	};
} forEach allUnits;

IP_BadGuy = floor(random(count IP_Cars));
_badGuy = IP_Cars select IP_BadGuy;
_weapon = ["hgun_P07_F", "hgun_Rook40_F", "hgun_ACPC2_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_02_F"] call BIS_fnc_selectRandom;
_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
_badGuy addWeaponCargo [_weapon, 1];
_badGuy addMagazineCargo [_magazine, 3];
_badGuy addMagazineCargo ["DemoCharge_Remote_Mag", 1];