_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_targets = [_this, 1, [], [[]]] call BIS_fnc_param;
_condition = [_this, 2, {true}, [{}]] call BIS_fnc_param;

while {(alive _unit) && (call _condition)} do {
	_targetSet = _targets call BIS_fnc_selectRandom;
	_target = [_targetSet, 0, objNull, [objNull]] call BIS_fnc_param;
	_stance = [_targetSet, 1, "UP", [""]] call BIS_fnc_param;
	_duration = [_targetSet, 2, 30, [0]] call BIS_fnc_param;
	_roundsPerBurst = [_targetSet, 3, 5, [0]] call BIS_fnc_param;
	_delayBetweenBursts = [_targetSet, 4, 3, [0]] call BIS_fnc_param;
	_delayBetweenShots = [_targetSet, 5, 0.2, [0]] call BIS_fnc_param;
	
	_roundsPerBurst = 1 + floor(random _roundsPerBurst);
	_duration = 1 + floor(random _duration);	
	_unit doWatch ObjNull;
	
	sleep 2.5;
	
	_unit setUnitPos _stance;
	_unit doWatch _target;
	_unit doTarget _target;
	
	sleep 5;
	
	_unit setVariable ["IP_Shooting", true];
	_hande = [_unit, (getPos _target), _roundsPerBurst, _delayBetweenBursts, _delayBetweenShots, {_this getVariable "IP_Shooting"}] spawn IP_fnc_suppressiveFire;
	sleep _duration;
	_unit setVariable ["IP_Shooting", false];
	waitUntil {scriptDone _hande};	
};