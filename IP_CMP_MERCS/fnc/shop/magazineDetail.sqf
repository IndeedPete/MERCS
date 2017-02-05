private "_text";

_control = _this select 0;
_i = _this select 1;

if (str(_control) == "Control #1500") then {
	_magazine = IP_AvailableMagazines select _i;
	
	_description = getText(configFile >> "CfgMagazines" >> _magazine >> "descriptionShort") + "<br/>";
	_price = "Price: €" + ([(getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price"))] call IP_fnc_numberText); 
	_text = _description + _price;
} else {
	_magazine = _control lbData _i;
	
	_description = getText(configFile >> "CfgMagazines" >> _magazine >> "descriptionShort") + "<br/>";
	_price = "Price: €" + ([((getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price")) / IP_SellingPriceDivisor)] call IP_fnc_numberText); 
	_text = _description + "Selling " + _price;
};

((findDisplay 10003) displayCtrl 1100) ctrlSetStructuredText (parseText _text);