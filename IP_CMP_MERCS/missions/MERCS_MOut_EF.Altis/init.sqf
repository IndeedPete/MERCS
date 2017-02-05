IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_ContactsAlive = if (isNil "IP_MERCS_ContactsAlive") then {[true, true, [true, true], true]} else {IP_MERCS_ContactsAlive}; // AAF - CSAT - DSE (Agent, Rival) - EF
IP_MainGroup = group IP_EFOfficer;

// Scenes
IP_scn_credits = compile(preprocessFileLineNumbers "Campaigns\IP_CMP_MERCS\scn\credits.sqf");

// Main Setup
[] call IP_fnc_mainInit;
//IP_Main setCaptive true;

// EF Officer Setup
[IP_EFOfficer, "EFOfficer"] call IP_fnc_applyTemplate;
[IP_EFOfficer] call IP_fnc_automaticRearm;
IP_EFOfficer allowDamage false;
IP_MainGroup allowFleeing 0;

// CSATOfficer
if (IP_ContactsAlive select 1) then {
	[IP_CSATOfficer, "CSATOfficer", "combat"] call IP_fnc_applyTemplate;
	{
		_x assignAsCargo IP_CSATHeli;
		_x moveInCargo IP_CSATHeli;
	} forEach (units IP_CSATOfficerGroup);
} else {
	{deleteVehicle _x} forEach ([IP_CSATHeli] + (units IP_CSATHeliGroup) + (units IP_CSATOfficerGroup));
};

// Pointman
(group IP_PointMan) setGroupID ["Liberty Point"];

// EF Group
{_x stop true} forEach (units IP_EFGroup);

// HQ Dummy
IP_HQ allowDamage false;
IP_HQ enableSimulation false;
IP_HQ hideObject true;
IP_HQ setVariable ["IP_Avatar", "Campaigns\IP_CMP_MERCS\img\EF_Flag.jpg"];
(group IP_HQ) setGroupID ["Gamemaster"];

// All Units
{
	_x enableIRLasers true;
	
	if ((side _x) == west) then {
		_x setVariable ["IP_Faction", "EFMil"];
		_x setObjectTexture [0, "Campaigns\IP_CMP_MERCS\txt\clothing1_coMOD.paa"];
		[_x, "TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "CSAT"];
		_x enableSimulation false;
		_x hideObject true;
	};
} forEach (allUnits - [IP_Main, IP_EFOfficer]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;