IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_HostageSaved = !(isNil "IP_MERCS_HostageSaved") && {IP_MERCS_HostageSaved};
IP_BuddyDied = !(isNil "IP_MERCS_BuddyDied") && {IP_MERCS_BuddyDied};
_campEnhancements = if (isNil "IP_MERCS_CampEnhancements") then {[]} else {IP_MERCS_CampEnhancements};

// Scenes
IP_m_scn_outro = compile(preprocessFileLineNumbers "scn\outro.sqf");
IP_scn_credits = compile(preprocessFileLineNumbers "IP_CMP_MERCS\IP_CMP_MERCS\scn\credits.sqf");

// Shop Setup
[] call IP_fnc_shopInit;

// All Objects
{
	if (_x isKindOf "Man") then {
		if ((_x getVariable ["IP_Faction", ""]) == "ION") then {
			[_x] call IP_fnc_createMerc;
		};
		
		if ((_x getVariable ["IP_Faction", ""]) == "BritishKnights") then {
			[_x, 5, false, [((dayTime < 7) OR (dayTime > 19)), true]] call IP_fnc_createBK;
		};
		
		if (_x getVariable ["IP_DeadBody", false]) then {
			[_x] call IP_fnc_deadBody;
		};
		
		_initCode = _x getVariable ["IP_InitCode", ""];
		if (_initCode != "") then {
			_x spawn (compile _initCode);
		};
	};
	
	_fire = _x getVariable ["IP_Fire", ""];
	if (_fire != "") then {
		[(getPos _x), _fire] call IP_fnc_createFireEffect;
	};
	
	_campEnhancement = _x getVariable ["IP_CampEnhancement", ""];
	if ((_campEnhancement != "") && {!(_campEnhancement in _campEnhancements)}) then {deleteVehicle _x};
} forEach (allMissionObjects "All");

// Adjust Date
private "_date";
_date = date;
_date set [3, 6];
_date set [4, 30];
if ((date select 3) > 5) then {_date set [2, ((date select 2) + 1)]};
setDate _date;

// Wetter
["", ["FOGGY", "LIGHTFOG"]] spawn IP_fnc_setWeather;

// Force Internal View
if (!IP_TESTMODE) then {["IP_OnEachFrameEH", "onEachFrame", {(vehicle player) switchCamera "Internal"}] call BIS_fnc_addStackedEventHandler};

// Main Setup
[] call IP_fnc_mainInit;
IP_Main allowDamage false;

// Buddy Setup
[] call IP_fnc_buddyInit;
if (IP_BuddyDied) then {
	deleteVehicle IP_Buddy;
} else {
	IP_Buddy setUnitPos "UP";
	IP_Buddy stop true;
	IP_Buddy allowDamage true;
};

// HQ
[IP_Lord, "lord", "combat"] call IP_fnc_applyTemplate;

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;

// British Knights Setup
[IP_Captain, "captain", "combat"] call IP_fnc_applyTemplate;
[IP_Medic, "medic", "combat"] call IP_fnc_applyTemplate;
{
	_x setUnitPos "UP";
	(group _x) setBehaviour "SAFE";
} forEach [IP_Medic, IP_Shooter];

// Hostage
if (IP_HostageSaved) then {
	IP_Hostage setIdentity "hostage";
	removeHeadgear IP_Hostage;
	IP_Hostage allowDamage false;
	{IP_Hostage disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET", "ANIM"];
	IP_Hostage setVariable ["IP_LiveFeed", true];
	IP_Hostage enableSimulation false;
	IP_Hostage hideObject true;
} else {deleteVehicle IP_Hostage};

// Whiteboards
IP_StratMap setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\Hub02_WBStratMap1.paa"];
IP_Whiteboard setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\Hub03_WB1.paa"];

// Heli
IP_Heli setObjectTexture [0, "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa"];
IP_Heli setObjectTexture [1, "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa"];
IP_Heli setObjectTexture [2, "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"];
IP_Heli allowDamage false;
IP_Heli enableSimulation false;
IP_Heli hideObject true;

// Destruction
{_x setDamage 1} forEach (IP_GL_Destruction nearObjects ["house", 100]);

// Prep Scene
{
	_guy = _x;
	{_guy disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
	{_guy enableAI _x} forEach ["ANIM","FSM"];
	(group _guy) setBehaviour "CARELESS";
	(group _guy) setCombatMode "BLUE";
	_guy enableSimulation false;
	_guy hideObject true;
} forEach [IP_Lord, IP_Commander, IP_Captain, IP_Main];

// Cutscene Mathafakka!
if (IP_ShowIntro) then {[] spawn IP_m_scn_outro};