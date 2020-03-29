_idc = [_this, 0, 1000, [0]] call BIS_fnc_param;
_hours = [_this, 1, 1, [0]] call BIS_fnc_param;

_textHours = [_hours, "HH:MM"] call BIS_fnc_timeToString;
_hours = if ((daytime + _hours) > 24) then {(daytime + _hours - 24)} else {(daytime + _hours)};
_textDaytime = [_hours, "HH:MM"] call BIS_fnc_timeToString;

ctrlSetText [_idc, (_textHours + " Hour(s) - Until " + _textDaytime)];