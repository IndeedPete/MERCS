_mission = IP_Main getVariable ["IP_ShopMission", ""];
if (_mission == "") exitWith {hint "No mission selected!"};
if (_mission in ["MMain01"]) exitWith {};

_params = switch (_this) do {
	case "foot": {[("t" + _mission + "InsertionFoot"), "foot"]};
	case "car": {
		_class = typeOf (vehicle player);
		[("t" + _mission + "InsertionCar"), _class]
	};
	case "heli": {[("t" + _mission + "InsertionHeli"), "heli"]};
	case "boat": {[("t" + _mission + "InsertionBoat"), "boat"]};
	default {[("t" + _mission + "InsertionFoot"), "foot"]};
};

if ((_params select 0) call BIS_fnc_taskExists) then {
	[(_params select 0), "SUCCEEDED"] call BIS_fnc_taskSetState;
	IP_Main setVariable ["IP_ShopInsertion", (_params select 1)];
	false spawn IP_scn_end;
};