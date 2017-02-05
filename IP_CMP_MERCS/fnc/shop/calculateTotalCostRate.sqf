private "_totalCost";

_team = player getVariable "IP_Team";
_totalCost = player getVariable "IP_BasicTCR";

for "_i" from 0 to ((count _team) - 1) do {
	_personS = _team select _i;
	_costRate = getNumber(missionConfigFile >> "ShopPersonnel" >> _personS >> "costRate"); 
	_totalCost = _totalCost + _costRate;
};

_totalCost