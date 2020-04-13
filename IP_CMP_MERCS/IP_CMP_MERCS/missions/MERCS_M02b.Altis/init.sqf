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
	_weapon = _weapons call BIS_fnc_selectRandom;
	_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
	_unit addMagazines [_magazine, 5];
	_unit addWeapon _weapon;
	
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enableGunLights "forceOn";
	
	[_unit, 2] call IP_fnc_setSkill;
};

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;

// Shop Setup
[] call IP_fnc_shopInit;

// Tank Setup
clearWeaponCargo IP_Tank;
clearMagazineCargo IP_Tank;
IP_Tank setObjectTexture [1, "IP_CMP_MERCS\IP_CMP_MERCS\txt\mbt_01_body_coEF.paa"];

// Officer Setup
IP_Officer setVariable ["IP_LiveFeed", true];

// Sergeant Setup
IP_Sergeant setVariable ["IP_LiveFeed", true];

// Marker
{_x setMarkerAlpha 0} forEach ["mCivFLee1", "mCivFLee2"];

// Briefing
["Violent riots broke out throughout the whole Republic of Altis. The CLIENT requests additional manpower to get these riots under control. The CONTRACTOR is obligated to deploy at the AOR and clear the main street of the city of Negades from rioters and road blocks.<br/>The AOR is under martial law. Hence ROE dictate that the CONTRACTOR is allowed to use lethal force against civilian rioters if necessary. However, peaceful solutions are preferred by the CLIENT."] call IP_fnc_createBriefing;
[player, "tClear", ["Clear the <marker name=""mAO"">main street of Negades</marker>! Scare off the civilians and move the cars aside!", "Clear Street", "Main Street"], "mAO", true, 1, true, "danger"] call BIS_fnc_taskCreate;	

// Accident Scene
_smoke = "#particlesource" createVehicle [0,0,0];
_smoke setParticleClass "WreckSmokeSmall";
_smoke attachTo [IP_Car, [0,1.65,-0.805]];

_smoke = "#particlesource" createVehicle [0,0,0];
_smoke setParticleClass "WreckSmokeSmall";
_smoke attachTo [IP_Truck, [0,1.65,-0.805]];

_smoke = createSoundSource ["Sound_SmokeWreck1", [0,0,0], [], 0];
_smoke attachTo [IP_Car, [0,1.65,-0.805]];

// All Units
{
	if  (side _x == west) then {
		[_x] call IP_fnc_m_createPoliceman;
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				player addRating -999999;
				//West setFriend [Resistance, 0];
				if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
			};
		}];
	};
	
	if  (side _x == resistance) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				player addRating -999999;
				//West setFriend [Resistance, 0];
				if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
			};
		}];
		if ((dayTime > 7) AND (dayTime < 19)) then {_x unassignItem "NVGoggles_INDEP"};
	};
	
	if  (side _x == civilian) then {
		_x setVariable ["IP_Scared", false];
		_x execFSM "civilian.fsm";
		_x setRandomLip true;
	};
} forEach (allUnits - [IP_Buddy, IP_Main, IP_Civ1, IP_Civ2]);

// Simple Crowd Sound
[] spawn {
	while {true} do {
		playSound "crowd2";
		sleep 43.5;
	};
};

// Random Yelling
[] spawn {
	_spakers = [IP_Main, IP_Buddy];
	_sentences = ["Go home people, this doesn't help!", "Get lost! Or you'll get hurt!", "Go back to your homes and we won't hurt you!", "Resistance is futile!", "Rioting didn't help in the past and it won't help you now!", "Just leave and let us clear the street!"];
	
	waitUntil {!isNil "IP_IntroDone"};
	while {("tClear" call BIS_fnc_taskState) != "SUCCEEDED"} do {
		_count = {((side _x) == civilian) && (_x getVariable ["IP_Scared", true])} count allUnits;
		waitUntil {({((side _x) == civilian) && (_x getVariable ["IP_Scared", true])} count allUnits) > _count};
		_speaker = _spakers call BIS_fnc_selectRandom;
		_sentence = _sentences call BIS_fnc_selectRandom;
		[_speaker, _sentence, "DIRECT"] call IP_fnc_simpleSentence;
	};
};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[false, false, false, true] call IP_fnc_ambientLife;