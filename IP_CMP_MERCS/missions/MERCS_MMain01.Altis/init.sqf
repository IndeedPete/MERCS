IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_Violations = 0;
IP_CriticalViolation = false;
IP_MaxViolations = 3;
IP_HoldFire = false;

// Functions
_applySilencer = {
	_silencer = (getArray(configFile >> "CfgWeapons" >> (primaryWeapon _this) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
	if (!isNil "_silencer") then {_this addPrimaryWeaponItem _silencer};
	_silencer = (getArray(configFile >> "CfgWeapons" >> (handGunWeapon _this) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
	if (!isNil "_silencer") then {_this addHandgunItem _silencer};
};

IP_m_fnc_stanceNazi = {
	#define CHECK ((animationState _unit != "AmovPpneMstpSrasWrflDnon") AND (animationState _unit != "AmovPpneMstpSrasWpstDnon"))
	
	_unit = _this select 0;
	_initialDelay = _this select 1;
	_duration = _this select 2;
	_tolerance = _this select 3;

	_counter = 0;
	sleep _initialDelay;

	while {_counter <= _duration} do {
		if (CHECK) then {
			sleep _tolerance;
			_counter = _counter + _tolerance;
			if (CHECK) then {
				IP_CriticalViolation = true;
			};
		} else {
			sleep 1;
			_counter = _counter + 1;
		};
	};
};

// Adjust Date
private "_date";
_date = date;
_date set [3, 5];
_date set [4, 0];
if ((date select 3) > 5) then {_date set [2, ((date select 2) + 1)]};
setDate _date;

// Main Setup
IP_MERCS_Team = [];
[] call IP_fnc_mainInit;
IP_Main addEventHandler ["Fired", {
	if (IP_HoldFire) then {
		IP_Violations = IP_Violations + 1;
		if (IP_Violations < IP_MaxViolations) then {
			[IP_Commander, "God dammit, hold your fire, you idiot!", "DIRECT"] spawn IP_fnc_simpleSentence;
		};
	};
}];

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;
IP_Commander call _applySilencer;

// Rival Setup
[IP_Rival, "rival"] call IP_fnc_applyTemplate;

// Agent Setup
[IP_Agent, "agent"] call IP_fnc_applyTemplate;
[IP_Agent, "STAND_U3", "ASIS"] call BIS_fnc_ambientAnim;

// British Knights Setup
[IP_Captain, "captain", "combat"] call IP_fnc_applyTemplate;
IP_Captain setVariable ['IP_LiveFeed', false];
IP_Captain call _applySilencer;
IP_Medic stop true;
IP_Medic setUnitPos "UP";
[IP_Medic, "medic", "combat"] call IP_fnc_applyTemplate;
IP_Medic call _applySilencer;
IP_Medic stop true;
IP_Medic setUnitPos "MIDDLE";
IP_Knights = [IP_Captain, IP_Medic];

// Cutscene Dummies
[IP_CommanderDummy, "commander", "combat"] call IP_fnc_applyTemplate;
IP_CommanderDummy setVariable ["IP_LiveFeed", false];
removeAllWeapons IP_CommanderDummy;
IP_CommanderDummy setUnitPos "MIDDLE";
IP_CommanderDummy stop true;
IP_CommanderDummy spawn {
	_this addWeapon "Binocular";
	waitUntil {"Binocular" in (weapons _this)};
	_this selectWeapon "Binocular"; 
};

[IP_MainDummy] call IP_fnc_mainInit;
IP_MainDummy setVariable ["IP_LiveFeed", false];
IP_MainDummy stop true;
{IP_MainDummy disableAI _x} forEach ["ANIM", "MOVE", "FSM"];
IP_MainDummy switchMove "Acts_passenger_flatground_leanright";

// HQ
[IP_Lord, "lord", "command"] call IP_fnc_applyTemplate;

// Overview Guards
{
	_x setVariable ["IP_Faction", "BlackArrow"];
	[_x] call IP_fnc_createMerc;
	_x setCaptive true;
} forEach [IP_Badguy1, IP_Badguy2];
[IP_Badguy1, "WATCH", "ASIS"] call BIS_fnc_ambientAnim;
[IP_Badguy2, "STAND", "ASIS"] call BIS_fnc_ambientAnim;

// Car
IP_Car allowDamage false;
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

// Cutscene Stuff
_pos = getPos IP_Wreck;
IP_Katiba = "groundWeaponHolder" createVehicle _pos;
IP_Katiba setPos _pos;
IP_Katiba addWeaponCargo ["arifle_Katiba_GL_Nstalker_pointer_F", 1];
IP_Katiba attachTo [IP_Wreck, [-0.85, -0.1, -0.13]];
IP_Katiba setVectorDirAndUp [[0, -1, 0], [3, 0, 0]];

IP_CutsceneStuff = [IP_CommanderDummy, IP_MainDummy, IP_Map, IP_Can1, IP_Can2, IP_Katiba, IP_Rival, IP_Agent, IP_Truck, IP_Device];
{
	_x enableSimulation false;
	_x hideObject true;
} forEach IP_CutsceneStuff;

// Marker
"mLinkup" setMarkerAlpha 0;

// Briefing
_prefix = "OPERATION CRUSADER Phase I<br/><br/>";
_suffix = "<br/><br/><img image='Campaigns\IP_CMP_MERCS\img\BK_LogoSmall.paa' width='128'/>";
 
player createDiaryRecord ["Diary", ["Signal", (_prefix + "White King - Command, Lord Commander Titus<br/>Black Knight - Recon, Executive Ian McMillian<br/>Paladin - Recon, Knight Captain Gabriel" + _suffix)]];
player createDiaryRecord ["Diary", ["Execution", (_prefix + "(Team Specific Version)<br/>1. Callsign 'Black Knight' will insert via boat <marker name=""mInsertion"">north-east</marker> of the <marker name=""mResearch"">target facility, code name 'Black Mesa'</marker>.<br/>2. Black Knight will secure an <marker name=""mOverview"">Overview Position east</marker> of <marker name=""mResearch"">Black Mesa</marker>.<br/>3. Black Knight will observe <marker name=""mResearch"">Black Mesa</marker> for approximately 24 hours.<br/>4. Black Knight will return to the <marker name=""mInsertion"">Insertion Point</marker> and extract by boat.<br/><br/>Black Knight must not be compromised throughout steps 1-3!" + _suffix)]];
player createDiaryRecord ["Diary", ["Mission", (_prefix + "Main objective is to reconnoitre the two research bases on Altis, operated by Deep Space Engineering. A company originating in the United States which diverted their headquarters to Germany after the CSAT invasion of the US west-coast in 2031. Necessary information about defences, staff strength, backup, involvement of the AAF and other important intel must be gathered." + _suffix)]];
player createDiaryRecord ["Diary", ["Situation", (_prefix + "AAF and FIA forces seem to have entered into a full blown civil war. Various reports speak of fightings around villages and military posts throughout the whole island of Altis. Officially, ION's mandate is frozen but the Altian government and the AAF are too busy fighting the FIA, independent warlords and pirates. The British Knights still operate undercover." + _suffix)]];

[player, "tDetect", ["Stay undetected!", "Stay Undetected", ""], nil, false, 1] call BIS_fnc_taskCreate;
[player, "tInsert", ["Insert by boat at the <marker name=""mInsertion"">Insertion Point</marker>!", "Insert", "Insertion Point"], "mInsertion", true, 1] call BIS_fnc_taskCreate;
[player, "tOverview", ["Reach and secure the <marker name=""mOverview"">Overview Position</marker>!", "Reach Overview Position", "Overview Position"], "mOverview", false, 1] call BIS_fnc_taskCreate;
[player, "tRecon", ["Reconnoitre the <marker name=""mResearch"">'Black Mesa' Research Facility</marker>!", "Recon Black Mesa", "Black Mesa"], "mResearch", false, 1] call BIS_fnc_taskCreate;
[player, "tExtract", ["Extract by boat at the <marker name=""mInsertion"">Extraction Point</marker>!", "Extract", "Extraction Point"], "mInsertion", false, 1] call BIS_fnc_taskCreate;

// All Units
{
	if ((side _x) == west) then {
		[_x, 5, true, [true, true]] call IP_fnc_createBK;
		IP_Knights = IP_Knights + [_x];
	};
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "BlackArrow"];
		[_x] call IP_fnc_createMerc;
	};
} forEach (allUnits - [IP_Rival, IP_Lord, IP_Captain, IP_Medic, IP_Main, IP_Commander, IP_MainDummy, IP_CommanderDummy]);

// Hide the Knights
{
	_x enableSimulation false;
	_x hideObject true;
} forEach IP_Knights;

// Music
[] call BIS_fnc_jukebox;