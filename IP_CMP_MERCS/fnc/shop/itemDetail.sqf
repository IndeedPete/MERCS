_getDescription = {
	_item = _this select 0;
	_category = _this select 1;
	
	_parent = if (isClass(configFile >> "CfgWeapons" >> _item)) then {
		"CfgWeapons"
	} else {
		_ret = if (isClass(configFile >> "CfgVehicles" >> _item)) then {"CfgVehicles"} else {"CfgGlasses"};
		_ret
	};

	_customDescription = if (isText(missionConfigFile >> "ShopItems" >> _category >> _item >> "description")) then {
		((getText(missionConfigFile >> "ShopItems" >> _category >> _item >> "description")) + "<br/>")
	} else {
		""
	};	
	
	_description = getText(configFile >> _parent >> _item >> "descriptionShort");
	_description = _description  + "<br/>" + _customDescription;
	_description
};

private "_text";
_control = _this select 0;
_i = _this select 1;

if (str(_control) == "Control #1500") then {
	_item = IP_AvailableItems select _i;
	
	_category = ["ShopItems", _item] call IP_fnc_getConfigCategory;
	_description = [_item, _category] call _getDescription;
	_price = "Price: €" + ([(getNumber(missionConfigFile >> "ShopItems" >> _category >> _item >> "price"))] call IP_fnc_numberText);
	_text = _description + _price;
} else {
	_item = _control lbData _i;
	
	_category = ["ShopItems", _item] call IP_fnc_getConfigCategory;
	_description = [_item, _category] call _getDescription;
	_price = "Price: €" + ([((getNumber(missionConfigFile >> "ShopItems" >> _category >> _item >> "price")) / IP_SellingPriceDivisor)] call IP_fnc_numberText);
	_text = _description + "Selling " + _price;
};

((findDisplay 10004) displayCtrl 1100) ctrlSetStructuredText (parseText _text);