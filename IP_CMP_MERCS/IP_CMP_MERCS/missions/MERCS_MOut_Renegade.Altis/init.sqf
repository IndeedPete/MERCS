IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Functions
IP_fnc_m_ambientLightning = {
	_GLs = [IP_GL1, IP_GL2, IP_GL3, IP_GL4, IP_GL5, IP_GL6, IP_GL7, IP_GL8, IP_GL9, IP_GL10];
	
	while {true} do {
		_GL = _GLs call BIS_fnc_selectRandom;
		[_GL, nil, true] spawn BIS_fnc_moduleLightning;
		sleep (1 + random 9);
	};
};

// Adjust Mission Date
_date = date;
_date set [1, ((_date select 1) + 1)]; // plus one month
_date set [2, 20]; // fixed on 20th day of month
_date set [3, 4]; // 0500
_date set [4, 30]; // 0500
setDate _date;

// Main Setup
[] call IP_fnc_mainInit;

// Shop Setup
[] call IP_fnc_shopInit;

// Buddy Setup
[] call IP_fnc_buddyInit;
//[IP_Buddy, ""] call IP_fnc_buddyEquipment;
IP_Buddy allowDamage true;

// Commander Setup
IP_Commander setIdentity "commander";
IP_Commander setVariable ["IP_LiveFeed", true];
IP_Commander setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\commanderAvatar.jpg"];
IP_Commander setVariable ["IP_Faction", "ION"];
[IP_Commander, "Executive"] call BIS_fnc_setUnitInsignia;
[IP_Commander, 5] call IP_fnc_setSkill;
[IP_Commander] call IP_fnc_track;

// Merc Setup
IP_Heli allowDamage false;
{
	_x setVariable ["IP_Faction", "ION"];
	[_x, false, [true, true], false] call IP_fnc_createMerc;
} forEach allUnits - [IP_Main, IP_Buddy, IP_Commander] - (units group IP_Heli);
{_x moveInCargo IP_Heli} forEach (units group IP_Commander);

// Music
[] call BIS_fnc_jukebox;

// Hide Buddy Marker Trick
if (!IP_TESTMODE) then {
	[] spawn {
		waitUntil{time > 0};
		sleep 10;
		{_x setMarkerAlpha 0} forEach allMapMarkers;
	};
};