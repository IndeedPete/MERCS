IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_OffersHeard = if (isNil "IP_MERCS_OffersHeard") then {[true, true, true, true]} else {IP_MERCS_OffersHeard}; // AAF - CSAT - DSE - EF
IP_ContactsAlive = if (isNil "IP_MERCS_ContactsAlive") then {[true, true, [true, true], true]} else {IP_MERCS_ContactsAlive}; // AAF - CSAT - DSE (Agent, Rival) - EF
IP_BuddyDied = !(isNil "IP_MERCS_BuddyDied") && {IP_MERCS_BuddyDied};
IP_GarageVehicles = [];
_campEnhancements = if (isNil "IP_MERCS_CampEnhancements") then {[]} else {IP_MERCS_CampEnhancements};
IP_CampVehicles = if (isNil "IP_MERCS_CampVehicles") then {[]} else {IP_MERCS_CampVehicles};
_killedTeammates = if (isNil "IP_MERCS_KilledTeammates") then {[]} else {IP_MERCS_KilledTeammates};
_playerBox = if (isNil "IP_MERCS_PlayerBox") then {[]} else {IP_MERCS_PlayerBox};

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

// All Objects
{
	if (_x isKindOf "Man") then {
		if ((typeOf _x) in _killedTeammates) then {deleteVehicle _x};
			
		if ((_x getVariable ["IP_Faction", ""]) == "ION") then {
			[_x, 5, false, [((dayTime < 7) OR (dayTime > 19)), true], false] call IP_fnc_createMerc;
		};
		
		if ((_x getVariable ["IP_Faction", ""]) == "BritishKnights") then {
			[_x, 5, false, [((dayTime < 7) OR (dayTime > 19)), true]] call IP_fnc_createBK;
		};
		
		if (side _x == independent) then {
			_x setVariable ["IP_Faction", "AltisMil"];
			if ((_x getVariable ["IP_Colonel", false]) && {!(IP_ContactsAlive select 0)}) then {deleteVehicle _x};
		};
		
		_initCode = _x getVariable ["IP_InitCode", ""];
		if (_initCode != "") then {
			_x spawn (compile _initCode);
		};
	};
	
	_campEnhancement = _x getVariable ["IP_CampEnhancement", ""];
	if ((_campEnhancement != "") && {!(_campEnhancement in _campEnhancements)}) then {deleteVehicle _x};
	
	_campVehicle = _x getVariable ["IP_CampVehicle", ""];
	if ((_campVehicle != "") && {!((_campVehicle call _getVehicleClassNameFromIdentifier) in IP_CampVehicles)})  then {deleteVehicle _x};
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
		clearItemCargo _created;
		
		IP_GarageVehicles = IP_GarageVehicles + [_created];
	};
} forEach IP_CampVehicles;

// Player's Box
if ((count _playerBox) > 0) then {
	{IP_PlayerBox addWeaponCargo [_x, 1]} forEach (_playerBox select 0);
	{IP_PlayerBox addMagazineCargo [_x, 1]} forEach (_playerBox select 1);
	{IP_PlayerBox addItemCargo [_x, 1]} forEach (_playerBox select 2);
	{IP_PlayerBox addBackpackCargo [_x, 1]} forEach (_playerBox select 3);
};

// Main Setup
(group IP_Main) setGroupID ["Templar"];
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;
if (IP_BuddyDied) then {
	deleteVehicle IP_Buddy;
} else {
	(group IP_Buddy) setBehaviour "SAFE";
	//player action ["sitDown", IP_Buddy]; // moved to mission start
	[IP_Buddy, "buddyOpener"] call IP_fnc_addConversation;
};

// HQ
[IP_Lord, "lord", "combat"] call IP_fnc_applyTemplate;

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;

// British Knights Setup
[IP_Captain, "captain", "combat"] call IP_fnc_applyTemplate;
[IP_Medic, "medic", "combat"] call IP_fnc_applyTemplate;
if ((dayTime < 7) OR (dayTime > 19)) then {{_x linkItem "NVGoggles"} forEach [IP_Commander, IP_Captain, IP_Medic]};

// Heli
if (!("B_Heli_Light_01_F" in IP_CampVehicles)) then {{deleteVehicle _x} forEach ((units(group IP_Heli)) + [IP_Heli])};

// Whiteboards
IP_StratMap setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\Hub02_WBStratMap1.paa"];
IP_Whiteboard setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\Hub03_WB1.paa"];

// Tasks
private "_rewards";
_rewards = "ION / British Knights<br/>1.500.000€";

[player, "tDefend", ["Defend the <marker name=""mCamp"">Camp</marker> at all costs!", "Defend the Camp", "Defend"], "mCheckpoint", true, 1] call BIS_fnc_taskCreate;
if ((IP_OffersHeard select 0) && (IP_ContactsAlive select 0)) then {
	[player, "tAAF", ["Betray the other factions and destroy the device for the AAF!", "Destroy the Device (AAF)", ""], IP_DeviceTruck, false, 1] call BIS_fnc_taskCreate;
	_rewards = _rewards + "<br/><br/>AAF<br/>750.000€ + A high government position on Altis.";
};

player createDiaryRecord ["Diary", ["Faction Rewards", _rewards]];

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;