waitUntil {!(isNil "IP_MainInitDone")};
params [
	["_unit", player, [ObjNull]],
	["_unique", false, [true]],
	["_skill", 5, [0]],
	["_silenced", (player getVariable ["IP_ShopTeamSilenced", false]), [true]],
	["_night", [false, false], [[]], 2],
	["_code", {}, [{}]],
	"_team", 
	"_grp", 
	"_pos", 
	"_veh",
	"_capacity"
];

_team = _unit getVariable ["IP_ShopTeam", []];
if (count _team == 0) exitWith {};

_grp = group _unit;
_pos = getPos _unit;
_veh = vehicle _unit;
_capacity = if (_unit != _veh) then {(((typeOf _veh) call IP_fnc_getCargoSeats) - 1)} else {(getNumber(missionConfigFile >> "ShopMetaInformation" >> "teamLimit"))};
{
	if (_forEachIndex >= _capacity) exitWith {};
	
	private "_teammate";
	if ((isNumber(missionConfigFile >> "ShopPersonnel" >> "Merc" >> _x >> "isMerc")) && {(getNumber(missionConfigFile >> "ShopPersonnel" >> "Merc" >> _x >> "isMerc")) == 1}) then {
		_teammate = [_pos, _x, (side _unit), _grp, false, _silenced] call IP_fnc_createMerc;
	} else {
		_teammate = _grp createUnit [_x, _pos, [], 0, "FORM"];		
		if (_x in ["B_CTRG_soldier_M_medic_F", "B_CTRG_soldier_AR_A_F", "B_CTRG_soldier_engineer_exp_F", "B_CTRG_soldier_GL_LAT_F"]) then { // British Knights Player Team
			_teammate setVariable ["IP_Faction", "BritishKnights"];
			[_teammate, _skill, _silenced, _night] call IP_fnc_createBK;
			_teammate setVariable ["IP_Owner", _unit];
			_teammate addEventHandler ["Killed", {
				_unit = _this select 0;
				_class = typeOf _unit;
				_owner = _unit getVariable ["IP_Owner", player];
				_team = _owner getVariable ["IP_ShopTeam", []];
				_killedTeammates = _owner getVariable ["IP_KilledTeammates", []];
				
				_team = _team - [_class];
				_killedTeammates = _killedTeammates + [_class];
				
				_owner setVariable ["IP_ShopTeam", _team];
				_owner setVariable ["IP_KilledTeammates", _killedTeammates];
			}];
		};
	};
	
	_teammate enableIRLasers true;
	[_teammate, _skill] call IP_fnc_setSkill;
	if (_silenced) then {[_teammate] call IP_fnc_applySilencer};
	
	if (_unit != _veh) then {
		if ((_veh emptyPositions "driver") > 0) then {
			_teammate moveInDriver _veh;
		} else {
			if ((_veh emptyPositions "gunner") > 0) then {
				_teammate moveInGunner _veh;
			} else {
				_teammate moveInCargo _veh;
			};
		};
	};
	
	if (IP_TESTMODE) then {_teammate allowDamage false};	
	_teammate spawn _code;
} forEach _team;