/* 
TPW AIR - Spawn ambient flybys of helicopters and aircraft
Author: tpw 
Date: 20140412
Version: 1.25

Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.     

To use: 
1 - Save this script into your mission directory as eg tpw_air.sqf
2 - Call it with 0 = [10,300,2] execvm "tpw_air.sqf"; where 10 = delay until flybys start (s), 300 = maximum time between flybys (sec). 0 = disable, 2 = maximum aircraft at a given time

THIS SCRIPT WON'T RUN ON DEDICATED SERVERS.
*/

if (isDedicated) exitWith {};
if (count _this < 3) exitwith {hint "TPW AIR incorrect/no config, exiting."};
//if !(isnil "tpw_air_active") exitwith {hint "TPW AIR already running."};
if (worldname in ["mak_Jungle","isladuala"]) exitwith {hint "TPW AIR disabled for this map."};
if (_this select 1 == 0) exitwith {};
WaitUntil {!isNull FindDisplay 46};

// VARIABLES
tpw_air_version = "1.25"; // Version string
tpw_air_delay = _this select 0; // delay until flybys start
tpw_air_time = _this select 1; // maximum time between flybys
tpw_air_max = _this select 2; // maximum number of aircraft at a given time
tpw_air_active = true; // Global enable/disabled
if (isnil "tpw_air_count") then {tpw_air_count = 0}; // How many spawned aircraft?

// LIST OF AIRCRAFT - Thanks to Larrow for the code
tpw_air_helitypes = [];
_cfg = (configFile >> "CfgVehicles");
for "_i" from 0 to ((count _cfg)-1) do 
	{
	if (isClass ((_cfg select _i) ) ) then 
		{
		_cfgName = configName (_cfg select _i);
		if ( (_cfgName isKindOf "helicopter") && (getNumber ((_cfg select _i) >> "scope") == 2) ) then 
			{
			tpw_air_helitypes set [count tpw_air_helitypes,_cfgname];
			};
		};
	};
tpw_air_planetypes = [];
_cfg = (configFile >> "CfgVehicles");
for "_i" from 0 to ((count _cfg)-1) do 
	{
	if (isClass ((_cfg select _i) ) ) then 
		{
		_cfgName = configName (_cfg select _i);
		if ( (_cfgName isKindOf "plane") && (getNumber ((_cfg select _i) >> "scope") == 2) ) then 
			{
			tpw_air_planetypes set [count tpw_air_planetypes,_cfgname];
			};
		};
	};	
	
/*
tpw_air_helitypes = [];
tpw_air_extrahelis = [
"ADF_S70A_BASE_F",
"UH1H",
"UH1Y",
"UH60M",
"UH60M_MEV",
"AH1Z",
"AH64D",
"CH_47F",
"B_Heli_Attack_01_F",
"B_Heli_Light_01_armed_F",
"B_Heli_Light_01_F",
"B_Heli_Transport_01_camo_F",
"B_Heli_Transport_01_F",
"civ_ka60_whiteblue",
"civ_md500_blueline",
"civ_md500_sunset",
"civ_md500_urban",
"civ_mohawk_dahoman",
"civ_mohawk_ion",
"I_Heli_light_03_F",
"I_Heli_light_03_unarmed_F",
"O_Heli_Attack_02_black_F",
"O_Heli_Attack_02_F",
"O_Heli_Light_02_F",
"O_Heli_Light_02_unarmed_F"
];	


tpw_air_planetypes = [];
tpw_air_extraplanes = [
"B_Plane_CAS_01_F",
"O_Plane_CAS_02_F",
"I_Plane_Fighter_03_AA_F",
"I_Plane_Fighter_03_CAS_F",
"Peral_A10C", 
"globemaster_c17_nato",
"C130J",
"F35B_AA",
"F35B_CAS",
"JS_JC_FA18E",
"JS_JC_FA18F",
"JS_JC_SU35",
"T6A",
"GNT_C185",
"yak42"
];


// Only spawn available planes
	{
	if (isClass (configFile >> "cfgVehicles" >> _x)) then
		{
		tpw_air_planetypes = tpw_air_planetypes + [_x];
		};

	} foreach tpw_air_extraplanes;
	
// Only spawn available helis
	{
	if (isClass (configFile >> "cfgVehicles" >> _x)) then
		{
		tpw_air_helitypes = tpw_air_helitypes + [_x];
		};

	} foreach tpw_air_extrahelis;
*/

tpw_air_heights = [50,250,500];

tpw_air_speeds = ["NORMAL","FULL"];

// HELI SPAWN
tpw_air_fnc_heli =
	{
	private ["_pos","_px","_py","_pxoffset","_pyoffset","_dir","_dist","_startx","_endx","_starty","_endy","_startpos","_endpos","_heli","_height","_speed"];
	_pos = position (_this select 0);
	_px = _pos select 0;
	_py = _pos select 1;
	
	// Offset so that aircraft doesn't necessarily fly straight over the top of whatever called this function
	_pxoffset = random 2000;
	_pyoffset = random 2000;
	
	// Pick a random direction and distance to spawn
	_dir = random 360;
	_dist = 5000 + (random 5000);
	
	// Calculate start and end positions of flyby
	_startx = _px + (_dist * sin _dir) + _pxoffset;
	_endx = _px - (_dist * sin _dir) + _pxoffset;
	_starty = _py + (_dist * cos _dir) + _pyoffset;
	_endy = _py - (_dist * cos _dir) + _pyoffset;
	_startpos = [_startx,_starty,0];
	_endpos = [_endx,_endy,0];
	
	// Pick random heli, height and speed
	_heli = tpw_air_helitypes select (floor (random (count tpw_air_helitypes)));
	_height = tpw_air_heights select (floor (random (count tpw_air_heights)));
	_speed = tpw_air_speeds select (floor (random (count tpw_air_speeds)));
	
	// Flyby
	[_startpos,_endpos, _height + (random _height),_speed,_heli,CIVILIAN] spawn bis_fnc_ambientflyby;
	tpw_air_count = tpw_air_count + 1;
	publicvariable "tpw_air_count";
	};
	
// JET SPAWN	
tpw_air_fnc_plane =
	{
	private ["_pos","_px","_py","_pxoffset","_pyoffset","_dir","_dist","_startx","_endx","_starty","_endy","_startpos","_endpos","_height","_speed"];
	_pos = position (_this select 0);
	_px = _pos select 0;
	_py = _pos select 1;
	
	// Offset so that aircraft doesn't necessarily fly straight over the top of whatever called this function
	_pxoffset = random 2000;
	_pyoffset = random 2000;
	
	// Pick a random direction and distance to spawn
	_dir = random 360;
	_dist = 5000 + (random 5000);
	
	// Calculate start and end positions of flyby
	_startx = _px + (_dist * sin _dir) + _pxoffset;
	_endx = _px - (_dist * sin _dir) + _pxoffset;
	_starty = _py + (_dist * cos _dir) + _pyoffset;
	_endy = _py - (_dist * cos _dir) + _pyoffset;
	_startpos = [_startx,_starty,0];
	_endpos = [_endx,_endy,0];
	
	// Pick random plane, speed and height
	_plane = tpw_air_planetypes select (floor (random (count tpw_air_planetypes)));
	_height = tpw_air_heights select (floor (random (count tpw_air_heights)));
	_speed = tpw_air_speeds select (floor (random (count tpw_air_speeds)));
	
	// Flyby
	[_startpos,_endpos,  _height + (random _height),_speed,_plane,CIVILIAN] spawn bis_fnc_ambientflyby;
	tpw_air_count = tpw_air_count + 1;
	publicvariable "tpw_air_count";
	};	
	
// RUN IT
sleep random tpw_air_delay;

[] spawn 
{	
while {true} do 
	{
	sleep (random tpw_air_time);
	_air = (position player) nearEntities [["air"], 1000];
	if (tpw_air_active && count _air < tpw_air_max) then 
		{
		[player] call tpw_air_fnc_heli;
		};

	};
};	

[] spawn 
{	
while {true} do 
	{
	sleep (random tpw_air_time);
	_air = (position player) nearEntities [["air"], 1000];
	if (tpw_air_active && count _air < tpw_air_max) then 
		{
		[player] call tpw_air_fnc_plane;
		};

	};
};	

while {true} do
	{
	// dummy loop so script doesn't terminate
	sleep 10;
	};