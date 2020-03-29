private ["_lastSuccessfulMission", "_reward"];
["IP_BlackScreen", false] call BIS_fnc_blackOut;
sleep 2;
skipTime 1;
call IP_scn_dynamicCampInit;

_lastMission = if (isNil "IP_MERCS_Mission") then {"MTrans01"} else {IP_MERCS_Mission};
_lastSuccessfulMission = "";
_reward = 0;
if ((!isNil "IP_MERCS_MissionsDone") && {_lastMission in IP_MERCS_MissionsDone}) then {
	_lastSuccessfulMission = _lastMission;
	_reward = _lastSuccessfulMission call IP_fnc_calculateCurrentMissionReward;
};
_delay = 4;
_pos = getMarkerPos "mComingHome";
_dir = 50;

// Follow-Up Code
switch (_lastSuccessfulMission) do {
	case "MTrans01": {
		IP_Weather = ["", ["FOGGY", "DENSEFOG"]] call IP_fnc_setWeather;
		
		{
			if ((side _x == west) && {_x getVariable ["IP_Faction", ""] == "ION"}) then {
				_x hideObject true;
				_x enableSimulation false;
			};
		} forEach (allUnits - [IP_Main, IP_Buddy, IP_Commander]);
		
		IP_Guide enableSimulation false;
		IP_Guide switchMove "";
		[IP_Guide, "medic", "combat"] call IP_fnc_applyTemplate;
		IP_Guide unlinkItem "NVGoggles";
		
		{IP_Guide disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
		{IP_Guide enableAI _x} forEach ["ANIM","FSM"];
		(group IP_Guide) setBehaviour "CARELESS";
		(group IP_Guide) setCombatMode "BLUE";
		
		sleep 0.5;
		
		IP_Guide switchMove "acts_welcomeonhub01_aiwalk";
		IP_Main switchMove "Acts_welcomeOnHUB01_PlayerWalk";
		IP_Guide enableSimulation true;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		sleep 0.5;
		
		[] spawn IP_fnc_showOSD;		
		[
			[IP_Main, IP_Guide],
			[
				"British Knights?! I thought they were only a myth!",
				"No, we're very real, mercenary. This is our FOB. You will be staying here for now.",
				"I don't have a choice?",
				"You don't. Listen, briefing room and barracks are in that big building over there.",
				"",
				"The armoury’s to the left – though, it’s out of bounds for now.",
				"Here, wait – what do you want from us? And why the fuck did you down our chopper?",
				"Patience! The Lord Commander will explain everything in a minute.",
				"The 'Lord Commander'?",
				"He's our leader. I suggest you treat him with respect! Britain first, my new brother in arms!",
				"Yeah, whatever..."
			],
			"DIRECT",
			IP_ShowIntro
		] call IP_fnc_simpleConversation;
		
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 1;
		
		_pos = getMarkerPos "mBriefing";		
		deleteVehicle IP_Guide;
		
		IP_Main enableSimulation false;
		IP_Main switchMove "";
		IP_Main setPos _pos;
		IP_Main setDir _dir;
		IP_Main switchMove "AmovPercMstpSlowWrflDnon";
		
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
		
		sleep 1;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		IP_Main enableSimulation true;		
		[
			[IP_LordTemp, IP_Main, IP_Commander],
			[
				"Good. I see we're all here. Mr. Salih, welcome to our camp. My name is Titus, Lord Commander of the Order of British Knights.",
				"",
				"",
				"I will try to make this short. Ian, our mutual 'friend' here, still owes the Order. He assumed leaving us would not come with a price. He was wrong.",
				"",
				"",
				"And so, we have brought him here – to demand what is ours. It also appears we share a common goal on Altis...",
				"Hold on a second – what exactly does this have to do with me? I've been through some shit recently, but this? I'm not even sure what this is!",
				"God dammit, shut up, Freshmeat!",
				"No! Let your man speak for himself, Ian. I can see you have a lot of questions – and they will be answered, shortly.",
				"",
				"",
				"At the moment however, you just need to listen and follow orders – the Order has no quarrel with you. On the contrary, in fact. We can offer money. Serious money.",
				"",
				"",
				"Although we may lack the combat capacity for the tasks to come – we possess the sinews of war. Infinite funds. As of now, we will be your only employer.",
				"",
				"",
				"Feel free to make a 'recce' of our camp. As soon as you’re done, choose a mission. My tactical officer, Knight Captain Gabriel here, will settle any questions you might have."
			],
			"DIRECT",
			IP_ShowIntro
		] call IP_fnc_simpleConversation;
		
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		
		deleteVehicle IP_LordTemp;
		IP_Lord hideObject false;
		
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		if (IP_BuddyDied) then {
			[IP_Commander, "Freshmeat! Your stuff is in the next room. There's also a shop terminal. And since Petrović died I need a new second-in-command. Congrats.", "DIRECT"] call IP_fnc_simpleSentence;
			call IP_fnc_mainPromotion;
		} else {
			[IP_Commander, "Freshmeat! Your stuff is in the next room. There's also a shop terminal. The corps man took care of Petrović but it doesn't look good.", "DIRECT"] call IP_fnc_simpleSentence;
		};
		
		[["MERCS", "AdvancedShop"]] call BIS_fnc_advHint;
		saveGame;
	};
	
	case "MMain01": {
		deleteVehicle IP_Guide;
		IP_Main setVariable ["IP_Team", []];
		IP_Main setPos [((_pos select 0) + 5), ((_pos select 1) + 3), 0];
		IP_Main setDir _dir;
		IP_Main switchMove "AmovPercMstpSlowWrflDnon";
		
		_class = typeOf IP_Commander;
		_grp = createGroup west;
		_class createUnit [_pos, _grp, "IP_CommanderTemp = this;"];
		[IP_CommanderTemp, "commander", "combat"] call IP_fnc_applyTemplate;	

		_class = typeOf IP_Captain;
		_grp = createGroup west;
		_class createUnit [_pos, _grp, "IP_CaptainTemp = this;"];
		[IP_CaptainTemp, "captain", "combat"] call IP_fnc_applyTemplate;		
		
		_class = typeOf IP_Medic;
		_grp = createGroup west;
		_class createUnit [_pos, _grp, "IP_MedicTemp = this;"];
		[IP_MedicTemp, "medic", "combat"] call IP_fnc_applyTemplate;
		
		{
			_unit = _x;
			{_unit disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
			{_unit enableAI _x} forEach ["ANIM","FSM"];
			(group _unit) setBehaviour "CARELESS";
			(group _unit) setCombatMode "BLUE";
		} forEach [IP_CommanderTemp, IP_CaptainTemp, IP_MedicTemp];
		
		IP_CommanderTemp setPos [((_pos select 0) + 6.5), ((_pos select 1) + 3), 0];
		IP_CommanderTemp setDir 25;
		IP_CommanderTemp switchMove "Acts_FarmIncident_Commander";
		
		IP_MedicTemp setPos [((_pos select 0) + 5), ((_pos select 1) + 4), 0];
		IP_MedicTemp setDir _dir;
		IP_MedicTemp switchMove "AmovPercMstpSlowWrflDnon";
		
		IP_CaptainTemp setPos [((_pos select 0) + 6), ((_pos select 1) + 5), 0];
		IP_CaptainTemp setDir ([IP_CaptainTemp, (getMarkerPos "mCamp")] call BIS_fnc_dirTo);
		[IP_CaptainTemp, "STAND", "ASIS"] call BIS_fnc_ambientAnim;
		
		_class = typeOf IP_Lord;
		_pos = (getMarkerPos "mCamp");
		_grp = createGroup west;
		_class createUnit [_pos, _grp, "IP_LordTemp = this;"];
		[IP_LordTemp, "lord"] call IP_fnc_applyTemplate;
		{IP_LordTemp disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
		{IP_LordTemp enableAI _x} forEach ["ANIM","FSM"];
		(group IP_LordTemp) setBehaviour "CARELESS";
		(group IP_LordTemp) setCombatMode "BLUE";
		IP_LordTemp setPos _pos;
		IP_LordTemp setDir ([IP_LordTemp, IP_CommanderTemp] call BIS_fnc_dirTo);
		[IP_LordTemp, "GUARD", "ASIS"] call BIS_fnc_ambientAnim;
		
		{_x hideObject true} forEach [IP_Lord, IP_Commander, IP_Captain, IP_Medic];
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		[
			[IP_LordTemp, IP_CommanderTemp],
			[
				"Report! How did it go?",
				"We were compromised but escaped during the chaos. Looks like the FIA is launching another offensive.",
				"What about our main objective?",
				"We've spotted it at Black Mesa. It's well defended but possible provided we have a good plan. However, it looks like they're getting it ready for transport.",
				"Good, then let's not waste too much time. We will discuss your observations in detail and come up with a plan ASAP.",
				"",
				"Mr. Salih, you did good work today and we're grateful. Your reward will be transferred immediately. Dismiss!"
			],
			"DIRECT",
			IP_ShowIntro
		] call IP_fnc_simpleConversation;
		
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		
		{deleteVehicle _x} forEach [IP_LordTemp, IP_CommanderTemp, IP_CaptainTemp, IP_MedicTemp];
		{_x hideObject false} forEach [IP_Lord, IP_Commander, IP_Captain, IP_Medic];
		skipTime 0.25;
		
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		[] spawn IP_fnc_showOSD;
		_reward call IP_fnc_addMoney;
		saveGame;
	};
	
	case "MMain03":{
		deleteVehicle IP_Guide;
		skipTime 1;
		
		IP_Main enableSimulation false;
		IP_Main switchMove "";
		IP_Main setPos (getMarkerPos "mBriefing");
		IP_Main setDir 50;
		IP_Main switchMove "AmovPercMstpSlowWrflDnon";
		
		IP_Hacker enableSimulation false;
		IP_Hacker hideObject true;
		
		_class = typeOf IP_Hacker;
		_grp = createGroup west;
		_class createUnit [[3153.19,21991.7,0.00146961], _grp, "IP_HackerTemp = this; this setVariable ['BIS_enableRandomization', false];"];
		IP_HackerTemp setPos [3153.19,21991.7,0.00146961];
		IP_HackerTemp setDir 177;
		[IP_HackerTemp, "hacker", "hub"] call IP_fnc_applyTemplate;	
		{IP_HackerTemp disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
		IP_HackerTemp switchMove "Acts_A_M02_briefing";
		
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0; 
		
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		IP_Main enableSimulation true;	
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 5;
		sleep 0.5;
		
		[
			[IP_HackerTemp, IP_Commander, IP_Lord],
			[
				"... see? It's totally easy. And to decrypt a message we simply take the d power of c modulo N. And bingo, we have the original message back!",
				"",
				"",
				"It's funny, but this whole system actually relies on prime factorisation. After all these years we still haven't found a way to efficiently-",
				"Yeah, great, nearly one hour of maths class and we still don't know how to get into the AAF's network, you shithead! Get to the bloody point!",
				"",
				"Hey, that's rude! Okay, I'm dealing with ignorants again. In short: We need to obtain a key pair. Preferably the one from big ass Colonel Arkhanteros himself.",
				"There's no other way?",
				"",
				"I could bruteforce my way in if you have another - uhm - 10 to 15 years? The AAF's network is not state-of-the-art but at least up-to-date. Former EUROFORCE components mostly.",
				"",
				"Okay, we'll see if we can come up with a plan on how to obtain these keys without anybody noticing. Dismiss!"				
			],
			"DIRECT",
			IP_ShowIntro
		] call IP_fnc_simpleConversation;
		
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		
		deleteVehicle IP_HackerTemp;
		IP_Hacker enableSimulation true;
		IP_Hacker hideObject false;
		
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		[] spawn IP_fnc_showOSD;
		_reward call IP_fnc_addMoney;
		saveGame;		
	};
	
	case "MMain04": {
		deleteVehicle IP_Guide;
		IP_Main setVariable ["IP_Team", []];
		IP_Main setPos _pos;
		IP_Main setDir _dir;
		IP_Main switchMove "Acts_PercMwlkSlowWrflDf2";
		
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		[0] call BIS_fnc_cinemaBorder;
		
		[] spawn IP_fnc_showOSD;
		sleep _delay;
		
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		IP_Main switchMove "AmovPercMstpSlowWrflDnon";
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;		
		[1] call BIS_fnc_cinemaBorder;
		_reward call IP_fnc_addMoney;
	};
	
	default {
		deleteVehicle IP_Guide;
		IP_Main setPos _pos;
		IP_Main setDir _dir;
		IP_Main switchMove "Acts_PercMwlkSlowWrflDf2";
		
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		[0] call BIS_fnc_cinemaBorder;
		
		[] spawn IP_fnc_showOSD;
		sleep _delay;
		
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		IP_Main switchMove "AmovPercMstpSlowWrflDnon";
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;		
		[1] call BIS_fnc_cinemaBorder;
		_reward call IP_fnc_addMoney;
	};
};