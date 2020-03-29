0 fadeSound 0;
enableSentences false;

#define CUTIN ["IP_BlackScreen"] call BIS_fnc_blackIn;
#define CUTOUT ["IP_BlackScreen", false] call BIS_fnc_blackOut;

CUTOUT
sleep 0.5;

_camera = "camera" camCreate (getPos player);
_camera cameraEffect ["internal", "back"];

_camera camPrepareTarget [-10093.09,118813.86,-20803.20];
_camera camPreparePos [3157.71,21908.15,3.75];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

_video = ["\A3\Missions_F_EPA\video\B_out2_sometime_later.ogv"] spawn BIS_fnc_playVideo;
sleep 7;
waitUntil {scriptDone _video};
0 fadeSound 1;

CUTIN
sleep 5;

_camera camPrepareTarget [-55180.17,74437.34,-61961.91];
_camera camPreparePos [3120.97,21947.42,2.55];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;
waitUntil {camCommitted _camera};

CUTOUT
sleep 0.25;

_camera camPrepareTarget [-25502.75,117600.91,-5606.43];
_camera camPreparePos [3117.87,21949.31,1.65];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

sleep 0.25;
CUTIN

sleep 5;

CUTOUT
sleep 0.5;

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

{
	_x enableSimulation true;
	_x hideObject false;
} forEach [IP_Lord, IP_Commander, IP_Captain, IP_Main, IP_Heli, IP_GL_Heli];

IP_Lord switchMove "Acts_FarmIncident_Commander";
IP_Commander switchMove "acts_welcomeonhub02_aiwalk";
IP_Main switchMove "Acts_welcomeOnHUB02_PlayerWalk";
IP_Captain switchMove "Acts_NavigatingChopper_Loop";
IP_Medic switchMove "AmovPercMstpSlowWrflDnon";

[] spawn {
	_in = call(compile(preprocessFileLineNumbers "heliDataIn.sqf"));
	_loop = call(compile(preprocessFileLineNumbers "heliDataLoop.sqf"));
	[IP_GL_Heli, _in] call BIS_fnc_unitPlay;
	IP_Captain switchMove "Acts_NavigatingChopper_Out";
	
	while {!(isNull IP_Heli)} do {
		[IP_GL_Heli, _loop] call BIS_fnc_unitPlay;
	};
};

sleep 0.25;
CUTIN

[0] call BIS_fnc_cinemaBorder;
[] spawn IP_fnc_showOSD;
sleep 0.25;

[
	[IP_Commander],
	[
		"Hell, that was a fight, wasn't it? And you're still alive, congrats.",
		"You know, when you first arrived at Maxwell I thought you would make it 24 hours tops. But you've proven you're less of an asshole than I thought.",
		"When this is done, we're all going to Switzerland. We should talk about your future at ION then."
	],
	"DIRECT"
] call IP_fnc_simpleConversation;

IP_Medic doWatch IP_Main;
IP_Medic doTarget IP_Main;
if (!IP_BuddyDied) then {
	[] spawn {
		IP_Shooter doWatch IP_Buddy;
		IP_Shooter doTarget IP_Buddy;
		
		sleep 1;
		_weapon = primaryWeapon IP_Shooter;
		_mode = (getArray(configFile >> "CfgWeapons" >> _weapon >> "modes")) select 0;
		
		for "_i" from 0 to 5 do {
			IP_Shooter forceWeaponFire [_weapon, _mode];
			sleep 0.1;
		};
		
		IP_Buddy setDamage 1;
		IP_Shooter doWatch ObjNull;
		IP_Shooter switchMove "AmovPercMstpSlowWrflDnon";		
	};
};

sleep 1;

for "_i" from 0 to 2 do {
	IP_Medic forceWeaponFire [(primaryWeapon IP_Medic), "SINGLE"];
	sleep 0.2;
};

IP_Medic doWatch ObjNull;
IP_Medic doTarget ObjNull;
IP_Medic switchMove "AmovPercMstpSlowWrflDnon";

CUTOUT
sleep 0.25;

IP_Main setDamage 0.9;
IP_Main switchMove "acts_InjuredAngryRifle01";
IP_Lord switchMove "Acts_FarmIncident_Commander";
IP_Commander switchMove "Acts_BootKoreShootingRange_Adams";

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0; 

sleep 0.25;
CUTIN

playSound ["combat_deafness", true];
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 10;

sleep 10;

[
	[IP_Commander, IP_Lord, IP_Main],
	[
		"...was that really necessary?",
		"Do you really want to share? I know you better, Ian. Besides, that nigger wasn't worth one and a half million.",
		"",
		"No, probably not but he was a good lad. He had potential, could've used him. Well, too bad. Sorry Freshmeat, that's nothing personal.",
		"Shock and blood loss will do the rest. Let's go, gentlemen!",
		"Bastards... fucking backstabbing bastards..."
	],
	"DIRECT"
] call IP_fnc_simpleConversation;

"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 5;

if (!IP_HostageSaved) exitWith {
	0 cutText ["", "WHITE OUT", 5];
	sleep 5;
	call IP_scn_credits;
};

0 cutText ["", "BLACK OUT", 5];
5 fadeSound 0;

sleep 6;

{deleteVehicle _x} forEach ([IP_Lord, IP_Commander, IP_Captain, IP_Medic, IP_Shooter, IP_AmbientMedic, IP_AmbientWounded, IP_Heli, IP_DeviceTruck] + (crew IP_Heli));
IP_Hostage enableSimulation true;
IP_Hostage hideObject false;
IP_Hostage setPos (IP_Main modelToWorld [0.6, -0.6, 0]);
IP_Hostage setDir ([IP_Hostage, IP_Main] call BIS_fnc_dirTo);
IP_Hostage switchMove "Acts_TreatingWounded03";
sleep 3;

0 cutText ["", "BLACK IN", 1];
1 fadeSound 1;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 5;
sleep 1;

[
	[IP_Hostage, IP_Main],
	[
		"Hey! Don't die yet, Mister! Stay with me!",
		"Ugh... Argh... Who... Who the fuck... Are you... ?",
		"You don't remember me?! Ben, Ben Kerry! You saved my life just the other day! At the pirate hideout! They held me as hostage there and you bailed me out!",
		"Right... What... Argh... What are you doing here?",
		"I was fishing close by when all hell broke loose. I hid in the woods until it was over, then I saw you guys! I recognised your face.",
		"You go fishing in a war zone? Ugh...",
		"Uhm, I guess so. But at least there are no pirates on this coast!"
	],
	"DIRECT"
] call IP_fnc_simpleConversation;

if (!IP_BuddyDied) then {
	[IP_Main, "What... What about Dražen?", "DIRECT"] call IP_fnc_simpleSentence;
	[IP_Hostage, "Who? Oh, the other guy with the tattoos. He's gone, sorry buddy. There was nothing I could do.", "DIRECT"] call IP_fnc_simpleSentence;
};

[IP_Hostage, "Listen, we have to get you out of here, to a doctor. I know a good one, just stay with me, will you?", "DIRECT"] call IP_fnc_simpleSentence;

CUTOUT
sleep 0.25;

_video = ["\A3\Missions_F_EPA\video\B_Hub01_10_days_later.ogv"] spawn BIS_fnc_playVideo;
skipTime (10 * 24 + 12);
["", ["CLEAR", "SUNNY"]] call IP_fnc_setWeather;
if (!isNil "IP_ColourCorrections") then {ppEffectDestroy IP_ColourCorrections};

IP_Main setDamage 0;
IP_Main switchMove "";
removeAllWeapons IP_Main;
removeHeadgear IP_Main;
removeGoggles IP_Main;
removeVest IP_Main;
removeUniform IP_Main;
removeBackpack IP_Main;
{IP_Main unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
IP_Main forceAddUniform "U_C_Poloshirt_blue";
IP_Main setPos [2992.9,18105.4,0.00157356];
IP_Main setDir ([IP_Main, IP_CampFire] call BIS_fnc_dirTo);
IP_Main forceWalk true;

IP_Hostage switchMove "";
{IP_Hostage enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET", "ANIM"];
IP_Hostage stop true;
IP_Hostage setUnitPos "UP";

sleep 5;
waitUntil {scriptDone _video};

IP_Hostage setPos [2987.62,18103.3,0.00138783];
IP_Hostage setDir ([IP_Hostage, IP_CampFire] call BIS_fnc_dirTo);
player action ["sitDown", IP_Hostage];

CUTIN

sleep 1;
[] spawn IP_fnc_showOSD;

sleep 0.5;

[IP_Hostage, "There you are! Feeling better? Come, join me at the campfire.", "DIRECT"] call IP_fnc_simpleSentence;

[1] call BIS_fnc_cinemaBorder;
waitUntil {(IP_Main distance IP_Campfire) < 1.8};
player action ["sitDown", IP_Main];

[
	[IP_Main, IP_Hostage],
	[
		"Yeah, I'm, getting better. Thanks to you that is.",
		"Well, I guess that makes us even now. I'm so glad you saved me from the pirates back then.",
		"You're welcome. Anything on the news about what happened at the camp?",
		"Nope, nothing. But they said that the AAF is back in charge and European troops are retreating. However, no word on your friends.",
		"",
		"So, what are your plans now?",
		"I have no fucking idea. Everything what held me on this island is gone now. Everybody's gone. Maybe I should pick up my original plan to immigrate to Europe.",
		"Don't worry, you've got time to think now. Lots of time. For now, just watch the sun going down. That's one of the perks of being on this island.",
		"Right, I think I've never really done that..."
	],
	"DIRECT"
] call IP_fnc_simpleConversation;

call IP_scn_credits;