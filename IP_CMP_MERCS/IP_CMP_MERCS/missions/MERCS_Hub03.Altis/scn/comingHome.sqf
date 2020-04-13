private ["_lastSuccessfulMission", "_reward", "_conv"];
["IP_BlackScreen", false] call BIS_fnc_blackOut;
{_x enableSimulation false} forEach [IP_Main, IP_LordTemp, IP_Scientist];
sleep 2;
skipTime 1;
call IP_scn_dynamicCampInit;

_lastMission = if (isNil "IP_MERCS_Mission") then {"MMain05"} else {IP_MERCS_Mission};
_lastSuccessfulMission = "";
_reward = 0;
if ((!isNil "IP_MERCS_MissionsDone") && {_lastMission in IP_MERCS_MissionsDone}) then {
	_lastSuccessfulMission = _lastMission;
	_reward = _lastSuccessfulMission call IP_fnc_calculateCurrentMissionReward;
};
	
sleep 0.5;

IP_Lord hideObject true;
{
	_guy = _x;
	{_guy disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
	_x setVariable ["IP_LiveFeed", false];
	_x enableSimulation true;
} forEach [IP_Scientist, IP_LordTemp, IP_Main];
IP_Scientist switchMove "Acts_Abuse_abuser";
IP_LordTemp switchMove "Acts_Abuse_Akhanteros";
IP_Main switchMove "Acts_Abuse_abusing";
IP_Main enableSimulation true;

sleep 4;

// Cutscene Start
#define CUTIN ["IP_BlackScreen"] call BIS_fnc_blackIn;
#define CUTOUT ["IP_BlackScreen", false] call BIS_fnc_blackOut;
#define CHECK if (!isNil "IP_Cutscene_Skip" && {IP_Cutscene_Skip}) then {breakOut "cutscene"};

disableSerialization;
IP_Cutscene_Skip = false;

_ehSkip = ([] call BIS_fnc_displayMission) displayAddEventHandler
[
	"KeyDown",
	"
		if (_this select 1 == 57) then
		{
			if (IP_Cutscene_Skip) exitWith {};

			playSound ['click',true];

			IP_Cutscene_Skip = true;
		};
	"
];

uiNamespace setVariable ["IP_Cutscene_ehSkip", _ehSkip];

_camera = "camera" camCreate (getPos player);
_camera cameraEffect ["internal", "back"];

if (true) then {
	scopeName "cutscene";
	
	// Scientist and Main front
	_camera camPrepareTarget [-73860.92,-41844.40,16.65];
	_camera camPreparePos [3129.09,21968.92,1.56];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 0;
	
	sleep 0.5;
	CUTIN
	CHECK
			
	_conv = [
		[IP_Main, IP_Scientist, IP_LordTemp],
		[
			"Okay, move on, nearly there.",
			"Ah, hijo de puta!",
			"",
			"Careful, Doctor! Son-of-a-bitch yourself.",
			"Argh, capullo! Come mierda, cabrón!",
			"",
			"You can keep insulting me in your funny language - it won't change the situation, señor.",
			"",
			"Ah, there you are! Please, bring him over, Mr. Salih.",
			"Okay, you heard the man. Get back up, Doctor.",
			"",
			"",
			"Go, move it!",
			"Yeah, yeah, fine! Just say how much you want! My company will pay anything! No need for violence!",
			"I'm afraid we're not after your company's money. Well, not directly at least.",
			"",
			"Then what do you want from me?",
			"We require your assistance in the operation the men behind me are currently preparing. Your technical skills as well as inside knowledge to be more precise.",
			"",
			"",
			"Can I rely on your cooperation? I ensure you that you will not be harmed if you obey.",
			"",
			"Okay, I'll do whatever you want. Just no shooting, okay? No one needs to die!",
			"Well, some people will die. Anyway, get him into to the house, prep your gear and report in for briefing. We'll get going soon."
		],
		"DIRECT",
		false
	] spawn IP_fnc_simpleConversation;
	
	sleep 3;
	
	// Scientist Fall Down
	_camera camPrepareTarget IP_Scientist; //[-42749.32,103918.17,-34323.65];
	_camera camPreparePos [3129.81,21967.75,1.47];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 4;
	waitUntil {camCommitted _camera};
	
	CHECK
	sleep 1;
	
	CHECK
	CUTOUT
	sleep 0.25;	

	// Scientist on the ground
	_camera camPrepareTarget [-33978.45,-70707.00,-5796.12];
	_camera camPreparePos [3129.24,21971.20,0.20];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 0;
	
	sleep 0.25;
	CUTIN
	CHECK
	
	sleep 9;
	
	CHECK
	CUTOUT
	sleep 0.25;
	
	// Lord
	_camera camPrepareTarget [54772.68,107065.61,-9609.15];
	_camera camPreparePos [3132.06,21973.92,1.67];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 0;
	
	sleep 0.25;
	CUTIN
	CHECK
	
	sleep 4;
	CHECK
	
	// Scientist and Main back
	_camera camPrepareTarget IP_Scientist; //[25960.67,118852.43,-9609.18];
	_camera camPreparePos [3130.26,21970.14,1.54];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 2;
	waitUntil {camCommitted _camera};
	
	CHECK
	sleep 4;
	
	CHECK
	CUTOUT
	sleep 0.25;
	
	// Scientist Kneeling
	_camera camPrepareTarget [-19094.33,-74808.80,-11752.78];
	_camera camPreparePos [3132.00,21976.99,1.28];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 0;
	
	sleep 0.25;
	CUTIN
	CHECK
	
	// Lord Left - Scientist Right
	_camera camPrepareTarget [-13894.93,-76350.88,-6424.01];
	_camera camPreparePos [3132.28,21978.19,1.60];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 6;
	waitUntil {camCommitted _camera};
	
	CHECK
	sleep 3;
	
	// Lord Back
	_camera camPrepareTarget [-91405.05,-2595.76,-21393.49];
	_camera camPreparePos [3135.10,21975.94,1.76];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 10;
	waitUntil {camCommitted _camera};
	
	CHECK
	CUTOUT
	sleep 0.25;

	// Side Again
	_camera camPrepareTarget [-11016.72,-74910.84,-20289.59];
	_camera camPreparePos [3132.33,21978.17,1.73];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 0;
	
	sleep 0.25;
	CUTIN
	CHECK
	
	sleep 12;
	CHECK
	
	_camera camPrepareTarget IP_Scientist; //[-93352.62,13873.40,-24974.51];
	_camera camPreparePos [3134.66,21975.58,1.75];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 25;
	waitUntil {(camCommitted _camera) && (scriptDone _conv)};
};

if ((!isNil "_conv") && {!(scriptDone _conv)}) then {terminate _conv};
CUTOUT
sleep 0.5;

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', (uiNamespace getVariable "IP_Cutscene_ehSkip")];
uiNamespace setVariable ["IP_Cutscene_ehSkip", nil];
IP_Cutscene_Skip = nil;

deleteVehicle IP_LordTemp;
IP_Lord hideObject false;

IP_Main switchMove "AmovPercMstpSlowWrflDnon";
IP_Main setDir 50;
IP_Main setVariable ["IP_LiveFeed", true];
{IP_Main enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];

_pos = (getMarkerPos "mScientist");
_pos set [2, 0.3];
IP_Scientist setPos _pos;
IP_Scientist setDir (markerDir "mScientist");
IP_Scientist setVariable ["IP_LiveFeed", true];
[IP_Scientist, "STAND_U1", "ASIS"] call BIS_fnc_ambientAnim;

sleep 0.5;
CUTIN

[] spawn IP_fnc_showOSD;
_reward call IP_fnc_addMoney;
saveGame;

[IP_Hacker, "Hey, psst, big bad mercenary! Come over here for a sec, will you?", "DIRECT"] call IP_fnc_simpleSentence;
[player, "tHacker", [("Talk to " + profileName + "! (OPTIONAL)"), "Talk (OPTIONAL)", profileName], IP_Hacker, true, 1, true, "talk1"] call BIS_fnc_taskCreate;