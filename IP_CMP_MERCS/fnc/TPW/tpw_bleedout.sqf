/*
TPW BLEEDOUT
Author: tpw
Version: 1.11
Date: 20140419
Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works. 	

To use: 
1 - Save this script into your mission directory as eg tpw_bleedout.sqf
2 - Call it with 0 = [5,0.4,0.6,0.8] execvm "tpw_bleedout.sqf"; where 5 = damage increment, 0.4 = crouch threshold, 0.6 = prone threshold, 0.8 incapacitation threshold
	
THIS SCRIPT WON'T RUN ON DEDICATED SERVERS
*/

if (isDedicated) exitWith {};
if (count _this  < 4) exitwith {hint "TPW BLEEDOUT incorrect/no config, exiting."};
//if !(isnil "tpw_bleedout_active") exitwith {hint "TPW BLEEDOUT already running."};
WaitUntil {!isNull FindDisplay 46};

//VARIABLES
tpw_bleedout_version = "1.11"; // Version string
tpw_bleedout_inc = _this select 0 ; // Damage increment. The percentage a bleeding unit's damage will increase by each 10 sec. 1% will take 10+ minutes to bleed out
tpw_bleedout_cthresh = _this select 1; // Damage beyond which a unit will be forced into crouch
tpw_bleedout_pthresh = _this select 2; // Damage beyond which a unit will be forced into prone
tpw_bleedout_ithresh = _this select 3; // Damage beyond which a unit will writhe around incapacitated
tpw_bleedout_inc = tpw_bleedout_inc / 100; // concert percentage damage to 0-1 value
tpw_bleedout_active = true; // global enable/disable

// Stance arrays for each weapon
tpw_bleedout_standarray = ["AmovPercMstpSrasWnonDnon","AmovPercMstpSrasWpstDnon","AmovPercMstpSrasWrflDnon","AmovPercMstpSrasWlnrDnon"];
tpw_bleedout_croucharray = ["AmovPknlMstpSrasWnonDnon","AmovPknlMstpSrasWpstDnon","AmovPknlMstpSrasWrflDnon","AmovPknlMstpSrasWlnrDnon"];
tpw_bleedout_pronearray = ["AmovPpneMstpSrasWnonDnon","AmovPpneMstpSrasWpstDnon","AmovPpneMstpSrasWrflDnon","AmovPpneMstpSrasWlnrDnon"];

// WRITHING
tpw_bleedout_fnc_writhe = 
	{
	private ["_unit"];
	_unit = _this select 0;
	_unit setunitpos "down";
	sleep 3;
	_unit playmove "AinjPpneMstpSnonWrflDnon_rolltoback";
	sleep 3;
	_unit setvariable ["tpw_bleedout_writhe",1];
	_unit setdir ((getdir _unit) + 145);
	_unit switchmove "acts_InjuredLookingRifle01";
	_unit disableai "anim";
	};	

// STOP WRITHING
tpw_bleedout_fnc_unwrithe = 
	{
	private ["_unit"];
	_unit = _this select 0;		
	_unit setvariable ["tpw_bleedout_writhe",0];
	_unit setdir ((getdir _unit) - 145);
	_unit enableai "anim";
	_unit switchmove "AinjPpneMstpSnonWnonDnon_rolltofront";
	_unit playmove "";
	[_unit] call tpw_core_fnc_weptype;
	_unit playmove (tpw_bleedout_standarray select (_unit getvariable "tpw_core_weptype"));
	_unit setunitpos "auto";
	};	
	
// HEALED
tpw_bleedout_fnc_healed =
	{
	private ["_unit"];
	_unit = _this select 0;
	_unit setBleedingRemaining 0; 
	_unit setvariable ["tpw_bleedout_damage",damage _unit];
	sleep (10 + random 10);
	if (_unit getvariable ["tpw_bleedout_writhe",0] == 1) then 
		{
		[_unit] spawn tpw_bleedout_fnc_unwrithe;
		} else
		{
		if (_unit != player) then
			{
			[_unit] call tpw_core_fnc_weptype;
			_unit playmove (tpw_bleedout_standarray select (_unit getvariable "tpw_core_weptype"));
			_unit setunitpos "auto";
			};
		};
	};
	

// MAIN LOOP
while {true} do
	{
	private ["_dam"];
		{
		// Add eventhandler for when unit is healed
		if (_x getvariable ["tpw_bleedout_healeh",0] == 0) then
			{
			_x addeventhandler ["handleheal",{[_this select 0] spawn tpw_bleedout_fnc_healed}];
			_x setvariable ["tpw_bleedout_healeh",1];
			};
		
		// If unit is bleeding:
		if (alive _x && {isbleeding _x}) then 
			{
			// Increase unit damage and fatigue, keep them bleeding
			_dam = (damage _x) + (tpw_bleedout_inc * damage _x);
			if ((_x getvariable ["tpw_bleedout_nodeath",0] == 1) && (_dam > 0.99)) then
				{
				_dam = damage _x;
				};
			_x setdamage _dam;
			_x setfatigue  _dam;
			_x setvariable ["tpw_bleedout_damage", _dam];
			_x setBleedingRemaining 60; 
			
			// Injured behaviours for AI
			if (_x != player) then 
				{
				// Stay crouched
				if (damage _x > tpw_bleedout_cthresh) then 
					{
					if (stance _x != "PRONE") then 
						{
						_x setunitpos "middle";
						[_x] call tpw_core_fnc_weptype;
						_x playmove (tpw_bleedout_croucharray select (_x getvariable "tpw_core_weptype"));
						};
					_x setSpeedMode "LIMITED";
					};
				// Stay prone	
				if (damage _x > tpw_bleedout_pthresh) then 	
					{
					_x setunitpos "down";
					[_x] call tpw_core_fnc_weptype;
					_x playmove (tpw_bleedout_pronearray select (_x getvariable "tpw_core_weptype"));
					_x setSpeedMode "LIMITED";
					};
				// Writhe around immobile		
				if (damage _x > tpw_bleedout_ithresh && (_x getvariable ["tpw_bleedout_writhe",0] == 0)) then 
					{
					[_x] spawn tpw_bleedout_fnc_writhe; 
					};
				};
			};	
		} foreach allunits;
		
		//Stop dead units from writhing	
		{
		if (_x getvariable "tpw_bleedout_writhe" == 1) then 
			{
			_x setdir ((getdir _x) - 145);
			_x switchmove "AinjPpneMstpSnonWrflDnon_rolltofront";
			_x setvariable ["tpw_bleedout_writhe",0];
			};
		} foreach alldead;
		sleep 10;
	};
