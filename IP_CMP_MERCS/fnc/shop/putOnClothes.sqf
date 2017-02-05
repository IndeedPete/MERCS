_i = _this;
if (_i == -1) exitWith {hint "You have to select a set of clothes first!"};

_inPosession = player getVariable "IP_Clothes";
_clothes = _inPosession select _i;
_items = uniformItems player;

player forceAddUniform _clothes;
if (isArray(missionConfigFile >> "ShopClothes" >> _clothes >> "texture")) then {
	_arr = getArray(missionConfigFile >> "ShopClothes" >> _clothes >> "texture");
	player setObjectMaterial [0, (_arr select 0)];
	player setObjectTexture [0, (_arr select 1)];
} else {
	if (isText(missionConfigFile >> "ShopClothes" >> _clothes >> "texture")) then {player setObjectTexture [0, (getText(missionConfigFile >> "ShopClothes" >> _clothes >> "texture"))]};
};

_rank = rank player;
if ((isText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> _rank >> "rankInsignia")) && (_clothes != "U_O_CombatUniform_ocamo")) then {
	_class = getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> _rank >> "rankInsignia");
	[player, _class] call BIS_fnc_setUnitInsignia;
};

{IP_PlayerBox addItemCargo [_x, 1]} forEach _items;
hint "The items you have carried in your old clothes were stored in your box!";