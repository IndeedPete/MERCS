_cfgPatches = (configFile >> "CfgPatches") call IP_fnc_getConfigEntries;
if ({_x in _cfgPatches} count ["TPW_HUD", "TPW_MODS", "TPW_MUSIC", "TPW_SOUNDS"] > 0) exitWith {
	if (IP_TESTMODE) then {hint "TPW Mods are already running!"};
};

_civs = [_this, 0, true, [false]] call BIS_fnc_param;
_cars = [_this, 1, true, [false]] call BIS_fnc_param;
_park = [_this, 2, true, [false]] call BIS_fnc_param;
_animals = [_this, 3, true, [false]] call BIS_fnc_param;

call IP_fnc_tpw_core;
if (_civs) then {[5,150,15,5,4,50,0,10,15,1] spawn IP_fnc_tpw_civs};
if (_cars) then {[5,1000,15,2,1] spawn IP_fnc_tpw_cars};
if (_park) then {[25,300,150,20,10] spawn IP_fnc_tpw_park};
if (_animals) then {[10,15,200,75,60] spawn IP_fnc_tpw_animals};

if (IP_TESTMODE) then {hint "TPW scripts activated!"};