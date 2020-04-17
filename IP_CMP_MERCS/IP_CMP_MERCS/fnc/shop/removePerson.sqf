private ["_i", "_team", "_person", "_category"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a person first!"};

_team = player getVariable ["IP_ShopTeam", []];
if (count _team < 1) exitWith {};

_person = _team select _i;
_category = [(missionConfigFile >> "ShopPersonnel"), _person] call IP_fnc_getConfigCategory;
if (getNumber(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "unique") == 1) then {
	_categoryIndex = IP_PersonnelCategories find _category;
	(IP_AvailablePersonnel select _categoryIndex) pushBack _person;
};

_team deleteAt _i;
player setVariable ["IP_ShopTeam", _team];
call IP_fnc_closeShop;
["Personnel", _i] spawn IP_fnc_openShop;