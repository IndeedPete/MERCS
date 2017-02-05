private "_category";

_top = _this select 0;
_entry = _this select 1;
_category = "";

_categories = (missionConfigFile >> _top) call IP_fnc_getConfigEntries;
{
	_path = (missionConfigFile >> _top >> _x >> _entry);
	if ((isClass _path)/* OR (isNumber _path) OR (isText _path) OR (isArray _path)*/) exitWith {_category = _x};
} forEach _categories;

_category