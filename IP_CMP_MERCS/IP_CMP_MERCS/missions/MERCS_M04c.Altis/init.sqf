IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_ToKill = [IP_FuelTruck, IP_RepairTruck, IP_AmmoTruck, IP_Heli, IP_Car1, IP_Car2, IP_Car3, IP_Officer1, IP_Officer2];
IP_ExplosiveTrucks = [IP_FuelTruck, IP_RepairTruck, IP_AmmoTruck];

// Main Setup
[] call IP_fnc_mainInit;
IP_Main addEventHandler ["WeaponAssembled", {
	[IP_Buddy, "All right, let's get this party started!", "DIRECT"] spawn IP_fnc_simpleSentence;
	(_this select 1) addEventHandler ["fired", {IP_MortarFired = true}];
}];

// Buddy Setup
[] call IP_fnc_buddyInit;
//[] call IP_fnc_buddyEquipment;

// Shop Setup
[] call IP_fnc_shopInit;

// Black Arrow Officers
IP_Officer1 setVariable ["IP_GlassInfo", "> <t color='#FF0000'>Priority Target</t><br/>"];
IP_Officer2 setVariable ["IP_GlassInfo", "> <t color='#FF0000'>Priority Target</t><br/>"];

// Contractor Setup
IP_Contractor setVariable ["IP_LiveFeed", true];
IP_Contractor setVariable ["IP_ConvSpecial", "Drone Specialist"];
removeAllWeapons IP_Contractor;
removeBackpack IP_Contractor;
removeVest IP_Contractor;
removeHeadgear IP_Contractor;
removeGoggles IP_Contractor;
removeUniform IP_Contractor;
IP_Contractor unlinkItem "NVGoggles";
IP_Contractor forceAddUniform "U_Competitor";
IP_Contractor addHeadgear "H_Cap_headphones";
IP_Contractor addGoggles "G_Aviator";
[IP_Contractor, "STAND_U1", "ASIS"] call BIS_fnc_ambientAnim;
[IP_Contractor, "contractorOpener"] call IP_fnc_addConversation;

// Contractor's gun
IP_Vermin attachTo [IP_Box, [0.1, 0.1, 0.35]];
IP_Vermin setDir 270;
[] spawn {
	while {alive IP_Contractor} do {
		waitUntil {!("SMG_01_F" in (weaponCargo IP_Vermin))};
		[IP_Contractor, "Hey! You put that back!", "DIRECT", 1] call IP_fnc_simpleSentence;
		waitUntil {("SMG_01_F" in (weaponCargo IP_Vermin))};
		[IP_Contractor, "Better for you, jerkface!", "DIRECT", 1] call IP_fnc_simpleSentence;
	};
};

// Mad Guy
IP_MadGuy setVariable ["IP_LiveFeed", true];
[IP_MadGuy, "SIT_LOW_U", "ASIS"] call BIS_fnc_ambientAnim;
[] spawn {
	waitUntil {IP_Main distance IP_MadGuy < 3};
	[IP_MadGuy, "The end is nigh! Flee, you fools! Flee! Soon they will use the device! THE DEVICE!", "DIRECT"] call IP_fnc_simpleSentence;
};

// Campfires
[] spawn {
	sleep 5;
	if ((dayTime < 7) OR (dayTime > 19)) then {
		IP_Fireplace inFlame true;
		IP_Campfire inFlame true;
		IP_Campfire2 inFlame true;
	};
};

// Mortar Backpacks
_backpack = "B_Mortar_01_support_F" createVehicle (getPos IP_Car);
_wh = nearestObject [_backpack, "GroundWeaponHolder"];
_wh attachTo [IP_Car, [1.6, -1.2, -0.6]];
_wh setVectorDirAndUp [[0, 0, -1], [3, 0, 0]];

_backpack = "B_Mortar_01_weapon_F" createVehicle (getPos IP_Car);
_wh = nearestObject [_backpack, "GroundWeaponHolder"];
_wh attachTo [IP_Car, [-1.65, -2.2, -0.6]];
_wh setVectorDirAndUp [[0, 0, -1], [-3, 0, 0]];

// Support Truck Explosions / Fire
{
	_x addEventHandler ["killed", {
		_killed = _this select 0;
		[(getPos _killed), "FIRE_BIG"] call IP_fnc_createFireEffect;
		if ((_killed in IP_ExplosiveTrucks) && {isNil "IP_MichaelBay"}) then {
			IP_MichaelBay = true;
			[] spawn {
				sleep 0.5;
				{
					"Bo_GBU12_LGB_MI10" createVehicle (getPos _x);
					sleep 0.5;
				} forEach IP_ExplosiveTrucks;
			};
		};
	}];
} forEach [IP_FuelTruck, IP_RepairTruck, IP_AmmoTruck, IP_Heli, IP_Car1, IP_Car2, IP_Car3];

// Closet
IP_Closet addAction ["Change Uniform", {
	IP_Closet removeAction (_this select 2);
	[] spawn {
		["IP_BlackScreen", false] call BIS_fnc_blackOut;
		sleep 0.5;
		{
			_unit  = _x;
			_items = uniformItems _unit;
			removeUniform _unit;
			_unit forceAddUniform "U_O_CombatUniform_ocamo";
			_unit setObjectMaterial [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothingMOD.rvmat"];
			_unit setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing_rus_coBA.paa"];
			{_unit addItem _x} forEach _items;
		} forEach (units group IP_Main);
		IP_Disguise = true;
		{_x setCaptive true} forEach allUnits;
		skipTime 0.25;
		sleep 0.5;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		sleep 0.5;
		[IP_Buddy, "That's horrible, I look like a nazi!", "DIRECT"] call IP_fnc_simpleSentence;
		[IP_Main, "And it's so uncomfortable! 'Futuristic design' my ass.", "DIRECT"] call IP_fnc_simpleSentence;
		[IP_Buddy, "At least it will get us into their base.", "DIRECT"] call IP_fnc_simpleSentence;
		saveGame;
	};
}];

// Add Killed EH to all toKill because I hate Arma
{
	_x addEventHandler ["killed", {
		player addRating 20000;
	}];
} forEach IP_ToKill;

// Whiteboard
IP_Whiteboard setObjectTexture [0, "IP_CMP_MERCS\IP_CMP_MERCS\txt\wb\M04c_WB1.paa"];

// Marker
{_x setMarkerAlpha 0} forEach ["mPatrol", "mRoadBlock", "mDrone", "mOutpost", "mOverview", "mCar"];

// Briefing
[] call IP_fnc_createBriefing;
[player, "tCamp", ["Destroy all vehicles and equipment and eliminate key personnel in the <marker name=""mCamp"">Black Arrow Camp</marker>!", "Black Arrow Camp", "Camp"], "mCamp", true, 1, true, "destroy"] call BIS_fnc_taskCreate;	

// Random Patrols
["mPatrol", east, [10, 15], [1, 2], ["GUE"]] call IP_fnc_randomPatrolArea;

// All Units - Post init to affect units spawned by site modules
[] spawn {
	waitUntil {time > 0};
	{
		switch (side _x) do {
			case west: {
				_x setVariable ["IP_Faction", "ION"];
				_x addEventHandler ["HIT", {
					if ((_this select 1) == (vehicle player)) then {
						player addRating -999999;
						if (IP_TESTMODE) then {hint "Everybody is now hostile!"};
					};
				}];
			};
			
			case resistance: {
				_x setVariable ["IP_Faction", "AltisMil"];
				if ((dayTime > 7) AND (dayTime < 19)) then {_x unassignItem "NVGoggles_INDEP"};
			};
		
			case east: {
				_x setVariable ["IP_Faction", "BlackArrow"];
				[_x] call IP_fnc_createMerc;
				_x allowFleeing 0;
				_x addEventHandler ["HIT", {
					if (((_this select 1) in (units group IP_Main)) && {!isNil "IP_Disguise"}) then {
						{_x setCaptive false} forEach allUnits;
						IP_Disguise = nil;
						if (IP_TESTMODE) then {hint "Cover is blown!"};
					};
				}];
			};
			
			default {};
		};
	} forEach (allUnits - [IP_Buddy, IP_Main]);
};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;