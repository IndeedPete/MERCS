private ["_amount", "_price", "_total", "_totalStr", "_text"];
_amount = ceil(_this);
_price = player getVariable ["IP_AmountPrice", 0];

_total = _amount * _price;
_totalStr = [_total] call IP_fnc_numberText;
ctrlSetText [1003, ("Total: " + _totalStr + "€")];
ctrlSetText [1004, ("Amount: " + str(_amount))];