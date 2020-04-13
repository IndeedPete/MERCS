IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Notes = [];

// Functions
IP_m_fnc_createNote = {
	private ["_identifier", "_text", "_fristTime"];
	_identifier = _this select 0;
	_text = _this select 1;
	
	if (isNil "IP_NoteSubjectCreated") then {
		player createDiarySubject ["NoteLog", "Notes & Hints"];
		IP_NoteSubjectCreated = true;
	};
	
	_fristTime = if (!(_identifier in IP_Notes)) then {
		player createDiaryRecord ["NoteLog", [_identifier, _text]];
		IP_Notes = IP_Notes + [_identifier];
		["NoteCreated", [_identifier]] call bis_fnc_showNotification;
		true
	} else {
		false
	};
	
	_fristTime
};

// Scenes
IP_m_scn_notesFound = {
	if ({_x in IP_Notes} count ["Laptop Dump", "Laptop Shack"] != 2) exitWith {};
	
	[IP_Hacker, "phoneOpener", IP_Main] call IP_fnc_addConversation;
	[IP_Main, "Wait? Is that my phone?", "DIRECT"] spawn IP_fnc_simpleSentence;
	while {isNil "IP_PhoneAnswered"} do {
		IP_Main say3D "ringtone";
		sleep 4;
	};
};

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Templar"];

// Shop Setup
[] call IP_fnc_shopInit;

// Hacker
[IP_Hacker, "hacker", "combat"] call IP_fnc_applyTemplate;
IP_Hacker setCaptive true;
IP_Hacker stop true;
IP_Hacker setUnitPos "DOWN";
[] spawn {
	waitUntil {(time > 0) && ("Binocular" in (weapons IP_Hacker))};
	IP_Hacker selectWeapon "Binocular";
};

// HQ
[IP_Lord, "lord", "command"] call IP_fnc_applyTemplate;

// Farmer
IP_Farmer setName "Farmer Pete";
IP_Farmer setFace "GreekHead_A3_04";
IP_Farmer addHeadgear "H_Cap_usblack";
IP_Farmer setVariable ["IP_LiveFeed", true];
IP_Farmer setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\farmerAvatar.jpg"];
[IP_Farmer, "BRIEFING", "ASIS"] call BIS_fnc_ambientAnim;
[IP_Farmer, "farmerOpener"] call IP_fnc_addConversation;
IP_Farmer addEventhandler ["Killed", {
	[IP_Farmer, "farmerOpener"] call IP_fnc_removeConversation;
	if (!("Farmer Pete" in IP_Notes)) then {
		[IP_Main, "Better check that crazy fuck for hints!", "DIRECT"] spawn IP_fnc_simpleSentence;
		IP_Farmer addAction ["Search Body", {
			(_this select 0) removeAction (_this select 2);
			['Farmer Pete', 'Find the shack at 065131. Beware of the redskins! ;)'] call IP_m_fnc_createNote;
		}];
	};
}];

// Laptops - Chapel moved to first scene
IP_LaptopDump addAction ["Use Laptop", {
	_text = "Below the Key (K) to my position.<br/><br/><br/><br/>678145<br/><br/><br/><br/>Follow the hints,<br/><br/>" + profileName;
	_handle = createDialog "IP_DLG_LAPTOP";
	((findDisplay 50000) displayCtrl 1100) ctrlSetStructuredText (parseText _text);
	_firstTime = ["Laptop Dump", _text] call IP_m_fnc_createNote;
	if (!_firstTime) exitWith {};
	[] spawn {
		waitUntil {!dialog};
		[IP_Main, "Hm, those numbers can't be grid coords, the first one is a six. That would lead me right into the Aegean Sea...", "DIRECT"] call IP_fnc_simpleSentence;
		call IP_m_scn_notesFound;
	};
}];

IP_LaptopShack addAction ["Use Laptop", {
	_text = "The One-Time-Pad-Encryption is a mean bitch if you're missing the parameters.<br/><br/><br/><br/>Di = (Ei - Ki) mod 10<br/>(i represents an index.)<br/><br/><br/><br/>Don't try to bruteforce my position, there are 94249 different combinations of grid coordinates on the Altian map.<br/><br/>Follow the hints,<br/><br/>" + profileName;
	_handle = createDialog "IP_DLG_LAPTOP";
	((findDisplay 50000) displayCtrl 1100) ctrlSetStructuredText (parseText _text);
	_firstTime = ["Laptop Shack", _text] call IP_m_fnc_createNote;
	if (!_firstTime) exitWith {};
	[] spawn {
		waitUntil {!dialog};
		[IP_Main, "Oh hell, this guy is plain nuts. Hm, 'D' could stand for decrypted, 'E' for encrypted and 'K' for key. But what are the 'i's? Indices?", "DIRECT"] call IP_fnc_simpleSentence;
		call IP_m_scn_notesFound;
	};
}];

// Marker
"mCheckpoint" setMarkerAlpha 0;

// Briefing
_prefix = "OPERATION CRUSADER Phase III<br/><br/>";
_suffix = "<br/><br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\BK_LogoSmall.paa' width='128'/>";
_rank = if (isClass(campaignConfigFile >> "campaign")) then {(getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> (([] call IP_fnc_getMainRankData) select 0) >> "displayName"))} else {"Section Leader"};

player createDiaryRecord ["Diary", ["Contact Information", ("The most recent picture of " + profileName + ".<br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\hackerAvatar.jpg' width='310' height='232'/>")]];
player createDiaryRecord ["Diary", ["Signal", (_prefix + "White King - Command, Lord Commander Titus<br/>Templar - Attack/Recon, " + _rank + " Raif Salih" + _suffix)]];
player createDiaryRecord ["Diary", ["Execution", (_prefix + "1. Callsign 'Templar' will insert on foot, by car or by helicopter close to the <marker name=""mPickup"">Pickup Point</marker>.<br/>2. Templar will meet with " + profileName + " at the <marker name=""mPickup"">Pickup Point</marker>.<br/>3. Templar will extract and return to base." + _suffix)]];
player createDiaryRecord ["Diary", ["Mission", (_prefix + "The task is to get to the <marker name=""mPickup"">Pickup Point</marker>, meet with " + profileName + " and then return to base with him." + _suffix)]];
player createDiaryRecord ["Diary", ["Situation", (_prefix + "The future steps of Operation Crusader require the assistance of a professional IT-Security specialist. The Order hired a freelancing partner they have been working with before. He is known as very careful, nearly paranoid and he operates under the alias '" + profileName + "'. His exact whereabouts are unknown but he agreed to a meeting and is waiting at a <marker name=""mPickup"">Pickup Point</marker>." + _suffix)]];

[player, "tPickup", [("Meet " + profileName + " at the <marker name=""mPickup"">Pickup Point</marker>!"), ("Pick up " + profileName), "Pickup"], "mPickup", true, 1, true, "meet"] call BIS_fnc_taskCreate;

// All Units
{
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "Rogues"];
		[_x] call IP_fnc_createMerc;
	};
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		_x unlinkItem "NVGoggles_INDEP";
		if ((dayTime < 7) OR (dayTime > 19)) then {
			_x addPrimaryWeaponItem "acc_flashlight";
			_x enableGunLights "forceOn";
		};
	};
} forEach (allUnits - [IP_Main]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;