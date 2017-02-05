private "_res";

_price = _this;
_price = round _price;
if (_price < 1) exitWith {false};
_money = player getVariable ["IP_Money", 0];

_newMoney = _money - _price;
if (_newMoney < 0) then {
	hint format ["You don't have enough money!\nMoney needed: €%1\nIn possession: €%2", ([_price] call IP_fnc_numberText), ([_money] call IP_fnc_numberText)];
	_res = false;
} else {
	player setVariable ["IP_Money", _newMoney];
	player createDiaryRecord ["Money", [(name player), "Withdrawal: -" + ([_price] call IP_fnc_numberText) + "€<br/>New Account Balance: +" + ([_newMoney] call IP_fnc_numberText) + "€"]];
	if (true) then {["MoneySpent", [([_price] call IP_fnc_numberText)]] call BIS_fnc_showNotification};
	_res = true;
};

_res