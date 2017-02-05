private "_text";

_control = _this select 0;
_i = _this select 1;

if (str(_control) == "Control #1500") then {
	_vehicle = IP_AvailableCampVehicles select _i;
	
	_description = getText(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "description") + "<br/>";
	_price = "Price: €" + ([(getNumber(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "price"))] call IP_fnc_numberText); 
	_text = _description + _price;
} else {
	_vehicles = player getVariable ["IP_CampVehicles", []];
	_vehicle = _vehicles select _i;
	
	_description = getText(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "description") + "<br/>";
	_price = "Selling Price: €" + ([((getNumber(missionConfigFile >> "ShopCampVehicles" >> _vehicle >> "price")) / IP_SellingPriceDivisor)] call IP_fnc_numberText); 
	_text = _description + _price;
};

((findDisplay 10007) displayCtrl 1100) ctrlSetStructuredText (parseText _text);