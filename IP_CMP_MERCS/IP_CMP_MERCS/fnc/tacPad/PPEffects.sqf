_on = if (isNil "IP_MERCS_PPEffects") then {false} else {IP_MERCS_PPEffects};

IP_MERCS_PPEffects = if (_on) then {
	if (!isNil "IP_ColourCorrections") then {ppEffectDestroy IP_ColourCorrections};
	if (!isNil "IP_FilmGrain") then {ppEffectDestroy IP_FilmGrain};
	((findDisplay 40000) displayCtrl 1607) ctrlSetText "PPEffects On";
	false
} else {
	_weather = if (isNil "IP_Weather") then {"CLEAR"} else {(IP_Weather select 0)};
	
	_PPEffect = switch (_weather) do {
		case "CLEAR": {[1, 1, 0.001, [-2.08, -1.55, -1.9, 0.013],[1.69, 0.21, 0.79, 1.64],[-0.21, -1.08, 0.91, -0.09]]};
		case "RAINY": {[[1,1,0,[0.1,0.2,0.3,-0.5],[1,1,1,0.4],[0.5,0.2,0,1]], [0.04,1,1,0,1]]};
		case "FOGGY": {[1, 1.08, -0.06, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 1.0, 1.21], [0.09, 0.09, 0.09, 0.0]]};
	};
	
	if (_weather == "RAINY") then {
		IP_ColourCorrections = ppEffectCreate ["ColorCorrections", 2000];
		IP_ColourCorrections ppEffectEnable true;
		IP_ColourCorrections ppEffectAdjust (_PPEffect select 0);
		IP_ColourCorrections ppEffectCommit 0;

		IP_FilmGrain = ppEffectCreate ["FilmGrain", 2005];
		IP_FilmGrain ppEffectEnable true;
		IP_FilmGrain ppEffectAdjust (_PPEffect select 1);
		IP_FilmGrain ppEffectCommit 0;
	} else {
		IP_ColourCorrections = ppEffectCreate ["ColorCorrections", 2000];
		IP_ColourCorrections ppEffectEnable true;
		IP_ColourCorrections ppEffectAdjust _PPEffect;
		IP_ColourCorrections ppEffectCommit 0;
	};
	
	((findDisplay 40000) displayCtrl 1607) ctrlSetText "PPEffects Off";
	true
};

saveVar "IP_MERCS_PPEffects";