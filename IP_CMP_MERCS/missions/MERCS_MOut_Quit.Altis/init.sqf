IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Functions
IP_fnc_m_createPoliceman = {
	private "_weapons";
	_unit = [_this, 0, objNull, [objNull]]call BIS_fnc_param;	
	_unit setVariable ["IP_Faction", "Altis"];
	
	removeAllWeapons _unit;
	removeHeadgear _unit;
	removeVest _unit;
	removeBackpack _unit;
	_unit unassignItem "NVGoggles_OPFOR";
	_unit removeItem "NVGoggles_OPFOR";
	removeUniform _unit;
	
	_uniforms = ["U_C_Poor_1", "U_IG_Guerilla2_1", "U_IG_Guerilla2_2", "U_IG_Guerilla2_3"];
	_uniform = _uniforms call BIS_fnc_selectRandom;
	_unit forceAddUniform _uniform;
	
	_unit addVest "V_TacVest_blk_POLICE";
	_unit addHeadgear "H_Beret_blk_POLICE";
	
	_weapons = ["SMG_01_F", "SMG_01_Holo_F", "SMG_01_ACO_F", "SMG_02_F", "SMG_02_ACO_F", "SMG_02_ARCO_pointg_F", "hgun_PDW2000_F", "hgun_PDW2000_Holo_F", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point"];
	{
		if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_weapons = _weapons - [_x]};
	} forEach _weapons;
	_weapon = _weapons call BIS_fnc_selectRandom;_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
	_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
	_unit addMagazines [_magazine, 5];
	_unit addWeapon _weapon;
	
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enableGunLights "forceOn";
	
	[_unit, 2] call IP_fnc_setSkill;
};

// Main Setup
[] call IP_fnc_mainInit;
removeAllWeapons IP_Main;
removeVest IP_Main;
removeUniform IP_Main;
removeHeadgear IP_Main;
removeGoggles IP_Main;
removeBackpack IP_Main;
IP_Main forceAddUniform "U_C_WorkerCoveralls";
IP_Main addHeadgear "H_Cap_grn_BI";
[] spawn {
	waitUntil {time > 0};
	IP_Main setObjectTexture [0, "Campaigns\IP_CMP_MERCS\txt\coveralls_dirty_coMODMain.paa"];
};

// Buddy Setup
[] call IP_fnc_buddyInit;

// Manager
IP_Manager setVariable ["IP_LiveFeed", true];
[IP_Manager, 0.7] call BIS_fnc_setHeight;
[IP_Manager, "BRIEFING", "NONE"] call BIS_fnc_ambientAnim;

// Car
[] spawn {
	waitUntil {(!isNil "IP_BuddyConvDone") && {IP_BuddyConvDone}};
	
	_primWeapon = ["arifle_Katiba_ARCO_pointer_F","arifle_MX_Hamr_pointer_F","arifle_TRG21_ARCO_pointer_F","arifle_Mk20_MRCO_pointer_F","arifle_Katiba_GL_ARCO_pointer_F","arifle_MX_GL_Hamr_pointer_F","arifle_TRG21_GL_MRCO_F","arifle_Mk20_GL_MRCO_pointer_F","srifle_EBR_MRCO_pointer_F","srifle_EBR_SOS_F","srifle_EBR_ARCO_pointer_F","arifle_MXM_Hamr_pointer_F","arifle_MXM_SOS_pointer_F","srifle_DMR_01_MRCO_pointer_F","srifle_DMR_01_SOS_F","srifle_DMR_01_DMS_F","srifle_DMR_01_ARCO_pointer_F","srifle_EBR_DMS_F","srifle_EBR_Hamr_pointer_F","arifle_MXM_DMS_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","arifle_MX_SW_pointer_F","arifle_MX_SW_Hamr_pointer_F","LMG_Zafir_pointer_F"] call BIS_fnc_selectRandom;
	_handgunWeapon = ["hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F"] call BIS_fnc_selectRandom;
	_vest = ((missionConfigFile >> "ShopItems" >> "Vests") call IP_fnc_getConfigEntries) call BIS_fnc_selectRandom;
		
	IP_Car addWeaponCargo [_primWeapon, 1];
	IP_Car addWeaponCargo [_handgunWeapon, 1];
	IP_Car addMagazineCargo [((getArray(configFile >> "CfgWeapons" >> _primWeapon >> "magazines")) select 0), 10];
	if ("EGLM" in (getArray(configFile >> "CfgWeapons" >> _primWeapon >> "muzzles"))) then {IP_Car addMagazineCargo ["1Rnd_HE_Grenade_shell", 4]};
	IP_Car addMagazineCargo [((getArray(configFile >> "CfgWeapons" >> _handgunWeapon >> "magazines")) select 0), 3];
	IP_Car addMagazineCargo ["HandGrenade", 4];
	IP_Car addItemCargo [_vest, 1];
	IP_Car addItemCargo ["G_Aviator", 1];
	
	IP_Car addAction ["Change Uniform", {
		IP_Car removeAction (_this select 2);
		[] spawn {
			["IP_BlackScreen", false] call BIS_fnc_blackOut;
			sleep 0.5;
			_items = uniformItems IP_Main;
			removeUniform IP_Main;
			_uniform = ["U_IG_Guerilla1_1", "U_IG_Guerilla2_1", "U_IG_Guerilla2_2", "U_IG_Guerilla2_3", "U_B_CombatUniform_mcam_tshirt"] call BIS_fnc_selectRandom;	
			IP_Main forceAddUniform _uniform;
			{IP_Main addItem _x} forEach _items;
			skipTime 0.1;
			sleep 0.5;
			["IP_BlackScreen"] call BIS_fnc_blackIn;
		};
	}];
};

// Trafficker Setup
IP_Trafficker setIdentity "trafficker";
IP_Trafficker setVariable ["IP_LiveFeed", true];
IP_Trafficker setVariable ["IP_Avatar", "Campaigns\IP_CMP_MERCS\img\traffickerAvatar.jpg"];
[IP_Trafficker, 5] call IP_fnc_setSkill;
[IP_Trafficker] call IP_fnc_track;
IP_Trafficker addVest "V_TacVest_blk";
IP_Trafficker addItem "FirstAidKit";
IP_Trafficker addMagazines ["30Rnd_65x39_caseless_mag", 6];
IP_Trafficker addMagazines ["handGrenade", 2];
IP_Trafficker addMagazines ["1Rnd_HE_Grenade_shell", 6];
IP_Trafficker addWeapon "arifle_MX_GL_Hamr_pointer_F";
IP_Trafficker selectWeapon (primaryWeapon IP_Trafficker);
IP_Trafficker stop true;
//[IP_Trafficker, "STAND", "ASIS"] call BIS_fnc_ambientAnimCombat;
IP_Trafficker addEventHandler ["HandleDamage", {
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
IP_Trafficker addEventHandler ["Killed", {
		[] spawn {
			[IP_Main, "Now. Now we're done.", "DIRECT", 1] call IP_fnc_simpleSentence;
			[IP_Buddy, "Served him right.", "DIRECT", 1] call IP_fnc_simpleSentence;
		};
	}
];

// Heli
IP_Heli allowDamage false;
[IP_Heli] call IP_fnc_heliDoors;
{
	_x allowDamage false;
	_x enableSimulation false;
} forEach [IP_Pilot, IP_CoPilot];
IP_Pilot moveInDriver IP_Heli;
IP_CoPilot moveInTurret [IP_Heli, [0]];

// All Units
{
	switch (side _x) do {
		case west: {
			[_x] call IP_fnc_m_createPoliceman;
		};
		
		case east: {
			_x setVariable ["IP_Faction", "Rogues"];
			[_x] call IP_fnc_createMerc;
			_x allowFleeing 0;
		};
		
		default {};
	};
} forEach (allUnits - [IP_Buddy, IP_Main, IP_Trafficker]);

// Marker
"mTrafficker" setMarkerAlpha 0;

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
call IP_fnc_tpw_core;
[5,150,15,5,4,50,0,10,15,1] spawn IP_fnc_tpw_civs;
[5,1000,15,2,1] spawn IP_fnc_tpw_cars;
[25,300,150,20,10] spawn IP_fnc_tpw_park;
[10,15,200,75,60] spawn IP_fnc_tpw_animals;