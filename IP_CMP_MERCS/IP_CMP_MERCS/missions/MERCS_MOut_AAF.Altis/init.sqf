IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Functions
call(compile(preprocessFileLineNumbers "fnc\HazardAreas.sqf"));

// Scenes
IP_scn_credits = compile(preprocessFileLineNumbers "IP_CMP_MERCS\IP_CMP_MERCS\scn\credits.sqf");

// Wetter
// SetWind Je nach ground zero
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1,0.6,0,[0,0,0,0],[3,3,1,0.75],[2.5,2.5,-2.75,0]];
"colorCorrections" ppEffectCommit 0;

// Main Setup
[] call IP_fnc_mainInit;

// Shop Setup
[] call IP_fnc_shopInit;

// Hacker
[IP_Hacker, "hacker", "hub"] call IP_fnc_applyTemplate;
IP_Hacker setUnitPos "MIDDLE";
IP_Hacker setBehaviour "SAFE";
if (!IP_TESTMODE) then {IP_Hacker allowDamage true};
[IP_Hacker, 0.07, 1, false] spawn BIS_fnc_sandStorm;
[IP_Hacker] call SURF_fnc_dangerousAreas;

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;

// British Knights Setup
[IP_Captain, "captain", "combat"] call IP_fnc_applyTemplate;
[IP_Medic, "medic", "combat"] call IP_fnc_applyTemplate;

// Scientist
[IP_Scientist, "scientist"] call IP_fnc_applyTemplate;

// All Dead Bodies
{[_x] call IP_fnc_deadBody} forEach [IP_Commander, IP_Captain, IP_Medic, IP_Scientist];

// Trafficker Setup
[IP_Trafficker, "trafficker"] call IP_fnc_applyTemplate;
[IP_Trafficker, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;

// Flickering Light
[[8193.75,22557.9,0.00110626], "Land_LampShabby_F"] spawn IP_fnc_streetLightsBlinking;

// Marker
{_x setMarkerAlpha 0} forEach ["mPatrol1", "mPatrol2", "mPatrol3"];

// Random Patrols
{
	[_x, west, [1, 3], [1, 3], ["GUE"]] call IP_fnc_randomPatrolArea;
	[_x, east, [3, 6], [2, 4], ["GUE"]] call IP_fnc_randomPatrolArea;
} forEach ["mPatrol1", "mPatrol2", "mPatrol3"];

// All Units
[] spawn {
	waitUntil {time > 0};
	{
		if ((side _x) == east) then {
			_x setVariable ["IP_Faction", "Rogues"];
			[_x] call IP_fnc_createMerc;
		};
	} forEach (allUnits - [IP_Trafficker]);
};

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Dead Bodies
["mBlacklist6", civilian, [30, 50], ["STD"]] spawn IP_fnc_randomDeadBodiesArea;

// Ambient Civilians
[] call IP_fnc_ambientLife;