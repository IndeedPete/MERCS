if (!(isClass(campaignConfigFile >> "campaign"))) exitWith {false};

IP_LastOpened = 10000;
IP_Navigation = [
	["Missions", 10000],
	["Personnel", 10001],
	["Weapons", 10002],
	["Magazines", 10003],
	["Items", 10004],
	["Clothes", 10005]
];

if (getText(missionConfigFile >> "stage") == "B") then {
	IP_Navigation = IP_Navigation + [
		["Enhancements", 10006],
		["Vehicles", 10007]
	];
};

IP_SellingPriceDivisor = 5;

IP_AvailableMissions = [];
_missions = (missionConfigFile >> "ShopMissions") call IP_fnc_getConfigEntries;
{
	_cond = getText(missionConfigFile >> "ShopMissions" >> _x >> "condition");
	if (call compile _cond) then {IP_AvailableMissions = IP_AvailableMissions + [_x]};
} forEach _missions;

IP_AvailablePersonnel = [];
_personnel = (missionConfigFile >> "ShopPersonnel") call IP_fnc_getConfigEntries;
_killedTeammates = if (isNil "IP_MERCS_KilledTeammates") then {[]} else {IP_MERCS_KilledTeammates};
_team = if (isNil "IP_MERCS_Team") then {[]} else {IP_MERCS_Team};
{
	_unique = if (isNumber(missionConfigFile >> "ShopPersonnel" >> _x >> "unique")) then {(getNumber(missionConfigFile >> "ShopPersonnel" >> _x >> "unique"))} else {0};
	_show = if (isNumber(missionConfigFile >> "ShopPersonnel" >> _x >> "show")) then {(getNumber(missionConfigFile >> "ShopPersonnel" >> _x >> "show"))} else {1};
	if (((_unique == 0) OR ((_unique == 1) && !(_x in _team))) && ((_show == 1) OR {(_show == 2) && ((getText(missionConfigFile >> "stage")) == "B") && !(_x in _killedTeammates)}) && (isClass(configFile >> "CfgVehicles" >> _x))) then {IP_AvailablePersonnel = IP_AvailablePersonnel + [_x]};
} forEach _personnel;

IP_AvailableWeapons = (missionConfigFile >> "ShopWeapons") call IP_fnc_getConfigEntries;
{
	_show = if (isNumber(missionConfigFile >> "ShopWeapons" >> _x >> "show")) then {(getNumber(missionConfigFile >> "ShopWeapons" >> _x >> "show"))} else {1};
	if ((_show != 1) OR {!(isClass(configFile >> "CfgWeapons" >> _x))} OR {(getNumber(configFile >> "CfgWeapons" >> _x >> "scope")) != 2}) then {IP_AvailableWeapons = IP_AvailableWeapons - [_x]};
} forEach IP_AvailableWeapons;

IP_AvailableMagazines = (missionConfigFile >> "ShopMagazines") call IP_fnc_getConfigEntries;
{
	if (!(isClass(configFile >> "CfgMagazines" >> _x))) then {IP_AvailableMagazines = IP_AvailableMagazines - [_x]};
} forEach IP_AvailableMagazines;

IP_AvailableItems = [];
_itemClasses = (missionConfigFile >> "ShopItems") call IP_fnc_getConfigEntries;
{
	private "_items";
	_items = (missionConfigFile >> "ShopItems" >> _x) call IP_fnc_getConfigEntries;
	{
		if (!(isClass(configFile >> "CfgWeapons" >> _x)) && !(isClass(configFile >> "CfgVehicles" >> _x)) && !(isClass(configFile >> "CfgGlasses" >> _x))) then {_items = _items - [_x]};
	} forEach _items;
	IP_AvailableItems = IP_AvailableItems + _items;
} forEach _itemClasses;

IP_AvailableClothes = (missionConfigFile >> "ShopClothes") call IP_fnc_getConfigEntries;
_clothes = if (isNil "IP_MERCS_Clothes") then {[]} else {IP_MERCS_Clothes};
{
	_show = if (isNumber(missionConfigFile >> "ShopClothes" >> _x >> "show")) then {(getNumber(missionConfigFile >> "ShopClothes" >> _x >> "show"))} else {1};
	if ((_show != 1) OR (_x in _clothes) OR {!(isClass(configFile >> "CfgWeapons" >> _x))}) then {IP_AvailableClothes = IP_AvailableClothes - [_x]};
} forEach IP_AvailableClothes;

IP_AvailableCampEnhancements = (missionConfigFile >> "ShopCampEnhancements") call IP_fnc_getConfigEntries;
_enhancements = if (isNil "IP_MERCS_CampEnhancements") then {[]} else {IP_MERCS_CampEnhancements};
{
	if (_x in _enhancements) then {IP_AvailableCampEnhancements = IP_AvailableCampEnhancements - [_x]};
} forEach IP_AvailableCampEnhancements;

IP_AvailableCampVehicles = (missionConfigFile >> "ShopCampVehicles") call IP_fnc_getConfigEntries;
_vehicles = if (isNil "IP_MERCS_CampVehicles") then {[]} else {IP_MERCS_CampVehicles};
{
	if (((_x in _vehicles) && ((getNumber(missionConfigFile >> "ShopCampVehicles" >> _x >> "isCar")) == 0)) OR !(isClass(configFile >> "CfgVehicles" >> _x))) then {IP_AvailableCampVehicles = IP_AvailableCampVehicles - [_x]};
} forEach IP_AvailableCampVehicles;