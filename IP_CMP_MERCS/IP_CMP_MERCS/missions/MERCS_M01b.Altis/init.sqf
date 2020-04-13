IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Functions
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
		private "_weapons";
		_weapons = ["SMG_01_F", "SMG_01_Holo_F", "SMG_01_ACO_F", "SMG_02_F", "SMG_02_ACO_F", "SMG_02_ARCO_pointg_F", "hgun_PDW2000_F", "hgun_PDW2000_Holo_F", "arifle_TRG20_F", "arifle_Mk20C_F", "RH_pdw"];
		{
			if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_weapons = _weapons - [_x]};
		} forEach _weapons;
		_weapon = _weapons call BIS_fnc_selectRandom;
	} else {
		_weapon = ["hgun_P07_F", "hgun_Rook40_F", "hgun_ACPC2_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_Yorris_F"] call BIS_fnc_selectRandom;
	};		
		
	_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
	_unit addMagazines [_magazine, 3];
	_unit addWeapon _weapon;
	
	[_unit, 1] call IP_fnc_setSkill;
	[_unit] call IP_fnc_takeMoney;
};

// Main Setup
[] call IP_fnc_mainInit;
group IP_Main setGroupID ["Razor"];
//group IP_Main selectLeader IP_Main;

// Buddy Setup
[] call IP_fnc_buddyInit;

// Shop Setup
[] call IP_fnc_shopInit;

// Team Setup - Moved to mission start
//[] call IP_fnc_spawnTeam;

// Delivery Scene Setup
{_x setCaptive true; _x allowFleeing 0;} forEach ([/*IP_Buddy,*/ IP_Car, IP_Merc1, IP_Merc2, IP_Pirate1, IP_Pirate2]/* + units group IP_Main*/);

// Merc Setup
{[_x] call IP_fnc_createMerc; _x stop true;} forEach [IP_Merc1, IP_Merc2];
IP_Merc1 setVariable ["IP_LiveFeed", true];
group IP_Merc1 setGroupID ["Sabre"];
[IP_Merc1, "STAND", "ASIS"] call BIS_fnc_ambientAnim;
IP_Pilot setGroupID ["Starforce"];
IP_Pilot setVariable ["IP_Avatar", ("IP_CMP_MERCS\IP_CMP_MERCS\img\pilotAvatar.jpg")];

// Pirate Setup
{_x allowDamage false} forEach [IP_Car, IP_Pirate1, IP_Pirate2];
[IP_Pirate1] call IP_fnc_m_createPirate;
IP_Pirate1 assignAsDriver IP_Car;
IP_Pirate1 moveInDriver IP_Car;
[IP_Pirate2] call IP_fnc_track;
[IP_Pirate2, true] call IP_fnc_m_createPirate;
IP_Pirate2 assignAsCargo IP_Car;
IP_Pirate2 moveInCargo IP_Car;
IP_Pirate2 setUnitPos "UP";
IP_Pirate2 removeAllEventHandlers "Killed";
IP_Pirate2 addEventHandler ["Killed", {
	_object = if (vehicle IP_Pirate2 != IP_Pirate2) then {IP_Car} else {IP_Pirate2};	
	_object addAction ["Take Ransom", {
		_object = _this select 0;
		_id = _this select 2;
		
		_object removeAction _id;
		IP_RansomCollected = true;
	}];
}];

// Briefing
["The CLIENT received a ransom demand for his kidnapped daughter and agreed to pay the full amount. The CONTRACTOR is obligated to observe the ransom delivery which is taken out by another contractor and ensure the save retrieval of the hostage."] call IP_fnc_createBriefing;
[player, "tObserve", ["Observe the delivery of the ransom at the <marker name=""mDelivery"">Delivery Point in the stadium</marker>! Make sure everything is going as planned!", "Observe Delivery", "Delivery Point"], "mDelivery", true, 1, true, "scout"] call BIS_fnc_taskCreate;

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[true, false, true, false] call IP_fnc_ambientLife;