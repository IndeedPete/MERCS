private "_speakers";
_mission = IP_Main getVariable "IP_ShopMission";
if (isNil "_mission") exitWith {hint "You have to select a mission first!"};
_speakers = getArray(missionConfigFile >> "ShopMissions" >> _mission >> "briefingSpeakers");
_sentences = getArray(missionConfigFile >> "ShopMissions" >> _mission >> "briefingSentences");

if ((count _speakers > 0) && (count _sentences > 0) && IP_ShowIntro) then {
	["IP_BlackScreen", false] call BIS_fnc_blackOut;
	sleep 0.5;
	
	_class = typeOf IP_Lord;
	_pos = getPos IP_Lord;
	_dir = getDir IP_Lord;
	IP_Lord hideObject true;
	_grp = createGroup west;
	_class createUnit [_pos, _grp, "IP_LordTemp = this;"];
	[IP_LordTemp, "lord"] call IP_fnc_applyTemplate;
	{IP_LordTemp disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
	{IP_LordTemp enableAI _x} forEach ["ANIM","FSM"];
	(group IP_LordTemp) setBehaviour "CARELESS";
	(group IP_LordTemp) setCombatMode "BLUE";
	IP_LordTemp setPos _pos;
	IP_LordTemp setDir _dir;
	IP_LordTemp switchMove "Acts_B_hub01_briefing";

	IP_Main enableSimulation false;
	IP_Main switchMove "";
	IP_Main setPos (getMarkerPos "mBriefing");
	IP_Main setDir 50;
	IP_Main switchMove "AmovPercMstpSlowWrflDnon";
	
	_animation = ["Acts_B_briefings", "Acts_B_hub01_briefing", "Acts_B_M01_briefing", "Acts_B_M02_briefing", "Acts_B_M03_briefing"/*, "Acts_B_M04_briefing"*/, "Acts_B_M05_briefing", "Acts_B_M06_briefing", "Acts_B_out2_briefing"] call BIS_fnc_selectRandom;
	IP_LordTemp switchMove _animation;
	if (IP_TESTMODE) then {hint ("DEBUG\nCurrent Lord Animation\n" + _animation)};
	
	for "_i" from 0 to (count _speakers - 1) do {
		_speaker = _speakers select _i;
		_speakers set [_i, (call compile _speaker)];
	};
	
	sleep 0.5;
	["IP_BlackScreen"] call BIS_fnc_blackIn;
	
	IP_Main enableSimulation true;	
	[_speakers, _sentences, "DIRECT", IP_ShowIntro] call IP_fnc_simpleConversation;
	
	["IP_BlackScreen", false] call BIS_fnc_blackOut;
	sleep 0.5;
	deleteVehicle IP_LordTemp;
	IP_Lord hideObject false;
	sleep 0.5;
	["IP_BlackScreen"] call BIS_fnc_blackIn;
};

IP_BriefingDone = true;
[("t" + _mission + "Briefing"), "SUCCEEDED"] call BIS_fnc_taskSetState;

switch (_mission) do {
	case "MMain06" : {
		[player, [("t" + _mission + "InsertionFoot"), ("t" + _mission)], ["Go to the car wreck to insert on foot!", "Insert On Foot", "Foot"], "mFoot", true, 1, true, "walk"] call BIS_fnc_taskCreate;
		if ((count IP_GarageVehicles) > 0) then {[player, [("t" + _mission + "InsertionCar"), ("t" + _mission)], ["Go to the garage to insert by car!", "Insert By Car", "Garage"], IP_Garage, false, 1, true, "car"] call BIS_fnc_taskCreate};
		if ("B_Heli_Light_01_F" in (player getVariable ["IP_ShopCampVehicles", []])) then {[player, [("t" + _mission + "InsertionHeli"), ("t" + _mission)], ["Go to the heli pad to insert by helicopter!", "Insert By Helicopter", "Helicopter"], IP_Heli, false, 1, true, "heli"] call BIS_fnc_taskCreate};
		[["MERCS", "InsertionM06"]] call BIS_fnc_advHint;
	};
	
	default {
		[player, [("t" + _mission + "InsertionFoot"), ("t" + _mission)], ["Go to the car wreck to insert on foot!", "Insert On Foot", "Foot"], "mFoot", true, 1, true, "walk"] call BIS_fnc_taskCreate;
		if ((count IP_GarageVehicles) > 0) then {[player, [("t" + _mission + "InsertionCar"), ("t" + _mission)], ["Go to the garage to insert by car!", "Insert By Car", "Garage"], IP_Garage, false, 1, true, "car"] call BIS_fnc_taskCreate};
		if ("B_Heli_Light_01_F" in (player getVariable ["IP_ShopCampVehicles", []])) then {[player, [("t" + _mission + "InsertionHeli"), ("t" + _mission)], ["Go to the heli pad to insert by helicopter!", "Insert By Helicopter", "Helicopter"], IP_Heli, false, 1, true, "heli"] call BIS_fnc_taskCreate};
		if ("B_G_Boat_Transport_01_F" in (player getVariable ["IP_ShopCampVehicles", []])) then {[player, [("t" + _mission + "InsertionBoat"), ("t" + _mission)], ["Go to the beach to insert by boat!", "Insert By Boat", "Boat"], IP_Boat, false, 1, true, "boat"] call BIS_fnc_taskCreate};
	};
};