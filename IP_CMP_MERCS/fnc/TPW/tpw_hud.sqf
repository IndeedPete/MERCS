/* 
TPW HUD - Realistic Heads Up Display for Tactical Goggles
Author: tpw 
Date: 20140423
Version: 1.17
 
Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.   

To use: 
1 - Save this script into your mission directory as eg tpw_hud.sqf
2 - Call it with 0 = 
[
[50,500], // min/max range of goggles
[0.5,1,0], // HUD and friendly units colour
[1,0.2,0], // enemy units colour
[1,0.6,0], // squad colour
0.6, // initial HUD brightness
[1,0.4,0.4,0.025], // ASL where 1 = active ( 0 = inactive), 0.4 = X position, 0.4 = Y position, 0.025 = text size
[1,0.5,0.4,0.025], // AZT 
[1,0.6,0.4,0.025], // GRD 
[1,0.4,0.5,0.025], // LMT 
[1,0.6,0.5,0.025], // TMP 
[1,0.4,0.6,0.025], // HLT 
[1,0.5,0.6,0.025], // RNG 
[1,0.6,0.6,0.025], // VEL 
[1,1,0.25,0.5], // UNITS where 1 = active ( 0 = inactive), 1 = icon max size, 0.25 = icon min size, 0.5 = text size ( 1 = same size as HUD text)
[0.03,0], //HUD offset [x,y] -1 to 1 
1, // HUD scale. > 1 = larger
1, // text scale. > 1 = larger
1 // HUD distance degradation. 0 = no degradation
] execvm "tpw_hud.sqf"; 

THIS SCRIPT WON'T RUN ON DEDICATED SERVERS.
*/

if (isDedicated) exitWith {};
WaitUntil {!isNull FindDisplay 46};
//if !(isnil "tpw_hud_active") exitwith {hint "TPW HUD already running."};
if (count _this < 18) exitwith {hint "TPW HUD incorrect/no config, exiting."};

//VARIABLES
tpw_hud_version = "1.17";
tpw_hud_range = _this select 0;
tpw_hud_colour = _this select 1; // HUD and friendlies
tpw_hud_enemycolour = _this select 2; // enemies
tpw_hud_squadcolour = _this select 3; // squad and waypoints
tpw_hud_alpha = _this select 4; // initial HUD brightness
tpw_hud_asl = _this select 5; // ASL
tpw_hud_azt = _this select 6; // AZT
tpw_hud_grd = _this select 7; // GRD
tpw_hud_lmt = _this select 8; // LMT
tpw_hud_tmp = _this select 9; // TMP
tpw_hud_hlt = _this select 10; // HLT
tpw_hud_rng = _this select 11; // RNG
tpw_hud_vel = _this select 12; // VEL
tpw_hud_unit = _this select 13; // UNITS
tpw_hud_offset = _this select 14; // offset
tpw_hud_scale = _this select 15; // scale
tpw_hud_textscale = _this select 16; // text scale
tpw_hud_degradation = _this select 17; // HUD degradation

// DEFAULT HUD ELEMENT LAYOUT (SCRIPT VERSION)
tpw_hud_asl_txt = "%1<t size='0.5'><br />ASL</t>";
tpw_hud_azt_txt = "%1<t size='0.5'><br />AZT %2</t>";
tpw_hud_grd_txt = "%1<t size='0.5'><br />GRD</t>";
tpw_hud_lmt_txt = "%1%2<t size='0.5'><br />LMT</t>";
tpw_hud_tmp_txt = "%1<t size='0.5'><br />TMP</t>";
tpw_hud_hlt_txt = "%1<t size='0.5'><br />HLT</t>";
tpw_hud_rng_txt = "%1<t size='0.5'><br />RNG</t>";
tpw_hud_vel_txt = "%1<t size='0.5'><br />VEL</t>";
tpw_hud_airvel_txt = "%1<t size='0.5'><br />VEL KTS</t>";

// GRAB HUD ELEMENT LAYOUT VALUES FROM CONFIG (IF ADDON VERSION ACTIVE)
if ((getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_active")) == 1) then
	{ 
	tpw_hud_asl_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_asl_txt");
	tpw_hud_azt_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_azt_txt");
	tpw_hud_grd_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_grd_txt");
	tpw_hud_lmt_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_lmt_txt");
	tpw_hud_tmp_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_tmp_txt");
	tpw_hud_hlt_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_hlt_txt");
	tpw_hud_rng_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_rng_txt");
	tpw_hud_vel_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_vel_txt");
	tpw_hud_airvel_txt = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_airvel_txt");
	};

// INITIAL VARIABLES	
tpw_hud_eh=false;
tpw_hud_active=true;
tpw_hud_params =[tpw_hud_asl,tpw_hud_azt,tpw_hud_grd,tpw_hud_lmt,[0,0,0,0],tpw_hud_tmp,tpw_hud_hlt,tpw_hud_rng,tpw_hud_vel];
tpw_hud_offset_x = tpw_hud_offset select 0;
tpw_hud_offset_y = tpw_hud_offset select 1;
tpw_hud_minrange = tpw_hud_range select 0;
tpw_hud_maxrange = tpw_hud_range select 1;
tpw_hud_markers = [];
tpw_hud_gogglewearers = [];
tpw_hud_nearunits = [];

// ACTIVATE HUD FUNCTIONS
sleep 1;
tpw_hud_fnc_activate =
	{
	tpw_hud_shortfunc = []; // functions for the short loop
	tpw_hud_longfunc = []; // functions for the long loop

	if ((tpw_hud_unit select 0) == 1) then
		{
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_unitprepare];
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_unitshow];
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_markerscan];
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_gogglecheck]; 
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_mapmarkers];
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_unitscan]; 		
		if (tpw_hud_degradation == 1) then
			{
			tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_effectiveness];
			};
		};	
	if ((tpw_hud_asl select 0) == 1) then
		{
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_asl];
		};
	if ((tpw_hud_azt select 0) == 1) then
		{
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_azt];
		};
	if ((tpw_hud_grd select 0) == 1) then
		{
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_grd];
		};
	if ((tpw_hud_lmt select 0) == 1) then
		{
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_lmt];
		};	
	if ((tpw_hud_tmp select 0) == 1) then
		{
		if (!isnil "tpw_fog_active") then
			{
			waituntil {!isnil "tpw_fog_temp"};
			tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_tmp];
			};
		};	
	if ((tpw_hud_hlt select 0) == 1) then
		{
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_hlt];
		};	
	if ((tpw_hud_rng select 0) == 1) then
		{
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_rng];
		};	
	if ((tpw_hud_vel select 0) == 1) then
		{
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_vel];
		};
	};	
	
// ADJUST BRIGHTNESS
tpw_hud_fnc_brightness =
	{
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call tpw_hud_fnc_keydown"];
	tpw_hud_lastchange = time; 
	tpw_hud_fnc_keydown = 
		{
		private["_ctrl","_key"];
		_key = _this select 1;
		_ctrl = _this select 3;
		if ((_ctrl) && {_key == 35} && {time > tpw_hud_lastchange}) then 
			{
			tpw_hud_lastchange = time + 0.2;
			tpw_hud_alpha = tpw_hud_alpha + 0.1;
			if (tpw_hud_alpha > 1) then
				{
				tpw_hud_alpha = 0;
				};
			
			// Reset HUD for good measure
			[] call tpw_hud_fnc_reset;		
			};
		};	
	};	

// CHECK FOR PLAYER ADDED MAP MARKERS
tpw_hud_fnc_mapmarkers = 
	{
	private ["_marker","_markers_temp"];
	_markers_temp = [];
	for "_ct" from 0 to (count allMapMarkers - 1) do
		{
		_marker = allmapmarkers select _ct;
		if (getmarkertype _marker == "hd_objective" && {["!!",markerText _marker] call bis_fnc_instring}) then
			{
			_markers_temp set [count _markers_temp,_marker];
			};
		} forEach allMapMarkers;	
	tpw_hud_markers = _markers_temp;
	};
		
// GET MARKER INFO FOR DISPLAY	
tpw_hud_fnc_markerscan =
	{
	private ["_pos","_dist","_scale","_text","_marker","_markerarray_temp"];
	_markerarray_temp = [];
	for "_ct" from 0 to (count tpw_hud_markers - 1) do
		{
		_marker = tpw_hud_markers select _ct;
		_pos = getmarkerpos _marker;
		_dist = format ["%1m",round (player distance _pos)];
		_scale = (tpw_hud_maxiconsize) - (round (player distance _pos) / 200);
		_text = [markerText _marker, "!!", ""] call CBA_fnc_replace;
		if (_text != "") then
			{
			_dist = _text + " " + _dist;
			};
		if (_scale < (tpw_hud_miniconsize)) then
			{
			_scale = tpw_hud_miniconsize;
			};
		if (player distance _pos > tpw_hud_minrange) then
			{
			_markerarray_temp set [count _markerarray_temp,[_pos,_dist,_scale]];
			};
		};	
	tpw_hud_markerarray = _markerarray_temp;
	};	

// PREPARE UNITS FOR DISPLAY
tpw_hud_fnc_unitprepare =
	{
	private ["_dist","_unit","_diff","_scale","_stance","_height","_angle","_visible_temp","_invisible_temp","_squadmem","_colour","_status"];

	// Temp arrays for display 
	_visible_temp = [];
	_hidden_temp = [];
	_unsure_temp = [];
	
	// Assign units to visible/hidden/unsure array	
	for "_ct" from 0 to (count tpw_hud_nearunits - 1) do
		{
		_status = "hidden";
		_unit = tpw_hud_nearunits select _ct;
			
		// HUD icon scale
		_scale = tpw_hud_maxiconsize - (round (player distance _unit) / 200);
		if (_scale < tpw_hud_miniconsize) then
			{
			_scale = tpw_hud_miniconsize;
			};
		_unit setvariable ["tpw_hud_scale",_scale];	
					
		// Is unit visible to anyone in squad wearing tac goggles?
		for "_ct" from 0 to (count tpw_hud_gogglewearers - 1) do
			{
			_squadmem = tpw_hud_gogglewearers select _ct;
			// Squad member has line of sight to unit
			if (!lineintersects [eyepos _squadmem, eyepos _unit,vehicle _unit,vehicle _squadmem] && !terrainintersect [asltoatl eyepos _squadmem, asltoatl eyepos _unit]) exitwith 
				{
				_status = "visible";
		
				// Simulate reduced HUD effectiveness
				if (tpw_hud_degradation == 1 && {_unit getvariable ["tpw_hud_dropout",0] > time}) then
					{
					_status= "unsure";
					}; 
				};
			};
		
		// Colour for HUD display
		_colour = _unit getvariable ["tpw_hud_unitrgb",[0,0,0]];		
		
		switch _status do
			{
			case "visible":
				{
				// Stance - HUD diamond will rotate according to stance
				_stance = stance _unit;
				switch _stance do
					{
					case "STAND": 
						{
						_angle = 0;
						_height = 1.25;
						};
					case "CROUCH": 
						{
						_angle = 60;
						_height = 0.75;
						};
					case "PRONE": 
						{
						_angle = 90;
						_height = 0.25;
						};
					case "UNDEFINED": 
						{
						_angle = 0;
						_height = 0;
						};
					default 
						{
						_angle = 0;
						_height = 0;
						};	
					};
				_unit setvariable ["tpw_hud_distance", format ["%1m",round (player distance _unit)]];	
				_unit setvariable ["tpw_hud_angle",_angle];
				_unit setvariable ["tpw_hud_height",_height];
				_unit setvariable ["tpw_hud_lasttime",time + 30];
				_unit setvariable ["tpw_hud_unitcolour",(_colour + [tpw_hud_alpha])];
				_visible_temp set [count _visible_temp, _unit]; // move to visible units array				
				};
			case "unsure":
				{
				_unit setvariable ["tpw_hud_unitcolour",(_colour + [tpw_hud_alpha*0.5])];	
				_unsure_temp set [count _unsure_temp, _unit]; // move to unsure units array
				};
			case "hidden":
				{
				if (_unit getvariable "tpw_hud_lasttime" > time) then 
					{
					_unit setvariable ["tpw_hud_unitcolour",(_colour + [tpw_hud_alpha])];	
					_unit setvariable ["tpw_hud_lastseen",format ["%1m %2s",round (player distance (_unit getvariable "tpw_hud_lastpos")),(30 - round ((_unit getvariable "tpw_hud_lasttime") - time))]];
					_hidden_temp set [count _hidden_temp, _unit];	// move to hidden units array
					};
				};				
			};
		};
	tpw_hud_visible = _visible_temp;
	tpw_hud_hidden = _hidden_temp;
	tpw_hud_unsure = _unsure_temp;	
	};

// SHOW SCANNED UNITS ON HUD
tpw_hud_fnc_unitshow =
	{
	// Start PFEH
	tpw_hud_eh = true;
	["tpw_hud","oneachframe",
		{
		private ["_ipos","_pos","_dist","_scale","_xpos","_ypos","_zpos","_marker","_unit"];

		//Show markers
		for "_ct" from 0 to (count tpw_hud_markerarray - 1) do	
			{
			_marker = tpw_hud_markerarray select _ct;
			_ipos = _marker select 0;
			_dist = _marker select 1;
			_scale = _marker select 2;
			drawIcon3D ["\tpw_hud\unit_half.paa",(tpw_hud_squadcolour + [tpw_hud_alpha]),_ipos,_scale,_scale,0,_dist,0,tpw_hud_unittextsize, "PuristaBold"]; 
			};
			
		// Show visible units
		for "_ct" from 0 to (count tpw_hud_visible - 1) do	
			{
			_unit = tpw_hud_visible select _ct;
			_pos = visibleposition _unit;
			_xpos = _pos select 0;
			_ypos = _pos select 1;
			_zpos =(_pos select 2) + (_unit getvariable "tpw_hud_height");
			_unit setvariable ["tpw_hud_lastpos",[_xpos,_ypos,_zpos]];
			drawIcon3D [(_unit getvariable ["tpw_hud_visicon",""]),(_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]), [_xpos,_ypos,_zpos], (_unit getvariable ["tpw_hud_scale",0]), (_unit getvariable ["tpw_hud_scale",0]),(_unit getvariable ["tpw_hud_angle",0]),(_unit getvariable ["tpw_hud_distance",""]),0,tpw_hud_unittextsize , "PuristaBold"]; 
			};
			
		// Show units hidden less than 30 sec
		for "_ct" from 0 to (count tpw_hud_hidden - 1) do	
			{			
			_unit = tpw_hud_hidden select _ct;
			drawIcon3D [(_unit getvariable ["tpw_hud_hidicon",""]), (_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]),(_unit getvariable ["tpw_hud_lastpos",[0,0,0]]), (_unit getvariable ["tpw_hud_scale",0]), (_unit getvariable ["tpw_hud_scale",0]), 180,(_unit getvariable ["tpw_hud_lastseen",""]),0,tpw_hud_unittextsize, "PuristaBold"]; 
			};
			
		// Show units HUD has incomplete data on 
		for "_ct" from 0 to (count tpw_hud_unsure - 1) do	
			{			
			_unit = tpw_hud_unsure select _ct;
			drawIcon3D [(_unit getvariable ["tpw_hud_visicon",""]),(_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]),(_unit getvariable ["tpw_hud_lastpos",[0,0,0]]), (_unit getvariable ["tpw_hud_scale",0]), (_unit getvariable ["tpw_hud_scale",0]),(_unit getvariable ["tpw_hud_angle",0]),(_unit getvariable ["tpw_hud_distance",""]),0,tpw_hud_unittextsize, "PuristaBold"]; 
			};	
		}
	] call BIS_fnc_addStackedEventHandler;	
	};		
	
// SET DISPLAY PARAMETERS FOR EACH HUD CONTROL
tpw_hud_fnc_displayparams =
	{
	private ["_display","_param","_ctrl","_xpos","_ypos","_diff","_size"];
	disableSerialization; 
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY"; 
	for "_i" from 0 to (count tpw_hud_params - 1) do
		{
		_param = tpw_hud_params select _i;
		_ctrl = _display displayctrl (100001 + _i);
		_xpos = (_param select 1);
		_ypos = (_param select 2);

		// Scale
		if (_xpos < 0.5) then
			{
			_diff = 0.5 - _xpos;
			_xpos = 0.5 - (_diff * tpw_hud_scale);
			};
		if (_xpos > 0.5) then		
			{
			_diff = _xpos - 0.5;
			_xpos = 0.5 + (_diff * tpw_hud_scale);
			};
		if (_ypos < 0.5) then
			{
			_diff = 0.5 - _ypos;
			_ypos = 0.5 - (_diff * tpw_hud_scale);
			};
		if (_ypos > 0.5) then		
			{
			_diff = _ypos - 0.5;
			_ypos = 0.5 + (_diff * tpw_hud_scale);
			};			
	
		// Apply offset	
		_xpos = _xpos + tpw_hud_offset_x;
		_ypos = _ypos + tpw_hud_offset_y;
		
		// Resolution correction
		_xpos = _xpos * safezoneW + safezoneX;
		_ypos = _ypos * safezoneW + safezoneX;
		_size = (_param select 3) * tpw_hud_textscale;

		// Update control
		_ctrl ctrlsetposition [_xpos,_ypos];
		_ctrl ctrlsetscale _size;
		_ctrl ctrlcommit 0;
		}; 
	tpw_hud_maxiconsize = tpw_hud_unit select 1;
	tpw_hud_miniconsize = tpw_hud_unit select 2;
	tpw_hud_unittextsize = (0.03 / (getResolution select 5)) *(tpw_hud_unit select 3) *tpw_hud_textscale
	};
	
// AZIMUTH
tpw_hud_fnc_azt = 
	{
	private ["_azt","_ang","_points","_num","_compass"];
	_azt = (((eyedirection player) select 0) atan2 ((eyedirection player) select 1));
	_ang = _azt;
	if (_azt < 0) then 
		{
		_azt = 360 + _azt;
		};
	_ang = _ang + 11.25; 
	if (_ang < 0) then 
		{
		_ang = 360 + _ang;
		};
	
	_points = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
	_num = floor (_ang / 22.5);
	_compass = _points select _num;		
	_ctrl_azt ctrlSetStructuredText parseText format [tpw_hud_azt_txt,_compass,round _azt];
	};
	
// ASL
tpw_hud_fnc_asl = 
	{
	private ["_asl"];
	_asl = round ((getposasl player) select 2);
	_ctrl_asl ctrlSetStructuredText parseText format [tpw_hud_asl_txt,_asl];
	};	
	
// SPEED
tpw_hud_fnc_vel = 
	{
	private ["_vel"];
	_vel = round (speed vehicle player);
	if (vehicle player iskindof "air") then
		{
		_vel = round (_vel * 0.53995);
		_ctrl_vel ctrlsetstructuredtext parsetext format [tpw_hud_airvel_txt,_vel];
		}else
		{
		_ctrl_vel ctrlsetstructuredtext parsetext format [tpw_hud_vel_txt,_vel];
		};
	};
				
// RANGE
tpw_hud_fnc_rng = 
	{
	private ["_objects","_rng"];
	_objects = lineintersectsobjs [(eyepos player),(atltoasl screentoworld [0.5,0.5]),(vehicle player),objnull,false,2];
	_rng = 0;
	if (count _objects > 0) then
		{
		_obj = _objects select 0;
		_rng = round (player distance _obj);
		}else
		{
		_rng = round (player distance (screentoworld [0.5,0.5]));
		};
	if (_rng > 1800 || _rng < 10) then
		{
		_rng = "---";
		};
	_ctrl_rng ctrlsetstructuredtext parsetext format [tpw_hud_rng_txt,_rng];
	};	

// GPS POS
tpw_hud_fnc_grd =
	{
	private ["_grd"];	
	_grd = mapGridPosition (position player);
	_ctrl_grd ctrlsetstructuredtext parsetext format [tpw_hud_grd_txt,_grd];
	};

// TEMPERATURE
tpw_hud_fnc_tmp =
	{
	private ["_tmp"];	
	_tmp = round tpw_fog_temp;
	_ctrl_tmp ctrlsetstructuredtext parsetext format [tpw_hud_tmp_txt,_tmp];
	};

// HEALTH
tpw_hud_fnc_hlt =
	{
	private ["_hlt"];
	_hlt = round (100 * (1 - damage player));
	_ctrl_hlt ctrlsetstructuredtext parsetext format [tpw_hud_hlt_txt,_hlt];
	};

// TIME	
tpw_hud_fnc_lmt =
	{
	private ["_h","_m"];	
	_h = date select 3;
	_m = date select 4;
	if (_h < 10) then 
		{
		_h = format ["0%1",_h];
		};
	if (_m < 10) then 
		{
		_m = format ["0%1",_m];
		};			
	_ctrl_lmt ctrlsetstructuredtext parsetext format [tpw_hud_lmt_txt,_h,_m];
	};	

// EFFECTIVENESS OF HUD REDUCED AT NIGHT, IN RAIN, IN FOG, PRONE UNITS
tpw_hud_fnc_effectiveness =
	{
	private ["_unit","_dist","_dropout","_thresh","_uthresh"];
	_thresh = 8;
	if (tpw_core_sunangle < 0) then 
		{
		_thresh = _thresh / 2;
		};
	if (rain > 0.2 || fog > 0.2 ) then 
		{
		_thresh = _thresh / 2;
		};
	
	for "_ct" from 0 to (count tpw_hud_nearunits - 1) do 
		{
		_unit = tpw_hud_nearunits select _ct;
		_dist = _unit distance player;
		
		if (stance _unit == "PRONE") then
			{
			_uthresh = _thresh / 2;
			} else
			{
			_uthresh = _thresh;
			}; 
		if (vehicle _unit != _unit) then
			{
			_uthresh = _thresh * 20;
			};
			
		// Magic formula to determine likelihood of unit not being detected properly 	
		if (random _uthresh < (_dist / tpw_hud_maxrange) ^ 2) then
			{
			_dropout = time + random (_dist / 100);
			_unit setvariable ["tpw_hud_dropout",_dropout];	// how long till unit is fully visible again
			};
		};
	};	

// GOGGLES/UAV CHECK
tpw_hud_fnc_gogglecheck = 
	{
	_tempgoggles = [];
	for "_ct" from 0 to (count (units group player) - 1) do
		{
		_unit = (units group player) select _ct;
		if ((goggles _unit) in ["G_Tactical_Black", "G_Tactical_Clear"]) then
			{
			_tempgoggles set [count _tempgoggles,_unit];
			};
		if (!isnull getconnecteduav _unit) then
			{
			_tempgoggles set [count _tempgoggles,(driver getconnecteduav _unit)];
			};
		};
	tpw_hud_gogglewearers = _tempgoggles;
	};
	
// SCAN FOR INFANTRY AND OCCUPIED VEHICLES/STATICS, DETERMINE THEIR COLOUR
tpw_hud_fnc_unitscan =
	{
	private ["_colour"];
	tpw_hud_nearunits = (getpos player) nearentities [["camanbase"],tpw_hud_maxrange ]; // infantry
	tpw_hud_nearveh = (getpos player) nearentities [["landvehicle","air"],tpw_hud_maxrange + 100 ]; // air and land vehicles, static weapons
	for "_ct" from 0 to (count tpw_hud_nearveh - 1) do	
		{
		_veh = tpw_hud_nearveh select _ct;
		if (!isnull driver _veh && {alive driver _veh}) then
			{
			_unit = driver _veh;
			tpw_hud_nearunits set [count tpw_hud_nearunits,_unit];
			};
		if (!isnull gunner _veh && {alive driver _veh} && {isnull driver _veh}) then
			{
			_unit = gunner _veh;
			tpw_hud_nearunits set [count tpw_hud_nearunits,_unit];
			};	
		};
	
	// Remove close units
	for "_ct" from 0 to (count tpw_hud_nearunits - 1) do	
		{
		_unit = tpw_hud_nearunits select _ct;
		if (_unit distance player < tpw_hud_minrange) then
			{
			tpw_hud_nearunits set [_ct,-1];
			};
		};	
	tpw_hud_nearunits = tpw_hud_nearunits - [-1];	

	for "_ct" from 0 to (count tpw_hud_nearunits - 1) do 
		{
		_unit = tpw_hud_nearunits select _ct;
		
		// Icon type
		_unit setvariable ["tpw_hud_icontype", "\tpw_hud\unit.paa"];
		if (vehicle _unit == _unit) then
			{
			_unit setvariable ["tpw_hud_visicon", "\tpw_hud\unit.paa"];
			_unit setvariable ["tpw_hud_hidicon", "\tpw_hud\unit_half.paa"];
			}else
			{
			_unit setvariable ["tpw_hud_visicon", "\tpw_hud\vehicle.paa"];
			_unit setvariable ["tpw_hud_hidicon", "\tpw_hud\vehicle_half.paa"];
			};
		
		// Assign RGB according to side	
		if ((side _unit) getFriend (side player) < 0.6) then
			{
			// Enemies 
			_colour = tpw_hud_enemycolour;
			}else
			{
			// Friendlies / civs
			_colour = tpw_hud_colour;
			};
		// Squad 
		if (_unit in units (group player)) then 
			{			
			_colour = tpw_hud_squadcolour;
			};
		_unit setvariable ["tpw_hud_unitrgb",_colour];
		};
	};
	
// HUD GLITCHES
tpw_hud_fnc_glitch =
	{
	if (cameraview == "external" || !((goggles player) in ["G_Tactical_Black", "G_Tactical_Clear"])) exitwith {};
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];

	// GET DISPLAY AND CONTROLS	
	disableSerialization; 
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY"; 
	_ctrl_asl = _display displayCtrl 100001; 
	_ctrl_azt = _display displayCtrl 100002; 
	_ctrl_grd = _display displayCtrl 100003; 
	_ctrl_lmt = _display displayCtrl 100004; 
	_ctrl_ctr = _display displayCtrl 100005; 
	_ctrl_tmp = _display displayCtrl 100006; 
	_ctrl_hlt = _display displayCtrl 100007; 
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;
	
	for "_ct" from 1 to (10 + random 10) do
		{
		//HUD off
			{
			_x ctrlshow false;
			} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
		if (tpw_hud_eh) then
			{
			["tpw_hud", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			tpw_hud_eh = false;
			};
		sleep random 0.2;
		//HUD on
			{
			_x ctrlshow true;
			_x ctrlsettextcolor (tpw_hud_colour + [random 1]);
			} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];	
		if !(tpw_hud_eh) then
			{	
			[] call tpw_hud_fnc_unitshow;
			};
		sleep random 0.2;	
		};
	};
	
// HUD RESET
tpw_hud_fnc_reset = 
	{
	("TPW_HUD_Layer" call BIS_fnc_rscLayer) cuttext ["","PLAIN",0,false]; 
	("TPW_HUD_Layer" call BIS_fnc_rscLayer) cutRsc ["TPW_HUD_DIALOG","PLAIN",0,false];	
	if (!isnil "tpw_hud_handle1") then
		{
		terminate tpw_hud_handle1;
		};
	if (!isnil "tpw_hud_handle2") then
		{
		terminate tpw_hud_handle2;
		};	
	[] call tpw_hud_fnc_displayparams;
	tpw_hud_handle1 = [] spawn tpw_hud_fnc_shortloop;
	tpw_hud_handle2 = [] spawn tpw_hud_fnc_longloop;	
	};
	
// SHORT HUD UPDATE LOOP
tpw_hud_fnc_shortloop =
	{
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];
	// GET DISPLAY AND CONTROLS	
	disableSerialization; 
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY"; 
	_ctrl_asl = _display displayCtrl 100001; 
	_ctrl_azt = _display displayCtrl 100002; 
	_ctrl_grd = _display displayCtrl 100003; 
	_ctrl_lmt = _display displayCtrl 100004; 
	_ctrl_ctr = _display displayCtrl 100005; 
	_ctrl_tmp = _display displayCtrl 100006; 
	_ctrl_hlt = _display displayCtrl 100007; 
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;

	while {true} do
		{
		// Only show/update HUD if player wearing tactical goggles
		if (cameraview != "external" && {(goggles player) in ["G_Tactical_Black", "G_Tactical_Clear"]}) then 
			{
			tpw_hud_active = true;
						
			// Show HUD
				{
				_x ctrlshow true;
				_x ctrlsettextcolor (tpw_hud_colour + [tpw_hud_alpha]);
				} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];

			// Update display data
				{
				[] call _x;
				} foreach tpw_hud_shortfunc;		
			} else
			{
			tpw_hud_active = false;
			// Hide HUD
				{
				_x ctrlshow false;
				} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
				
			// Disable unit display - remove PFEH
			if (tpw_hud_eh) then
				{
				["tpw_hud", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				tpw_hud_eh = false;
				};
			};
		sleep 0.5;
		};
	};	
	
// LONG HUD UPDATE LOOP
tpw_hud_fnc_longloop = 
	{
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];
	disableSerialization; 
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY"; 
	_ctrl_asl = _display displayCtrl 100001; 
	_ctrl_azt = _display displayCtrl 100002; 
	_ctrl_grd = _display displayCtrl 100003; 
	_ctrl_lmt = _display displayCtrl 100004; 
	_ctrl_ctr = _display displayCtrl 100005; 
	_ctrl_tmp = _display displayCtrl 100006; 
	_ctrl_hlt = _display displayCtrl 100007; 
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;
	while {true} do
		{
		if (tpw_hud_active) then 
			{		
			// Update display data
				{
				[] call _x;
				} foreach tpw_hud_longfunc;	
			};
		sleep 2.5;
		};
	};	

// ADD HIT EVENTHANDLER
player addEventHandler ["Hit",{[] spawn tpw_hud_fnc_glitch}];	

// TEAM SWITCH
onteamswitch
	{
	[] call tpw_hud_fnc_reset;
	};
 	
// RUN IT
[] call tpw_hud_fnc_activate;
[] call tpw_hud_fnc_brightness;
[] call tpw_hud_fnc_reset;

// LOOP TO ENSURE SCRIPT DOESN'T TERMINATE. PERIODICALLY RESET HUD. 
while {true} do
	{
	[] call tpw_hud_fnc_reset;	
	sleep 30;
	};