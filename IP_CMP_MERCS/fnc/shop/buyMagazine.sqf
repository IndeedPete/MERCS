_i = _this;
if (_i == -1) exitWith {hint "You have to select a magazine first!"};

_magazine = IP_AvailableMagazines select _i;
_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");

if (_price call IP_fnc_purchase) then {
	IP_PlayerBox addMagazineCargo [_magazine, 1];
	call IP_fnc_closeShop;
	[player, 10003, _i] spawn IP_fnc_openShop;
};