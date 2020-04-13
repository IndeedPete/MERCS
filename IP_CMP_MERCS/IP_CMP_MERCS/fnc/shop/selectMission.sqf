_i = _this;
if (_i == -1) exitWith {hint "You have to select a mission first!"};

_currentTask = player getVariable ["IP_ShopMission", ""];
_task = IP_AvailableMissions select _i;

if (_currentTask == _task) exitWith {("t" + _currentTask) call IP_fnc_taskHint};
if (_currentTask != "") then {[("t" + _currentTask)] call BIS_fnc_deleteTask};

_title = getText(missionConfigFile >> "ShopMissions" >> _task >> "title");
_desc = getText(missionConfigFile >> "ShopMissions" >> _task >> "description"); 
player setVariable ["IP_ShopMission", _task];

if ((getText(missionConfigFile >> "stage")) == "A") then {
	[player, ("t" + _task), [_desc, _title, ""], IP_Commander, true, 1, true, "whiteboard"] call BIS_fnc_taskCreate;
} else {
	IP_BriefingDone = nil;
	[player, ("t" + _task), [_desc, _title, ""], nil, true, 1] call BIS_fnc_taskCreate;
	[player, [("t" + _task + "Briefing"), ("t" + _task)], ["Report in for briefing!", "Briefing", "Briefing"], IP_Commander, true, 1, true, "whiteboard"] call BIS_fnc_taskCreate;
};