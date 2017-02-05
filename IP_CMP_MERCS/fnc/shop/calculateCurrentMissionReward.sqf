_mission = _this;
_tcr = call IP_fnc_calculateTotalCostRate;
_totalReward = getNumber(missionConfigFile >> "ShopMissions" >> _mission >> "reward");

_currentReward = (100 * round(_totalReward * (1 - _tcr))) / 100;
_currentReward