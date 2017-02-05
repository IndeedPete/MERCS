IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_DayTime = dayTime + 1.25;
if (IP_DayTime > 24) then {IP_DayTime = IP_DayTime - 24};
IP_SecurityDetail = [IP_SquadLeader, IP_Grenadier, IP_Autorifleman];

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;
(unitBackpack IP_Buddy) addMagazineCargo ["ClaymoreDirectionalMine_Remote_Mag", 4];

// UAV Backpack
_backpack = "B_UAV_01_backpack_F" createVehicle (getPos IP_Car2);
_wh = nearestObject [_backpack, "GroundWeaponHolder"];
_wh attachTo [IP_Car2, [1.6, -1.7, -1.1]];
_wh setVectorDirAndUp [[0, 0, -1], [3, 0, 0]];

// Car Setup
IP_Car spawn {
	sleep 1; 
	_this setObjectTexture [0, "\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa"];
}; 
IP_Car addEventHandler [
	"HandleDamage",{
		_unit = _this select 0;
		_selection = _this select 1;
		_passedDamage = _this select 2;
		_source = _this select 3;
		_projectile = _this select 4;
		
		_oldDamage = damage _unit;
		
		_return = _oldDamage + ((_passedDamage - _oldDamage) / 10);
		if (IP_TESTMODE) then {hint format ["Target: %1\nSelection: %2\nDamage: %3\nReduced Damage: %4\nHealth: %5", _unit, _selection, _passedDamage, _return, (1 - (damage _unit))];};
		
		_return
	}
];

// OPFOR / VIP Setup
IP_HVI setIdentity "hvi";
IP_HVI allowFleeing 0;
IP_HVI setVariable ["IP_LiveFeed", true];
IP_Grenadier assignAsDriver IP_Car;
IP_Grenadier moveInDriver IP_Car;
{_x assignAsCargo IP_Car} forEach [IP_SquadLeader, IP_Autorifleman, IP_HVI];
IP_SquadLeader moveInCargo [IP_Car, 0];
IP_HVI moveInCargo [IP_Car, 1];
IP_Autorifleman moveInCargo [IP_Car, 2];
[IP_SquadLeader] call IP_fnc_track;
[IP_HVI] call IP_fnc_track;
[IP_HVI, IP_SquadLeader, {true}, {!alive IP_SquadLeader}] spawn IP_fnc_follow;

// Briefing
_time = [(dayTime + 1), "HH:MM"] call BIS_fnc_timeToString;
_commander = getText(missionConfigFile >> "CfgIdentities" >> "commander" >> "name");
_text = format ["According to our information the HVI travels in a black SUV guarded by at least three PMCs. His first appointment is at the <marker name=""mRadar"">AAF Radar Station</marker> at precisely %1. He will stay there for around 15 minutes and then move on to a <marker name=""mMilitary"">Military Base</marker> where he will also spend around 15 minutes. Finally, his security detail will take him to the <marker name=""mAirfield"">Molos Airfield</marker> where he will be brought off country. Attack the HVI on the road between his stops. Engaging the AAF bases head on is bloody suicide and the airfield is guarded by Black Arrow PMCs.<br/><br/>Executive on Site<br/>%2", _time, _commander];
player createDiaryRecord ["Diary", ["HVI Schedule", _text]];
[] call IP_fnc_createBriefing;
[player, "tHVI", ["The HVI must stay alive!", "HVI", ""], nil, true, 1] call BIS_fnc_taskCreate;	
[player, "tSecurity", ["Eliminate the HVI's security detail!", "Eliminate Security Detail", ""], nil, true, 2] call BIS_fnc_taskCreate;

// All Units - Post init to affect units spawned by site modules
[] spawn {
	waitUntil {time > 0};
	{
		switch (side _x) do {
			case resistance: {
				_x setVariable ["IP_Faction", "AltisMil"];
				if ((dayTime > 7) AND (dayTime < 19)) then {_x unassignItem "NVGoggles_INDEP"};
			};
		
			case east: {
				_x setVariable ["IP_Faction", "BlackArrow"];
				[_x] call IP_fnc_createMerc;
				_x allowFleeing 0;
			};
			
			default {};
		};
	} forEach (allUnits - [IP_Buddy, IP_Main]);
};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;