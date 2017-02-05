private "_magazines";
_i = _this;
if (_i == -1) exitWith {hint "You have to select a magazine first!"};

_magazine = lbData [1501, _i];
if (!(isNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price"))) exitWith {hint "The trader doesn't accept this magazine."};
_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
_price = _price / IP_SellingPriceDivisor;

_magazines = magazineCargo IP_PlayerBox;
_count = {_x == _magazine} count _magazines;
_magazines = _magazines - [_magazine];

for "_i" from 1 to (_count - 1) do {
	_magazines = _magazines + [_magazine];
};

clearMagazineCargo IP_PlayerBox;
{IP_PlayerBox addMagazineCargo [_x, 1]} forEach _magazines;
_price call IP_fnc_addMoney;
call IP_fnc_closeShop;
[player, 10003, _i] spawn IP_fnc_openShop;