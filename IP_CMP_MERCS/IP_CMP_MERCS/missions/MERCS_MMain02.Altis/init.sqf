IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Alert = false;
IP_QRFUnits = [];

// Functions
IP_m_fnc_alert = {
	sleep 60;
	waitUntil {sleep 1; !(alive _this) OR IP_Alert OR (_this call BIS_fnc_enemyDetected)};
	sleep (5 + (random 5));
	if ((alive _this) && {!IP_Alert}) then {
		IP_Alert = true;
		{_x enableSimulation true} forEach IP_QRFUnits;
		if (IP_TESTMODE) then {hint "Alarm triggered!"};
	};
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

// Ship
IP_Ship addAction ["Plant Charge", 
	#include "actionCode.sqf"
];

// Briefing
_prefix = "OPERATION CRUSADER Phase II<br/><br/>";
_suffix = "<br/><br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\BK_LogoSmall.paa' width='128'/>";
_rank = if (isClass(campaignConfigFile >> "campaign")) then {(getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> (([] call IP_fnc_getMainRankData) select 0) >> "displayName"))} else {"Section Leader"};

player createDiaryRecord ["Diary", ["Target Information", "Satellite image of the target trawler.<img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_MMain02_Sat.jpg' width='248' height='124'/>"]];
player createDiaryRecord ["Diary", ["Signal", (_prefix + "White King - Command, Lord Commander Titus<br/>Templar - Attack, " + _rank + " Raif Salih" + _suffix)]];
player createDiaryRecord ["Diary", ["Execution", (_prefix + "1. Callsign 'Templar' will insert by boat or on foot close to <marker name=""mSurfer"">Surfer's Scrapyard</marker>.<br/>2. Templar will neutralise the <marker name=""mCaptain"">Black Arrow Captain</marker> and sink the <marker name=""mShip"">Ship</marker>.<br/>3. Templar will get to a safe distance from the targets and call for extraction." + _suffix)]];
player createDiaryRecord ["Diary", ["Mission", (_prefix + "Objectives are to eliminate the <marker name=""mCaptain"">Black Arrow Captain</marker> and plant a satchel charge on the <marker name=""mShip"">Ship</marker> in order to destroy it." + _suffix)]];
player createDiaryRecord ["Diary", ["Situation", (_prefix + "Deep Space Engineering is planning to transport the device off country. The company intends to use a civil trawler operated by Black Arrow PMCs. The <marker name=""mShip"">Ship</marker> is currently docked near Anthrakia, south of the AAF airbase / central airport. Captain and crew of the ship are holding out in a <marker name=""mCaptain"">house</marker> on the premises of a local company called <marker name=""mSurfer"">'Surfer's Scrapyard'</marker>. The AAF runs a maintenance depot as well as outposts and checkpoints near-by. Expect a QRF to be on stand-by at the airbase." + _suffix)]];

[player, "tCaptain", ["Eliminate the <marker name=""mCaptain"">Black Arrow Captain</marker>! He's staying in the office house in <marker name=""mSurfer"">Surfer's Scrapyard</marker>.", "Eliminate Captain", "Captain"], "mCaptain", true, 1] call BIS_fnc_taskCreate;
[player, "tShip", ["Plant a charge at the side of the <marker name=""mShip"">Ship</marker> and destroy it!", "Destroy Ship", "Ship"], "mShip", false, 1] call BIS_fnc_taskCreate;

// All Units
{
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "BlackArrow"];
		[_x] call IP_fnc_createMerc;
		_x spawn IP_m_fnc_alert;
	};
	
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];		
		if (_x getVariable ["IP_QRF", false]) then {
			_x enableSimulation false;
			IP_QRFUnits = IP_QRFUnits + [_x];
		} else {
			_x unlinkItem "NVGoggles_INDEP";
			_x addPrimaryWeaponItem "acc_flashlight";
			_x enableGunLights "forceOn";
			_x spawn IP_m_fnc_alert;
		};
	};
} forEach (allUnits - [IP_Main, IP_Lord]);

if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;