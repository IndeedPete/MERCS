// [IP_Dealer, (group player), "Freezoners", "Eliminate", [250, 1000]] call IP_fnc_simpleMissionFlow;
if (!isServer) exitWith {};
_this spawn {
	scopeName "main";
	private ["_groupSetup", "_agent", "_ownerGrp", "_faction", "_missionType", "_radius", "_enemyFactions", "_enemySide", "_directionType", "_centre", "_minRadius", "_maxRadius", "_pos", "_attempts", "_keyValuePair", "_keyVars", "_toCheck", "_task", "_obj"];

	_groupSetup = {
		private ["_grp", "_faction", "_leader", "_units", "_dest", "_wp"];
		_grp = _this select 0;
		_faction = _this select 1;
		_leader = leader _grp;
		_units = units _grp;
		_dest = getPos _leader;
		
		_grp setBehaviour "SAFE";
		_grp setSpeedMode "LIMITED";
		
		_wp = _grp addWaypoint [_dest, 0];
		_wp setWaypointType "SAD";
		_wp = _grp addWaypoint [_dest, 1];
		_wp setWaypointType "CYCLE";
		
		[_leader] call IP_fnc_track;			
		{_x setVariable ["IP_Faction", _faction]} forEach _units;
	};

	_agent = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
	if (isNull _agent) exitWith {["_agent must not be null!"] call BIS_fnc_error};

	_ownerGrp = [_this, 1, GrpNull, [GrpNull]] call BIS_fnc_param;
	if (isNull _ownerGrp) exitWith {["_ownerGrp must not be null!"] call BIS_fnc_error};

	_faction = [_this, 2, (_agent getVariable ["IP_Faction", ""]), [""]] call BIS_fnc_param;
	_missionType = [_this, 3, "Find", [""]] call BIS_fnc_param;
	if (!(_missionType in ["Find", "Eliminate", "Secure"])) exitWith {["_missionType unknown: %1", _missionType] call BIS_fnc_error};

	_radius = [_this, 4, (_agent getVariable ["IP_MissionRadius", []]), [[]]] call BIS_fnc_param;
	_enemyFactions = [_this, 5, (_faction call IP_fnc_getEnemyFactions), ["", []]] call BIS_fnc_param;
	_enemySide = [_this, 6, east, [west]] call BIS_fnc_param;
	_directionType = [_this, 7, (["Orientation", "Grid"] call BIS_fnc_selectRandom), [""]] call BIS_fnc_param;

	if (isNil "IP_TaskEliminateIndex") then {IP_TaskEliminateIndex = 0};
	if (isNil "IP_TaskFindIndex") then {IP_TaskFindIndex = 0};
	if (isNil "IP_TaskSecureIndex") then {IP_TaskSecureIndex = 0};

	_centre = getPos _agent;
	_minRadius = if (count _radius < 1) then {0} else {(_radius select 0)};
	_maxRadius = if (count _radius < 2) then {-1} else {(_radius select 1)};
	_pos = [];
	_attempts = 0;

	while {_attempts < 1000} do {
		private "_inHazardZone";
		_testPos = [_centre, _minRadius, _maxRadius, 2, 0, 0.7, 0] call BIS_fnc_findSafePos;
		_nearByLogics = nearestObjects [_testPos, ["logic"], 1001];
		_inHazardZone = false;
		
		{
			if (!(toUpper(_x getVariable ["SURF_Hazard", ""]) in ["", "ZOMBIES"]) && {_testPos distance _x <= (_x getVariable ["SURF_Radius", 99999])}) exitWith {
				_inHazardZone = true;
			};
		} forEach _nearByLogics;
		
		if (!_inHazardZone) then {
			_pos = _testPos;
			breakTo "main";
		};
		_attempts = _attempts + 1;
	};

	if (count _pos == 0) exitWith {["No valid position found!"] call BIS_fnc_error};

	_keyVars = switch (_missionType) do {
		case "Eliminate": {
			_taskID = IP_TaskEliminateIndex;
			IP_TaskEliminateIndex = IP_TaskEliminateIndex + 1;
			_enemyFaction = "Contention";
			
			_grp = createGroup east;
			_unit = _grp createUnit ["O_Soldier_SL_F", _pos, [], 0, "NONE"];
			[_unit] call IP_fnc_track;
			{_unit setVariable _x} forEach [["IP_TaskEliminateIndex", _taskID], ["IP_TaskOwner", _ownerGrp], ["IP_TaskAgent", _agent]];
			[_grp, _enemyFaction] call _groupSetup;
			
			_unit addEventHandler ["Killed", {
				_unit = _this select 0;
				_taskID = _unit getVariable "IP_TaskEliminateIndex";
				_ownerGrp = _unit getVariable "IP_TaskOwner";
				_agent = _unit getVariable "IP_TaskAgent";
				_ownerGrp setVariable [("IP_TaskEliminate" + str(_taskID)), true];
				
				[[("tTaskEliminate" + str(_taskID)), (getPosATL _agent)], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
			}];
			
			_patrolGrp = [_pos, _enemySide, [3, 5]] call IP_fnc_createContentionPatrol;
			_units = units _patrolGrp;
			[_patrolGrp, _enemyFaction] call _groupSetup;
			_unit setVariable ["IP_Patrol", _units];
			
			_task = "tTaskEliminate" + str(_taskID);
			[_missionType, _ownerGrp, _task, _faction, _enemyFaction, _agent, _unit, _directionType] call IP_fnc_createGenericTask;
			[("IP_TaskEliminate" + str(_taskID)), _task, _unit]
		};

		case "Find": {
			_taskID = IP_TaskFindIndex;
			IP_TaskFindIndex = IP_TaskFindIndex + 1;
			_enemyFaction = "Zombies";
			
			_unit = [_pos] call IP_fnc_createFreezoner;
			[_unit] call IP_fnc_track;
			{_unit setVariable _x} forEach [["IP_TaskFindIndex", _taskID], ["IP_TaskOwner", _ownerGrp], ["IP_TaskAgent", _agent]];
			[_unit] call IP_fnc_deadBody;
			
			_actionParams = [
				_unit,
				[
					"Search Body",
					{
						_unit = _this select 0;
						_taskID = _unit getVariable "IP_TaskFindIndex";
						_ownerGrp = _unit getVariable "IP_TaskOwner";
						_agent = _unit getVariable "IP_TaskAgent";
						
						[_unit, "removeAllActions", _ownerGrp] call BIS_fnc_MP;
						_ownerGrp setVariable [("IP_TaskFind" + str(_taskID)), true];					
						[[("tTaskFind" + str(_taskID)), (getPosATL _agent)], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
					},
					nil,
					1.5,
					true,
					true,
					"",
					"(_target distance _this <= 3) && (leader(group _this) == _this) && ((group _this) == (_target getVariable 'IP_TaskOwner'))"
				]
			];
			
			[_actionParams, "addAction", _ownerGrp] call BIS_fnc_MP;
			_logic = [_pos] call IP_fnc_createZombieLogic;
			_unit setVariable ["IP_ZombieLogic", _logic];
			
			_task = "tTaskFind" + str(_taskID);
			[_missionType, _ownerGrp, _task, _faction, _enemyFaction, _agent, _unit, _directionType] call IP_fnc_createGenericTask;
			[("IP_TaskFind" + str(_taskID)), _task, _unit]
		};
		
		case "Secure": {
			_taskID = IP_TaskSecureIndex;
			IP_TaskSecureIndex = IP_TaskSecureIndex + 1;		
			_enemyFaction = if (typeName _enemyFactions == "ARRAY") then {
				if (count _enemyFactions > 0) then {
					(_enemyFactions call BIS_fnc_selectRandom)
				} else {
					""
				};
			} else {
				_enemyFactions
			};
			
			_obj = "Land_Laptop_unfolded_F" createVehicle _pos;
			[_obj] call IP_fnc_track;
			{_obj setVariable _x} forEach [["IP_TaskSecureIndex", _taskID], ["IP_TaskOwner", _ownerGrp], ["IP_TaskAgent", _agent]];
			
			_actionParams = [
				_obj,
				[
					"Secure Laptop",
					{
						_obj = _this select 0;
						_taskID = _obj getVariable "IP_TaskSecureIndex";
						_ownerGrp = _obj getVariable "IP_TaskOwner";
						_agent = _obj getVariable "IP_TaskAgent";
						
						[_obj, "removeAllActions", _ownerGrp] call BIS_fnc_MP;
						_obj hideObjectGlobal true;
						_ownerGrp setVariable [("IP_TaskSecure" + str(_taskID)), true];					
						[[("IP_TaskSecure" + str(_taskID)), (getPosATL _agent)], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
					},
					nil,
					1.5,
					true,
					true,
					"",
					"(_target distance _this <= 3) && (leader(group _this) == _this) && ((group _this) == (_target getVariable 'IP_TaskOwner'))"
				]
			];
			
			[_actionParams, "addAction", _ownerGrp] call BIS_fnc_MP;
			if (_enemyFaction == "Contention") then {
				_patrolGrp = [_pos, _enemySide, [3, 5]] call IP_fnc_createContentionPatrol;
				_units = units _patrolGrp;
				[_patrolGrp, _enemyFaction] call _groupSetup;
				_obj setVariable ["IP_Patrol", _units];
			} else {
				_logic = [_pos] call IP_fnc_createZombieLogic;
				_obj setVariable ["IP_ZombieLogic", _logic];
			};
			
			_task = "IP_TaskSecure" + str(_taskID);
			[_missionType, _ownerGrp, _task, _faction, _enemyFaction, _agent, _obj, _directionType] call IP_fnc_createGenericTask;
			[("IP_TaskSecure" + str(_taskID)), _task, _obj]
		};
	};

	_toCheck = _keyVars select 0;
	waitUntil {((_ownerGrp getVariable [_toCheck, false]) && {(leader _ownerGrp) distance _agent <= 2}) OR ({alive _x} count(units _ownerGrp) == 0)};

	if ({alive _x} count(units _ownerGrp) > 0) then {
		_task = _keyVars select 1;
		[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
	};

	_obj = _keyVars select 2;
	switch (_missionType) do {
		case "Eliminate": {
			_units = _obj getVariable "IP_Patrol";
			{deleteVehicle _x} forEach (_units + [_obj]);
		};
		
		case "Find": {
			_logic = _obj getVariable "IP_ZombieLogic";
			_logic setVariable ["SURF_Hazard", nil];
			_zombies = _logic getVariable ["SURF_Zombies", []];
			{deleteVehicle _x} forEach (_zombies + [_obj, _logic]);
		};
		
		case "Secure": {
			if (count(_obj getVariable ["IP_Patrol", []]) > 0) then {
				_units = _obj getVariable "IP_Patrol";
				{deleteVehicle _x} forEach (_units + [_obj]);
			};
			
			if (!isNull(_obj getVariable ["IP_ZombieLogic", ObjNull])) then {
				_logic = _obj getVariable "IP_ZombieLogic";
				_logic setVariable ["SURF_Hazard", nil];
				_zombies = _logic getVariable ["SURF_Zombies", []];
				{deleteVehicle _x} forEach (_zombies + [_obj, _logic]);
			};
		};
	};
};