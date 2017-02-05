#define CHECK ((alive player) && (goggles player in _goggles) && (player getVariable ["IP_Glass_Boot", false]) && (player getVariable ["IP_Glass_Details", false]))

private "_text";	
_goggles = _this select 0;

while {CHECK} do {
	waitUntil {!isNull cursorTarget};
	if (!CHECK) exitWith {};
	_target = cursorTarget;
	_damage = damage _target;
	_picture = cursorTarget getVariable ["IP_Avatar", "Campaigns\IP_CMP_MERCS\img\defaultAvatar.jpg"];
	_faction = _target getVariable "IP_Faction";
	_faction = if (!isNil "_faction") then {("> " + (getText(missionConfigFile >> "Factions" >> _faction >> "displayNameShort")) + "<br/>")} else {""};
	_distance = round(player distance _target);
	_distanceStr = "> " + str(_distance) + "m <br/>";
	_info = _target getVariable ["IP_GlassInfo", ""];
	
	_canMove = if ((alive _target) && (!canMove _target)) then {"> <t color='#FF0000'>Immobilised</t><br/>"} else {""};
	_canFire = if ((alive _target) && (!canFire _target)) then {"> <t color='#FF0000'>Ineffective</t><br/>"} else {""};
	
	if ((_target isKindOf "MAN") && !(_target isKindOf "ANIMAL")) then {
		_name = if (alive _target) then {
			"> " + (name _target) + "<br/>"
		} else {
			getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName") + "<br/>"
		};
		
		_rankGroup = if (side _target != civilian) then {
			"> " + ([_target] call IP_fnc_getRank) + "<br/>> " + (groupID (group _target)) + "<br/>"
		} else {
			""
		};
		
		_weapon = if (primaryWeapon _target != "") then {
			"> " + (getText(configFile >> "CfgWeapons" >> (primaryWeapon _target) >> "displayName") + "<br/>")
		} else {
			if (secondaryWeapon _target != "") then {
				"> " + (getText(configFile >> "CfgWeapons" >> (secondaryWeapon _target) >> "displayName") + "<br/>")
			} else {
				""
			}
		};
		
		_status = if (alive _target) then {
			if (damage _target > 0) then {
				if (damage _target > 0.7) then {
					"> <t color='#FF0000'>Critical</t><br/><br/>"
				} else {
					"> <t color='#FFFF00'>Wounded</t><br/><br/>"
				}
			} else {
				"> Healthy<br/><br/>"
			}
		} else {"> DEAD<br/><br/>"};
		
		_text = _name + _rankGroup + _faction + _weapon + _distanceStr + _canMove + _canFire + _status + _info;
	};
	
	if ((_target isKindOf "CAR") OR (_target isKindOf "TANK") OR (_target isKindOf "AIR")) then {
		_name = if ((alive _target) && (!isNull(driver _target)) && {alive(driver _target)}) then {
			"> " + (name(driver _target)) + "<br/>"
		} else {
			getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName") + "<br/>"
		};
		
		_rankGroup = if ((side _target != civilian) && (!isNull(driver _target))) then {
			"> " + ([(driver _target)] call IP_fnc_getRank) + "<br/>> " + (groupID(group(driver _target))) + "<br/>"
		} else {
			""
		};
		
		_weapon = if ((count(weapons _target)) > 0) then {
			"> " + (getText(configFile >> "CfgWeapons" >> ((weapons _target) select 0) >> "displayName") + "<br/>")
		} else {
			""
		};
		
		_locked = if (locked _target > 1) then {"> <t color='#FF0000'>Locked</t><br/>"} else {"> Open<br/>"};
		
		_status = if (alive _target) then {
			if (damage _target > 0) then {
				if (damage _target > 0.7) then {
					"> <t color='#FF0000'>Critical</t><br/><br/>"
				} else {
					"> <t color='#FFFF00'>Damaged</t><br/><br/>"
				}
			} else {
				"> O.K.<br/><br/>"
			}
		} else {"> DESTROYED<br/><br/>"};
		
		_text = _name + _rankGroup + _faction + _weapon + _distanceStr + _locked + _canMove + _canFire + _status + _info;
	};
	
	if (!isNil "_text") then {
		64 cutRsc ["IP_DLG_GLASSDETAILS", "PLAIN"]; 
		((uiNamespace getVariable "DLG_GlassDetails") displayCtrl 1200) ctrlSetText _picture;
		((uiNamespace getVariable "DLG_GlassDetails") displayCtrl 1100) ctrlSetStructuredText (parseText _text);
	};
	
	waitUntil {(isNull cursorTarget) OR (cursorTarget != _target) OR (damage _target != _damage)};
	64 cutText ["", "PLAIN"];
	_text = nil;
};