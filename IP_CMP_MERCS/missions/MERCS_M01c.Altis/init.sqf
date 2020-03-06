IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_FIACalled = false;
IP_FIASupport = false;

// Functions
IP_fnc_m_createPirate = {
	private ["_uniforms", "_weapons"];
	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;	
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

	_uniforms = (missionConfigFile >> "ShopClothes") call IP_fnc_getConfigEntries;
	_uniforms = _uniforms - ["U_Competitor", "U_Rangemaster", "U_B_CTRG_1", "U_B_CTRG_2", "U_B_CTRG_3", "U_O_CombatUniform_ocamo", "U_I_G_resistanceLeader_F", "U_B_Wetsuit"];
	{
		if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_uniforms = _uniforms - [_x]};
	} forEach _uniforms;
	_uniform = _uniforms call BIS_fnc_selectRandom;
	_unit forceAddUniform _uniform;
	
	_vests = (missionConfigFile >> "ShopItems" >> "LightVests") call IP_fnc_getConfigEntries;
	_vest = _vests call BIS_fnc_selectRandom;
	_unit addVest _vest;
	
	_weapons = ["SMG_01_F", "SMG_01_Holo_F", "SMG_01_ACO_F", "SMG_02_F", "SMG_02_ACO_F", "SMG_02_ARCO_pointg_F", "hgun_PDW2000_F", "hgun_PDW2000_Holo_F", "arifle_TRG20_F", "arifle_Mk20C_F", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "hlc_rifle_aks74u", "hlc_rifle_falosw", "hlc_rifle_hk51", "hlc_rifle_hk53", "RH_m16a1", "hlc_rifle_ak47"];
	{
		if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_weapons = _weapons - [_x]};
	} forEach _weapons;
	_weapon = _weapons call BIS_fnc_selectRandom;
	_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
	_unit addMagazines [_magazine, 5];
	_unit addMagazines ["HandGrenade", 2];
	_unit addWeapon _weapon;
	
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enableGunLights "forceOn";
	
	[_unit, 2] call IP_fnc_setSkill;
	[_unit] call IP_fnc_takeMoney;
};

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Razor"];

// Buddy Setup
[] call IP_fnc_buddyInit;

// Contact Setup
(group IP_Contact) setGroupID ["Pink Floyd"];
IP_Contact setVariable ["IP_LiveFeed", true];
IP_Contact setVariable ["IP_Faction", "FIA"];
IP_Contact setVariable ["IP_ConvSpecial", "FIA Informant"];
[IP_Contact, "STAND_U3"] call BIS_fnc_ambientAnim;
[IP_Contact, "contactOpener"] call IP_fnc_addConversation;
IP_Contact addEventhandler ["Killed", {
	private "_sum";
	_sum = 0;
	if (locked IP_Car == 0) then {_sum = _sum + (getNumber(missionConfigFile >> 'carPrice'))};
	if (IP_FIASupport) then {_sum = _sum + (getNumber(missionConfigFile >> 'FIAPrice'))};
	if (_sum > 0) then {
		_act = compile (format ["IP_Contact removeAction (_this select 2); %1 call IP_fnc_addMoney;", _sum]);
		IP_Contact addAction ["Take Money", _act];
	};
	
	IP_FIASupport = false;
	[IP_Contact, "contactOpener"] call IP_fnc_removeConversation;
	if (locked IP_Car == 2) then {
		IP_Contact addAction ["Take Keys", {
			IP_Contact removeAction (_this select 2);
			IP_Car lock 0;
		}];
	};
	
	[IP_Buddy, "Was that really necessary? I'll never introduce you to one of my contacts again.", "DIRECT"] spawn IP_fnc_simpleSentence;
}];

// Hostage Setup
IP_Hostage setIdentity "hostage";
IP_Hostage setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\hostageAvatar.jpg"];
removeHeadgear IP_Hostage;
[IP_Hostage, "SIT_LOW", "ASIS", {(player distance IP_Hostage) < 3}] call BIS_fnc_ambientAnimCombat;
IP_Hostage stop true;
IP_Hostage setDamage 0.7;
IP_Hostage setVariable ["IP_LiveFeed", true];
[IP_Hostage, "hostageOpener"] call IP_fnc_addConversation;
IP_Hostage addEventhandler ["Killed", {
	if (!isPlayer(_this select 1)) exitWith {};
	
	[IP_Hostage, "hostageOpener"] call IP_fnc_removeConversation;
	if (IP_KnowsAboutMoney && (isNil "IP_MoneyReceived")) then {
		_act = compile (format ["IP_Hostage removeAction (_this select 2); %1 call IP_fnc_addMoney;", (getNumber(missionConfigFile >> 'hostageMoney'))]);
		IP_Hostage addAction ["Take Money", _act];
	};
	
	[IP_Buddy, "You Sir, are a fucking asshole. There was no reason to kill this poor bastard.", "DIRECT"] spawn IP_fnc_simpleSentence;
}];

// Pirates Setup
{
	if (side _x == west) then {_x setVariable ["IP_Faction", "FIA"]};
	if (side _x == east) then {[_x] call IP_fnc_m_createPirate};
} forEach (allUnits - [IP_Main, IP_Buddy]);

// Marker
{_x setMarkerAlpha 0} forEach ["mFIA", "mArr"];

// Briefing
["The CLIENT requests the immediate extraction of his kidnapped daughter. She is being held by Altian Pirates in the AOR, near the Northern Airfield, Altis. The CONTRACTOR is obligated to infiltrate the AOR, find out where exactly the CLIENT's daughter is kept and ensure her save return. The CONTRACTOR is not responsible for any physical or psychic harm the CLIENT's daughter may experience during the OPERATION."] call IP_fnc_createBriefing;
[player, "tRescue", ["Guard the missing girl from the <marker name=""mCompound"">Pirate Compound</marker>!", "Rescue Girl", "Pirate Compound"], "mCompound", true, 1] call BIS_fnc_taskCreate;

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;