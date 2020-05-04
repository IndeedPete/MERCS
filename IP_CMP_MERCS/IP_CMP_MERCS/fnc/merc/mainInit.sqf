// Necessary to prevent lost uniform bug after briefing.
_this spawn {
	_unit = [_this, 0, player, [objNull]] call BIS_fnc_param;
	_keepLoadout = getNumber(missionConfigFile >> "keepLoadout");
	
	_mainLoadout = if (isNil "IP_MERCS_MainLoadout") then {[]} else {IP_MERCS_MainLoadout};
	_money = if (isNil "IP_MERCS_Money") then {0} else {IP_MERCS_Money}; 
	_debts = if (isNil "IP_MERCS_Debts") then {0} else {IP_MERCS_Debts};
	_team = if (isNil "IP_MERCS_Team") then {[]} else {IP_MERCS_Team}; 
	_clothes = if (isNil "IP_MERCS_Clothes") then {[]} else {IP_MERCS_Clothes};
	_playerBox = if (isNil "IP_MERCS_PlayerBox") then {[[], [], [], []]} else {IP_MERCS_PlayerBox};
	_missionsDone = if (isNil "IP_MERCS_MissionsDone") then {["MIn"]} else {IP_MERCS_MissionsDone};
	_silenced = if (isNil "IP_MERCS_TeamSilenced") then {false} else {IP_MERCS_TeamSilenced};
	
	// Special for Stage B
	_campEnhancements = if (isNil "IP_MERCS_CampEnhancements") then {[]} else {IP_MERCS_CampEnhancements};
	_campVehicles = if (isNil "IP_MERCS_CampVehicles") then {[]} else {IP_MERCS_CampVehicles};
	_killedTeammates = if (isNil "IP_MERCS_KilledTeammates") then {[]} else {IP_MERCS_KilledTeammates};
	
	_count = count _missionsDone;
	_arr = [_count] call IP_fnc_getMainRankData;
	_rank = _arr select 0;
	_picture = _arr select 1;
	_avatar = _arr select 2;
	_companyRank = _arr select 3;

	_unit setIdentity "main";
	_unit setRank _rank;
	{
		_unit setVariable _x;
	} forEach [
		["IP_ShopMoney", _money],
		["IP_Debts", _debts],
		["IP_ShopTeam", _team],
		["IP_ShopUniforms", _clothes],
		["IP_ShopTeamSilenced", _silenced],
		["IP_ShopCampEnhancements", _campEnhancements],
		["IP_ShopCampVehicles", _campVehicles],
		["IP_KilledTeammates", _killedTeammates],
		["IP_ShopPicture", ("IP_CMP_MERCS\IP_CMP_MERCS\img\" + _picture)],
		["IP_Avatar", ("IP_CMP_MERCS\IP_CMP_MERCS\img\" + _avatar)],
		["IP_LiveFeed", true],
		["IP_Faction", "ION"]
	];
	
	// Nicht schön, geht aber nicht anders, da sonst Kalkulation die Debts nicht miteinbezieht.
	_unit setVariable ["IP_BasicTCR", (call IP_fnc_calculateBasicCostRate)];
	//_unit createDiarySubject ["Money", "Account"];
	//_unit createDiaryRecord ["Money", [(name _unit), "Account Balance: +" + ([_money] call IP_fnc_numberText) + "€"]];
	
	if (getNumber(missionConfigFile >> "tacPad") == 1) then {[_unit, "TacPad"] call BIS_fnc_addCommMenuItem};	
	if (IP_TESTMODE) then {_unit allowDamage false};	
	if (_keepLoadout != 1) exitWith {IP_MainInitDone = true};
	
	if (count _mainLoadout > 0) then {
		[_unit, _mainLoadout] call IP_fnc_setLoadout;
	} else {
		removeAllWeapons _unit;
		removeUniform _unit;
		removeVest _unit;
		removeGoggles _unit;
		removeHeadgear _unit;
		_unit forceAddUniform (_clothes select 0);
	};

	if ((getNumber(missionConfigFile >> "isHub") == 1)) then {
		_unit setVariable ["IP_ShopBox", IP_PlayerBox];

		if ((count _playerBox) > 0) then {
			{IP_PlayerBox addWeaponCargo [_x, 1]} forEach (_playerBox select 0);
			{IP_PlayerBox addMagazineCargo [_x, 1]} forEach (_playerBox select 1);
			{IP_PlayerBox addItemCargo [_x, 1]} forEach (_playerBox select 2);
			{IP_PlayerBox addBackpackCargo [_x, 1]} forEach (_playerBox select 3);
		};
	};
	
	// Double stuff because of missing uniform bug
	waitUntil {time > 0};

	if (count _mainLoadout > 0) then {
		[_unit, _mainLoadout] call IP_fnc_setLoadout;
	} else {
		removeAllWeapons _unit;
		removeUniform _unit;
		removeVest _unit;
		removeGoggles _unit;
		removeHeadgear _unit;
		_unit forceAddUniform (_clothes select 0);
	};
	
	_uniform = uniform _unit;
	if (isArray(missionConfigFile >> "ShopUniforms" >> "Military" >> _uniform >> "texture")) then {
		_arr = getArray(missionConfigFile >> "ShopUniforms" >> "Military" >> _uniform >> "texture");
		_unit setObjectMaterial [0, (_arr select 0)];
		_unit setObjectTexture [0, (_arr select 1)];
	} else {
		if (isText(missionConfigFile >> "ShopUniforms" >> "Military" >> _uniform >> "texture")) then {_unit setObjectTexture [0, (getText(missionConfigFile >> "ShopUniforms" >> "Military" >> _uniform >> "texture"))]};
	};
	
	// Exclude BA Uniform
	if (_uniform != "U_O_CombatUniform_ocamo") then {[_unit, _companyRank] call BIS_fnc_setUnitInsignia};
	
	_goggles = getArray(missionConfigFile >> "mainValues" >> "glassGoggles");
	if ((goggles player in _goggles) && (isNil "IP_MERCS_Hint_Glass")) then {
		IP_MERCS_Hint_Glass = true;
		saveVar "IP_MERCS_Hint_Glass";
		[["MERCS", "Glass"]] call BIS_fnc_advHint;
	};

	if (!(isClass(campaignConfigFile >> "campaign"))) then {
		[([_this, 0, IP_Main, [objNull]] call BIS_fnc_param), "main"] call IP_fnc_applyTemplate;
	};
	
	IP_MainInitDone = true;
};