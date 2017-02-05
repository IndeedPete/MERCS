_i = _this;
if (_i == -1) exitWith {hint "You have to select a vehicle!"};

_vehicle = IP_AvailableCampVehicles select _i;
_price = getNumber(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "price");
_requires = if (isText(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "requires")) then {(getText(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "requires"))} else {""};
_isCar = ((getNumber(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "isCar")) == 1);
_vehicleCount = count IP_GarageVehicles;

if ((_requires != "") && {!(_requires in (player getVariable ["IP_CampEnhancements",[]]))}) exitWith {
	_title = getText(missionConfigFile >> "ShopCampEnhancements" >> _requires >> "title");
	hint ("You need to buy the camp enhancement '" + _title + "' first!");
};

if (_isCar && !(_vehicleCount < 2)) exitWith {hint "Your garage is full! Sell a ground vehicle to gain a free place!"};

if (_price call IP_fnc_purchase) then {
	_inPosession = player getVariable ["IP_CampVehicles",[]];
	player setVariable ["IP_CampVehicles", (_inPosession + [_vehicle])];
	call IP_fnc_closeShop;
	
	if (_isCar) then {
		_spot = _vehicleCount + 1;
		_marker = "mGarageSpot" + str(_spot);
		_pos = getMarkerPos _marker;
		
		_created = _vehicle createVehicle _pos;
		_created setDir 180;
		_created setPos _pos;
		//_created lockDriver true;
		clearItemCargo _created;
		
		_created addEventHandler ["Killed", {
			_vehicle = typeOf (_this select 0);
			_inPosession = IP_Main getVariable ["IP_CampVehicles",[]];
			
			_count = {_x == _vehicle} count _inPosession;
			_inPosession = _inPosession - [_vehicle];
			IP_Main setVariable ["IP_CampVehicles", _inPosession];
			if (_count > 1) then {		
				for "_i" from 1 to (_count - 1) do {
					_inPosession = _inPosession + [_vehicle]; // Adds other vehicles of the same class back to array
					IP_Main setVariable ["IP_CampVehicles", ((IP_Main getVariable "IP_CampVehicles") + [_vehicle])];
				};		
			};
		}];
		
		IP_GarageVehicles = IP_GarageVehicles + [_created];
	} else {
		IP_AvailableCampVehicles = IP_AvailableCampVehicles - [_vehicle];
		_identifier = getText(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "identifier");
		{
			_campVehicle = _x getVariable ["IP_CampVehicle", ""];
			if (_campVehicle == _identifier) then {
				_x enableSimulation true;
				_x hideObject false;
			};
		} forEach (allMissionObjects "All");
	};
	
	[player, 10007] spawn IP_fnc_openShop;
};