_i = _this;
if (_i == -1) exitWith {hint "You have to select a weapon first!"};

_weapon = IP_AvailableWeapons select _i;
_price = getNumber(missionConfigFile >> "ShopWeapons" >> _weapon >> "price");

if (_price call IP_fnc_purchase) then {
	IP_PlayerBox addWeaponCargo [_weapon, 1];
	call IP_fnc_closeShop;
	[player, 10002, _i] spawn IP_fnc_openShop;
};