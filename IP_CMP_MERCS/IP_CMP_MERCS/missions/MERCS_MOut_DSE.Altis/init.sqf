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

// Scenes
IP_scn_credits = compile(preprocessFileLineNumbers "IP_CMP_MERCS\IP_CMP_MERCS\scn\credits.sqf");

// Adjust Date
private "_date";
_date = date;
_date set [3, 23];
_date set [4, 0];
if ((date select 3) > 5) then {_date set [2, ((date select 2) + 1)]};
setDate _date;

// Wetter
["", ["FOGGY", "MEDIUMFOG"]] spawn IP_fnc_setWeather;

// Main Setup
[] call IP_fnc_mainInit;
IP_Main setCaptive true;

// Shop Setup
[] call IP_fnc_shopInit;

// Agent Setup
[IP_Agent, "agent", "combat"] call IP_fnc_applyTemplate;
removeGoggles IP_Agent;

// Rival Setup
IP_Rival setPos [21959.7,21013.6,5.83053];
IP_Rival setDir 220;
[IP_Rival, "rival"] call IP_fnc_applyTemplate;
IP_Rival linkItem "NVGoggles";
IP_Rival setUnitPos "UP";
IP_Rival allowDamage true;
IP_Rival enableSimulation false;
IP_Rival hideObject true;

// Whiteboard
IP_Whiteboard setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\MOut_DSE_WB1.paa"];

// Flickering Lights
[[22001.1,21050,0.00143814], "Lamps_base_F"] spawn IP_fnc_streetLightsBlinking;
[[21924.3,20976.9,-0.00172043], "Lamps_base_F"] spawn IP_fnc_streetLightsBlinking;

// All Units
{
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "BlackArrow"];
		[_x] call IP_fnc_createMerc;
		_x enableSimulation false;
		_x hideObject true;
		_x unlinkItem "NVGoggles_INDEP";
		_x unlinkItem "NVGoggles_OPFOR";
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "ForceOn";
	};
} forEach (allUnits - [IP_Main, IP_Rival]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};