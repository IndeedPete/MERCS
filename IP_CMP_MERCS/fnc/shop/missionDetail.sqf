_i = _this select 1;
_tcr = call IP_fnc_calculateTotalCostRate;
_task = IP_AvailableMissions select _i;

_client = getText(missionConfigFile >> "ShopMissions" >> _task >> "client");
_client = "Client: " +  getText(missionConfigFile >> "Factions" >> _client >> "displayName") + "<br/>";
_loc = "Location: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "location") + "<br/>";
_totalRew = "Total Reward: €" + ([(getNumber(missionConfigFile >> "ShopMissions" >> _task >> "reward"))] call IP_fnc_numberText) + "<br/>";
_currentRew = "Current Reward (TCR " + str(100 * _tcr) + "%): €" + ([(_task call IP_fnc_calculateCurrentMissionReward)] call IP_fnc_numberText) + "<br/>";
_desc = "Description: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "description") + "<br/>"; 
_req = "Recommended: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "requirements");

_text = _client + _loc + _totalRew + _currentRew + _desc + _req;
((findDisplay 10000) displayCtrl 1100) ctrlSetStructuredText (parseText _text);