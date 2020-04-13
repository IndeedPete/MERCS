_mission = IP_Main getVariable "IP_ShopMission";
if (isNil "_mission") exitWith {hint "You have to select a mission first!"};
if (_mission == "MTrans01") exitWith {[] execVM "scn\AEnd.sqf"}; // Alpha / Promo Ending
_sentences = getArray(missionConfigFile >> "ShopMissions" >> _mission >> "briefing");

if ((count _sentences > 0) && IP_ShowIntro) then {
	["IP_BlackScreen", false] call BIS_fnc_blackOut;
	sleep 0.5;
	
	_class = typeOf IP_Commander;
	_pos = getPos IP_Commander;
	_dir = getDir IP_Commander;
	_goggles = goggles IP_Commander;
	_hasVest = (vest IP_Commander != "");
	_uniform = uniform IP_Commander;

	deleteVehicle IP_Commander;
	_grp = createGroup west;
	_class createUnit [_pos, _grp, "IP_Commander = this;"];

	IP_Commander setPos _pos;
	IP_Commander setDir _dir;
	IP_Commander setIdentity "commander";
	IP_Commander setVariable ["IP_LiveFeed", true];
	[IP_Commander, "Executive"] call BIS_fnc_setUnitInsignia;
	removeAllWeapons IP_Commander;
	removeGoggles IP_Commander;
	removeUniform IP_Commander;
	IP_Commander forceAddUniform _uniform;
	if (_goggles != "") then {IP_Commander addGoggles _goggles};
	if (!_hasVest) then {removeVest IP_Commander};

	IP_Main setPos (getMarkerPos "mBriefingMain");
	_dir = [IP_Main, IP_Commander] call BIS_fnc_dirTo;
	IP_Main setDir _dir;
	
	_class = typeOf IP_Buddy;
	_pos = getMarkerPos "mBriefingBuddy";
	deleteVehicle IP_Buddy;
	_grp = createGroup west;
	_class createUnit [_pos, _grp, "IP_Buddy = this; this setVariable ['BIS_enableRandomization', false];"];
	[IP_Buddy, _mission] call IP_fnc_buddyEquipment;
	IP_Buddy unassignItem "NVGoggles";
	IP_Buddy setPos _pos;
	_dir = [IP_Buddy, IP_Commander] call BIS_fnc_dirTo;
	IP_Buddy setDir _dir;
	IP_Buddy stop true;

	_animation = ["Acts_A_M01_briefing", "Acts_A_M02_briefing", "Acts_A_M03_briefing", "Acts_A_M04_briefing"] call BIS_fnc_selectRandom;
	IP_Commander disableAI "ANIM";
	IP_Commander disableAI "MOVE";
	IP_Commander switchMove _animation;
	
	sleep 0.5;
	["IP_BlackScreen"] call BIS_fnc_blackIn;
	[0] call BIS_fnc_cinemaBorder;
	
	disableSerialization;
	//add skip mechanics -----------------------------------------------------------------------
	IP_cutscene_skip = false;

	private["_ehSkip"];

	_ehSkip = ([] call BIS_fnc_displayMission) displayAddEventHandler
	[
		"KeyDown",
		"
			if (_this select 1 == 57) then
			{
				if (IP_cutscene_skip) exitWith {};

				playSound ['click',true];

				IP_cutscene_skip = true;
			};

			if !((_this select 1) in (actionKeys 'PersonView' + [1])) then {true};
		"
	];

	uiNamespace setVariable ["IP_Cutscene_ehSkip", _ehSkip];
	//add skip mechanics -----------------------------------------------------------------------
	
	{
		[IP_Commander, _x, "DIRECT"] call IP_fnc_simpleSentence;
		if (IP_cutscene_skip) exitWith {};
	} forEach _sentences;
} else {
	[IP_Buddy, _mission] call IP_fnc_buddyEquipment;
};

[_mission, true, 5] call IP_fnc_endMission;