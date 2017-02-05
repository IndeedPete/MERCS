IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_BuddyHealed = false;

// Adjust Mission Date
_date = date;
_date set [3, 4];
_date set [4, 25];
setDate _date;

// Weather
[] spawn {
	IP_Weather = ["", ["FOGGY", "DENSEFOG"]] call IP_fnc_setWeather;
};

// Force Internal View
if (!IP_TESTMODE) then {["IP_OnEachFrameEH", "onEachFrame", {(vehicle player) switchCamera "Internal"}] call BIS_fnc_addStackedEventHandler};

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;
_set = ["RIFLEMAN", "GRENADIER", "AUTORIFLEMAN", "MARKSMAN"] call BIS_fnc_selectRandom;
[IP_Buddy, "", _set, "V_I_G_resistanceLeader_F", "", "", "", false, [false, false]] call IP_fnc_buddyEquipment;

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;
IP_Commander unlinkItem "NVGoggles";

// Captain Setup
[IP_Captain, "captain", "combat"] call IP_fnc_applyTemplate;
IP_Captain unlinkItem "NVGoggles";
[IP_Captain, "STAND", "ASIS"] call BIS_fnc_ambientAnim;

// Medic Setup
[IP_Medic, "medic", "combat"] call IP_fnc_applyTemplate;
IP_Medic unlinkItem "NVGoggles";
IP_Medic setUnitPos "MIDDLE";

// Crashsite
IP_Heli2 setObjectTexture [0, "Campaigns\IP_CMP_MERCS\txt\heli_light_02_ext_coION.paa"];
{IP_Heli2 animate [_x, 1]} forEach ["dvere1", "dvere1_posunZ", "dvere2"];
IP_Heli2 setDamage 0.9;
IP_Heli2 allowDamage false;
clearWeaponCargo IP_Heli2;
clearMagazineCargo IP_Heli2;
clearItemCargo IP_Heli2;
clearBackpackCargo IP_Heli2;

IP_Pilot2 setIdentity "pilot";
removeBackpack IP_Pilot2;
IP_Pilot2 setObjectTexture [0, "Campaigns\IP_CMP_MERCS\txt\coveralls_black_coION.paa"];
[IP_Pilot2] call IP_fnc_deadBody;

removeBackpack IP_CoPilot2;
[IP_CoPilot2] call IP_fnc_deadBody;

// All Units
{
	_x addEventHandler ["HIT", {
		if ((_this select 1) == (vehicle player)) then {
			player addRating -999999;
			if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
		};
	}];
	
	if (((side _x) == west) && !(_x in [IP_Commander, IP_Captain, IP_Medic])) then {
		[_x] call IP_fnc_createBK;
	};
} forEach (allUnits - [IP_Main, IP_Buddy]);

// Music
[] call BIS_fnc_jukebox;