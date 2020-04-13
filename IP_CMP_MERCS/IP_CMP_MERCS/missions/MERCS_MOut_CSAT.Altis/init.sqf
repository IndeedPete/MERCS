IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_ContactsAlive = if (isNil "IP_MERCS_ContactsAlive") then {[true, true, [true, true], true]} else {IP_MERCS_ContactsAlive}; // AAF - CSAT - DSE (Agent, Rival) - EF 
IP_Weather = if (isNil "IP_MERCS_Weather") then {["CLEAR", "SUNNY"]} else {IP_MERCS_Weather};
//IP_MainGroup = group IP_EFOfficer;

// Scenes
IP_scn_credits = compile(preprocessFileLineNumbers "IP_CMP_MERCS\IP_CMP_MERCS\scn\credits.sqf");

// Main Setup
[] call IP_fnc_mainInit;
IP_Main setCaptive true;

// Shop Setup
[] call IP_fnc_shopInit;

// EF Officer Setup
if (IP_ContactsAlive select 3) then {
	[IP_EFOfficer, "EFOfficer"] call IP_fnc_applyTemplate;
	IP_EFOfficerGroup = group IP_EFOfficer; 
} else {
	{deleteVehicle _x} forEach (units(group IP_EFOfficer));
};

// CSATOfficer
[IP_CSATOfficer, "CSATOfficer", "combat"] call IP_fnc_applyTemplate;
[IP_CSATOfficer] call IP_fnc_automaticRearm;
IP_CSATOfficer allowDamage false;
IP_CSATOfficer setCaptive true;
(group IP_CSATOfficer) allowFleeing 0;

// HQ Dummy
IP_HQ allowDamage false;
IP_HQ enableSimulation false;
IP_HQ hideObject true;
IP_HQ setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\CSAT_Flag.jpg"];
(group IP_HQ) setGroupID ["Sultan"];

// Device Truck
IP_DeviceTruck allowDamage false;
IP_DeviceTruck setCaptive true;

// All Units
{
	_x enableIRLasers true;
	
	if ((side _x) == west) then {
		_x setVariable ["IP_Faction", "EFMil"];
		_x setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_coMOD.paa"];
		[_x, "TFAegis"] call BIS_fnc_setUnitInsignia;
		_x enableSimulation false;
		_x hideObject true;
	};
	
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "CSAT"];
		[_x, 5] call IP_fnc_setSkill;
	};
} forEach (allUnits - [IP_Main, IP_EFOfficer]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;