private "_weapons";
_i = _this;
if (_i == -1) exitWith {hint "You have to select a weapon first!"};

_weapons = weaponCargo IP_PlayerBox;
_weapon = _weapons select _i;
if (!((isNumber(missionConfigFile >> "ShopWeapons" >> _weapon >> "price")) OR (isText(missionConfigFile >> "ShopWeapons" >> _weapon >> "price")))) exitWith {hint "The trader doesn't accept this weapon."};
_price = if (isNumber(missionConfigFile >> "ShopWeapons" >> _weapon >> "price")) then {
		(getNumber(missionConfigFile >> "ShopWeapons" >> _weapon >> "price"))
} else {
	_ref = getText(missionConfigFile >> "ShopWeapons" >> _weapon >> "price");
	(getNumber(missionConfigFile >> "ShopWeapons" >> _ref >> "price"))
};
_price = _price / IP_SellingPriceDivisor;

_count = {_x == _weapon} count _weapons;
_weapons = _weapons - [_weapon];

for "_i" from 1 to (_count - 1) do {
	_weapons = _weapons + [_weapon];
};

clearWeaponCargo IP_PlayerBox;
{IP_PlayerBox addWeaponCargo [_x, 1]} forEach _weapons;
_price call IP_fnc_addMoney;
call IP_fnc_closeShop;
[player, 10002, _i] spawn IP_fnc_openShop;