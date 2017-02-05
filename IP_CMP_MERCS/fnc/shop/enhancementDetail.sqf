private "_text";

_control = _this select 0;
_i = _this select 1;

if (str(_control) == "Control #1500") then {
	_enhancement = IP_AvailableCampEnhancements select _i;
	
	_description = getText(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "description") + "<br/>";
	_price = "Price: €" + ([(getNumber(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "price"))] call IP_fnc_numberText); 
	_text = _description + _price;
} else {
	_enhancements = player getVariable ["IP_CampEnhancements", []];
	_enhancement = _enhancements select _i;
	
	_description = getText(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "description") + "<br/>";
	_text = _description;
};

((findDisplay 10006) displayCtrl 1100) ctrlSetStructuredText (parseText _text);