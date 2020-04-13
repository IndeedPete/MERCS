_saySentences = {
	#define EH_SKIP (uiNamespace getVariable "IP_Cutscene_ehSkip")
	#define EH_SKIP_SET_NIL uiNamespace setVariable ["IP_Cutscene_ehSkip",nil]
	
	_guys = _this select 0;
	_sentences = _this select 1;

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
	
	for "_i" from 0 to ((count _sentences) - 1) do {
		_sentence = _sentences select _i;
		if (_sentence != "" ) then {
			private "_speaker";
			if (_i mod 2 == 0) then {_speaker = _guys select 0} else {_speaker = _guys select 1};			
			[_speaker, _sentence, "DIRECT"] call IP_fnc_simpleSentence;
		};
		if (IP_cutscene_skip) exitWith {};
	};
	
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', EH_SKIP];
	EH_SKIP_SET_NIL;
	IP_cutscene_skip = nil;
};

private ["_lastMission", "_lastSuccessfulMission", "_sentences", "_reward", "_missionsDone"];

["IP_BlackScreen", false] call BIS_fnc_blackOut;
sleep 2;
skipTime 1;
call IP_scn_dynamicCampInit;

_lastMission = if (isNil "IP_MERCS_Mission") then {""} else {IP_MERCS_Mission};
_lastSuccessfulMission = "";
_sentences = [];
_reward = 0;
_missionsDone = if (isNil "IP_MERCS_MissionsDone") then {""} else {IP_MERCS_MissionsDone};
if (_lastMission in _missionsDone) then {
	_lastSuccessfulMission = _lastMission;
	_sentences = getArray(missionConfigFile >> "ShopMissions" >> _lastSuccessfulMission >> "comingHome");
	_reward = _lastSuccessfulMission call IP_fnc_calculateCurrentMissionReward;
};
_delay = 10;
_pos = getMarkerPos "mComingHome";

IP_Main setPos _pos;
IP_Main setDir 0;
IP_Main switchMove "Acts_PercMwlkSlowWrflDf2";

IP_Buddy unassignItem "NVGoggles";
IP_Buddy disableAI "MOVE";
IP_Buddy disableAI "ANIM";
IP_Buddy setPos [(_pos select 0) + 0.5, (_pos select 1) + 2, _pos select 2];
IP_Buddy setDir 0;
IP_Buddy switchMove "Acts_PercMwlkSlowWrflDf2";
[0] call BIS_fnc_cinemaBorder;
["IP_BlackScreen"] call BIS_fnc_blackIn;

sleep 0.5;

[] spawn IP_fnc_showOSD;
if (count _sentences > 0) then {
	[[IP_Main, IP_Buddy], _sentences] call _saySentences;
} else {
	sleep _delay;
};

["IP_BlackScreen", false] call BIS_fnc_blackOut;
sleep 0.5;

IP_Main switchMove "AmovPercMstpSlowWrflDnon";
IP_Buddy switchMove "AmovPercMstpSlowWrflDnon";
IP_Buddy enableAI "MOVE";
IP_Buddy enableAI "ANIM";

sleep 0.5;
["IP_BlackScreen"] call BIS_fnc_blackIn;

// Follow-Up Code
switch (_lastSuccessfulMission) do {
	case "MIn": {
		IP_Buddy setBehaviour "SAFE";
		IP_Buddy setSpeedMode "LIMITED";
		IP_Buddy doMove (getMarkerPos "mBuddyHome");
		[1] call BIS_fnc_cinemaBorder;
		
		[IP_Buddy, "Follow me! It's down there, third one on the right.", "DIRECT"] call IP_fnc_simpleSentence;
		[IP_Buddy, "From there you have access to our system where you can pick missions and buy gear. There's also a private box for your stuff and a place to rest.", "DIRECT"] call IP_fnc_simpleSentence;
		[IP_Buddy, "Here we are. You share it with some other guys. Feel free to check out the rest of the camp first or go inside and pick our first mission. A girl went missing, sounds like easy money.", "DIRECT"] call IP_fnc_simpleSentence;
		[IP_Buddy, "Knock yourself out, I'll wait here if you have questions. Oh, and since you've got no weapons yet I've placed a little present in your box.", "DIRECT"] call IP_fnc_simpleSentence;
		saveGame;
		
		[["MERCS", "Conversations"]] call BIS_fnc_advHint;
		
		_weapon = ["hgun_P07_F", "hgun_P07_F", "hgun_ACPC2_F", "hgun_ACPC2_F", "hgun_Rook40_F", "hgun_Rook40_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_01_F"] call BIS_fnc_selectRandom;
		_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
		IP_PlayerBox addWeaponCargo [_weapon, 1];
		IP_PlayerBox addMagazineCargo [_magazine, 3];
		IP_PlayerBox addItemCargo ["FirstAidKit", 1];
		IP_PlayerBox addItemCargo ["ItemMap", 1];
		IP_PlayerBox addItemCargo ["ItemGPS", 1];
		IP_PlayerBox addItemCargo ["ItemCompass", 1];
	};
	
	case "M01a": {
		[1] call BIS_fnc_cinemaBorder;
		[] call IP_fnc_buddyEquipment;
		IP_Buddy setPos (getMarkerPos "mBuddy");
		IP_Buddy setDir 290;
		IP_Buddy unlinkItem "NVGoggles";
		_animSet = ["BRIEFING", "GUARD", "STAND_U1", "STAND_U2", "STAND_U3"] call BIS_fnc_selectRandom;
		[IP_Buddy, _animSet, "ASIS"] call BIS_fnc_ambientAnim;
		_reward call IP_fnc_addMoney;
		
		_displayName = getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> "PRIVATE" >> "displayName");
		_insignia = getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> "PRIVATE" >> "insignia");		
		["Promotion", [_displayName, _insignia]] call bis_fnc_showNotification;
		[["MERCS", "Promotions"]] call BIS_fnc_advHint;
	};
	
	case "M04c": {
		_uniform = "U_I_G_resistanceLeader_F";
		if (uniform IP_Buddy != _uniform) then {
			removeUniform IP_Buddy;
			IP_Buddy addUniform _uniform;
			if (isArray(missionConfigFile >> "ShopClothes" >> _uniform >> "texture")) then {
				_arr = getArray(missionConfigFile >> "ShopClothes" >> _uniform >> "texture");
				IP_Buddy setObjectMaterial [0, (_arr select 0)];
				IP_Buddy setObjectTexture [0, (_arr select 1)];
			} else {
				if (isText(missionConfigFile >> "ShopClothes" >> _uniform >> "texture")) then {IP_Buddy setObjectTexture [0, (getText(missionConfigFile >> "ShopClothes" >> _uniform >> "texture"))]};
			};
		};
		
		// Default Code
		[1] call BIS_fnc_cinemaBorder;
		[] call IP_fnc_buddyEquipment;
		IP_Buddy setPos (getMarkerPos "mBuddy");
		IP_Buddy setDir 290;
		IP_Buddy unlinkItem "NVGoggles";
		_animSet = ["BRIEFING", "GUARD", "STAND_U1", "STAND_U2", "STAND_U3"] call BIS_fnc_selectRandom;
		[IP_Buddy, _animSet, "ASIS"] call BIS_fnc_ambientAnim;
		_reward call IP_fnc_addMoney;
		call IP_fnc_mainPromotion;
	};
	
	case "M05": {
		sleep 0.5;
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		
		IP_Main setPos (getPos IP_SleepingMat);
		IP_Main setDir 210:
		skipTime 10;
		sleep 1;
		IP_Weather = [(IP_Weather select 0)] call IP_fnc_setWeather;
		
		sleep 3;
		
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0; 
		
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		//"dynamicBlur" ppEffectEnable false;
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 5;
		
		[] spawn IP_fnc_showOSD;
		[IP_Main, "Never ever will I drink that much again. Oh, sweet hangover...", "DIRECT"] call IP_fnc_simpleSentence;
		
		// Default Code
		[1] call BIS_fnc_cinemaBorder;
		[] call IP_fnc_buddyEquipment;
		IP_Buddy setPos (getMarkerPos "mBuddy");
		IP_Buddy setDir 290;
		IP_Buddy unlinkItem "NVGoggles";
		_animSet = ["BRIEFING", "GUARD", "STAND_U1", "STAND_U2", "STAND_U3"] call BIS_fnc_selectRandom;
		[IP_Buddy, _animSet, "ASIS"] call BIS_fnc_ambientAnim;
		// _reward call IP_fnc_addMoney; // Gibt eh Nüscht.
		call IP_fnc_mainPromotion;
	};
	
	default {
		[1] call BIS_fnc_cinemaBorder;
		[] call IP_fnc_buddyEquipment;
		IP_Buddy setPos (getMarkerPos "mBuddy");
		IP_Buddy setDir 290;
		IP_Buddy unlinkItem "NVGoggles";
		_animSet = ["BRIEFING", "GUARD", "STAND_U1", "STAND_U2", "STAND_U3"] call BIS_fnc_selectRandom;
		[IP_Buddy, _animSet, "ASIS"] call BIS_fnc_ambientAnim;
		_reward call IP_fnc_addMoney;
		call IP_fnc_mainPromotion;
	};
};

// Hub01 Ending - Move on to Trans
if (count IP_AvailableMissions == 0) then {
	IP_Main setVariable ["IP_Debts", 0];
	IP_Main setVariable ["IP_BasicTCR", (call IP_fnc_calculateBasicCostRate)];	
	[IP_Commander, "Hey, Freshmeat! Get your arse over here!", "DIRECT"] call IP_fnc_simpleSentence;
	[player, 'tCommander1', ['Report in with McMillian!', 'Report In', ''], IP_Commander, true, 1, true, "whiteboard"] call BIS_fnc_taskCreate;
};