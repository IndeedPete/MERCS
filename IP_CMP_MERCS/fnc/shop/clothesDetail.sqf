private ["_description", "_text"];

_control = str(_this select 0);
_i = _this select 1;

if (_control == "Control #1500") then {
	_clothes = IP_AvailableClothes select _i;
	
	_price = "Price: €" + ([(getNumber(missionConfigFile >> "ShopClothes" >> _clothes >> "price"))] call IP_fnc_numberText); 
	if (isText(missionConfigFile >> "ShopClothes" >> _clothes >> "description")) then {_description = "Description: " + (getText(missionConfigFile >> "ShopClothes" >> _clothes >> "description")) + "<br/>"} else {_description = ""};
	_text = _description + _price;
} else {
	_clothes = player getVariable "IP_Clothes";
	_clothes = _clothes select _i;
	
	if (isText(missionConfigFile >> "ShopClothes" >> _clothes >> "description")) then {_description = "Description: " + (getText(missionConfigFile >> "ShopClothes" >> _clothes >> "description"))} else {_description = ""};
	_text = _description;
};

((findDisplay 10005) displayCtrl 1100) ctrlSetStructuredText (parseText _text);