IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Sons = [IP_Son1, IP_Son2];

// Functions
IP_m_fnc_QRF = {
	_pos = getPos IP_Main;
		
	IP_QRF setBehaviour "COMBAT";
	IP_QRF setCombatMode "RED";
	IP_QRF setSpeedMode "FULL";
	
	deleteWaypoint [IP_QRF, 0];
	_wp = IP_QRF addWaypoint [_pos, 0];
	_wp setWaypointType "SAD";
	
	if (IP_TESTMODE) then {hint "QRF deployed!"};
};

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Templar"];
[] spawn {
	waitUntil {(!isNil "IP_MainInitDone") && {(count(IP_Main getVariable ["IP_Team", []]) + 1) == (count(units(group IP_Main)))}};
	if (uniform IP_Main == "U_O_CombatUniform_ocamo") then {
		_guys = units(group IP_Main);
		IP_Disguise = true;
		if (IP_TESTMODE) then {hint "Undercover, bitches!"};
		{_x setCaptive true} forEach _guys;
		{
			_x setCaptive true;
			_x addEventHandler ["HIT", {
				if (((_this select 1) in (units group IP_Main)) && {!isNil "IP_Disguise"}) then {
					{_x setCaptive false} forEach allUnits;
					IP_Disguise = nil;
					if (IP_TESTMODE) then {hint "Cover is blown!"};
				};
			}];
		} forEach (allUnits - _guys);
	};
};

// HQ
[IP_Lord, "lord", "command"] call IP_fnc_applyTemplate;

// Sons
IP_Son1 setVariable ["IP_LiveFeed", true];
IP_Son1 setName "Angel Díaz";
IP_Son2 setName "Jorge Díaz";
{
	_x addEventHandler ["Killed", {
		if (IP_Scientist in (list trgHouse)) then {
			[] spawn {
				waitUntil {!IP_SimpleSentence_Talking};
				[IP_Scientist, "No! What are you doing?! Stop this madness, please!", "DIRECT"] call IP_fnc_simpleSentence;
			};
		};
		if ({alive _x} count IP_Sons == 0) then {
			[] spawn {
				sleep 2;
				waitUntil {!IP_SimpleSentence_Talking};
				[IP_Main, "Fuck, his sons are both dead, now my leverage is gone!", "DIRECT"] call IP_fnc_simpleSentence;
			};
		};
	}];
} forEach IP_Sons;

// Scientist
[IP_Scientist, "scientist"] call IP_fnc_applyTemplate;
(group IP_Scientist) allowFleeing 0;
IP_Scientist setUnitPos "UP";
[IP_Scientist, "scientistOpener"] call IP_fnc_addConversation;
if ((dayTime < 7) OR (dayTime > 19)) then {
	IP_ScientistAtHome = true;
	_grp = group IP_Scientist;
	deleteWaypoint [_grp, 1];
	deleteWaypoint [_grp, 0];
	IP_Scientist setPos [16605.3, 16218.9, 0.00143433];
	IP_Scientist setDir 140;
	IP_Scientist stop true;
};

// SUV Setup (And Campfire)
if ((dayTime < 7) OR (dayTime > 19)) then {
	IP_CampFire inFlame true;
	{deleteVehicle _x} forEach ((units(group IP_SUVLeader)) + [IP_SUV, IP_Hatchback]);
} else {
	IP_SUV spawn {_this setObjectTexture [0, "\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa"]}; 
	IP_SUV addEventHandler [
		"HandleDamage",{
			_unit = _this select 0;
			_selection = _this select 1;
			_passedDamage = _this select 2;
			_source = _this select 3;
			_projectile = _this select 4;
			
			_oldDamage = damage _unit;
			
			_return = _oldDamage + ((_passedDamage - _oldDamage) / 10);
			if (IP_TESTMODE) then {hint format ["Target: %1\nSelection: %2\nDamage: %3\nReduced Damage: %4\nHealth: %5", _unit, _selection, _passedDamage, _return, (1 - (damage _unit))];};
			
			_return
		}
	];
};

// AAF Composition Checkpoint
[] call compile preProcessFileLineNumbers "compositions_complex\C_EA_Checkpoint_03.sqf";
[] call compile preProcessFileLineNumbers "compositions_complex\C_EA_Accident.sqf";

// Markers
{_x setMarkerAlpha 0} forEach ["mPat1", "mPat2", "mPat3", "mPat4"];

// Briefing
_prefix = "OPERATION CRUSADER Phase V<br/><br/>";
_suffix = "<br/><br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\BK_LogoSmall.paa' width='128'/>";
_rank = if (isClass(campaignConfigFile >> "campaign")) then {(getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> (([] call IP_fnc_getMainRankData) select 0) >> "displayName"))} else {"Section Leader"};

player createDiaryRecord ["Diary", ["Target Information", "Dr. Joaquín Díaz at work.<br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\scientistAvatar.jpg' width='310' height='232'/>"]];
player createDiaryRecord ["Diary", ["Signal", (_prefix + "White King - Command, Lord Commander Titus<br/>Templar - Attack, " + _rank + " Raif Salih" + _suffix)]];
player createDiaryRecord ["Diary", ["Execution", (_prefix + "1. Callsign 'Templar' will insert on foot, by car, by boat or by helicopter close to the <marker name=""mResearch"">AO around the Research Facility</marker>.<br/>2. Templar will find a way to abduct Dr. Joaquín Díaz.<br/>3. Templar will extract with Dr. Joaquín Díaz and return to base.<br/><br/>The mission will be considered a failure if Dr. Joaquín Díaz dies!" + _suffix)]];
player createDiaryRecord ["Diary", ["Mission", (_prefix + "The task is to abduct Dr. Joaquín Díaz. The British Knights' tactical officer identified three recommended ways to do so. First one would be to wait close to the <marker name=""mResearch"">Research Facility</marker> until Dr. Díaz's shift is over at around 1900 and then ambush his armed escort. Second way would be to break into his <marker name=""mHouse"">House in Anthrakia</marker> during daytime, take his sons as hostages and call him to leave his work early. Third option would be a night attack on his <marker name=""mHouse"">House in Anthrakia</marker> while he is at home. A direct attack on the <marker name=""mResearch"">Research Facility</marker> is not recommended. Furthermore, the AAF checkpoints, roadblocks and bases should be avoided." + _suffix)]];
player createDiaryRecord ["Diary", ["Situation", (_prefix + "The final steps of Operation Crusader require the assistance of a Deep Space Engineering employee in order to ensure safe transportation and handling once the British Knights are in possession of the device. Therefore, project engineer and chief logistics specialist Dr. Joaquín Díaz has been identified as primary target. As it is unlikely that Dr. Díaz's cooperation can be bought, the Knights decided to enforce his assistance by abducting him.<br/><br/>Dr. Díaz works at the <marker name=""mResearch"">Research Facility</marker> in central Altis. The whole facility is heavily guarded by Black Arrow PMCs while the surroundings are protected by AAF patrols, checkpoints and bases. Since the operation takes place within the AAF's Greenzone quick reaction forces as well as armoured support should be expected. Dr. Díaz is usually going home around 1900, accompanied by an armed escort that takes him to his <marker name=""mHouse"">House in Anthrakia</marker>. The <marker name=""mHouse"">House in Anthrakia</marker> is guarded by Black Arrow PMCs as well (staff seems to double at night). During daytime, his two sons are usually at home while Dr. Díaz is at work." + _suffix)]];

[player, "tKidnap", ["Find a way to kidnap Dr. Joaquín Díaz!", "Kidnap Dr. Díaz", ""], nil, true, 1] call BIS_fnc_taskCreate;

// Random Patrols
_blacklisted = ["I_soldier_AA_F", "I_soldier_AAA_F"];
["mPat1", independent, [4, 6], [2, 3], ["STD"], ["SAD", "CYCLE"], "", _blacklisted] call IP_fnc_randomPatrolArea;
["mPat2", independent, [2, 3], [2, 2], ["STD"], ["SAD", "CYCLE"], "", _blacklisted] call IP_fnc_randomPatrolArea;
["mPat3", independent, [3, 5], [2, 3], ["STD"], ["SAD", "CYCLE"], "", _blacklisted] call IP_fnc_randomPatrolArea;
["mPat3", independent, [2, 3], [2, 2], ["STD"], ["SAD", "CYCLE"], "", _blacklisted] call IP_fnc_randomPatrolArea;

// All Units
{
	if (((side _x) == civilian) && {_x getVariable ["IP_Scientist", false]}) then {
		_x setVariable ["IP_Faction", "DSE"];
		_x setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\scientist_02_coDSE.paa"];
	};
	
	if ((side _x) == east) then {
		if ((_x getVariable ["IP_Night", false]) && {(dayTime > 7) && (dayTime < 19)}) then {
			deleteVehicle _x;
		} else {
			_x setVariable ["IP_Faction", "BlackArrow"];
			[_x] call IP_fnc_createMerc;
		};
	};
	
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		if (!(_x getVariable ["IP_QRF", false])) then {
			_x unlinkItem "NVGoggles_INDEP";
			if ((dayTime < 7) OR (dayTime > 19)) then {
				_x addPrimaryWeaponItem "acc_flashlight";
				_x enableGunLights "forceOn";
			};
		};
	};
} forEach (allUnits - [IP_Main]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;