_i = _this;
if (_i == -1) exitWith {hint "You have to select a person first!"};

_team = player getVariable "IP_Team";
_person = (_team select _i);
_team = _team - [_person];
player setVariable ["IP_Team", _team];
if ((isNumber(missionConfigFile >> "ShopPersonnel" >> _person >> "unique")) && {(getNumber(missionConfigFile >> "ShopPersonnel" >> _person >> "unique")) == 1}) then {
	IP_AvailablePersonnel = IP_AvailablePersonnel + [_person];
};

call IP_fnc_closeShop;
[player, 10001] spawn IP_fnc_openShop;