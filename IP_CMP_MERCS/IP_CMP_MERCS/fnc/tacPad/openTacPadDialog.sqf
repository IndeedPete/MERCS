createDialog "IP_DLG_TACPAD";

// Setup Mission Info
_task = getText(missionConfigFile >> "name");

if (isClass(missionConfigFile >> "ShopMissions" >> _task)) then {
	_tcr = call IP_fnc_calculateTotalCostRate;

	_title = getText(missionConfigFile >> "ShopMissions" >> _task >> "title") + "<br/>";
	_client = getText(missionConfigFile >> "ShopMissions" >> _task >> "client");
	_client = "Client: " +  getText(missionConfigFile >> "Factions" >> _client >> "displayName") + "<br/>";
	_loc = "Location: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "location") + "<br/>";
	_totalRew = "Total Reward: €" + ([(getNumber(missionConfigFile >> "ShopMissions" >> _task >> "reward"))] call IP_fnc_numberText) + "<br/>";
	_currentRew = "Current Reward (TCR " + str(100 * _tcr) + "%): €" + str(_task call IP_fnc_calculateCurrentMissionReward) + "<br/>";
	_desc = "Description: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "description") + "<br/>"; 
	_req = "Recommended: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "requirements");

	_text = _title + _client + _loc + _totalRew + _currentRew + _desc + _req;
	((findDisplay 40000) displayCtrl 1100) ctrlSetStructuredText (parseText _text);
};
	
// Set Rest DLG
sliderSetRange [1900, 1, 24];
sliderSetPosition [1900, 1];
[1000, (sliderPosition 1900)] call IP_fnc_setRestHoursTime;

if ((!isNil "IP_MERCS_PPEffects") && {!IP_MERCS_PPEffects}) then {
	((findDisplay 40000) displayCtrl 1607) ctrlSetText "PPEffects On";
} else {
	((findDisplay 40000) displayCtrl 1607) ctrlSetText "PPEffects Off";
};

if (player getVariable ["IP_Glass_Boot", false]) then {((findDisplay 40000) displayCtrl 1603) ctrlSetText "Glass Off"};
if (player getVariable ["IP_Glass_Core", false]) then {((findDisplay 40000) displayCtrl 1606) ctrlSetText "Glass Core Off"};
if (player getVariable ["IP_Glass_Status", false]) then {((findDisplay 40000) displayCtrl 1604) ctrlSetText "Glass Status Off"};
if (player getVariable ["IP_Glass_Details", false]) then {((findDisplay 40000) displayCtrl 1605) ctrlSetText "Glass Details Off"};