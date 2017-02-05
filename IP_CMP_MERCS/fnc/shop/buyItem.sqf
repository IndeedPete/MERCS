_i = _this;
if (_i == -1) exitWith {hint "You have to select an item first!"};

_item = IP_AvailableItems select _i;
_category = ["ShopItems", _item] call IP_fnc_getConfigCategory;
_price = getNumber(missionConfigFile >> "ShopItems" >> _category >> _item >> "price");

if (_price call IP_fnc_purchase) then {
	if ((isClass(configFile >> "CfgWeapons" >> _item)) OR (isClass(configFile >> "CfgGlasses" >> _item))) then {
		IP_PlayerBox addItemCargo [_item, 1];
	} else {
		IP_PlayerBox addBackpackCargo [_item, 1];
	};
	
	call IP_fnc_closeShop;
	[player, 10004, _i] spawn IP_fnc_openShop;
};