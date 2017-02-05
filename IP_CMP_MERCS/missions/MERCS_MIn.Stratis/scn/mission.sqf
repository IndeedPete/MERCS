_saySentences = {
	#define EH_SKIP (uiNamespace getVariable "IP_Cutscene_ehSkip")
	#define EH_SKIP_SET_NIL uiNamespace setVariable ["IP_Cutscene_ehSkip",nil]
	
	_sentences = _this;
	
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
		_speaker = _sentence select 0;
		_str = _sentence select 1;
		if (_str != "" ) then {
			[_speaker, _str, "DIRECT"] call IP_fnc_simpleSentence;
		};
		if (IP_cutscene_skip) exitWith {};
	};
	
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', EH_SKIP];
	EH_SKIP_SET_NIL;
	IP_cutscene_skip = nil;
};

// Mission Starts
enableSentences false;
0 cutText ["", "BLACK FADED", 10e10];
0 fadeSound 0;
sleep 2;

_text = "
	<t align = 'left' font='PuristaBold' shadow = '1' size = '2.0'>mercenary</t><br/>
	<t align = 'left' shadow = '1' size = '1.0'>	Line breaks: mer¦cen|ary</t><br/><br/>
	<t align = 'left' shadow = '1' size = '1.5'>Adjective</t><br/><br/>
	<t align = 'left' shadow = '1' size = '1.0'>	Primarily concerned with making money at the expense of ethics.</t><br/><br/>
	<t align = 'left' shadow = '1' size = '1.5'>Noun (plural mercenaries)</t><br/><br/>
	<t align = 'left' shadow = '1' size = '1.0'>	1 A professional soldier hired to serve in a foreign army.</t><br/><br/>
	<t align = 'left' shadow = '1' size = '1.0'>		1.1 A person primarily motivated by personal gain.</t><br/><br/>
	<t align = 'right' shadow = '1' size = '1.5'>- Oxford Dictionary</t>
";

1 cutRsc ["IP_DLG_DICTIONARY", "PLAIN", 3]; 
((uiNamespace getVariable "DLG_Dictionary") displayCtrl 1100) ctrlSetStructuredText (parseText _text);

sleep 2;
IP_Weather = ["", IP_Weather] call IP_fnc_setWeather;
sleep 10;
0 fadeSound 1;
1 cutText ["", "PLAIN", 3];
sleep 2;
0 cutText ["", "BLACK IN", 5];
if (IP_ShowIntro) then {[0] call BIS_fnc_cinemaBorder};

[
	[IP_Main, "Ha, I can see land! Is this Greece already?!"],
	[IP_Refugee1, "I'm not sure, I don't think so! Hey Nikos, is this Greece over there?!"],
	[IP_Trafficker, "No, my friends, not yet! This is where you will be working to pay off your debts with me! But Greece is not far, we can visit it together!"],
	[IP_Main, "Thank you Nikos, you're my saviour! Don't worry about your money, I'll do the job and pay you back! Just no more fighting!"],
	[IP_Main, "Not one month ago I was sitting in some foxhole a few clicks north of Karthoum trying to somehow survive while Ethiopian artillery rained down on me!"],
	[IP_Trafficker, "You're welcome my friend! Soon you will be a free man! In Europe!"],
	[IP_Refugee1, "You are from Sudan?"],
	[IP_Main, "Yes, but it's horrible there! First the civil war and now the Ethiopians! I didn't have a future there, so I deserted from the army, took the little I had and started running!"],
	[IP_Trafficker, "There is the coast, we're going to meet some of my partners! Don't worry!"]
] call _saySentences;

["IP_BlackScreen", false] call BIS_fnc_blackOut;
IP_Main setPos (getMarkerPos "mMain");
IP_Main setDir ([IP_Main, IP_Commander] call BIS_fnc_dirTo);
IP_Main switchMove "acts_StandingSpeakingUnarmed";

IP_Trafficker disableAI "ANIM";
IP_Trafficker disableAI "MOVE";
IP_Trafficker setPos (getMarkerPos "mTrafficker");
IP_Trafficker setDir ([IP_Trafficker, IP_Commander] call BIS_fnc_dirTo);
IP_Trafficker switchMove "Acts_B_out2_briefing";
[] spawn {
	sleep 52.359;
	IP_Trafficker switchMove "Acts_B_out2_briefing";
};

IP_Refugee1 setPos (getMarkerPos "mRefugee1");
IP_Refugee1 stop true;
IP_Refugee1 setDir ([IP_Refugee1, IP_Commander] call BIS_fnc_dirTo);

IP_Merc1 doWatch IP_Refugee1;
IP_Merc1 doTarget IP_Refugee1;

sleep 3;
["IP_BlackScreen"] call BIS_fnc_blackIn;

[
	[IP_Commander, "Nikos, looks like you have whole group with you this time!"],
	[IP_Trafficker, "Yes, yes! A lot to do!"],
	[IP_Main, "Nikos, who are these men and why are they pointing rifles at us?!"],
	[IP_Trafficker, "These are my partners and your new employers. We had a deal, remember? I'll get you to Europe and you'd work for me in return."],
	[IP_Main, "Yes, but you said I'd have a normal, peaceful job! All I wanted was to get away from war!"],
	[IP_Trafficker, "Sorry, but a nice, peaceful job is not profitable. I want to get my money back before I turn eighty."],
	[IP_Trafficker, "So, McMillian here will pay for you and we're even. The rest is between you and him."],
	[IP_Main, "What?! I'm not an object! You can't sell me like a fucking thing!"],
	[IP_Trafficker, "I can, and I did! Sorry, but that's how this business works. What did you think? That human trafficking is run by charity? Grow up."],
	[IP_Commander, "You better listen to him, Freshmeat. I'm offering you a way out of your debts and into a wealthy life."],
	[IP_Commander, "Nikos said you have military experience. That makes you useful to us."],
	[IP_Commander, "Work for me until we're even or die right now. It's your choice."]
] call _saySentences;

if (IP_ShowIntro) then {[1] call BIS_fnc_cinemaBorder};
0 cutText ["", "BLACK FADED", 10e10];

[] call BIS_fnc_jukebox;
[IP_Trafficker, "STAND_U1", "ASIS"] call BIS_fnc_ambientAnim;
IP_Main switchMove "";

0 cutText ["", "BLACK IN"];

_actYes = IP_Main addAction ["'Fuck! I guess there is no choice after all.'", {IP_Choice = true}];
_actNo = IP_Main addAction ["'No! I won't fight for you!'", {IP_Choice = false}];
[["MERCS", "Decisions"]] call BIS_fnc_advHint;

waitUntil{!isNil "IP_Choice"};

IP_Main removeAction _actYes;
IP_Main removeAction _actNo;

if (!IP_Choice) exitWith {
	[IP_Main, "No! I won't fight for you!", "DIRECT"] call IP_fnc_simpleSentence;
	[IP_Commander, "All right. Try your luck, you've got 5 seconds. Start running.", "DIRECT"] call IP_fnc_simpleSentence;
	IP_Main addRating -10000;
};

[IP_Main, "Fuck! I guess there is no choice after all. I'll do whatever it is you want from me.", "DIRECT"] call IP_fnc_simpleSentence;
[IP_Main, "But Nikos, this is not over. We are not done.", "DIRECT"] call IP_fnc_simpleSentence;
[IP_Commander, "All right. Petrović, take the FNG to the camp and show him the ropes. We'll deal with Nikos and come later.", "DIRECT"] call IP_fnc_simpleSentence;
[IP_Buddy, "Yes, Sir. As you wish. Follow me, new guy!", "DIRECT"] call IP_fnc_simpleSentence;

IP_BuddyGo = true;

[IP_Refugee1, "But what happens to us?!", "DIRECT"] call IP_fnc_simpleSentence;
[IP_Trafficker, "You'll stay here on the island. Permanently.", "DIRECT"] call IP_fnc_simpleSentence;
[IP_Main, "Who are you?! And where are we?! And what will they do to the others?", "DIRECT"] call IP_fnc_simpleSentence;
[IP_Buddy, "We're private military contractors doing mercenary work. Mostly on Altis up to the north. We're on Stratis now.", "DIRECT"] call IP_fnc_simpleSentence;
[IP_Buddy, "Get in the car! Believe me, you don't want to see this.", "DIRECT"] call IP_fnc_simpleSentence;

waitUntil{IP_Main in IP_Car};
sleep 2;

{
	_x allowDamage true;
	_x addRating -10000;
	sleep 0.5;
} forEach [IP_Refugee1, IP_Refugee2, IP_Refugee3, IP_Refugee4];

waitUntil{(!alive IP_Refugee1) && (!alive IP_Refugee2) && (!alive IP_Refugee3) && (!alive IP_Refugee4)};
if (!IP_TESTMODE) then {IP_Main allowDamage true};

["Hub01", true, 5] call IP_fnc_endMission;