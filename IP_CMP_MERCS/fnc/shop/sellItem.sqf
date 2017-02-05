private "_items";
_i = _this;
if (_i == -1) exitWith {hint "You have to select an item first!"};

_itemOrBackpack = lbData [1501, _i];
_category = ["ShopItems", _itemOrBackpack] call IP_fnc_getConfigCategory;
if (!(isNumber(missionConfigFile >> "ShopItems" >> _category >> _itemOrBackpack >> "price"))) exitWith {hint "The trader doesn't accept this item."};
_price = getNumber(missionConfigFile >> "ShopItems" >> _category >> _itemOrBackpack >> "price");
_price = _price / IP_SellingPriceDivisor;

if (_category == "Backpacks") then {
	_backpacks = backpackCargo IP_PlayerBox;
	_count = {_x == _itemOrBackpack} count _backpacks;
	_backpacks = _backpacks - [_itemOrBackpack];

	for "_i" from 1 to (_count - 1) do {
		_backpacks = _backpacks + [_itemOrBackpack];
	};

	clearBackpackCargo IP_PlayerBox;
	{IP_PlayerBox addBackpackCargo [_x, 1]} forEach _backpacks;
} else {
	_items = itemCargo IP_PlayerBox;
	_count = {_x == _itemOrBackpack} count _items;
	_items = _items - [_itemOrBackpack];

	for "_i" from 1 to (_count - 1) do {
		_items = _items + [_itemOrBackpack];
	};

	clearItemCargo IP_PlayerBox;
	{IP_PlayerBox addItemCargo [_x, 1]} forEach _items;
};

_price call IP_fnc_addMoney;
call IP_fnc_closeShop;
[player, 10004, _i] spawn IP_fnc_openShop;