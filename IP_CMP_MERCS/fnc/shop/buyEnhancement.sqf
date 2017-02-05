_i = _this;
if (_i == -1) exitWith {hint "You have to select a camp enhancement first!"};

_enhancement = IP_AvailableCampEnhancements select _i;
_price = getNumber(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "price");

if (_price call IP_fnc_purchase) then {
	_inPosession = player getVariable ["IP_CampEnhancements",[]];
	player setVariable ["IP_CampEnhancements", (_inPosession + [_enhancement])];
	call IP_fnc_closeShop;
	IP_AvailableCampEnhancements = IP_AvailableCampEnhancements - [_enhancement];
	
	_enhancement spawn {
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		
		{
			_campEnhancement = _x getVariable ["IP_CampEnhancement", ""];
			if (_campEnhancement == _this) then {
				_x enableSimulation true;
				_x hideObject false;
			};
		} forEach (allMissionObjects "All");
		
		if (isText(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker")) then {
			_marker = getText(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker");
			_marker setMarkerAlpha 1;
		} else {
			if (isArray(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker")) then {
				_markers = getArray(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker");
				{_x setMarkerAlpha 1} forEach _markers;
			};
		};
		
		skipTime 3;
		call IP_scn_dynamicCampInit;
		IP_Weather = [(IP_Weather select 0)] call IP_fnc_setWeather;
		
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		_title = getText(missionConfigFile >> "ShopCampEnhancements" >> _this >> "title");
		["EnhancementDeployed", [_title]] call BIS_fnc_showNotification; //hint ("The camp enhancement '" + _title + "' has been deployed!");
		[] spawn IP_fnc_showOSD;
		[player, 10006] call IP_fnc_openShop;
	};
};