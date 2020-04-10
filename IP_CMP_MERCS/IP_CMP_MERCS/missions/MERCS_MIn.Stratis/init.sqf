IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

IP_MERCS_MissionsDone = [];
IP_MERCS_PlayerBox = [];
saveVar "IP_MERCS_PlayerBox";
IP_Weather = ["CLEAR", "SUNNY"];

// Clear PNS Garbage
{profileNameSpace setVariable [_x, nil]} forEach ["IP_MERCS_MissionsDone", "IP_MERCS_PlayerBox", "IP_MERCS_MainLoadout", "IP_MERCS_BuddyLoadout", "IP_MERCS_Money", "IP_MERCS_Debts", "IP_MERCS_Team", "IP_MERCS_Clothes", "IP_MERCS_Mission", "IP_MERCS_Date", "IP_MERCS_Weather"];
saveProfileNamespace;

// Shop Init
[] call IP_fnc_shopInit;

// Player Initial Setup
IP_Main setIdentity "main";
IP_Main setVariable ["IP_Money", (getNumber(missionConfigFile >> "MainValues" >> "startMoney"))];
IP_Main setVariable ["IP_Debts", (getNumber(missionConfigFile >> "MainValues" >> "startDebts"))];
IP_Main setVariable ["IP_Picture", "IP_CMP_MERCS\IP_CMP_MERCS\img\main.jpg"];
IP_Main setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\mainAvatar1.jpg"];
IP_Main setVariable ["IP_LiveFeed", true];
IP_Main setVariable ["IP_Team", []];
IP_Main setVariable ["IP_ShopUniforms", [getText(missionConfigFile >> "MainValues" >> "startUniform")]];
if (IP_TESTMODE) then {IP_Main allowDamage false};

removeAllWeapons IP_Main;
removeUniform IP_Main;
removeVest IP_Main;
removeGoggles IP_Main;
removeHeadgear IP_Main;

IP_Main forceAddUniform ((IP_Main getVariable "IP_ShopUniforms") select 0);
IP_Main moveInCargo [IP_Boat1, 0];

IP_Main unassignItem "ItemMap";
IP_Main unassignItem "ItemGPS";
IP_Main unassignItem "ItemCompass";
IP_Main removeItem "ItemMap";
IP_Main removeItem "ItemGPS";
IP_Main removeItem "ItemCompass";

// Buddy Setup
[] call IP_fnc_buddyInit;
IP_Buddy setUnitPos "UP";

// Commander Setup
IP_Commander setIdentity "commander";
IP_Commander setVariable ["IP_LiveFeed", true];
IP_Commander allowDamage false;
[IP_Commander, "Executive"] call BIS_fnc_setUnitInsignia;
[IP_Commander, "STAND", "ASIS"] call BIS_fnc_ambientAnim;

// Trafficker Setup
IP_Trafficker setIdentity "trafficker";
IP_Trafficker setVariable ["IP_LiveFeed", true];
IP_Trafficker setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\traffickerAvatar.jpg"];
IP_Trafficker allowDamage false;
IP_Trafficker moveInDriver IP_Boat1;

// Refugees Setup
IP_Refugee1 setVariable ["IP_LiveFeed", true];
IP_Refugee2 setVariable ["IP_LiveFeed", true];
{_x setUnitPos "UP"} forEach [IP_Refugee1, IP_Refugee2, IP_Refugee3, IP_Refugee4];

// Mission Start
[] spawn {
	while {true} do {
		waitUntil {savingEnabled};
		enableSaving [false, false];
	};
};
execVM "scn\mission.sqf"; 