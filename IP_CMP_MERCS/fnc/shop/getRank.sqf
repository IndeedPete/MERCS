private ["_unit", "_displayNameShort", "_rank", "_faction"];

_unit = [_this, 0, player, [objNull]] call BIS_fnc_param;
_displayNameShort = [_this, 1, true, [false]] call BIS_fnc_param;

_rank = if ((_unit getVariable ["IP_Rank", ""]) == "") then {
	_rank = rank _unit;
	_faction = _unit getVariable ["IP_Faction", ""];
	
	if (isClass(missionConfigFile >> "Factions" >> _faction >> "Ranks")) then {
		if (_displayNameShort) then {
			(getText(missionConfigFile >> "Factions" >> _faction >> "Ranks" >> _rank >> "displayNameShort"))
		} else {
			(getText(missionConfigFile >> "Factions" >> _faction >> "Ranks" >> _rank >> "displayName"))
		}
	} else {
		_number = switch (_rank) do {
			case "PRIVATE": {"0"};
			case "CORPORAL": {"1"};
			case "SERGEANT": {"2"};
			case "LIEUTENANT": {"3"};
			case "CAPTAIN": {"4"};
			case "MAJOR": {"5"};
			case "COLONEL": {"6"};
			case "GENERAL": {"7"};
			case default {"0"};
		};
		
		if (_displayNameShort) then {
			_tmp = (getText(configFile >> "CfgRanks" >> _number >> "displayNameShort"));
			(_tmp + ".")
		} else {
			(getText(configFile >> "CfgRanks" >> _number >> "displayName"))
		}
	}
} else {
	(_unit getVariable "IP_Rank")
};

_rank