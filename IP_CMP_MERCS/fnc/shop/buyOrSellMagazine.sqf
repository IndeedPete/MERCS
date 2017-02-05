private ["_i", "_amount", "_selling", "_magazine", "_magazines", "_price"];
_amount = ceil(_this);
_i = player getVariable ["IP_AmountIndex", 0];
_selling = player getVariable ["IP_AmountSelling", false];
_magazine = player getVariable ["IP_AmountMagazine", ""];

if (_magazine == "") exitWith {hint "IP_fnc_buyOrSellMagazine\nNo magazine class given!"};

if (_selling) then {
	if (!(isNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price"))) exitWith {hint "The trader doesn't accept this magazine."};
	_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_price = _price / IP_SellingPriceDivisor;
	_total = _amount * _price;
	
	_magazines = magazineCargo IP_PlayerBox;
	_count = ({_x == _magazine} count _magazines) - _amount;
	_magazines = _magazines - [_magazine];
	
	for "_i" from 1 to (_count) do {
		_magazines = _magazines + [_magazine];
	};
	
	clearMagazineCargo IP_PlayerBox;
	{IP_PlayerBox addMagazineCargo [_x, 1]} forEach _magazines;
	_total call IP_fnc_addMoney;
	closeDialog 0;
	_i spawn {
		sleep 0.03;
		call IP_fnc_closeShop;
		[player, 10003, _this] spawn IP_fnc_openShop;
	};
} else {
	_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_total = _amount * _price;
	
	if (_total call IP_fnc_purchase) then {
		IP_PlayerBox addMagazineCargo [_magazine, _amount];
		closeDialog 0;
		_i spawn {
			sleep 0.03;
			call IP_fnc_closeShop;
			[player, 10003, _this] spawn IP_fnc_openShop;
		};
	};
};