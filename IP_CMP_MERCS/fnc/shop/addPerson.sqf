_i = _this;
if (_i == -1) exitWith {hint "You have to select a person first!"};

_team = player getVariable "IP_Team";
_person = IP_AvailablePersonnel select _i;
_costRate = getNumber(missionConfigFile >> "ShopPersonnel" >> _person >> "costRate");

if (((call IP_fnc_calculateTotalCostRate) + _costRate) > 1) exitWith {hint "Your total cost rate would be higher than 100%!"};

_team set [(count _team), _person];
player setVariable ["IP_Team", _team];
if ((isNumber(missionConfigFile >> "ShopPersonnel" >> _person >> "unique")) && {(getNumber(missionConfigFile >> "ShopPersonnel" >> _person >> "unique")) == 1}) then {
	IP_AvailablePersonnel = IP_AvailablePersonnel - [_person];
};

call IP_fnc_closeShop;
[player, 10001] spawn IP_fnc_openShop;