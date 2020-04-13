IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_RivalGroup = group IP_Rival;

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Razor"];

// Buddy Setup
[] call IP_fnc_buddyInit;

// Shop Setup
[] call IP_fnc_shopInit;

// Rival Setup
IP_Rival allowDamage false;
IP_Rival setIdentity "rival";
IP_Rival setVariable ["IP_LiveFeed", true];
IP_Rival setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\rivalAvatar.jpg"];
IP_Rival setVariable ["IP_Faction", "BlackArrow"];
removeAllWeapons IP_Rival;
removeHeadgear IP_Rival;
removeVest IP_Rival;
removeUniform IP_Rival;
IP_Rival forceAddUniform "U_O_CombatUniform_ocamo";
IP_Rival setObjectMaterial [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothingMOD.rvmat"];
IP_Rival setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing_rus_coBA.paa"];
IP_Rival addVest "V_PlateCarrier1_blk";
IP_Rival addItem "FirstAidKit";
IP_Rival addMagazines ["9Rnd_45ACP_Mag", 3];
IP_Rival addWeapon "hgun_ACPC2_F";
IP_Rival addMagazines ["150Rnd_762x54_Box_Tracer", 3];
IP_Rival addMagazines ["handGrenade", 2];
IP_Rival addMagazine "SmokeShell";
IP_Rival addMagazine "SmokeShellGreen";
IP_Rival addWeapon "LMG_Zafir_pointer_F";
IP_Rival addPrimaryWeaponItem "optic_Nightstalker";
IP_Rival selectWeapon (primaryWeapon IP_Rival);
[IP_Rival] call IP_fnc_automaticRearm;
if (IP_TESTMODE) then {[IP_Rival] call IP_fnc_track};
(group IP_Rival) setGroupID ["Sabre"];
{_x stop true} forEach (units IP_RivalGroup);
[] spawn {
	waitUntil {!isNil "IP_IntroDone"};
	if ((dayTime < 7) OR (dayTime > 19)) then {IP_Rival linkItem "NVGoggles"};
};

// Officer Setup
IP_Officer setVariable ["IP_LiveFeed", true];
(group IP_Officer) setGroupID ["Kappa-1"];
[] spawn {
	waitUntil {time > 0};
	sleep 0.5;
	//[IP_Officer, 0.83] call BIS_fnc_setHeight;
	[IP_Officer, "LEAN_ON_TABLE", "ASIS", IP_Arr] call BIS_fnc_ambientAnim;
};

// Mortar
(group IP_Mortar) setGroupID ["Sigma-3-2"];

// Briefing
["The FIA took control of one of the CLIENTS's armour depots. The CLIENT requests support to re-take the facility. The CONTRACTOR is obligated to deploy at the AOR and follow the CLIENT's orders.<br/>FIA controlled armour may be engaged and immobilised or incapacitated. Destruction of the CLIENT's property should only happen if necessary."] call IP_fnc_createBriefing;
[player, "tDepot", ["Secure the <marker name=""mDepot"">Tank Depot</marker>!", "Secure Tank Depot", "Tank Depot"], "mDepot", true, 1, true, "attack"] call BIS_fnc_taskCreate;	

// Tank Setup - To Prevent player from losing rating.
{
	_x addEventHandler ["Killed", {
		_killer = _this select 1;
		_killer addRating 10000;
	}];
} forEach [/*IP_Tank1,*/ IP_Tank2, IP_Tank3];

// All Units
{
	if  (side _x == west) then {
		_x setVariable ["IP_Faction", "BlackArrow"];
		[_x, 5, false, [((dayTime < 7) OR (dayTime > 19)), true]] call IP_fnc_createMerc;
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				player addRating -999999;
				//West setFriend [Resistance, 0];
				if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
			};
		}];
	};
	
	if  (side _x == resistance) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				player addRating -999999;
				//West setFriend [Resistance, 0];
				if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
			};
		}];
		if ((dayTime > 7) AND (dayTime < 19)) then {_x unassignItem "NVGoggles_INDEP"};
	};
	
	if  (side _x == east) then {
		_x setVariable ["IP_Faction", "FIA"];
		if ((dayTime < 7) OR (dayTime > 19)) then {
			_x addPrimaryWeaponItem "acc_flashlight";
			_x enableGunLights "forceOn";
		};
	};
} forEach (allUnits - [IP_Buddy, IP_Main, IP_Rival, /*IP_Tank1,*/ IP_Tank2, IP_Tank3]);

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
//[] call IP_fnc_ambientLife;