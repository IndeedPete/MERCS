IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Asker"];

// CSAT Officer
[IP_Officer, "CSATOfficer", "covert"] call IP_fnc_applyTemplate;
IP_Officer stop true;
IP_Officer setUnitPos "MIDDLE";
IP_Officer setPos [3403.9, 13102.3, 4.35031];
IP_Officer setDir 250;
if (IP_TESTMODE) then {IP_Officer allowDamage false};

// HQ Dummy
IP_HQ allowDamage false;
IP_HQ setVariable ["IP_Avatar", "Campaigns\IP_CMP_MERCS\img\CSAT_Flag.jpg"];
(group IP_HQ) setGroupID ["Sultan"];

// Marker
{_x setMarkerAlpha 0} forEach ["mPickup", "mPower", "mAO1", "mAO2"];

// Briefing
[
	"The CONTRACTOR is tasked to infiltrate the AOR and locate covert operative Sub-Lieutenant Malik Nafisi, who is working undercover as journalist. The CONTRACTOR will then transport SLt. Nafisi safely to a location the CLIENT determines during the course of the OPERATION where the SLt. will be extracted. In case of unforeseen death of SLt. Nafisi, the important information he is carrying must be extracted instead. Under no circumstances the CONTRACTOR is allowed to copy or examine the information SLt. Nafisi is carrying.",
	"You're tasked to locate and rescue some CSAT operative who was obviously too dumb to leave before the AAF started bombing the living shit out of Kavala. Try to make your way between the front lines and avoid contact where possible. Extract the super important intel the guy is carrying, preferably with him still alive. But don't make the life of some random CSAT agent your top priority. Stick to the contract. Care for the data, care for the money."
] call IP_fnc_createBriefing;
[player, "tReach", ["Reach <marker name=""mOfficer"">Mirza's position</marker> and link up with him!", "Reach Mirza", "Mirza"], IP_Officer, true, 1] call BIS_fnc_taskCreate;

// All Units
{
	if ((side _x) == west) then {
		_x setVariable ["IP_Faction", "FIA"];
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "CSAT"];
	};
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];
	};
} forEach (allUnits - [IP_Main]);

// Dead Bodies
["mAO1", civilian, [50, 50], ["STD"]] spawn IP_fnc_randomDeadBodiesArea;
["mAO2", civilian, [50, 50], ["STD"]] spawn IP_fnc_randomDeadBodiesArea;

// Ambient Fireworks
[IP_AATank, IP_AATarget, 200, 500, 0.2] spawn IP_fnc_ambientVehicleFire;
[IP_ArtyTank, IP_ArtyTarget, 200, 1000, 10] spawn IP_fnc_ambientVehicleFire;
["mAO1", {true}, 0, 0, [20, 40], "ARTY"] spawn IP_fnc_ambientArty;

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;