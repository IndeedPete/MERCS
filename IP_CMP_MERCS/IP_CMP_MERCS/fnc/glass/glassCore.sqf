#define CHECK ((alive player) && (goggles player in _goggles) && (player getVariable ["IP_Glass_Boot", false]) && (player getVariable ["IP_Glass_Core", false]))

_goggles = _this select 0;

_code = {
	{
		if((player distance _x < 1000) && (!isPlayer _x) && (player knowsAbout _x >= 0.7)) then	{
			_vis = (lineIntersects [eyePos player, eyePos _x, player, _x]) OR (terrainIntersect [eyePos player, eyePos _x]);
			if(!_vis /*&& (vehicle _x == _x)*/) then	{
				#define ColourCiv [1,1,1,1]
				
				private ["_pos", "_kind", "_marker"];
				
				_pos = visiblePosition _x;
				_side = side _x;
				_prefix = switch (_side) do {
					case west: {"b"};
					case east: {"o"};
					case resistance: {"n"};
					default {"b"};
				};
				_colour = if ((!alive _x) or (_side == civilian) or (isNull(driver _x))) then {ColourCiv} else {[_side] call BIS_fnc_SideColor};							
				
				if (_x isKindOf "MAN") then {
					_pos set[2,(getPosATL _x select 2) + 2.2];							
					_colour = if ((!alive _x) or (_side == civilian)) then {ColourCiv} else {[_side] call BIS_fnc_SideColor};
					_kind = "MAN";		
					_marker = "_inf.paa";
				};
				
				if (_x isKindOf "CAR") then {
					_pos set [2, (getPosATL _x select 2) + 4];
					_kind = "CAR";	
					_marker = "_motor_inf.paa";
				};
				
				if (_x isKindOf "TANK") then {
					_pos set [2, (getPosATL _x select 2) + 4];							
					_kind = "TANK";	
					_marker = "_armor.paa";
				};
				
				if (_x isKindOf "AIR") then {
					_pos set [2, (getPosATL _x select 2) + 4.5];							
					_kind = "AIR";	
					_marker = "_air.paa";
				};
				
				if (isNil "_marker") exitWith {};
				drawIcon3D ["\a3\ui_f\data\map\Markers\NATO\" + _prefix + _marker, _colour, _pos, 1, 1, 0, "", 0, 0.04];
			
				if (_x == cursorTarget) then {
					#define CursorIcon "\a3\Ui_F_Curator\Data\CfgMarkers\minefield_ca.paa"
					
					if ((_kind != "AIR") OR {(getPosATL _x select 2) < 1}) then {_pos set [2, ((_pos select 2) / 2)]};
					_text = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
					drawIcon3D [CursorIcon, _colour, _pos, 1, 1, 0, _text, 0, 0.04];
				};
			};
		};
	} forEach (allUnits + vehicles + allDead);
	
	_task = [player] call BIS_fnc_taskCurrent;
	if (_task != "") then {
		_destArr = [_task] call BIS_fnc_taskDestination;
		_pos = if (count _destArr > 2) then {
			_destArr
		} else {
			_obj = _destArr select 0;
			if (!isNull _obj) then {(getPos _obj)}	else {[0, 0, 0]}
		};
		
		if (!([_pos, [0, 0, 0]] call BIS_fnc_areEqual)) then {
			_posMod = [(_pos select 0), (_pos select 1), ((_pos select 2) + 10)];
			drawIcon3D ["\a3\ui_f\data\map\Markers\Military\warning_ca.paa", ([(side player)] call BIS_fnc_SideColor), _posMod, 2, 2, 0, "", 0, 0.04];
		};
	};
};

["IP_OnEachFrameEH", "onEachFrame", _code] call BIS_fnc_addStackedEventHandler;

[] spawn {
	// Vision Enhancements
	disableSerialization;
	_ehVision = ([] call BIS_fnc_displayMission) displayAddEventHandler [
		"KeyDown",
		"
			if (_this select 1 == 49 && (({_x in assignedItems player} count ['NVGoggles', 'NVGoggles_INDEP', 'NVGoggles_OPFOR']) == 0) && (cameraView != 'Gunner')) then {
				switch (player getVariable ['IP_Glass_Vision', 0]) do {
					case 0: {
						setAperture 0.65;					
						player setVariable ['IP_Glass_Vision', 1];
					};
					
					case 1: {
						setAperture -1;					
						player setVariable ['IP_Glass_Vision', 0];
					};
					
					default {};
				};
				
				true
			};
		"
	];
	
	uiNamespace setVariable ["IP_Glass_ehVision", _ehVision];
};

waitUntil {!CHECK};

[] spawn {
	disableSerialization;
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', (uiNamespace getVariable "IP_Glass_ehVision")];
};

["IP_OnEachFrameEH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
setAperture -1;					
player setVariable ['IP_Glass_Vision', 0];