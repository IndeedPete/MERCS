_add = _this;
_add = round _add;

if (_add < 1) exitWith {false};
_money = player getVariable ["IP_Money", 0];
_money = _money + _add;
player setVariable ["IP_Money", _money];
player createDiaryRecord ["Money", [(name player), "<br/>Deposit: +" + ([_add] call IP_fnc_numberText) + "€<br/>New Account Balance: +" + ([_money] call IP_fnc_numberText) + "€"]];
if (true) then {["MoneyAdded", [([_add] call IP_fnc_numberText)]] call bis_fnc_showNotification};
true