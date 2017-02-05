private "_posEnemy";

_stake = getNumber(missionConfigFile >> "DuelStake");
if (!(_stake call IP_fnc_purchase)) exitWith {[IP_Gambler, "Sorry Bro, you don't have enough cash to play with the big boys.", "DIRECT"] call IP_fnc_simpleSentence};

IP_DuelResult = nil;
IP_DuelGoingOn = true;

["IP_BlackScreen", false] call BIS_fnc_blackOut;
sleep 0.5;
skipTime 0.25;

_posMain = "mDuelArea" call IP_fnc_SHKPos;
IP_Main setPos _posMain;
IP_Main setDir (random 360);

_posEnemy = _posMain;
while {_posEnemy distance _posMain <= 150} do {
	_posEnemy = "mDuelArea" call IP_fnc_SHKPos;
};

_class = ["B_G_soldier_AR_F", "B_G_Soldier_GL_F", "B_G_soldier_M_F", "B_G_Soldier_F", "B_G_Soldier_SL_F", "B_G_Soldier_TL_F"] call BIS_fnc_selectRandom;
createCenter east; 
_grp = createGroup east;
IP_Enemy = _grp createUnit [_class, _posEnemy, [], 0, "NONE"];
IP_Enemy setDir (random 360);
[IP_Enemy] call IP_fnc_createMerc;
[IP_Enemy] spawn IP_fnc_track;

{
	_x addEventHandler ["HandleDamage", {
			_target = _this select 0;
			_shooter = _this select 3;
			
			if (_shooter in [IP_Main, IP_Enemy]) then {				
				if (_shooter == IP_Main) then {
					IP_DuelResult = true;
				} else {
					IP_DuelResult = false;
				};
			};
			
			0
		}
	];
} forEach [IP_Main, IP_Enemy];

sleep 0.5;
["IP_BlackScreen"] call BIS_fnc_blackIn;

if (["tDuell"] call BIS_fnc_taskExists) then {["tDuell"] call BIS_fnc_deleteTask};
[player, "tDuel", ["Hit you opponent before he hits you first! Do not leave the <marker name=""mDuelArea"">Duel Area</marker>!", "Duel", ""], nil, true, 1] call BIS_fnc_taskCreate;
[IP_Gambler, "The duel may begin!", "SIDE", 2] call IP_fnc_simpleSentence;
[IP_Enemy, IP_Main] spawn IP_fnc_hunt;
[] spawn IP_fnc_showOSD;