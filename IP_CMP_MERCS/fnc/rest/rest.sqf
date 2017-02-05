_time = [_this, 0, 0, [0]] call BIS_fnc_param;

closeDialog 0;
["IP_BlackScreen", false] call BIS_fnc_blackOut;

sleep 2;
skipTime _time;
if (getText(missionConfigFile >> "name") in ["Hub01", "Hub02"]) then {
	call IP_scn_dynamicCampInit;
	if (_time >= 1) then {IP_Weather = [(IP_Weather select 0)] call IP_fnc_setWeather};
};

["IP_BlackScreen"] call BIS_fnc_blackIn;

sleep 1;

[] call IP_fnc_showOSD;