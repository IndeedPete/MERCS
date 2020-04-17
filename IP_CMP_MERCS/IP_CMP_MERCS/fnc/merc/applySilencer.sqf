params [
	["_unit", player, [ObjNull]], 
	"_silencer"
];

_silencer = (getArray(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
if !(isNil "_silencer") then {_unit addPrimaryWeaponItem _silencer};
_silencer = (getArray(configFile >> "CfgWeapons" >> (handGunWeapon _unit) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
if !(isNil "_silencer") then {_unit addHandgunItem _silencer};