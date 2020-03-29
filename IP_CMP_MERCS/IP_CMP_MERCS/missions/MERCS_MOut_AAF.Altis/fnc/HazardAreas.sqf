private ["_hazardWhitelist", "_hazardBlackList"];
_hazardWhitelist = []; // If more than one element script will only consider whitelisted areas.
_hazardBlackList = []; // If more than one script will determine if possible hazard area centre would be in blacklisted marker area and re-calculate position if necessary.
{
	if (["mHazardWhitelist", _x] call BIS_fnc_inString) then {_hazardWhitelist = _hazardWhitelist + [_x]};
	if (["mHazardBlacklist", _x] call BIS_fnc_inString) then {_hazardBlackList = _hazardBlackList + [_x]};
} forEach allMapMarkers;

if (!IP_TESTMODE) then {
		{_x setMarkerAlpha 0} forEach (_HazardWhitelist + _HazardBlackList); // Make White/Blacklistmarkers invisible.
};

_mapCentre = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_mapRadius = getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize") / 4; // Divisor of 2 seems to be too small...
_areaCount = 40 + round(random 20); // ToDo: AJUST!
_logicCentre = createCenter sideLogic;
_logicGroup = createGroup _logicCentre;

for "_i" from 0 to (_areaCount - 1) do {

		// Determine Position
		_pos = if (count _HazardWhitelist > 0) then {
				private "_possiblePos";
				_whichOne = _HazardWhitelist call BIS_fnc_selectRandom; // Pick random whitelisted zone.
				_possiblePos = [_whichOne, 0] call IP_fnc_SHKPos; // Determine possible area centre pos.
				if (count _HazardBlackList > 0) then { // If there are blacklisted areas.
						while {{[_x, _possiblePos] call BIS_fnc_inTrigger} count _HazardBlackList > 0} do { // Look for new position while current candidate is in blacklisted area.
								_possiblePos = [_mapCentre, _mapRadius, [0, 360], 0] call IP_fnc_SHKPos;
						};
				};
				_possiblePos // Return final candidate.
		} else {
				private "_possiblePos";
				_possiblePos = [_mapCentre, _mapRadius, [0, 360], 0] call IP_fnc_SHKPos; // Determine possible area centre pos.
				if (count _HazardBlackList > 0) then { // If there are blacklisted areas.
						while {{[_x, _possiblePos] call BIS_fnc_inTrigger} count _HazardBlackList > 0} do { // Look for new position while current candidate is in blacklisted area.
								_possiblePos = [_mapCentre, _mapRadius, [0, 360], 0] call IP_fnc_SHKPos;
						};
				};
				_possiblePos // Return final candidate.
		};

		_radius = 20 + (random 60); // Determine radius. TODO: ADJUST!
		_hazard = "RAD";//["BIO", "CHEM", "RAD", "FREEZER", "BLASTER", "TRIP"] call BIS_fnc_selectRandom; // Determine Hazard ToDo: Add more hazards!

		_GL = _logicGroup createUnit ["logic", _pos, [], 0, "NONE"];
		_GL setPos _pos;
		_GL setVariable ["SURF_Hazard", _hazard];
		_GL setVariable ["SURF_Radius", _radius];
		if (_hazard in ["FREEZER"]) then {_GL setVariable ["SURF_SafeZone", (_radius * 0.25)]}; // ToDo: Adjust safe zone (25% of radius).
};

{
	_hazard = toUpper(_x getVariable ["SURF_Hazard", ""]);
	if (_hazard != "") then {
		_pos = getPos _x;
		_radius = _x getVariable ["SURF_Radius", 99999];

		/*
		// Hazard specific eventhandlers, code, functions, whatever.
		switch (_hazard) do {
			case "FREEZER": {
				_x spawn {
					_pos = getPos _this;
					_radius = _this getVariable ["SURF_Radius", 99999];
					_this setVariable ["SURF_SafeZone", (_radius * 0.25)];
					while {true} do {
						_flrObj = _this getVariable ["SURF_FlareObject", ObjNull];
						waitUntil {(!isNull(_pos nearestObject "grenadeHand")) && {(_pos nearestObject "grenadeHand") distance _pos <= _radius} && {isNull _flrObj}}; // Check if throwable is in range.

						_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
						_soundToPlay = _soundPath + "HazardAreas\sounds\single_rumble.ogg";
						playSound3D [_soundToPlay, player];

						_flrObj = "F_20mm_White" createVehicle (_this ModelToWorld [0,0,1.5]);
						_this setVariable ["SURF_FlareObject", _flrObj];

						waitUntil {isNull(_pos nearestObject "grenadeHand")}; // Wait until it's gone.
						sleep 5;
					};
				};
			};*/

			//default {/* Do Nothing */};
		//};

		// DEBUG - Create Testmarker for every anomaly (editor placed and random)
		if (IP_TESTMODE) then {
			_colour = switch (_hazard) do {
				case "BIO": {"ColorGreen"};
				case "CHEM": {"ColorYellow"};
				case "RAD": {"ColorRed"};
				case "FREEZER": {"ColorBlue"};
				case "BLASTER": {"ColorOrange"};
				case "TRIP": {"ColorPink"};
				default {"ColorWhite"};
			};

			_marker = createMarker[(_hazard + str(_x)), _pos];
			_marker setMarkerShape "ELLIPSE";
			_marker setMarkerSize [_radius, _radius];
			_marker setMarkerColor _colour;
		};
	};
} forEach (allMissionObjects "logic"); // For all game logics.

// Functions
SURF_fnc_dangerousAreas = { // Custom Function - can be called anywhere during a mission.
	_this spawn {
		_unit = [_this, 0, player, [ObjNull]] call BIS_fnc_param; // Validate incoming parameters.

		// While unit is alive check if it is inside a danger zone.
		while {alive _unit} do {
				private ["_nearByLogics", "_damageFactor", "_inBIOHazard", "_inCHEMHazard", "_inRADHazard", "_inFREEZER", "_inBLASTER", "_inTRIP"]; // Adding local variables to innermost scope. Means they can be filled/overwritten within loops / control structures.
				_nearByLogics = nearestObjects [(getPos _unit), ["logic"], 5000]; // ToDo: Adjust radius (500) to maximum hazard zone diameter.
				_damageFactor = 0; // Initialise / reset damage factor;
				_inBIOHazard = false; // Initialise / reset
				_inCHEMHazard = false; // Initialise / reset
				_inRADHazard = false; // Initialise / reset
				_inFREEZER = nil;
				_inBLASTER = nil;
				_inTRIP = nil;

				{
						if (_unit distance _x <= (_x getVariable ["SURF_Radius", 99999])) then {
								switch (toUpper(_x getVariable ["SURF_Hazard", ""])) do {
										case "BIO": {
												if (!_inBIOHazard) then { // Already in hazard.
														_damageFactor = _damageFactor + 0.02;
														_inBIOHazard = true;
												};
										};

										case "CHEM": {
												if (!_inCHEMHazard) then { // Already in hazard.
														_damageFactor = _damageFactor + 0.02;
														_inCHEMHazard = true;
												};
										};

										case "RAD": {
												if (!_inRADHazard) then { // Already in hazard.
														_damageFactor = _damageFactor + 0.02;
														_inRADHazard = true;
												};
										};

										case "FREEZER": {
												if (isNil "_inFREEZER") then { // Already in hazard.
														_damageFactor = _damageFactor + 0.00;
														_inFREEZER = _x;
												};
										};

										case "BLASTER": {
												if (isNil "_inBLASTER") then { // Already in hazard.
														_damageFactor = _damageFactor + 0.00;
														_inBLASTER = _x;

												};
										};

										case "TRIP": {
												if (isNil "_inTRIP") then { // Already in hazard.
														_damageFactor = _damageFactor + 0.00;
														_inTRIP = _x;

												};
										};


										default {/* Do nothing. */};
								};
						};
				} forEach _nearByLogics;

				_isPlayer = isPlayer _unit; // To enable ppEffects and sounds only for players with mine detectors.
				_withMineDetector = true;//"MineDetector" in (items _unit); // To enable ppEffects and sounds only for players with mine detectors.



	// VISUAL AND ACOUSTICAL CLUES

				// Show / Remove BIO Icon
				if (_inBIOHazard) then {
						//  Check if unit has been within hazard area in the last iteration.
						if (!(_unit getVariable ["SURF_inBIOHazard", false]) && _isPlayer) then {
								if (_withMineDetector) then {
												//////////// PLAYING SOUND HERE /////////
												_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
												_soundToPlay = _soundPath + "HazardAreas\sounds\bio.ogg";
												playSound3d [_soundToPlay, _UNIT];

												42 cutRsc ["SURF_RSC_BIO", "PLAIN"]; // Fade in icon - 42 = layer

										/////////// ppEFFECT COLORCORRECTIONS HERE
								};

								_myPPEffect = ppEffectCreate ["ColorCorrections", 2004];
								_myPPEffect ppEffectEnable true;
								_myPPEffect ppEffectAdjust [0.5, 1.4, 0,[0.9,0.6,0.3,0.2],[0.9,0.6,0.3,1],[0.9,0.6,0.3,1]];
								_myPPEffect ppEffectCommit 10;
								_unit setVariable ["PPEffectBIO", _myPPEffect]; // Speichern

								_myPPChrome = ppEffectCreate ["ChromAberration", 501];
								_myPPChrome ppEffectEnable true;
								_myPPChrome ppEffectAdjust [0.05, 0, 0.05];
								_myPPChrome ppEffectCommit 10;
								_unit setVariable ["PPEffectChrome", _myPPChrome]; // Speichern
						};
				} else {
						//  Check if unit has been within hazard area in the last iteration.
						if (_unit getVariable ["SURF_inBIOHazard", false] && _isPlayer) then {
								if (_withMineDetector) then {
										42 cutText ["", "PLAIN"]; // Fade out icon / replace icon on layer 42 with empty text...
								};

								_myPPEffect = _unit getVariable "PPEffectBIO";
								_myPPEffect ppEffectAdjust [1, 1, 0,[0.0,0.0,0.0,0],[0.5,0.5,0.5,1],[0.5,0.5,0.5,1]];
								_myPPEffect ppEffectCommit 10;

								_myPPChrome = _unit getVariable "PPEffectChrome";
								_myPPChrome ppEffectAdjust [0.0, 0, 0.0];
								_myPPChrome ppEffectCommit 10;

						};
				};





				// Show / Remove CHEM Icon
				if (_inCHEMHazard) then {
						//  Check if unit has been within hazard area in the last iteration.
						if (!(_unit getVariable ["SURF_inCHEMHazard", false]) && _isPlayer) then {
								if (_withMineDetector) then {

										43 cutRsc ["SURF_RSC_CHEM", "PLAIN"]; // Fade in icon - 43 = layer
								};

						_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
						_soundToPlay = _soundPath + "HazardAreas\sounds\chem.ogg";
						playSound3D [_soundToPlay, _UNIT];                   //TODO: EMMIT SOUND FROM CENTER OF THIS ZONE!

						/////////// ppEFFECT BLUR HERE
						_myPPEffect = ppEffectCreate ["DynamicBlur", 401];
						_myPPEffect ppEffectEnable true;
						_myPPEffect ppEffectAdjust [0.7];
						_myPPEffect ppEffectCommit 10;
						_unit setVariable ["PPEffectCHEM", _myPPEffect];

						addCamShake [15, 30, 0.4];


						};
				} else {
						//  Check if unit has been within hazard area in the last iteration.
						if (_unit getVariable ["SURF_inCHEMHazard", false] && _isPlayer) then {
								if (_withMineDetector) then {

										43 cutText ["", "PLAIN"]; // Fade out icon / replace icon on layer 43 with empty text...

								};
						_myPPEffect = _unit getVariable "PPEffectCHEM";
						_myPPEffect ppEffectAdjust [0];
						_myPPEffect ppEffectCommit 10;

						};
				};

				// Show / Remove RAD Icon
				if (_inRADHazard) then {
						//  Check if unit has been within hazard area in the last iteration.
						if (!(_unit getVariable ["SURF_inRADHazard", false]) && _isPlayer) then {
								if (_withMineDetector) then {

										//////////// PLAYING SOUND HERE /////////
										_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
										_soundToPlay = _soundPath + "snd\Beep1.ogg";
										playSound3D [_soundToPlay, _UNIT];

										44 cutRsc ["SURF_RSC_RAD", "PLAIN"]; // Fade in icon - 44 = layer
								};

						/////////// ppEFFECT GRAIN HERE

						_myPPEffectGrain = ppEffectCreate ["filmGrain", 2001];
						_myPPEffectGrain ppEffectEnable true;
						_myPPEffectGrain ppEffectAdjust [0.05, 0, 50, 1, 1, true];
						_myPPEffectGrain ppEffectCommit 10;
						_unit setVariable ["PPEffectGrain", _myPPEffectGrain];
						
						/*
						_myPPEffect = ppEffectCreate ["ColorCorrections", 2006];
						_myPPEffect ppEffectEnable true;
						_myPPEffect ppEffectAdjust [0.9, 1.2, 0, [0.5,0.5,0.5,0],[0.5,0.5,0.5,0],[0.5,0.5,0.5,0]];
						_myPPEffect ppEffectCommit 30;
						_unit setVariable ["PPEffectColor", _myPPEffect];
						*/


						};
				} else {
						//  Check if unit has been within hazard area in the last iteration.
						if (_unit getVariable ["SURF_inRADHazard", false] && _isPlayer) then {
								if (_withMineDetector) then {
									44 cutText ["", "PLAIN"]; // Fade out icon / replace icon on layer 44 with empty text...
								};


								_myPPEffectGrain = _unit getVariable "PPEffectGrain";
								_myPPEffectGrain ppEffectAdjust [0.00, 0, 50, 1, 1, true];
								_myPPEffectGrain ppEffectCommit 10;
								
								/*
								_myPPEffect = _unit getVariable "PPEffectColor";
								_myPPEffect ppEffectAdjust [1, 1, 0,[0.0,0.0,0.0,0],[0.5,0.5,0.5,1],[0.5,0.5,0.5,1]];
								_myPPEffect ppEffectCommit 10;*/



						};
				};





				// FREEZER ANOMALY
				if (!isNil "_inFREEZER") then {
						//  Check if unit has been within FREEZER in the last iteration.
						_temp = _unit getVariable ["SURF_inFREEZER", nil];
						if (isNil "_temp") then {
								//////////// PLAYING SOUND HERE /////////
								_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
								_soundToPlay = _soundPath + "HazardAreas\sounds\single_rumble.ogg";
								playSound3D [_soundToPlay, _UNIT];
														};

														_flrObj = _inFREEZER getVariable ["SURF_FlareObject", ObjNull];
														if (isNull _flrObj) then {
																_flrObj = "F_20mm_White" createVehicle (_inFREEZER ModelToWorld [0,0,1.5]);
																_inFREEZER setVariable ["SURF_FlareObject", _flrObj];
														};

														// Check if unit is already past safe zone (radius - safezone).
														if ((_unit distance _inFREEZER < ((_inFREEZER getVariable "SURF_Radius") - (_inFREEZER getVariable ["SURF_SafeZone", 10]))) && !(_unit getVariable ["SURF_WakeActionSet", false])) then {
																		_unit setVariable ["SURF_WakeActionSet", true];
																		sleep 3;
																		_unit enableSimulation false;
																		_unit addAction ["<t color='#00FF00'>Wake up!</t>", {(_this select 0) removeAction (_this select 2); (_this select 0); (_this select 0) enableSimulation true; (_this select 0) setVariable ["SURF_WakeActionSet", nil];}, nil, 6, true, true, "", "(_target != _this) && (true)"]; // ToDo: Adjust max distance (10). Last parameter is condition to show the action. //(_target distance _this <= 10)
														};
				} else {
						//  Check if unit has been within FREEZER in the last iteration.
						_temp = _unit getVariable ["SURF_inFREEZER", nil];
						if (!isNil "_temp") then {

						};
				};


				// TRIP ANOMALY
				if (!isNil "_inTRIP") then {
						//  Check if unit has been within TRIP in the last iteration.
						_temp = _unit getVariable ["SURF_inTRIP", nil];
						_tripped = _unit getVariable ["SURF_TRIPPED", nil];
						if (isNil "_temp") then {
												//////////// PLAYING SOUND HERE /////////   // this is what happens in the safe zone
												_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
												_soundToPlay = _soundPath + "HazardAreas\sounds\Dripping_Reverse.ogg";
												playSound3D [_soundToPlay, _UNIT];
												};




												// Check if unit is already past safe zone (radius - safezone).

												if ((_unit distance _inTRIP < ((_inTRIP getVariable "SURF_Radius") - (_inTRIP getVariable ["SURF_SafeZone", 10]))) && !(_unit getVariable ["SURF_TRIPPED", false])) then {
																		_unit setVariable ["SURF_TRIPPED", true];
																		_unit setVariable ["SURF_inTrip", true];   //TODO: delete if error


														//this is what happens when you step into the anomaly
														_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
														_soundToPlay = _soundPath + "HazardAreas\sounds\TRIP.ogg";
														playSound3D [_soundToPlay, _UNIT];   //TODO: EMMIT SOUND FROM CENTER OF THIS ZONE!

														enableCamShake true;
														addCamShake [400, 120, 0.2];
														_myPPEffect = ppEffectCreate ["ColorInversion", 2501];
														_myPPEffect ppEffectEnable true;
														_myPPEffect ppEffectAdjust [0.8,0.4,0.2];
														_myPPEffect ppEffectCommit 10;

														_myPPChrome = ppEffectCreate ["ChromAberration", 501];
														_myPPChrome ppEffectEnable true;
														_myPPChrome ppEffectAdjust [0.4, 0, 0.4];
														_myPPChrome ppEffectCommit 10;

														_unit setVariable ["PPEffectTRIP1", _myPPEffect];
														_unit setVariable ["PPEffectTRIP2", _myPPChrome];

														sleep 3;

												};
				} else {
						//  Check if unit has been within TRIP in the last iteration.
						_temp = _unit getVariable ["SURF_inTRIP", nil];
						_tripped = _unit getVariable ["SURF_TRIPPED", nil];
						if (!isNil "_tripped") then {
								_myPPEffect = _unit getVariable "PPEffectTRIP1";
								_myPPEffect ppEffectAdjust [0,0,0];            //TODO: undefined variable if you don't go beyond safe zone
								_myPPEffect ppEffectCommit 30;

								_myPPChrome = _unit getVariable "PPEffectTRIP2";
								_myPPChrome ppEffectAdjust [0,0,0];
								_myPPChrome ppEffectCommit 30;

								_unit setVariable ["SURF_inTrip", nil];
								_unit setVariable ["SURF_TRIPPED", nil];

								sleep 30;
								resetCamShake;

						};
				};







				// BLASTER ANOMALY
				if (!isNil "_inBLASTER") then {
						//  Check if unit has been within BLASTER in the last iteration.
						_temp = _unit getVariable ["SURF_inBLASTER", nil];
						_randomexplosion = "";
						_randomtime = 0.0;
						if (isNil "_temp") then {
								//////////// PLAYING SOUND HERE /////////
								_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
								_soundToPlay = _soundPath + "HazardAreas\sounds\bristeling.ogg";
								playSound3D [_soundToPlay, _UNIT];
														};

														_flrObj = _inBLASTER getVariable ["SURF_FlareObject", ObjNull];
														if (isNull _flrObj) then {
																_flrObj = "F_20mm_Red" createVehicle (_inBLASTER ModelToWorld [0,0,0.05]);


																_inBLASTER setVariable ["SURF_FlareObject", _flrObj];
														};

														// Check if unit is already past safe zone (radius - safezone).
														if ((_unit distance _inBLASTER < ((_inBLASTER getVariable "SURF_Radius") - (_inBLASTER getVariable ["SURF_SafeZone", 10])))) then {

																		_randomtime = [0.5,1,2,4,7] call BIS_fnc_selectRandom;
																		sleep _randomtime;
																		_randomexplosion = ["M_Titan_AT"] call BIS_fnc_selectRandom; // ["HelicopterExploSmall","grenade"]
																		_randomexplosion createVehicle (_inBLASTER ModelToWorld [0,0,0.15]);



														};
				} else {
						//  Check if unit has been within BLASTER in the last iteration.
						_temp = _unit getVariable ["SURF_inBLASTER", nil];
						if (!isNil "_temp") then {

						};
				};







				// Set for next iteration.
				_unit setVariable ["SURF_inBIOHazard", _inBIOHazard];
				_unit setVariable ["SURF_inCHEMHazard", _inCHEMHazard];
				_unit setVariable ["SURF_inRADHazard", _inRADHazard];

				if (isNil "_inFREEZER") then {_unit setVariable ["SURF_inFREEZER", nil]} else {_unit setVariable ["SURF_inFREEZER", _inFREEZER]};
				if (isNil "_inTRIP") then {_unit setVariable ["SURF_inTRIP", nil]} else {_unit setVariable ["SURF_inTRIP", _inTRIP]};

				// Apply damage - Instant kill after 90% damage - ToDo: adjust!
				if (!IP_TESTMODE) then {
					_damage = damage _unit;
					if (_damage > 0.9) then {
						_unit setDamage 1;
					} else {
						_health = 1 - _damage;
						_add = _health * _damageFactor;
						_unit setDamage (_damage + _add);
					};
				};

				// Run this loop every X seconds.
				sleep 1; // ToDo: Adjust!
		};
	};
};