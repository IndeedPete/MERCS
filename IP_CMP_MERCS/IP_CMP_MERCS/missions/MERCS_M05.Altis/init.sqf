IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Weather = ["CLEAR", "SUNNY"];
IP_InCutscene = false;

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

// Drunk Mode
IP_fnc_m_drunkMode = {
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [0.01, 0.01 ,true];
	"chromAberration" ppEffectCommit 1; 
	"radialBlur" ppEffectEnable true;
	"radialBlur" ppEffectAdjust [0.02, 0.02, 0.15, 0.15];
	"radialBlur" ppEffectCommit 1;
	setAccTime 0.8;
	
	waitUntil {time > 0};
	disableSerialization;
	_ehDrunk = ([] call BIS_fnc_displayMission) displayAddEventHandler [
		"KeyDown",
		{
			_actionKeys = (actionKeys 'MoveBack') + (actionKeys 'MoveFastForward') + (actionKeys 'MoveForward') + (actionKeys 'MoveSlowForward');
			if (((_this select 1) in _actionKeys) && !IP_InCutscene && (vehicle player == player)) then {
				_anims = ['amovpercmsprslowwrfldf_amovppnemstpsraswrfldnon', 'amovpercmsprslowwpstdf_amovppnemstpsraswpstdnon_2', 'amovpercmsprsnonwnondf_amovppnemstpsnonwnondnon'];
				_animState = animationState player;
				_animStateChars = toArray _animState;
				_animP = toUpper(toString [_animStateChars select 5, _animStateChars select 6, _aniMStateChars select 7]);	
				
				if	(((random 1) > 0.999) && {!(_animState in _anims) && (_animP != 'PNE')}) then {
					_i = if (primaryWeapon player != '') then {
						0
					} else {
						if (handgunWeapon player != '') then {
							1
						} else {
							2
						};
					};
					
					_anim = _anims select _i;
					player playMoveNow _anim;
					if (!IP_SimpleSentence_Talking) then {
						_sentence = ['Whoa!', 'Ouch!', 'Dammit!', 'Ah, I should not drink that much!', 'Meh!', 'Damn!', 'Damn it!', 'God!', 'What the-?!'] call BIS_fnc_selectRandom;
						[player, _sentence, 'DIRECT'] spawn IP_fnc_simpleSentence;
					};
					
					true
				};
			};
		}
	];

	uiNamespace setVariable ["IP_DisplayEH_DrunkMode", _ehDrunk];
	
	/*
	[] spawn {
		_delay = 0.01;
		_range = 10;
		_step = 0.5;
		
		while {true} do {		
			for "_bank" from (_range * -1) to _range step _step do {
				_pitch = _bank / 2;
				[player, _pitch, _bank] call BIS_fnc_setPitchBank;
				sleep _delay;
			};
			
			_range = _range * -1;
			_step = _step * -1;	
		};
	};*/
};

// Adjust Mission Date
private "_date";
_date = date;
if ((_date select 3) > 19) then {_date set [2, ((_date select 2) + 1)]};
_date set [3, 18];
_date set [4, 02];
setDate _date;

// Disable Radio
enableSentences false;

// Main Setup
[] call IP_fnc_mainInit;
IP_Main moveInCargo IP_Car;
IP_Main addEventHandler [
	"HandleDamage",{
		_unit = _this select 0;
		_selection = _this select 1;
		_passedDamage = _this select 2;
		_source = _this select 3;
		_projectile = _this select 4;
		
		_oldDamage = 0;
		
		switch(_selection)do{
			case("head"):{_oldDamage = _unit getHitPointDamage "HitHead";};
			case("body"):{_oldDamage = _unit getHitPointDamage "HitBody";};
			case("hands"):{_oldDamage = _unit getHitPointDamage "HitHands";};
			case("legs"):{_oldDamage = _unit getHitPointDamage "HitLegs";};
			case(""):{_oldDamage = damage _unit;};
			default{};
		};
		
		_return = _oldDamage + ((_passedDamage - _oldDamage) / 10);
		if (IP_TESTMODE) then {hint format ["Target: %1\nSelection: %2\nDamage: %3\nReduced Damage: %4\nHealth: %5", _unit, _selection, _passedDamage, _return, (1 - (damage _unit))];};
		
		_return
	}
];

// Buddy Setup
[] call IP_fnc_buddyInit;
IP_Buddy moveInDriver IP_Car;

// Car Setup
IP_Car allowDamage false;
IP_Car lock 2;
IP_Car lockDriver true;

// Marker
"mCar" setMarkerAlpha 0;

// All Units
{
	if  (side _x == west) then {
		[_x] call IP_fnc_m_createPoliceman;
	};
	
	if  (side _x == east) then {
		_x setVariable ["IP_Faction", "FIA"];
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
	};
} forEach (allUnits - [IP_Buddy, IP_Main]);

// Hide Stuff
{
	if ((_x getVariable ["IP_Hide", 1]) == 0) then {
		_x enableSimulation false;
		_x hideObject true;
	};
} forEach allMissionObjects "ALL";

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[true, true, false, false] call IP_fnc_ambientLife;