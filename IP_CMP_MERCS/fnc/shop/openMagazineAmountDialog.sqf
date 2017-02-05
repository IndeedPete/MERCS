private ["_i", "_selling", "_magazine", "_price", "_count"];
_i = _this select 0;
_selling = _this select 1;
if (_i == -1) exitWith {hint "You have to select a magazine first!"};

if (_selling) then {
	_magazine = lbData [1501, _i];
	if (!(isNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price"))) exitWith {hint "The trader doesn't accept this magazine."};
	_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_price = _price / IP_SellingPriceDivisor;
	
	_magazines = magazineCargo IP_PlayerBox;
	_count = {_x == _magazine} count _magazines;
} else {
	_magazine = IP_AvailableMagazines select _i;
	_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_count = 10;
};

_title = getText(configFile >> "CfgMagazines" >> _magazine >> "displayName");
_priceStr = [_price] call IP_fnc_numberText;
player setVariable ["IP_AmountPrice", _price];
player setVariable ["IP_AmountIndex", _i];
player setVariable ["IP_AmountSelling", _selling];
player setVariable ["IP_AmountMagazine", _magazine];

createDialog "IP_DLG_AMOUNT";
ctrlSetText [1001, _title];
ctrlSetText [1002, (ctrlText 1002 + (_priceStr + "€"))];
1 call IP_fnc_magazineAmountSetTotal;
sliderSetRange [1900, 1, _count];
sliderSetPosition [1900, 1];