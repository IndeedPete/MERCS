IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};
_cmpPath = "IP_CMP_MERCS\IP_CMP_MERCS\";

// Variables
IP_ShowIntro = true;
IP_PlacesCaptured = if (isNil "IP_MERCS_PlacesCaptured") then {["mCapture1", "mCapture2", "mCapture3", "mCapture4"]} else {IP_MERCS_PlacesCaptured};
IP_LogicsCaptured = [];
IP_Places = [];
{
	if (["mCapture", _x] call BIS_fnc_inString) then {IP_Places = IP_Places + [_x]};
} forEach allMapMarkers;

// Functions
IP_fnc_m_rollDice = {
	private "_number";

	if (_this) then {
		_number = 1 + (round(random 7))
	} else {
		_number = 4 + (round(random 3))
	};

	IP_DiceValue = IP_DiceValue + _number;
	call IP_fnc_closeConversation;
	_nul = [IP_Gambler, player, "gamblerDiceMain"] spawn IP_fnc_openConversation;
};

IP_fnc_m_determineDiceWin = {
	_win = switch (IP_DiceValue) do {
		case 15: {50};
		case 16: {100};
		case 17: {200};
		case 18: {250};
		case 19: {300};
		case 20: {400};
		default {0};
	};

	_win
};

// Scenes
IP_scn_ambientShootingRange = compile(preProcessFileLineNumbers "scn\ambientShootingRange.sqf");
IP_scn_campfire = compile(preProcessFileLineNumbers "scn\campfire.sqf");
IP_scn_duelStart = compile(preProcessFileLineNumbers "scn\duelStart.sqf");
IP_scn_duelEnd = compile(preProcessFileLineNumbers "scn\duelEnd.sqf");
IP_scn_dynamicCampInit = {
	// Shooting Range
	[IP_Shooter, "", west, (group IP_Shooter), false, ((dayTime < 7) OR (dayTime > 19))] call IP_fnc_createMerc;
	
	// Camp Fire && Helicopter
	if ((dayTime < 7) OR (dayTime > 19)) then {
		[IP_Pilot, "helicopterOpener"] call IP_fnc_removeConversation;
		
		IP_Campfire1 inFlame true;
		IP_Campfire2 inFlame true;
		[IP_Storyteller, "storyOpener"] call IP_fnc_addConversation;
	} else {
		IP_Campfire1 inFlame false;
		IP_Campfire2 inFlame false;
		[IP_Storyteller, "storyOpener"] call IP_fnc_removeConversation;
		
		[] spawn {
			[IP_Pilot, "helicopterOpener"] call IP_fnc_addConversation;
			waitUntil{time > 0};
			while {(dayTime >= 7) AND (dayTime <= 19)} do {
				sleep (300 + random 300);
				IP_Heli setFuel 1;
				IP_Heli engineOn true;			
				sleep (10 + random 10);			
				IP_Heli setFuel 0;
			};
		};
	};
};

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;
[IP_Buddy, "buddyOpener"] call IP_fnc_addConversation;

// Commander Setup
IP_Commander setIdentity "commander";
IP_Commander setVariable ["IP_Faction", "ION"];
IP_Commander setVariable ["IP_LiveFeed", true];
IP_Commander setVariable ["IP_Avatar", (_cmpPath + "img\commanderAvatar.jpg")];
IP_Commander setVariable ["IP_ConvSpecial", "Head of ION's Mediterranean operations."];
[IP_Commander, "Executive"] call BIS_fnc_setUnitInsignia;
removeAllWeapons IP_Commander;
if ((round random 1) > 0.5) then {removeVest IP_Commander};
if ((round random 1) > 0.5) then {removeGoggles IP_Commander};
_animSet = ["BRIEFING", "GUARD", "STAND_U1", "STAND_U2", "STAND_U3"] call BIS_fnc_selectRandom;
[IP_Commander, _animSet, "ASIS"] call BIS_fnc_ambientAnim;
[IP_Commander, "commanderOpener"] call IP_fnc_addConversation;

// Shop Setup
[true, true, [(player getVariable ["IP_ShopUniforms", []]),[],[]]] call IP_fnc_shopInit;

// Shooting Range
_nul = [IP_Shooter, [[IP_SR_TargetBig], [IP_SR_TargetSmall], [IP_MR_TargetBig, "MIDDLE"], [IP_MR_TargetSmall, "MIDDLE"], [IP_LR_TargetBig, "DOWN"], [IP_LR_TargetSmall, "DOWN"]]] spawn IP_scn_ambientShootingRange;
{_x addEventHandler ["HIT", {if (isPlayer(_this select 1)) then {(_this select 0) removeAllEventhandlers "HIT"; _nul = [IP_Rangemaster, "Wow, looks like we got a real master here!", "DIRECT"] spawn IP_fnc_simpleSentence;}}]} forEach [IP_UR_TargetSmall, IP_UR_TargetBig];
[IP_ShootingRangeGuard, "shootingRangeOpener"] call IP_fnc_addConversation;

// Dynamic Ambient Camp Stuff - Should be moved to "Coming Home"
IP_Pilot setIdentity "pilot";
IP_Pilot setVariable ["IP_Faction", "ION"];
IP_Pilot setVariable ["IP_Avatar", (_cmpPath + "img\pilotAvatar.jpg")];
IP_Pilot setVariable ["IP_ConvSpecial", "Company Pilot"];
[IP_Pilot, "STAND_U3", "NONE"] call BIS_fnc_ambientAnim;
IP_Pilot setObjectTexture [0, (_cmpPath + "txt\coveralls_black_coION.paa")];
IP_Heli setObjectTexture [0, (_cmpPath + "txt\heli_light_02_ext_coION.paa")];
{IP_Heli animate [_x, 1]} forEach ["dvere1", "dvere1_posunZ", "dvere2"];
call IP_scn_dynamicCampInit;

// Gambler
IP_Gambler setVariable ["IP_ConvSpecial", "Gambler"];
{[IP_Gambler, _x] call IP_fnc_addConversation} forEach ["gamblerOpener", "gamblerDuelStart", "gamblerDiceStart"];

// Toilet Guy
IP_ToiletGuy setVariable ["IP_LiveFeed", true];
IP_ToiletGuy setVariable ["IP_Faction", "ION"];
removeHeadgear IP_ToiletGuy;
removeGoggles IP_ToiletGuy;
removeUniform IP_ToiletGuy;
removeAllWeapons IP_ToiletGuy;
removeVest IP_ToiletGuy;
[IP_ToiletGuy, "toiletOpener"] call IP_fnc_addConversation;
[IP_ToiletGuy, "SIT", "ASIS"] call BIS_fnc_ambientAnim;
[] spawn{
	waitUntil {time > 0}; 
	sleep 3; 
	IP_ToiletGuy attachTo [IP_Toilet, [0, 0.7, -1.1]]; 
	IP_ToiletGuy setDir 180;
};

// Whiteboard
IP_Whiteboard setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\Hub01_WB1.paa"];

// Capturing Init
[player, "tCapture", ["Capture Stratis by leaving the base and eliminating all rogues at every red marked location! This task and the progress you make stays persistent when leaving the hub for a contract mission. (OPTIONAL)", "Capture Stratis (OPTIONAL)", ""], nil, true, 1, false, "kill"] call BIS_fnc_taskCreate;
if ((count IP_PlacesCaptured) == (count IP_Places)) then {["tCapture", "SUCCEEDED"] call BIS_fnc_taskSetState};
_logicCentre = createCenter sideLogic;
_logicGroup = createGroup _logicCentre;
{
	if (_x in IP_PlacesCaptured) then {
		_x setMarkerColor "colorUnknown";
	} else {		
		_pos = getMarkerPos _x;
		_GL = _logicGroup createUnit ["logic", _pos, [], 0, "NONE"];
		_GL setPos _pos;
		_GL setVariable ["IP_ToCapture", _x];
		_x setMarkerColor "colorEast";
	};
} forEach IP_Places;

// All Units
{
	if  (side _x == west) then {
		_x setVariable ["IP_Faction", "ION"];
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				player addRating -999999;
				//West setFriend [Resistance, 0];
				if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
			};
		}];
	};
} forEach (allUnits - [IP_Main]);

// Jukebox
[] call BIS_fnc_jukebox;

// Ambient Life
[] call IP_fnc_ambientLife;

// Mission Start
if (IP_ShowIntro) then {execVM "scn\comingHome.sqf"};
execFSM "fnc\freeroaming.fsm";