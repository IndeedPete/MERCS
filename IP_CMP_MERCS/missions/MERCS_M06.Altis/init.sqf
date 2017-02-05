IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Burried = 0;
IP_ToBurry = 3;

// Functions
_bury = {
	_unit = _this select 0;
	_pos = getPos _unit;
	_dir = getDir _unit;
	
	["IP_BlackScreen", false] call BIS_fnc_blackOut;
	sleep 0.5;
	
	deleteVehicle _unit;
	_grave = "Land_Grave_dirt_F" createVehicle _pos;
	_grave setDir _dir;
	_grave setPos _pos;
	skipTime 0.5;
	IP_Burried = IP_Burried + 1;
	
	sleep 0.5;
	["IP_BlackScreen"] call BIS_fnc_blackIn;
};

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Templar"];

// Buddy Setup
if (!(isNil "IP_MERCS_BuddyDied") && {IP_MERCS_BuddyDied}) then {
	[] call IP_fnc_buddyInit;
	removeAllWeapons IP_Buddy;
	[IP_Buddy] call IP_fnc_deadBody;
	IP_Buddy addAction ["Bury", _bury];
} else {
	deleteVehicle IP_Buddy;
	IP_ToBurry = IP_ToBurry - 1;
};

// HQ
[IP_Lord, "lord", "command"] call IP_fnc_applyTemplate;

// Crashsite
IP_Heli2 setObjectTexture [0, "Campaigns\IP_CMP_MERCS\txt\heli_light_02_ext_coION.paa"];
{IP_Heli2 animate [_x, 1]} forEach ["dvere1", "dvere1_posunZ", "dvere2"];
IP_Heli2 setDamage 0.9;
[(getPos IP_Heli2), "SMOKE_BIG"] call IP_fnc_createFireEffect;
clearWeaponCargo IP_Heli2;
clearMagazineCargo IP_Heli2;
clearItemCargo IP_Heli2;
clearBackpackCargo IP_Heli2;

IP_Pilot2 setIdentity "pilot";
removeBackpack IP_Pilot2;
IP_Pilot2 setObjectTexture [0, "Campaigns\IP_CMP_MERCS\txt\coveralls_black_coION.paa"];
[IP_Pilot2] call IP_fnc_deadBody;
IP_Pilot2 addAction ["Bury", _bury];

removeBackpack IP_CoPilot2;
[IP_CoPilot2] call IP_fnc_deadBody;
IP_CoPilot2 addAction ["Bury", _bury];

// Briefing
player createDiaryRecord ["Diary", ["Executive Briefing", "Our quick withdrawal from the crash site left traces, assets and dead contractors for anybody to find. Insert, locate and then clean up the crash site. Destroy what's left of the helo and bury the fallen contractors.<br/><br/>Executive on Site<br/>Ian McMillian"]];
[player, "tClean", ["Destroy what's left of the transport helicopter and bury the dead ION contractors at the <marker name=""mClean"">Crashsite</marker>!", "Cleanup", "Crashsite"], "mClean", true, 1] call BIS_fnc_taskCreate;

// All Units
{
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "Rogues"];
		[_x] call IP_fnc_createMerc;
	};
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];
	};
} forEach (allUnits - [IP_Main]);

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;