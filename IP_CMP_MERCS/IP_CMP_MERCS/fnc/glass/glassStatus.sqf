#define CHECK ((alive player) && (goggles player in _goggles) && (player getVariable ["IP_Glass_Boot", false]) && (player getVariable ["IP_Glass_Status", false]))

private ["_bearing", "_rate"];
_goggles = _this select 0;
65 cutRsc ["IP_DLG_GLASSSTATUS", "PLAIN"];
disableSerialization;
_display = uiNamespace getVariable "DLG_GlassStatus";

while {CHECK} do {
	_pos = getPos player;
	_bearing = getDir player;
	_fatigue = getFatigue player;
	_damage = damage player;
	_oldPulse = player getVariable ["IP_Pulse", 80];
	_oldBreathng = player getVariable ["IP_Breathing", 15];
	
	_grid = mapGridPosition _pos;
	
	if (_bearing < 0) then {_bearing = _bearing + 360};	
	_heading = switch (true) do { 
		case (_bearing <= 22.5 || _bearing > 337.5): {"N"};  
		case (_bearing > 22.5 && _bearing <= 67.5): {"NE"};  
		case (_bearing > 67.5 && _bearing <= 112.5 ): {"E"};  
		case (_bearing > 112.5 && _bearing <= 157.5): {"SE"};  
		case (_bearing > 157.5 && _bearing <= 202.5): {"S"};  
		case (_bearing > 202.5 && _bearing <= 247.5): {"SW"};  
		case (_bearing > 247.5 && _bearing <= 292.5): {"W"};  
		case (_bearing > 292.5 && _bearing <= 337.5): {"NW"};     
		default {"N"};
	};
	
	_rate = -0.25;
	
	if (_fatigue > 0) then {_rate = _rate + (_fatigue * 10)};
	if (!isNull(player findNearestEnemy player)) then {_rate = _rate + 0.5};
	if (!isNull(nearestObject [player, "BulletBase"])) then {_rate = _rate + 1};
	if (_damage > 0.7) then {_rate = _rate + 2};
	
	_pulse = if (_rate > 0) then {
		if ((_oldPulse + _rate) > 160) then {160} else {(_oldPulse + _rate)}
	} else {
		if ((_oldPulse + _rate) < 80) then {80} else {(_oldPulse + _rate)}
	};
	
	_rate = _rate / 2;
	_breathing = if (_rate > 0) then {
		if ((_oldBreathng + _rate) > 60) then {60} else {(_oldBreathng + _rate)}
	} else {
		if ((_oldBreathng + _rate) < 15) then {15} else {(_oldBreathng + _rate)}
	};
	
	player setVariable ["IP_Pulse", _pulse];
	player setVariable ["IP_Breathing", _breathing];
	
	_condition = if (_damage > 0) then {
		if (_damage > 0.7) then {
			((uiNamespace getVariable "DLG_GlassStatus") displayCtrl 1101) ctrlSetStructuredText (parseText("Condition: " + "<t color='#FFFF00'>CRITICAL</t>"));
			sleep 0.5;
			"<t color='#FF0000'>CRITICAL</t>"
		} else {
			"<t color='#FFFF00'>Wounded</t>"
		}
	} else {
		"Healthy"
	};
	
	(_display displayCtrl 1100) ctrlSetStructuredText (parseText("Grid: " + _grid));
	(_display displayCtrl 1102) ctrlSetStructuredText (parseText("Heading: " + _heading));
	(_display displayCtrl 1103) ctrlSetStructuredText (parseText("Pulse: " + str(round(_pulse)) + "/min"));
	(_display displayCtrl 1104) ctrlSetStructuredText (parseText("Breathing: " + str(round(_breathing)) + "/min"));
	(_display displayCtrl 1101) ctrlSetStructuredText (parseText("<t align='CENTER'>Condition: " + _condition + "</t>"));
	
	sleep 0.5;
};

65 cutText ["", "PLAIN"];