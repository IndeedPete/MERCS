IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Main Setup
[] call IP_fnc_mainInit;
IP_Main moveInDriver IP_Car;

// Buddy Setup
[] call IP_fnc_buddyInit;
IP_Buddy moveInCargo IP_Car;

// Agent Setup
IP_Agent setIdentity "agent";
IP_Agent setVariable ["IP_Faction", "DSE"];
[IP_Agent, 5] call IP_fnc_setSkill;
IP_Agent addGoggles "G_Aviator";
IP_Agent setVariable ["IP_Avatar", "Campaigns\IP_CMP_MERCS\img\agentAvatar.jpg"];
IP_Agent setVariable ["IP_LiveFeed", true];
IP_Agent addEventHandler [
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
		
		_return = _oldDamage + ((_passedDamage - _oldDamage) / 5);
		if (IP_TESTMODE) then {hint format ["Target: %1\nSelection: %2\nDamage: %3\nReduced Damage: %4\nHealth: %5", _unit, _selection, _passedDamage, _return, (1 - (damage _unit))];};
		
		_return
	}
];
IP_Agent stop true; // He was running away...

// Car Setup
IP_Car spawn {
	sleep 1; 
	_this setObjectTexture [0, "\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa"];
}; 
IP_Car addEventHandler [
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

// Marker
{_x setMarkerAlpha 0} forEach ["mResearch1", "mResearch2"];

// Briefing
["The CLIENT requests transportation and personal protection during the course of the OPERATION. The CONTRACTOR is obligated to pick up the CLIENT at the Altis International Airport. From there the further course of the OPERATION falls to the CLIENT."] call IP_fnc_createBriefing;
[player, "tProtect", ["Protect the VIP at all costs and keep the SUV intact!", "Protect VIP", ""], nil, false, 1] call BIS_fnc_taskCreate;	
[player, "tPickup", ["Pick up the VIP from the <marker name=""mAirport"">Central Airport</marker>!", "Pick Up VIP", "Central Airport"], "mAirport", true, 1] call BIS_fnc_taskCreate;	

// AAF Compositions (Airport etc.)
[] call compile preProcessFileLineNumbers "compositions_complex\C_EA_Airbase.sqf";
[] call compile preProcessFileLineNumbers "compositions_complex\C_EA_Airbase_inside.sqf";
[] call compile preProcessFileLineNumbers "compositions_complex\C_EA_Checkpoint_03.sqf";

// Checkpoints
{_x setVariable ["IP_LiveFeed", true]} forEach [IP_Officer1, IP_Officer2, IP_Officer3];
	
// All Units
{
	if (side _x == resistance) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				Resistance setFriend [West, 0];
				//West setFriend [Resistance, 0];
				if (IP_TESTMODE) then {hint "AAF is now hostile!"};
			};
		}];
		if ((dayTime > 7) AND (dayTime < 19)) then {_x unassignItem "NVGoggles_INDEP"};
	};
	
	if (side _x == west) then {
		_x setVariable ["IP_Faction", "BlackArrow"];
		[_x] call IP_fnc_createMerc;
		_x addEventHandler ["HIT", {
			if ((_this select 1) == (vehicle player)) then {
				player addRating -999999;
				if (IP_TESTMODE) then {hint "Black Arrow is now hostile!"};
			};
		}];
	};	
} forEach (allUnits - [IP_Buddy, IP_Main]);

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;