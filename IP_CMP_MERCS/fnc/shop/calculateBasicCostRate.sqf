private "_BCR";

_basic = getNumber(missionConfigFile >> "MainValues" >> "basicRate");
_buddy = if((getText(missionConfigFile >> "stage")) == "A") then {(getNumber(missionConfigFile >> "MainValues" >> "buddyCostRate"))} else {0};
_rate = getNumber(missionConfigFile >> "Factions" >> (player getVariable ["IP_Faction", "ION"]) >> "Ranks" >> (rank player) >> "Rate");
_debts = player getVariable ["IP_Debts", getNumber(missionConfigFile >> "MainValues" >> "startDebts")];

_BCR = _basic + _buddy + _rate;
if (_debts > 0) then {
	_debtRate = getNumber(missionConfigFile >> "MainValues" >> "debtPayOffRate");
	_BCR = _BCR + _debtRate;
};

_BCR