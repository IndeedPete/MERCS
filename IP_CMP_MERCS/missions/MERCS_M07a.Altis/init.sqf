IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_LaseTargets = true;
IP_MichaelBayVehicles = [];
IP_ToDestroy = [];

// Functions
IP_m_fnc_destroyed = {
	if ((random 1) > 0.5) then {[(getPos _this), "FIRE_BIG"] call IP_fnc_createFireEffect};
	if (!isNil "IP_MichaelBay") exitWith {};
	IP_MichaelBay = true;
	[] spawn {
		sleep 0.5;
		{
			"Bo_GBU12_LGB_MI10" createVehicle (getPos _x);
			sleep 0.5;
		} forEach IP_MichaelBayVehicles;
	};
};

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Eightball"];
[] spawn {
	while {IP_LaseTargets} do {
		waitUntil {(!isNull (laserTarget IP_Main)) && {isNull ((laserTarget IP_Main) getVariable ["IP_LaserTarget", ObjNull])}};
		_target = (nearestObjects [(getPos(laserTarget IP_Main)), ["ALL"], 50]) select 1;
		_pos = getPosATL _target;
		_laserTarget = "LaserTargetW" createVehicle _pos;
		_laserTarget attachTo [_target, [0, 0, 3]];
		_target setVariable ["IP_LaserTarget", _laserTarget];
		
		_marker = createMarker[(str(_target)), _pos];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_destroy";
		_marker setMarkerColor "colorRed";
		_marker setMarkerText "Laser Target";
		
		// Killed EH workaround.
		_target spawn {
			waitUntil {(!alive _this) OR ((damage _this) > 0.9)};
			_laserTarget = _this getVariable ["IP_LaserTarget", ObjNull];
			if (!isNull _laserTarget) then {deleteVehicle _laserTarget};
			_marker = str(_this);
			deleteMarker _marker;
		};
		
		["TargetLased"] call bis_fnc_showNotification;
		waitUntil {isNull (laserTarget IP_Main)};
	};
};

// HQ Dummy
IP_HQ allowDamage false;
IP_HQ setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\EF_Flag.jpg"];
(group IP_HQ) setGroupID ["Gamemaster"];

// Planes
IP_Plane setObjectTexture [1, "IP_CMP_MERCS\IP_CMP_MERCS\txt\plane_cas_01_ext01_coEF1.paa"];
IP_Plane setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\plane_cas_01_ext02_coEF1.paa"];
IP_Plane2 setObjectTexture [1, "IP_CMP_MERCS\IP_CMP_MERCS\txt\plane_cas_01_ext01_coEF1.paa"];
IP_Plane2 setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\plane_cas_01_ext02_coEF2.paa"];
{
	_x enableSimulation false;
	_x hideObject true;
} forEach [IP_Plane, IP_Plane2];

// Markers
{_x setMarkerAlpha 0} forEach ["mPatPyrgos", "mPatHQ", "mPatAO"];

// Briefing
player createDiaryRecord ["Diary", ["Target Information", "TRANSMISSION BY EUROFORCE COMMAND (EUCOM) - PRIORITY ALPHA<br/><br/>Satellite image of the AAF Headquarters - primary target areas marked in red.<img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_M07a_Sat.jpg' width='292' height='170'/><br/><br/>Opportunity Target - 'Ace Of Spades'<br/>AAF Commander In Chief - Colonel Georgious Akhanteros<img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_M07a_Colonel.jpg' width='240' height='185'/>"]];
[
	"The CONTRACTOR is tasked to infiltrate the AOR on his own and locate an appropriate overview position close to the AAF Headquarters near Pyrgos. Once the CONTRACTOR is in position he will start reconnoitring the AOR and mark targets around the AAF Headquarters at his own will. The target coordinates will be uploaded into EUNET. The CONTRACTOR will then call in EUROFORCE air assets who will engage the AAF Headquarters as well as the marked targets. The CONTRACTOR constantly provides BDA. On mission completion, the CONTRACTOR will extract on his own.",
	"EUROFORCE requested our services for recon and BDA in the tactical bombardment of the AAF Headquarters at Pyrgos. Hitting their Headquarters and possibly taking our their leader - Colonel Georgious Akhanteros - would be a severe strike against the AAF and probably the base for a Blueflag ground attack. We will help them out this time but we need to observe the situation so the Blueflags won't become a thread to the Knights and us."
] call IP_fnc_createBriefing;
[player, "tOverview", ["Establish an overview position around the <marker name=""mHQ"">AAF Headquarters</marker> and call in the EUROFORCE air assets!", "Establish Overview", ""], nil, true, 1] call BIS_fnc_taskCreate;

// All Units
{
	if (_x getVariable ["IP_MichaelBay", false]) then {
		IP_MichaelBayVehicles = IP_MichaelBayVehicles + [_x];
	};
	
	if (_x getVariable ["IP_ToDestroy", false]) then {
		_x enableSimulation false;
		_x hideObject true;
		_x allowDamage false;
		IP_ToDestroy = IP_ToDestroy + [_x];
	};
} forEach vehicles;

{
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];
	};
} forEach allUnits;

// Random Patrols
[] spawn {
	_blacklisted = ["I_soldier_AA_F", "I_soldier_AAA_F"];
	["mPatPyrgos", independent, [6, 8], [2, 3], ["STD"], ["SAD", "CYCLE"], "", _blacklisted] call IP_fnc_randomPatrolArea;
	["mPatHQ", independent, [3, 4], [3, 5], ["STD"], ["SAD", "CYCLE"], "", _blacklisted] call IP_fnc_randomPatrolArea;
	["mPatAO", independent, [10, 15], [2, 3], ["STD"], ["SAD", "CYCLE"], "", _blacklisted] call IP_fnc_randomPatrolArea;
};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;