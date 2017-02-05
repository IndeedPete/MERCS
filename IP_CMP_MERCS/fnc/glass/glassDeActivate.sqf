if (!(player getVariable ["IP_Glass_Boot", false])) exitWith {hint "ERROR: BIS Glass must be booted first!"};

_what = [_this, 0, "IP_Glass_Core", [""]] call BIS_fnc_param;

_fnc = switch (_what) do {
	case "IP_Glass_Core": {IP_fnc_glassCore};
	case "IP_Glass_Status": {IP_fnc_glassStatus};
	case "IP_Glass_Details": {IP_fnc_glassDetails};
	default {nil}
};

if (isNil "_fnc") exitWith {};

closeDialog 0;

if (player getVariable [_what, false]) then {
	player setVariable [_what, false];
} else {
	_goggles = getArray(missionConfigFile >> "mainValues" >> "glassGoggles");
	
	player setVariable [_what, true];
	[_goggles] spawn _fnc;
};

[] spawn IP_fnc_openTacPadDialog;