_i = _this;
if (_i == -1) exitWith {hint "You have to select a set of clothes first!"};

_clothes = IP_AvailableClothes select _i;
_price = getNumber(missionConfigFile >> "ShopClothes" >> _clothes >> "price");

if (_price call IP_fnc_purchase) then {
	_inPosession = player getVariable "IP_Clothes";
	player setVariable ["IP_Clothes", (_inPosession + [_clothes])];
	IP_AvailableClothes = IP_AvailableClothes - [_clothes];
	call IP_fnc_closeShop;
	[player, 10005] spawn IP_fnc_openShop;
};