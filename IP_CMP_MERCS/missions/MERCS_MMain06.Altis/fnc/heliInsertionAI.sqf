_units = _this;
_posStart = getMarkerPos "mHeliStart";
_posEnd = getMarkerPos "mHeliEnd";
_dir = markerDir "mHeliStart";
_data = call(compile(preprocessFileLineNumbers "heliInsertionData.sqf"));

_grp = createGroup civilian;
IP_Pilot = _grp createUnit ["C_man_pilot_F", _posStart, [], 0, "NONE"];
IP_Copilot = _grp createUnit ["C_man_pilot_F", _posStart, [], 0, "NONE"];
IP_Heli = createVehicle ["B_Heli_Light_01_F", _posStart, [], 0, "FLY"];
IP_Heli setDir _dir;
IP_Heli lock 2;
IP_Heli allowDamage false;
IP_Pilot moveInDriver IP_Heli;
IP_Copilot moveInTurret [IP_Heli, [0]];

_grp setCombatMode "BLUE";
_grp allowFleeing 0;
{_x setCaptive true} forEach units _grp;

{
	_x assignAsCargo IP_Heli;
	_x moveInCargo IP_Heli;
} forEach _units;

[IP_Heli, _data] call BIS_fnc_unitPlay;

IP_Heli lock 0;
{
	unassignVehicle _x;
	_x action ["EJECT", IP_Heli];
} forEach _units;
IP_Heli lock 1;

_wp = _grp addWaypoint [_posEnd, 0];
_wp setWaypointType "MOVE";
_wp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach units group this;"];