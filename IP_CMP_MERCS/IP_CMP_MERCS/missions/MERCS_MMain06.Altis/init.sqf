IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
// IP_MERCS_Insertion = "heli";
IP_Insertion = if (isNil "IP_MERCS_Insertion") then {"foot"} else {IP_MERCS_Insertion}; // B_G_Offroad_01_armed_F
IP_ChoseBlackArrow = if (isNil "IP_MERCS_ChoseBlackArrow") then {false} else {IP_MERCS_ChoseBlackArrow}; 
IP_OffersHeard = if (isNil "IP_MERCS_OffersHeard") then {[true, true, true, true]} else {IP_MERCS_OffersHeard}; // AAF - CSAT - DSE - EF
IP_ContactsAlive = if (isNil "IP_MERCS_ContactsAlive") then {[true, true, [true, true], true]} else {IP_MERCS_ContactsAlive}; // AAF - CSAT - DSE (Agent, Rival) - EF
IP_Holograms = [];
IP_HiddenCSAT = [];
IP_HiddenEF = [];
IP_HiddenConvoy = [];

// Functions
IP_m_fnc_heliInsertionAI = compile(preProcessFileLineNumbers "fnc\heliInsertionAI.sqf");

// Main Setup
if (IP_ChoseBlackArrow) then {
	_pos = getMarkerPos "mFootDSE";
	_dir = markerDir "mFootDSE";
	"mFootStart" setMarkerPos _pos;
	"mFootStart" setMarkerDir _dir;
	selectPlayer IP_MainDSE;
	deleteVehicle IP_Main;
	IP_Main = IP_MainDSE;
	(group IP_Main) setGroupID ["Razor"];
	[] spawn {
		waitUntil {time > 0};
		{[_x] call IP_fnc_createMerc} forEach ((units(group IP_Main)) - [IP_Main]);
	};
} else {
	{deleteVehicle _x} forEach (units(group IP_MainDSE));
	(group IP_Main) setGroupID ["Templar"];
};
[] call IP_fnc_mainInit;

// Shop Setup
[] call IP_fnc_shopInit;

// HQ
[IP_Lord, "lord", "command"] call IP_fnc_applyTemplate;

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;

// British Knights Setup
[IP_Captain, "captain", "combat"] call IP_fnc_applyTemplate;
[IP_Medic, "medic", "combat"] call IP_fnc_applyTemplate;
if ((dayTime < 7) OR (dayTime > 19)) then {{_x linkItem "NVGoggles"} forEach [IP_Commander, IP_Captain, IP_Medic]};
if (IP_ChoseBlackArrow) then {{_x allowDamage true} forEach [IP_Commander, IP_Captain, IP_Medic]};

// CSATOfficer
if ((IP_ContactsAlive select 1) && !IP_ChoseBlackArrow) then {
	[IP_CSATOfficer, "CSATOfficer", "combat"] call IP_fnc_applyTemplate;
	IP_CSATOfficer allowDamage false;
	IP_CSATOfficer enableSimulation false;
	IP_CSATOfficer hideObject true;
	[IP_CSATOfficer, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;
} else {deleteVehicle IP_CSATOfficer};

// Rival Setup
if ((IP_ContactsAlive select 2) select 1) then {
	[IP_Rival, "rival"] call IP_fnc_applyTemplate;
	if (!IP_ChoseBlackArrow) then {IP_Rival allowDamage true};
	if ((dayTime < 7) OR (dayTime > 19)) then {IP_Rival linkItem "NVGoggles"};
} else {{deleteVehicle _x} forEach (units(group IP_Rival))};

// Agent Setup
if ((IP_ContactsAlive select 2) select 0) then {
	[IP_Agent, "agent", "combat"] call IP_fnc_applyTemplate;
	if (!IP_ChoseBlackArrow) then {IP_Agent allowDamage true};
	if ((dayTime < 7) OR (dayTime > 19)) then {
		IP_Agent linkItem "NVGoggles";
		removeGoggles IP_Agent;
	};
} else {{deleteVehicle _x} forEach (units(group IP_Agent))};

// EFOfficer
if ((IP_ContactsAlive select 3) && !IP_ChoseBlackArrow) then {
	[IP_EFOfficer, "EFOfficer"] call IP_fnc_applyTemplate;
	IP_EFOfficer allowDamage false;
	IP_EFOfficer enableSimulation false;
	IP_EFOfficer hideObject true;
	[IP_EFOfficer, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;
} else {deleteVehicle IP_EFOfficer};

// Scientist
if (IP_ChoseBlackArrow) then {
	{deleteVehicle _x} forEach ([IP_Scientist] + (units(group IP_ScientistBodyguard)) + [IP_ScientistCar]);
} else {
	[IP_Scientist, "scientist"] call IP_fnc_applyTemplate;
	IP_Scientist allowDamage false;
	IP_Scientist assignAsCargo IP_ScientistCar;
	IP_Scientist moveInCargo IP_ScientistCar;
	IP_Scientist setUnitPos "UP";
};

// Support Replacement
if (!IP_ChoseBlackArrow) then {{deleteVehicle _x} forEach (units(group IP_SupportReplacementLeader))};

// Generator
[IP_Generator, 5, {IP_GeneratorDestroyed = true}] call IP_fnc_explosionDetector;

// Black Mesa
call(compile(preProcessFileLineNumbers "compositions\researchBase.sqf"));

// Device
[IP_DeviceDummy, "deviceOpener", IP_Device] call IP_fnc_addConversation;

// Marker
{_x setMarkerAlpha 0} forEach ["mCSAT", "mEF", "mCamp"];

// Briefing
if (IP_ChoseBlackArrow) then {
	[player, "tDefend", ["Defend <marker name=""mResearch"">Black Mesa</marker> at all costs!", "Defend Black Mesa", "Black Mesa"], "mResearch", true, 1, true, "defend"] call BIS_fnc_taskCreate;
	
	private "_rewards";
	_rewards = "Deep Space Engineering / Black Arrow<br/>1.000.000€";
	
	if ((IP_OffersHeard select 0) && (IP_ContactsAlive select 0)) then {
		[player, "tAAF", ["Betray the other factions and destroy the device for the AAF!", "Destroy the Device (AAF)", ""], nil, false, 1, true, "a"] call BIS_fnc_taskCreate;
		_rewards = _rewards + "<br/><br/>AAF<br/>750.000€ + A high government position on Altis.";
	};
	
	player createDiaryRecord ["Diary", ["Faction Rewards", _rewards]];
	player createDiaryRecord ["Diary", ["Hologram Information", "While the concept of the hologram is well known since 'Star Trek: The Next Generation' development in this area was mostly theoretical until the 2030s. In 2032 the Czech-German technology giant 'Böhmen Integrated Systems' (BIS) has come up with actually working hologram generators, suited for military use. While they sound and look like real soldiers from the distance, they're only firing simulated rounds that can't hurt anybody. When fired upon or hit by an object they tend to flicker. Holograms are mostly used in combat to distract the enemy or draw hostile fire away from real soldiers. This technology is also used by military forces to make strategic important areas or buildings look occupied while there are only little or no human guards on site. If the hologram generator experiences a power outage projected holograms tend to disappear within seconds.<br/><br/>A hologram guard (foreground) compared to a human one (background).<br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_MMain06_Holograms.jpg' width='282' height='186'/>"]];
	player createDiaryRecord ["Diary", ["Device Information", "What's often just referred to as 'The Device' is actually a very powerful mobile fusion generator based on the Portable-Fusion-Power-Architecture (PFP) invented by Nobel prize winner Dr. Adam Zweistein. Deep Space Engineering is the first organisation to actually develop a functioning prototype of the PFP. Originally intended for use in deep space travel it has become clear that the PFP might be a solution to the problem of dwindling resources on earth itself. Thus, many nations as well as organisations are interested in obtaining said prototype for their own interests.<br/><br/>The PFP prototype loaded on a special truck.<br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_MMain06_Device.jpg' width='330' height='227'/>"]];
	player createDiaryRecord ["Diary", ["Briefing", "Our main goal is to hold the <marker name=""mResearch"">Research Facility 'Black Mesa'</marker> as long as we can against an imminent ION / British Knights attack. The device prototype must not fall into their hands. If we can hold out long enough Black Arrow assets might be able to extract us. Fortunately, defector Raif Salih provided us with what he could get from the enemy's battle plan. According to this data they will attack from the <marker name=""mAttackStart"">east</marker> and <marker name=""mAttackStart2"">south</marker> as well as from the <marker name=""mSupport"">north-eastern ridgeline</marker>. Furthermore, an infiltration team will try to deploy by helicopter right into the <marker name=""mInfiltration"">facility</marker> and destroy our <marker name=""mGenerator"">Hologram Generator</marker>. Apart from that the AAF has become a threat to our operations as well and might interfere. If we organise our defence properly and keep the holo soldiers running we might have a slight chance to defend the device that's rightfully ours.<br/><br/>Agent Alexander Engel<br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\DSE_LogoSmall.paa' width='128' height='64'/>"]];
} else {
	_prefix = "OPERATION CRUSADER Phase VI<br/><br/>";
	_suffix = "<br/><br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\BK_LogoSmall.paa' width='128'/>";
	_rank = if (isClass(campaignConfigFile >> "campaign")) then {(getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> (([] call IP_fnc_getMainRankData) select 0) >> "displayName"))} else {"Section Leader"};
		
	_roles = switch (IP_Insertion) do {
		case "foot": {
			[player, "tSupport", ["Support the attack on <marker name=""mResearch"">Black Mesa</marker> from the <marker name=""mSupport"">Ridgeline</marker>!", "Support", "Ridgeline"], "mSupport", true, 1, true, "target"] call BIS_fnc_taskCreate;
			["Attack", "Infiltration", "Support"]
		};
		
		case "heli": {
			[player, "tInfiltrate", ["<marker name=""mInfiltration"">Infiltrate</marker> <marker name=""mResearch"">Black Mesa</marker> and use explosives to destroy the <marker name=""mGenerator"">Hologram Generator</marker>!", "Infiltrate", "Generator"], "mGenerator", true, 1, true, "destroy"] call BIS_fnc_taskCreate;
			["Support", "Attack", "Infiltration"]
		};
		
		default {
			[player, "tAttack", ["Attack <marker name=""mResearch"">Black Mesa</marker> and defeat the garrison!", "Attack", "Black Mesa"], "mResearch", true, 1, true, "attack"] call BIS_fnc_taskCreate;
			["Infiltration", "Support", "Attack"]
		};
	};
	
	"mCamp" setMarkerAlpha 1;
	[player, "tDevice", ["Capture <marker name=""mResearch"">Black Mesa</marker> and retrieve the device!", "Capture Black Mesa", "Black Mesa"], "mResearch", false, 1, true, "attack"] call BIS_fnc_taskCreate;
	[player, "tBK", ["Return with the device back to the <marker name=""mCamp"">British Knight's Camp</marker>!", "Extract Device (ION/BK)", "Camp"], "mCamp", false, 1, true, "b"] call BIS_fnc_taskCreate;
	
	private "_rewards";
	_rewards = "ION / British Knights<br/>1.500.000€";
	
	if ((IP_OffersHeard select 0) && (IP_ContactsAlive select 0)) then {
		[player, "tAAF", ["Betray the other factions and destroy the device for the AAF!", "Destroy the Device (AAF)", ""], nil, false, 1, true, "a"] call BIS_fnc_taskCreate;
		_rewards = _rewards + "<br/><br/>AAF<br/>750.000€ + A high government position on Altis.";
	};
	
	if ((IP_OffersHeard select 1) && (IP_ContactsAlive select 1)) then {
		"mCSAT" setMarkerAlpha 1;
		[player, "tCSAT", ["Betray the other factions, steal the device and <marker name=""mCSAT"">meet with CSAT</marker>!", "Steal the Device (CSAT)", "CSAT"], "mCSAT", false, 1, true, "c"] call BIS_fnc_taskCreate;
		_rewards = _rewards + "<br/><br/>CSAT<br/>800.000€ + Safe passage to a country of choice, except the European Federation.";
	};
	
	if ((IP_OffersHeard select 3) && (IP_ContactsAlive select 3)) then {
		"mEF" setMarkerAlpha 1;
		[player, "tEF", ["Betray the other factions, steal the device and <marker name=""mEF"">meet with EUROFORCE</marker>!", "Steal the Device (EUROFORCE)", "EUROFORCE"], "mEF", false, 1, true, "e"] call BIS_fnc_taskCreate;
		_rewards = _rewards + "<br/><br/>EUROFORCE<br/>500.000€ + Permanent residence within the European Federation.";
	};
	
	player createDiaryRecord ["Diary", ["Faction Rewards", _rewards]];
	player createDiaryRecord ["Diary", ["Hologram Information", "While the concept of the hologram is well known since 'Star Trek: The Next Generation' development in this area was mostly theoretical until the 2030s. In 2032 the Czech-German technology giant 'Böhmen Integrated Systems' (BIS) has come up with actually working hologram generators, suited for military use. While they sound and look like real soldiers from the distance, they're only firing simulated rounds that can't hurt anybody. When fired upon or hit by an object they tend to flicker. Holograms are mostly used in combat to distract the enemy or draw hostile fire away from real soldiers. This technology is also used by military forces to make strategic important areas or buildings look occupied while there are only little or no human guards on site. If the hologram generator experiences a power outage projected holograms tend to disappear within seconds.<br/><br/>A hologram guard (foreground) compared to a human one (background).<br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_MMain06_Holograms.jpg' width='282' height='186'/>"]];
	player createDiaryRecord ["Diary", ["Device Information", "What's often just referred to as 'The Device' is actually a very powerful mobile fusion generator based on the Portable-Fusion-Power-Architecture (PFP) invented by Nobel prize winner Dr. Adam Zweistein. Deep Space Engineering is the first organisation to actually develop a functioning prototype of the PFP. Originally intended for use in deep space travel it has become clear that the PFP might be a solution to the problem of dwindling resources on earth itself. Thus, many nations as well as organisations are interested in obtaining said prototype for their own interests.<br/><br/>The PFP prototype loaded on a special truck.<br/><img image='IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_MMain06_Device.jpg' width='330' height='227'/>"]];
	player createDiaryRecord ["Diary", ["Signal", (_prefix + "White King - Command, Lord Commander Titus<br/>Black Knight - " + (_roles select 0) + ", Executive Ian McMillian<br/>Paladin - " + (_roles select 1) + ", Knight Captain Gabriel<br/>Templar - " + (_roles select 2) + ", " + _rank + " Raif Salih<br/>Battlemage - Backup, Detail Leader David Armstrong<br/>Pegasus - Transport / CAS, Senior Contractor Matthew Cooper" + _suffix)]];
	player createDiaryRecord ["Diary", ["Execution", (_prefix + "Four combat elements will be deployed, each with its own critical task to fulfil.<br/><br/>1. The Backup element will be the first on site, closing all roads and paths leading to the AO and providing reconnaissance throughout the operation.<br/>2. The Insertion element will be dropped by helicopter right into the <marker name=""mInfiltration"">facility</marker>. Their task is to destroy the <marker name=""mGenerator"">Hologram Generator</marker> as quickly as possible.<br/>3. The Attack element will move in on <marker name=""mResearch"">'Black Mesa'</marker> from the <marker name=""mAttackStart"">east</marker> and <marker name=""mAttackStart2"">south</marker>, clear <marker name=""mResearch"">'Black Mesa'</marker> together with the Insertion element and locate the device.<br/>4. The Support element will seize and hold a position <marker name=""mSupport"">north-east</marker> of <marker name=""mResearch"">'Black Mesa'</marker> and provide covering fire for the other Elements throughout the whole operation.<br/>4. Once <marker name=""mResearch"">'Black Mesa'</marker> hase been secured and the device has been located, Dr. Díaz will move in and prepare the device for transport.<br/>6. The Insertion element will transport the device <marker name=""mCamp"">back to the camp</marker>, followed by the other elements." + _suffix)]];
	player createDiaryRecord ["Diary", ["Mission", (_prefix + "The task is to clear the <marker name=""mResearch"">Research Facility 'Black Mesa'</marker>, secure the device and then extract it back to base. The device is the first and only priority and it must not be damaged or destroyed. Consequences in that case would be unforeseeable." + _suffix)]];
	player createDiaryRecord ["Diary", ["Situation", (_prefix + "We're at the beginning of the final phase of Operation Crusader, engaging the <marker name=""mResearch"">Research Facility 'Black Mesa'</marker> and retrieving the device prototype. Black Arrow PMCs have fortified <marker name=""mResearch"">'Black Mesa'</marker> with barricades and static weaponry. However, they seem to be highly understaffed and have no outside support. Hence they've set up hologram generators to make <marker name=""mResearch"">'Black Mesa'</marker> look better defended than it actually is.<br/>Additionally, there is always a chance that the AAF or other forces might interfere with our operation." + _suffix)]];
};

// All Units
{
	_ambientAnimCombat = _x getVariable ["IP_AmbientAnimCombat", []];
	if (count _ambientAnimCombat > 0) then {
		if (count _ambientAnimCombat > 1) then {
			[_x, (_ambientAnimCombat select 0), (_ambientAnimCombat select 1)] call BIS_fnc_ambientAnimCombat;
		} else {
			[_x, (_ambientAnimCombat select 0)] call BIS_fnc_ambientAnimCombat;
		};
	};
	if ((_x getVariable ["IP_Faction", ""]) in ["BlackArrow", "ION"]) then {[_x] call IP_fnc_createMerc};
	if ((_x getVariable ["IP_Faction", ""]) == "BritishKnights") then {[_x, 5, false, [((dayTime < 7) OR (dayTime > 19)), true]] call IP_fnc_createBK};
	if ((_x getVariable ["IP_Faction", ""]) == "CSAT") then {
		if (IP_ChoseBlackArrow OR (!(IP_OffersHeard select 1))) then {deleteVehicle _x} else {
			_x enableSimulation false;
			_x hideObject true;
			IP_HiddenCSAT = IP_HiddenCSAT + [_x];
		};
	};
	if ((_x getVariable ["IP_Faction", ""]) == "EFMil") then {
		if (IP_ChoseBlackArrow OR (!(IP_OffersHeard select 3))) then {deleteVehicle _x} else {
			_x setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_coMOD.paa"];
			[_x, "TFAegis"] call BIS_fnc_setUnitInsignia;
			_x enableSimulation false;
			_x hideObject true;
			IP_HiddenEF = IP_HiddenEF + [_x];
		};
	};
	if ((side _x) == independent) then {_x setVariable ["IP_Faction", "AltisMil"]};	
	if (_x getVariable ["IP_Hologram", false]) then {
		IP_Holograms = IP_Holograms + [_x];
		_x addEventhandler ["Fired", {deleteVehicle (_this select 6)}];
		_x addEventhandler ["HandleDamage", {
			_this spawn {
				_holo = _this select 0;
				_holo hideObject true;
				sleep 0.1;
				_holo hideObject false;
			};
			
			0
		}];
	};
	if (((side _x) == civilian) && {_x getVariable ["IP_Scientist", false]}) then {
		_x setVariable ["IP_Faction", "DSE"];
		_x setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\scientist_02_coDSE.paa"];
	};
} forEach (allUnits - [IP_Main, IP_MainDSE, IP_Lord, IP_Commander, IP_Captain, IP_Medic, IP_CSATOfficer, IP_Agent, IP_Rival, IP_EFOfficer]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;