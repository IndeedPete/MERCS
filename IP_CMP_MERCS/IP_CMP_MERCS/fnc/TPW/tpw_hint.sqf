// UNIFIED STARTUP HINT FOR TPW MODS

sleep 10;
0 = [] spawn 
	{
	private ["_hint","_hintsleep"];
	_hintsleep = 0;
	_hint = "<t color='#cc9900'>TPW MODS active:</t> ";
	if !(isnil "tpw_air_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>AIR %2",_hint,tpw_air_version]};		
	if !(isnil "tpw_animal_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>ANIMALS %2",_hint,tpw_animal_version]};
	if !(isnil "tpw_bleedout_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>BLEEDOUT %2",_hint,tpw_bleedout_version]};
	if !(isnil "tpw_boat_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>BOATS %2",_hint,tpw_boat_version]};
	if !(isnil "tpw_car_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>CARS %2",_hint,tpw_car_version]};
	if !(isnil "tpw_civ_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>CIVS %2",_hint,tpw_civ_version]};
	if !(isnil "tpw_ebs_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>EBS %2",_hint,tpw_ebs_version]};
	if !(isnil "tpw_fall_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>FALL %2",_hint,tpw_fall_version]};
	if !(isnil "tpw_fog_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>FOG %2",_hint,tpw_fog_version]};
	if !(isnil "tpw_houselights_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>HOUSELIGHTS %2",_hint,tpw_houselights_version]};
	if !(isnil "tpw_hud_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>HUD %2",_hint,tpw_hud_version]};
	if !(isnil "tpw_los_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>LOS %2",_hint,tpw_los_version]};
	if !(isnil "tpw_park_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>PARK %2",_hint,tpw_park_version]};
	if !(isnil "tpw_radio_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>RADIO %2",_hint,tpw_radio_version]};
	if !(isnil "tpw_rain_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>RAINFX %2",_hint,tpw_rain_version]};
	if !(isnil "tpw_streetlights_version") then {_hintsleep = _hintsleep + 1;_hint = format ["%1<br/>STREETLIGHTS %2",_hint,tpw_streetlights_version]};
	hintsilent parsetext format ["<t size = '0.9'> %1</t>",_hint];
	sleep _hintsleep;
	hintsilent "";
	};	

while {true} do
	{
	// dummy loop so script doesn't terminate
	sleep 10;
	};	