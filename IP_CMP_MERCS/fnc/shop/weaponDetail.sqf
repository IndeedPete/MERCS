_getOrigin = {
	private "_origin";	
	_weapon = _this;
	
	_origin = getText(missionConfigFile >> "ShopWeapons" >> _weapon >> "origin");
	if (isClass(missionConfigFile >> "ShopWeapons" >> _origin)) then {_origin = getText(missionConfigFile >> "ShopWeapons" >> _origin >> "origin")};	
	
	_origin = "Origin: " + getText(missionConfigFile >> "Factions" >> _origin >> "displayNameShort") + "<br/>";
	_origin
};

_getPrice = {
	private "_amount";	
	_weapon = _this select 0;
	_buying = _this select 1;
	
	_amount = if (isNumber(missionConfigFile >> "ShopWeapons" >> _weapon >> "price")) then {
		(getNumber(missionConfigFile >> "ShopWeapons" >> _weapon >> "price"))
	} else {
		_ref = getText(missionConfigFile >> "ShopWeapons" >> _weapon >> "price");
		(getNumber(missionConfigFile >> "ShopWeapons" >> _ref >> "price"))
	};
	
	if (!_buying) then {_amount = _amount / IP_SellingPriceDivisor};	
	_price = ("Price: €" + ([_amount] call IP_fnc_numberText) + "<br/>");
	_price
};

_getMags = {
	private "_magazines";	
	_weapon = _this;
	_magArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines");
	_magazines = "Magazines:";
	
	{
		_mag = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
		_magazines = _magazines + " " + _mag + ";";
	} forEach _magArr;
	
	_magazines = _magazines + "<br/>";
	_magazines
};

_getOptics = {
	private "_optics";	
	_weapon = _this;
	_opticArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
	_optics = "Optics:";
	
	if (count _opticArr == 0) then {
		_optics = _optics + " N.A.";
	} else {
		{
			_optic = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_optics = _optics + " " + _optic + ";";
		} forEach _opticArr;
	};
	
	_optics = _optics + "<br/>";
	_optics
};

_getMuzzles = {
	private "_muzzles";	
	_weapon = _this;
	_muzzleArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	_muzzles = "Muzzles:";
	
	if (count _muzzleArr == 0) then {
		_muzzles = _muzzles + " N.A.";
	} else {
		{
			_muzzle = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_muzzles = _muzzles + " " + _muzzle + ";";
		} forEach _muzzleArr;
	};
	
	_muzzles = _muzzles + "<br/>";
	_muzzles
};

_getPointerStr = {
	private "_pointerStr";	
	_weapon = _this;
	_pointerArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
	_pointerStr = "Pointer:";
	
	if (count _pointerArr == 0) then {
		_pointerStr = _pointerStr + " N.A.";
	} else {
		{
			_pointer = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_pointerStr = _pointerStr + " " + _pointer + ";";
		} forEach _pointerArr;
	};
	
	_pointerStr = _pointerStr + "<br/>";
	_pointerStr
};

private "_text";
_control = str(_this select 0);
_i = _this select 1;

if (_control == "Control #1500") then {
	_weapon = IP_AvailableWeapons select _i;
	
	_description = getText(configFile >> "CfgWeapons" >> _weapon >> "descriptionShort") + "<br/>";
	_origin = _weapon call _getOrigin;
	_price = [_weapon, true] call _getPrice;
	_magazines = _weapon call _getMags;
	_optics = _weapon call _getOptics;
	_muzzles = _weapon call _getMuzzles;
	_pointerStr = _weapon call _getPointerStr;
	_text = _description + _origin + _price + _magazines + _optics + _muzzles + _pointerStr;
} else {
	_weapons = weaponCargo IP_PlayerBox;	
	_weapon = _weapons select _i;
	
	_description = getText(configFile >> "CfgWeapons" >> _weapon >> "descriptionShort") + "<br/>";
	_origin = _weapon call _getOrigin;
	_price = [_weapon, false] call _getPrice;
	_magazines = _weapon call _getMags;
	_optics = _weapon call _getOptics;
	_muzzles = _weapon call _getMuzzles;
	_pointerStr = _weapon call _getPointerStr;
	_text = _description + _origin + "Selling " + _price + _magazines + _optics + _muzzles + _pointerStr;
};

((findDisplay 10002) displayCtrl 1100) ctrlSetStructuredText (parseText _text);