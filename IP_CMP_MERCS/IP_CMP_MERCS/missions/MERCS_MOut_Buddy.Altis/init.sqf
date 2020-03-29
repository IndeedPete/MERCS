IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Scenes
IP_scn_credits = compile(preprocessFileLineNumbers "IP_CMP_MERCS\IP_CMP_MERCS\scn\credits.sqf");

// Adjust Date
private "_date";
_date = date;
_date set [3, 10];
_date set [4, 0];
if ((date select 3) > 5) then {_date set [2, ((date select 2) + 1)]};
setDate _date;

// Wetter
["", ["CLEAR", "OVERCAST"]] spawn IP_fnc_setWeather;

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;
IP_Buddy forceWalk true;
IP_Buddy addGoggles "G_Aviator";
//if (!IP_TESTMODE) then {IP_Buddy allowDamage true};

// Boat
IP_Boat allowDamage false;

// Trafficker Setup
[IP_Trafficker, "trafficker"] call IP_fnc_applyTemplate;
[IP_Trafficker, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;
(group IP_Trafficker) allowFleeing 0;
/*
IP_Trafficker addEventHandler ["HandleDamage", {
		_unit = _this select 0;
		_damage = _this select 2;	
		
		//_unit setDamage 0.7;
		_unit allowDamage false;
		_unit setCaptive true;
		_unit removeAllEventhandlers "HandleDamage";
		[_unit, "PRONE_INJURED"] call BIS_fnc_ambientAnim;
		
		0
	}
];
IP_Trafficker addEventHandler ["Killed", {
		[] spawn {
			[IP_Main, "Now. Now we're done.", "DIRECT", 1] call IP_fnc_simpleSentence;
			[IP_Buddy, "Served him right.", "DIRECT", 1] call IP_fnc_simpleSentence;
		};
	}
];
*/

// Marker
"mNikos" setMarkerAlpha 0;

// All Units
{
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "Rogues"];
		[_x] call IP_fnc_createMerc;
	};
} forEach (allUnits - [IP_Main, IP_Buddy, IP_Trafficker]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;