IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Recruits = [];
IP_CriticalViolation = false;
IP_MainGroup = group IP_Marksman;

// Scenes
IP_scn_ambientShootingRange = compile(preProcessFileLineNumbers "scn\ambientShootingRange.sqf");

// Adjust Date
private "_date";
_date = date;
_date set [3, 8];
_date set [4, 0];
if ((date select 3) > 7) then {_date set [2, ((date select 2) + 1)]};
setDate _date;

// Main Setup
IP_MERCS_Team = [];
[] call IP_fnc_mainInit;
[] spawn {
	waitUntil {(!isNil "IP_MainInitDone") && (time > 0)};
	[IP_Main, "mainAAF"] call IP_fnc_applyTemplate;
};

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;
IP_Commander setVariable ["IP_LiveFeed", false];
{
	[_x, "KNEEL", "ASIS"] call BIS_fnc_ambientAnim;
	_x enableSimulation false;
	_x hideObject true;
} forEach (units(group IP_Commander));

// Sergeant
IP_Sergeant setFace "GreekHead_A3_09";
IP_Sergeant setName "Kostas Strambopoulos";
IP_Sergeant setVariable ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\drillSergeantAvatar.jpg'];
IP_Sergeant allowDamage false;
IP_Sergeant setVariable ["IP_LiveFeed", true];
removeAllWeapons IP_Sergeant;
removeVest IP_Sergeant;
removeHeadgear IP_Sergeant;
removeGoggles IP_Sergeant;
IP_Sergeant addGoggles "G_Aviator";
IP_Sergeant addHeadgear "H_MilCap_dgtl";
[IP_Sergeant, "Curator"] call BIS_fnc_setUnitInsignia;

// Resistance Leader
removeAllWeapons IP_ResistanceLeader;
removeVest IP_ResistanceLeader;
IP_ResistanceLeader addWeapon "hgun_ACPC2_F";
[] spawn {
	waitUntil {time > 0};
	IP_ResistanceLeader switchMove "Acts_SittingWounded_out";
	IP_ResistanceLeader setDamage 1;
	removeHeadgear IP_ResistanceLeader;
	removeGoggles IP_ResistanceLeader;
};

// Colonel
[IP_Colonel, "colonel"] call IP_fnc_applyTemplate;
IP_Colonel setVariable ["IP_Cemetery", true];
[IP_Colonel, "BRIEFING", "ASIS"] call BIS_fnc_ambientAnim;
[IP_Colonel, "colonelOpener"] call IP_fnc_addConversation;

// Whiteboard
IP_Whiteboard setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\MMain04_WB1.paa"];

// Marker
{_x setMarkerAlpha 0} forEach ["mRecruits", "mMeet"];

// Briefing
_prefix = "OPERATION CRUSADER Phase IV<br/><br/>";
_suffix = "<br/><br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\BK_LogoSmall.paa' width='128'/>";
_rank = if (isClass(campaignConfigFile >> "campaign")) then {(getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> (([] call IP_fnc_getMainRankData) select 0) >> "displayName"))} else {"Section Leader"};

player createDiaryRecord ["Diary", ["Target Information", "AAF Commander In Chief - Colonel Georgious Akhanteros<img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_M07a_Colonel.jpg' width='240' height='185'/>"]];
player createDiaryRecord ["Diary", ["Signal", (_prefix + "White King - Command, Lord Commander Titus<br/>Black Knight - Attack/Extraction, Executive Ian McMillian" + _suffix)]];
player createDiaryRecord ["Diary", ["Execution", (_prefix + "1. Raif Salih will report in as volunteer for the AAF's extended recruitment program.<br/>2. Raif Salih will get close to Colonel Arkhanteros and copy his credentials using the smartphone app.<br/>3. Raif Salih will be contacted and extracted." + _suffix)]];
player createDiaryRecord ["Diary", ["Mission", (_prefix + "The task is to infiltrate the AAF using their extended recruitment program, find a way to get close to Colonel Arkhanteros, apply the smartphone app to read out his credentials without him noticing and then extract without being compromised. Any behaviour leading to compromise is to be avoided." + _suffix)]];
player createDiaryRecord ["Diary", ["Situation", (_prefix + "In order to gain access to the AAF's internal network and communications valid user credentials and login data are required. The easiest way to obtain said credentials is to copy existing and valid ones. It is mandatory to gain the highest access level possible which is currently possessed by the AAF's Commander in Chief - Colonel Georgious Akhanteros.<br/><br/>According to " + profileName + " Colonel Arkhanteros carries a small subcutaneous implant containing the needed data. It is using Near-Field-Communication (NFC) to exchange data with the AAF's computer terminals. " + profileName + " found an exploit in its communication protocols and wrote a small smartphone app which is able to read out the credentials once it is close enough to establish an NFC connection." + _suffix)]];

[player, "tKey", ["Find a way to get Colonel Akhanteros' AAF network credentials!", "Colonel's Credentials", ""], nil, true, 1] call BIS_fnc_taskCreate;

// All Units
{
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "FIA"];
		_x enableSimulation false;
		_x hideObject true;
	};
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		_x unlinkItem "NVGoggles_INDEP";		
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				IP_CriticalViolation = true;
			};
		}];
		
		if (_x getVariable ["IP_Recruit", false]) then {
			IP_Recruits = IP_Recruits + [_x];
			
			_x stop true;
			removeAllWeapons _x;
			removeHeadgear _x;
			removeVest _x;
			removeGoggles _x;
			_x addHeadgear "H_Booniehat_dgtl";
			[_x, "Curator"] call BIS_fnc_setUnitInsignia;			
		};
		
		if (_x in (units IP_MainGroup)) then {
			[_x, "Curator"] call BIS_fnc_setUnitInsignia;
			[_x, 1] call IP_fnc_setSkill;
			_x assignAsCargo IP_APC;
			_x moveInCargo IP_APC;
		};
		
		if (_x getVariable ["IP_Cemetery", false]) then {
			_x enableSimulation false;
			_x hideObject true;
		};
	};
} forEach (allUnits - [IP_Main]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;