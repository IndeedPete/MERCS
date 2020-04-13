IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

IP_fnc_m_createPirate = {
	private ["_weapon", "_uniforms"];	
	_unit = [_this, 0, objNull, [objNull]]call BIS_fnc_param;
	_hasSMG = [_this, 1, false, [true]]call BIS_fnc_param;
	
	_unit setVariable ["IP_Faction", "Pirates"];
	
	removeAllWeapons _unit;
	removeHeadgear _unit;
	removeVest _unit;
	removeBackpack _unit;
	_unit unassignItem "NVGoggles_OPFOR";
	_unit removeItem "NVGoggles_OPFOR";
	removeUniform _unit;
	
	_facePool = (configFile >> "CfgFaces" >> "Man_A3") call IP_fnc_getConfigEntries;
	_facePool = _facePool - ["Custom", "Nikos", "AfricanHead_03", "Miller", "IG_Leader"];
	_face = _facePool call BIS_fnc_selectRandom;
	_unit setFace _face;

	_uniforms = (missionConfigFile >> "ShopUniforms" >> "Paramilitary") call IP_fnc_getConfigEntries;
	_uniforms = _uniforms - ["U_Competitor", "U_Rangemaster", "U_B_CTRG_1", "U_B_CTRG_2", "U_B_CTRG_3", "U_O_CombatUniform_ocamo", "U_I_G_resistanceLeader_F", "U_B_Wetsuit"];
	{
		if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_uniforms = _uniforms - [_x]};
	} forEach _uniforms;
	_uniform = _uniforms call BIS_fnc_selectRandom;
	_unit forceAddUniform _uniform;
	
	if (_hasSMG) then {
		_weapon = ["SMG_01_F", "SMG_01_Holo_F", "SMG_01_ACO_F", "SMG_02_F", "SMG_02_ACO_F", "SMG_02_ARCO_pointg_F", "hgun_PDW2000_F", "hgun_PDW2000_Holo_F"] call BIS_fnc_selectRandom;
	} else {
		_weapon = ["hgun_P07_F", "hgun_Rook40_F", "hgun_ACPC2_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_Yorris_F"] call BIS_fnc_selectRandom;
	};		
		
	_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
	_unit addMagazines [_magazine, 3];
	_unit addWeapon _weapon;
	
	[_unit] call IP_fnc_setSkill;
	[_unit] call IP_fnc_takeMoney;
};

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;

// Shop Setup
[] call IP_fnc_shopInit;

// Team Setup - Moved to Mission Start
//[] call IP_fnc_spawnTeam;

// Pirate Setup
[IP_Pirate1] call IP_fnc_m_createPirate;
IP_Pirate1 setVariable ["IP_LiveFeed", true];
[IP_Pirate2, true] call IP_fnc_m_createPirate;
IP_Pirate2 stop true;

IP_Caller setName "Caller";
[IP_Caller, true] call IP_fnc_m_createPirate;
[IP_Caller, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;

[IP_Survivor] call IP_fnc_m_createPirate;
IP_Survivor stop true;
IP_Survivor setUnitPos "UP";
IP_Survivor addEventHandler ["HandleDamage", {
		_unit = _this select 0;
		_damage = _this select 2;	
		
		//_unit setDamage 0.7;
		_unit allowDamage false;
		_unit setCaptive true;
		_unit removeAllEventhandlers "HandleDamage";
		[_unit, "PRONE_INJURED"] call BIS_fnc_ambientAnim;
		
		0
	}
];

// Markers
{_x setMarkerAlpha 0} forEach ["mHouse", "mFactory"];

// Briefing
["The CLIENT requests any information about his daughter's whereabouts and status. The CLIENT's daughter was on vacation on Altis when the CLIENT lost contact with her. She was last seen alive in Kavala, Altis."] call IP_fnc_createBriefing;
[player, "tHint", ["Find hints regarding the whereabouts and status of the missing girl!", "Find Hints", ""], nil, true, 1, true, "intel"] call BIS_fnc_taskCreate;

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;