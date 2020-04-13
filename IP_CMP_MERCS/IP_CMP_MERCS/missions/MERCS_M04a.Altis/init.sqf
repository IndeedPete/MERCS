IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;

// Main Setup
[] call IP_fnc_mainInit;

// Buddy Setup
[] call IP_fnc_buddyInit;

// Shop Setup
[] call IP_fnc_shopInit;

// Corporal Setup
IP_Corporal setVariable ["IP_LiveFeed", true];

// Officer Setup
IP_EFOfficer setIdentity "ef_officer";
IP_EFOfficer allowDamage false;
IP_EFOfficer setVariable ["IP_LiveFeed", true];
IP_EFOfficer setVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\EFOfficerAvatar.jpg"];
[IP_EFOfficer, 'TFAegis'] call BIS_fnc_setUnitInsignia;
IP_EFOfficer setVariable ["IP_Rank", "Lt.Cdr."];
[IP_EFOfficer, "STAND1", "ASIS"] call BIS_fnc_ambientAnim;
[IP_EFOfficer, "EFOfficerOpener"] call IP_fnc_addConversation;

// Worker & Box Setup
[IP_Worker, "REPAIR_VEH_KNEEL"] call BIS_fnc_ambientAnim;
[IP_Worker, "workerOpener"] call IP_fnc_addConversation;
IP_Worker addEventHandler ["Killed", {
	IP_Box enableSimulation true;
	[IP_Buddy, "God damn, would you stop shooting harmless civies?! He did nothing to you, you jerk!", "DIRECT"] spawn IP_fnc_simpleSentence;
}];
clearWeaponCargo IP_Box;
clearMagazineCargo IP_Box;
clearItemCargo IP_Box;
IP_Box addItemCargo ["ToolKit", 1];
IP_Box enableSimulation false;
[] spawn {
	waitUntil {!("ToolKit" in itemCargo IP_Box)};
	if (!alive IP_Worker) exitWith {};
	waitUntil {"ToolKit" in itemCargo IP_Box};
	IP_Box enableSimulation false;
	[IP_Worker, "Thanks man, honesty is a rare trait these days! I hope it solved your problems!", "DIRECT"] call IP_fnc_simpleSentence;
};

// Briefing
["The CLIENT requests the retrieval of his property from a former CLIENT base. The CONTRACTOR is obligated to pick up two trucks loaded with the CLIENT's property and then take them to the Northern Airfield, Altis. A CLIENT's associate will wait at the Northern Airfield, Altis to check if the property is complete and ready for shipment. The CLIENT's property must not be damaged during the course of the OPERATION."] call IP_fnc_createBriefing;
[player, "tTransport", ["Deliver the two HEMTT Cargo Trucks from the <marker name=""mFOB"">former FOB Sauerland</marker> to the <marker name=""mAirfield"">Northern Airfield</marker>! The trucks must not be destroyed!", "Transport", "Northern Airfield"], "mAirfield", true, 1, true, "container"] call BIS_fnc_taskCreate;	

// All Units
{
	switch (side _x) do {
		case west: {
			_x setVariable ["IP_Faction", "EFMil"];
			_x setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_coMOD.paa"];
			[_x, "TFAegis"] call BIS_fnc_setUnitInsignia;
			_x addEventHandler ["HIT", {
				if ((_this select 1) == (vehicle player)) then {
					player addRating -999999;
					if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
				};
			}];
			if ((dayTime > 7) AND (dayTime < 19)) then {_x unassignItem "NVGoggles"};
		};
	
		case resistance: {
			_x setVariable ["IP_Faction", "AltisMil"];
			_x addEventHandler ["HIT", {
				if ((_this select 1) == (vehicle player)) then {
					Resistance setFriend [West, 0];
					player addRating -999999;
					//West setFriend [Resistance, 0];
					if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
				};
			}];
			if ((dayTime > 7) AND (dayTime < 19)) then {_x unassignItem "NVGoggles_INDEP"};
		};
	
		case east: {
			_x setVariable ["IP_Faction", "BlackArrow"];
			[_x] call IP_fnc_createMerc;
			_x allowFleeing 0;
			_x enableSimulation false;
			_x hideObject true;
		};
		
		default {};
	};
} forEach (allUnits - [IP_Buddy, IP_Main]);

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[true, false, true, false] call IP_fnc_ambientLife;