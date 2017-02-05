private ["_taskState", "_sentence", "_amount"];

IP_DuelGoingOn = false;

if (IP_DuelResult) then {
	_taskState = "SUCCEEDED";
	_sentence = "You won! Good job, man!";
} else {
	_taskState = "FAILED";
	_sentence = "You lost! Sorry, dude!";
};

["tDuel", _taskState] call BIS_fnc_taskSetState;
sleep 3;

["IP_BlackScreen", false] call BIS_fnc_blackOut;
sleep 0.5;
skipTime 0.25;

IP_DuelResult = nil;
deleteVehicle IP_Enemy;

IP_Main setPos (getMarkerPos "mGamblerPlayer");
_dir = [IP_Main, IP_Gambler] call BIS_fnc_dirTo;
IP_Main setDir _dir;
IP_Main switchMove "";
IP_Main removeAllEventhandlers "HandleDamage";

sleep 0.5;
["IP_BlackScreen"] call BIS_fnc_blackIn;

[IP_Gambler, _sentence, "DIRECT", 2] call IP_fnc_simpleSentence;
if (_taskState == "SUCCEEDED") then {
	_stake = getNumber(missionConfigFile >> "DuelStake");
	(_stake * 2) call IP_fnc_addMoney;
};
[] spawn IP_fnc_showOSD;

sleep 1;

IP_DuelGoingOn = nil;