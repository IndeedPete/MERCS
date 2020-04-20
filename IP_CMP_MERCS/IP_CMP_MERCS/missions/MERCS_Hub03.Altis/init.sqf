IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_BurningStuff = [];
IP_BuddyDied = !(isNil "IP_MERCS_BuddyDied") && {IP_MERCS_BuddyDied};
IP_CSATOfficerDied = !(isNil "IP_MERCS_CSATOfficerAlive") && {!IP_MERCS_CSATOfficerAlive};
IP_OffersHeard = [false, false, false, false]; // AAF - CSAT - DSE - EF
IP_ContactsAlive = [true, !IP_CSATOfficerDied, [true, true], true]; // AAF - CSAT - DSE (Agent, Rival) - EF
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
IP_scn_talk = {
	[IP_Hacker, "hackerOpener"] call IP_fnc_removeConversation;
	[IP_Hacker, "You do that! There's a quad bike for you by the garage, near the wrecked HUMVEE. And don't tell anyone. *wink*", "DIRECT"] call IP_fnc_simpleSentence;
	["tHacker", "SUCCEEDED"] call BIS_fnc_taskSetState;
	
	{_x setMarkerAlpha 1} forEach ["mAAF", "mDSE", "mEF"]; 
	[player, "tAAF", ["Talk to <marker name=""mAAF"">AAF representative</marker>! (OPTIONAL)", "Talk to AAF (OPTIONAL)", "Meet"], "mAAF", false, 1, true, "talk2"] call BIS_fnc_taskCreate;
	[player, "tDSE", ["Talk to <marker name=""mDSE"">Deep Space Engineering representative</marker>! (OPTIONAL)", "Talk to DSE (OPTIONAL)", "Meet"], "mDSE", false, 1, true, "talk3"] call BIS_fnc_taskCreate;
	[player, "tEF", ["Talk to <marker name=""mEF"">EUROFORCE representative</marker>! (OPTIONAL)", "Talk to EUROFORCE (OPTIONAL)", "Meet"], "mEF", false, 1, true, "talk4"] call BIS_fnc_taskCreate;
	if (!IP_CSATOfficerDied) then {
		"mCSAT" setMarkerAlpha 1;
		[player, "tCSAT", ["Talk to <marker name=""mCSAT"">CSAT representative</marker>! (OPTIONAL)", "Talk to CSAT (OPTIONAL)", "Meet"], "mCSAT", false, 1, true, "talk5"] call BIS_fnc_taskCreate;
	};
	saveGame;
};
IP_scn_end = {
	IP_MERCS_ChoseBlackArrow = _this;
	IP_MERCS_OffersHeard = IP_OffersHeard;
	IP_MERCS_ContactsAlive = IP_ContactsAlive;
	{saveVar _x} forEach ["IP_MERCS_ChoseBlackArrow", "IP_MERCS_OffersHeard", "IP_MERCS_ContactsAlive"];
	["mMain06", true, 5] call IP_fnc_endMission;
};

// Shop Setup
[true, true, [(player getVariable ["IP_ShopUniforms", []]), (player getVariable ["IP_ShopCampEnhancements", []]), (player getVariable ["IP_ShopCampVehicles", []])]] call IP_fnc_shopInit;

// All Objects
{
	if (_x isKindOf "Man") then {
		if (!(isPlayer _x)) then {
			_x addEventHandler ["HIT", {
				if ((_this select 1) == (vehicle player)) then {
					player addRating -999999;
					player setCaptive false;
					if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
				};
			}];
		};
		
		if (side _x == independent) then {
			_x setVariable ["IP_Faction", "AltisMil"];
		};
		
		if ((typeOf _x) in _killedTeammates) then {deleteVehicle _x};
			
		if ((_x getVariable ["IP_Faction", ""]) in ["ION", "BlackArrow"]) then {
			[_x] call IP_fnc_createMerc;
		};
		
		if ((_x getVariable ["IP_Faction", ""]) == "BritishKnights") then {
			[_x] call IP_fnc_createBK;
		};
		
		if ((_x getVariable ["IP_Faction", ""]) == "EFMil") then {
			_x setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_coMOD.paa"];
			[_x, "TFAegis"] call BIS_fnc_setUnitInsignia;
		};
		
		if ((_x getVariable ["IP_Faction", ""]) == "CSAT") then {
			if (IP_CSATOfficerDied) then {
				_x enableSimulation false;
				_x hideObject true;
			} else {
				[_x, "GryffinRegiment"] call BIS_fnc_setUnitInsignia;
			};
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
		
		_ambientAnimCombat = _x getVariable ["IP_AmbientAnimCombat", []];
		if (count _ambientAnimCombat > 0) then {
			if (count _ambientAnimCombat > 1) then {
				[_x, (_ambientAnimCombat select 0), (_ambientAnimCombat select 1)] call BIS_fnc_ambientAnimCombat;
			} else {
				[_x, (_ambientAnimCombat select 0)] call BIS_fnc_ambientAnimCombat;
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
	if (isClass(missionConfigFile >> "ShopCampVehicles" >> "Cars" >> _x)) then {
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
player setVariable ["IP_ShopGarageVehicles", IP_GarageVehicles];

// Main Setup
[] call IP_fnc_mainInit;
IP_Main setCaptive true;
//IP_Main addEventHandler ["GetOut", {hint str(_this select 0); (_this select 0) setCaptive true;}];

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
IP_Whiteboard setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\Hub03_WB1.paa"];

// People
_animSet = ["BRIEFING", "GUARD", "STAND_U1", "STAND_U2", "STAND_U3"];

// Lord
[IP_Lord, "lord"] call IP_fnc_applyTemplate;
[IP_Lord, (_animSet call BIS_fnc_selectRandom), "ASIS"] call BIS_fnc_ambientAnim;
[IP_Lord, "lordOpener"] call IP_fnc_addConversation;
[IP_LordTemp, "lord"] call IP_fnc_applyTemplate;

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

// Hacker
[IP_Hacker, "hacker", "hub"] call IP_fnc_applyTemplate;
[IP_Hacker, (_animSet call BIS_fnc_selectRandom), "ASIS"] call BIS_fnc_ambientAnim;
[IP_Hacker, "hackerOpener"] call IP_fnc_addConversation;

// Colonel
[IP_Colonel, "colonel"] call IP_fnc_applyTemplate;
[IP_Colonel, "BRIEFING", "ASIS"] call BIS_fnc_ambientAnim;
[IP_Colonel, "colonelOpener"] call IP_fnc_addConversation;
IP_Colonel allowDamage true;
IP_Colonel addEventHandler ["Killed", {
	IP_ContactsAlive set [0, false];
	if ("tAAF" call BIS_fnc_taskExists) then {["tAAF", "CANCELED"] call BIS_fnc_taskSetState};
}];

// EFOfficer
[IP_EFOfficer, "EFOfficer"] call IP_fnc_applyTemplate;
[IP_EFOfficer, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;
[IP_EFOfficer, "EFOfficerOpener"] call IP_fnc_addConversation;
IP_EFOfficer addEventHandler ["Killed", {
	IP_ContactsAlive set [3, false];
	if ("tEF" call BIS_fnc_taskExists) then {["tEF", "CANCELED"] call BIS_fnc_taskSetState};
}];

// CSATOfficer
if (IP_CSATOfficerDied) then {
	deleteVehicle IP_CSATOfficer;
} else {
	[IP_CSATOfficer, "CSATOfficer", "combat"] call IP_fnc_applyTemplate;
	[IP_CSATOfficer, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;
	[IP_CSATOfficer, "CSATOfficerOpener"] call IP_fnc_addConversation;
	IP_CSATOfficer addEventHandler ["Killed", {
		IP_ContactsAlive set [1, false];
		if ("tCSAT" call BIS_fnc_taskExists) then {["tCSAT", "CANCELED"] call BIS_fnc_taskSetState};
	}];
};

// Agent
[IP_Agent, "agent", "combat"] call IP_fnc_applyTemplate;
IP_Agent allowDamage true;
[IP_Agent, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;
[IP_Agent, "agentOpener"] call IP_fnc_addConversation;
IP_Agent addEventHandler ["Killed", {
	(IP_ContactsAlive select 2) set [0, false];
	if (("tDSE" call BIS_fnc_taskExists) && {("tDSE" call BIS_fnc_taskState) != "CANCELED"}) then {["tDSE", "CANCELED"] call BIS_fnc_taskSetState};
}];

// Rival
[IP_Rival, "rival"] call IP_fnc_applyTemplate;
IP_Rival allowDamage true;
IP_Rival addEventHandler ["Killed", {
	(IP_ContactsAlive select 2) set [1, false];
	if (("tDSE" call BIS_fnc_taskExists) && {("tDSE" call BIS_fnc_taskState) != "CANCELED"}) then {["tDSE", "CANCELED"] call BIS_fnc_taskSetState};
}];

// Scientist
[IP_Scientist, "scientist"] call IP_fnc_applyTemplate;
IP_Scientist allowDamage false;

// Markers
{_x setMarkerAlpha 0} forEach ["mAAF", "mCSAT", "mDSE", "mEF"];

// Jukebox
[] call BIS_fnc_jukebox;

// Mission Start
if (IP_ShowIntro) then {[] spawn IP_scn_comingHome}; 