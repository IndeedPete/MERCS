private "_classes";
_i = _this;
if (_i == -1) exitWith {hint "You have to select a vehicle!"};

_vehicle = (player getVariable ["IP_CampVehicles", []]) select _i;
_price = getNumber(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "price") / IP_SellingPriceDivisor;
_isCar = ((getNumber(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "isCar")) == 1);

_inPosession = player getVariable ["IP_CampVehicles",[]];
call IP_fnc_closeShop;

if (_isCar) then {
	_classes = [];
	{
		_classes = _classes + [(typeOf _x)];
		deleteVehicle _x;
	} forEach IP_GarageVehicles;
	IP_GarageVehicles = [];
	
	_count = {_x == _vehicle} count _classes;
	_classes = _classes - [_vehicle];
	player setVariable ["IP_CampVehicles", (_inPosession - [_vehicle])];
	if (_count > 1) then {		
		for "_i" from 1 to (_count - 1) do {
			_classes = _classes + [_vehicle]; // Adds other vehicles of the same class back to array
			player setVariable ["IP_CampVehicles", ((player getVariable "IP_CampVehicles") + [_vehicle])];
		};		
	};
	
	{
		_spot = (count IP_GarageVehicles) + 1;
		_marker = "mGarageSpot" + str(_spot);
		_pos = getMarkerPos _marker;
		
		_created = _x createVehicle _pos;
		_created setDir 180;
		_created setPos _pos;
		_created lockDriver true;
		clearItemCargo _created;
		
		IP_GarageVehicles = IP_GarageVehicles + [_created];
	} forEach _classes;
} else {
	player setVariable ["IP_CampVehicles", (_inPosession - [_vehicle])];
	IP_AvailableCampVehicles = IP_AvailableCampVehicles + [_vehicle];
	_identifier = getText(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "identifier");
	{
		_campVehicle = _x getVariable ["IP_CampVehicle", ""];
		if (_campVehicle == _identifier) then {
			_x enableSimulation false;
			_x hideObject true;
		};
	} forEach (allMissionObjects "All");
};

_price call IP_fnc_addMoney;
[player, 10007] spawn IP_fnc_openShop;