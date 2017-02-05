if (IP_Decision) then {
	["IP_BlackScreen", false] call BIS_fnc_blackOut;
	
	sleep 0.5;
	
	private "_date";
	_date = date;
	
	if (((_date select 3) > 3) && ((_date select 4) > 30)) then {
		_date set [2, ((_date select 2) + 1)];
	};
	
	_date set [3, 3];
	_date set [4, 30];
	setDate _date;
	
	sleep 2;
	
	["MTrans01", true, 0] call IP_fnc_endMission;
} else {
	['tCommander1', 'SUCCEEDED'] call BIS_fnc_taskSetState;
	[IP_Commander, 'Then get the fuck out of my camp!', 'DIRECT'] call IP_fnc_simpleSentence;
	["MOut_Quit", true, 5] call IP_fnc_endMission;
};