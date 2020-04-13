IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_BurningStuff = [];
IP_BuddyDied = !(isNil "IP_MERCS_BuddyDied") && {IP_MERCS_BuddyDied};
IP_GarageVehicles = [];
_campEnhancements = if (isNil "IP_MERCS_CampEnhancements") then {[]} else {IP_MERCS_CampEnhancements};
_campVehicles = if (isNil "IP_MERCS_CampVehicles") then {[]} else {IP_MERCS_CampVehicles};
_killedTeammates = if (isNil "IP_MERCS_KilledTeammates") then {[]} else {IP_MERCS_KilledTeammates};
_missionsDone = if (isNil "IP_MERCS_MissionsDone") then {[]} else {IP_MERCS_MissionsDone};

// Functions
_getVehicleClassNameFromIdentifier = {
	private ["_identifier", "_allCampVehicles", "_className"];
	_identifier = _this;
	_allCampVehicles = (missionConfigFile >> "ShopCampVehicles") call IP_fnc_getConfigEntries;
	_className = "";
	
	{
		_path = (missionConfigFile >> "ShopCampVehicles" >> _x >> "identifier");
		if ((isText _path) && {(getText _path) == _identifier}) exitWith {_className = _x};
	} forEach _allCampVehicles;
	
	_className
};

IP_m_fnc_stratMap = {
	if ((isNil "IP_AvailableMissions") OR {count IP_AvailableMissions == 0}) exitWith {hint "No missions available at the moment!"};
	private "_missionsData";
	_missionsData = [];
	
	for "_i" from 0 to ((count IP_AvailableMissions) - 1) do {
		_mission = IP_AvailableMissions select _i;
		_pos = getMarkerPos ("m" + _mission);
		_code = compile (str(_i) + " call IP_fnc_selectMission;");
		_title = getText(missionConfigFile >> "ShopMissions" >> _mission >> "title");
		_desc = getText(missionConfigFile >> "ShopMissions" >> _mission >> "description");
		_client = getText(missionConfigFile >> "Factions" >> (getText(missionConfigFile >> "ShopMissions" >> _mission >> "client")) >> "displayName");
		_overview = "IP_CMP_MERCS\IP_CMP_MERCS\img\" + _mission + "_overview.jpg";
		_missionsData set [(count _missionsData), [_pos, _code, _title, _desc, _client, _overview, 1, []]];
	};
	
	disableSerialization;

	_parentDisplay	= [] call bis_fnc_displayMission;
	_mapCenter = getMarkerPos "mCamp";
	_ORBAT = [];
	_markers = [];
	_images = [];
	_overcast = overcast;
	_isNight = !((dayTime > 7) && (dayTime < 19));
	_scale = 1;
	_simul = true;

	[
		findDisplay 46,
		_mapCenter,
		_missionsData,
		_ORBAT,
		_markers,
		_images,
		_overcast,
		_isNight,
		_scale,
		_simul
	] call Bis_fnc_strategicMapOpen;
};

// Scenes
IP_scn_comingHome = compile(preprocessFileLineNumbers "scn\comingHome.sqf");
IP_scn_briefing = compile(preprocessFileLineNumbers "scn\briefing.sqf");
IP_scn_insertion = compile(preprocessFileLineNumbers "scn\insertion.sqf");
IP_scn_dynamicCampInit = {	
	// Camp Fires
	if ((dayTime < 7) OR (dayTime > 19)) then {
		{_x inFlame true} forEach IP_BurningStuff;
	} else {
		{_x inFlame false} forEach IP_BurningStuff;
	};
};

// Shop Setup
[true, true, [(player getVariable ["IP_ShopUniforms", []]), (player getVariable ["IP_ShopCampEnhancements", []]), (player getVariable ["IP_ShopCampVehicles", []])]] call IP_fnc_shopInit;

// All Objects
{
	if (_x isKindOf "Man") then {
		if ((side _x == west) && !(isPlayer _x)) then {
			_x addEventHandler ["HIT", {
				if ((_this select 1) == (vehicle player)) then {
					player addRating -999999;
					if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
				};
			}];
		};
		
		if ((typeOf _x) in _killedTeammates) then {deleteVehicle _x};
			
		if ((_x getVariable ["IP_Faction", ""]) == "ION") then {
			[_x] call IP_fnc_createMerc;
		};
		
		if ((_x getVariable ["IP_Faction", ""]) == "BritishKnights") then {
			[_x] call IP_fnc_createBK;
		};
		
		_initCode = _x getVariable ["IP_InitCode", ""];
		if (_initCode != "") then {
			_x spawn (compile _initCode);
		};
		
		_ambientAnim = _x getVariable ["IP_AmbientAnim", []];
		if (count _ambientAnim > 0) then {
			if (count _ambientAnim > 1) then {
				[_x, (_ambientAnim select 0), (_ambientAnim select 1)] call BIS_fnc_ambientAnim;
			} else {
				[_x, (_ambientAnim select 0)] call BIS_fnc_ambientAnim;
			};
		};
	};
	
	_burning = _x getVariable ["IP_Burning", false];
	if (_burning) then {
		if ((dayTime < 7) OR (dayTime > 19)) then {_x inFlame true};
		IP_BurningStuff = IP_BurningStuff + [_x];
	};
	
	_campEnhancement = _x getVariable ["IP_CampEnhancement", ""];
	if ((_campEnhancement != "") && {!(_campEnhancement in _campEnhancements)}) then {
		_x enableSimulation false;
		_x hideObject true;
	};
	
	_campVehicle = _x getVariable ["IP_CampVehicle", ""];
	if ((_campVehicle != "") && {!((_campVehicle call _getVehicleClassNameFromIdentifier) in _campVehicles)}) then {
		_x enableSimulation false;
		_x hideObject true;
	};
} forEach (allMissionObjects "All");

// Enhancement Markers
_availableCampEnhancements = (missionConfigFile >> "ShopCampEnhancements") call IP_fnc_getConfigEntries;
{
	if (!(_x in _campEnhancements)) then {
		if (isText(missionConfigFile >> "ShopCampEnhancements" >> _x >> "marker")) then {
			_marker = getText(missionConfigFile >> "ShopCampEnhancements" >> _x >> "marker");
			_marker setMarkerAlpha 0;
		} else {
			if (isArray(missionConfigFile >> "ShopCampEnhancements" >> _x >> "marker")) then {
				_markers = getArray(missionConfigFile >> "ShopCampEnhancements" >> _x >> "marker");
				{_x setMarkerAlpha 0} forEach _markers;
			};
		};
	};
} forEach _availableCampEnhancements;

// Garage Setup
{
	if (getNumber(missionConfigFile >> "ShopCampVehicles" >> _x >> "isCar") == 1) then {
		_spot = (count IP_GarageVehicles) + 1;
		_marker = "mGarageSpot" + str(_spot);
		_pos = getMarkerPos _marker;
		
		_created = _x createVehicle _pos;
		_created setDir 180;
		_created setPos _pos;
		_created lockDriver true;
		clearItemCargo _created;
		
		IP_GarageVehicles = IP_GarageVehicles + [_created];
	};
} forEach _campVehicles;

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;
if (IP_BuddyDied) then {
	deleteVehicle IP_Buddy;
} else {
	[IP_Buddy, "PRONE_INJURED", "NONE"] call BIS_fnc_ambientAnim;
	[IP_Buddy, "buddyOpener"] call IP_fnc_addConversation;
};

// Whiteboards
IP_StratMap setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\Hub02_WBStratMap1.paa"];
IP_StratMap addAction ["Open Strategic Map", {call IP_m_fnc_stratMap}];
_WB = switch ({_x in ["MMain01", "MMain02", "MMain03", "MMain04"]} count _missionsDone) do {
	case 1: {"Hub02_WB2"};
	case 2: {"Hub02_WB3"};
	case 3: {"Hub02_WB4"};
	case 4: {"Hub02_WB5"};
	default {"Hub02_WB1"};
};
IP_Whiteboard setObjectTexture [0, ("IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\" + _WB + ".paa")];

// People
_animSet = ["BRIEFING", "GUARD", "STAND_U1", "STAND_U2", "STAND_U3"];

// Lord
[IP_Lord, "lord"] call IP_fnc_applyTemplate;
[IP_Lord, (_animSet call BIS_fnc_selectRandom), "ASIS"] call BIS_fnc_ambientAnim;
[IP_Lord, "lordOpener"] call IP_fnc_addConversation;

// Commander
[IP_Commander, "commander", "hub"] call IP_fnc_applyTemplate;
[IP_Commander, (_animSet call BIS_fnc_selectRandom), "ASIS"] call BIS_fnc_ambientAnim;
[IP_Commander, "commanderOpener"] call IP_fnc_addConversation;

// Captain
[IP_Captain, "captain", "hub"] call IP_fnc_applyTemplate;
[IP_Captain, "STAND1", "ASIS"] call BIS_fnc_ambientAnim;
[IP_Captain, "captainOpener"] call IP_fnc_addConversation;

// Medic
[IP_Medic, "medic", "hub"] call IP_fnc_applyTemplate;
[IP_Medic, (_animSet call BIS_fnc_selectRandom), "ASIS"] call BIS_fnc_ambientAnim;
[IP_Medic, "medicOpener"] call IP_fnc_addConversation;

// Hacker + Laptop
if ("MMain03" in _missionsDone) then {
	[IP_Hacker, "hacker", "hub"] call IP_fnc_applyTemplate;
	[IP_Hacker, "SIT_AT_TABLE", "ASIS"] call BIS_fnc_ambientAnim;
	[IP_Hacker, "hackerOpener"] call IP_fnc_addConversation;
	IP_HackerLaptop setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\laptop\Laptop_Code.paa"];
} else {
	deleteVehicle IP_Hacker;
	IP_HackerLaptop setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\laptop\Laptop_BKLockscreen.paa"];
};

// Jukebox
[] call BIS_fnc_jukebox;

// Mission Start
if (IP_ShowIntro) then {[] spawn IP_scn_comingHome}; 