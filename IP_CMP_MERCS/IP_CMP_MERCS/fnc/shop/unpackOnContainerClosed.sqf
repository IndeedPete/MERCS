private ["_box", "_id"];
_box = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
if ((isNull _box) OR (_box getVariable ["IP_ContainerClosedEH", -1] >= 0)) exitWith {};

_id = _box addEventHandler ["ContainerClosed", {
	_container = _this select 0;

	_items = itemCargo _container;
	_backpacks = backpackCargo _container;
	_mags = magazinesAmmoCargo _container;
	_weaponsItems = weaponsItemsCargo _container;

	{
		_class = _x select 0;
		_cont = _x select 1;

		{
			_weaponsItems pushBack _x;
		} forEach weaponsItemsCargo _cont;
		
		{
			_items pushBack _x;
		} forEach itemCargo _cont;
		
		{
			_mags pushBack _x;
		} forEach magazinesAmmoCargo _cont;
	} forEach (everyContainer _container);

	_weapons = [];
	{
		_weapon = _x select 0;
		_cfg = (configFile >> "CfgWeapons" >> _weapon);
		_muzzle = _x select 1;
		_pointer = _x select 2;
		_optic = _x select 3;
		_magPrim = "";
		_ammoPrim = "";
		_magSec = "";
		_ammoSec = "";
		_bipod = _x select 6;

		if (count(_x select 4) > 0) then {
			_magPrim = (_x select 4) select 0;
			_ammoPrim = (_x select 4) select 1;
		};

		if (count(_x select 5) > 0) then {
			_magSec = (_x select 5) select 0;
			_ammoSec = (_x select 5) select 1;
		};

		{
			if !( _x isEqualTo "" ) then {
				_items pushBack _x;
			};
		} forEach [_muzzle, _pointer, _optic, _bipod];

		if !(_magPrim isEqualTo "") then {
			_mags pushBack [_magPrim, _ammoPrim];
		};

		if !(_magSec isEqualTo "") then {
			_mags pushBack [_magSec, _ammoSec];
		};

		_baseWeapon = _weapon;
		if !(isText( _cfg >> "baseWeapon") && {getText( _cfg >> "baseWeapon") isEqualTo _weapon}) then {		
			{
				if !(isClass(_x >> "LinkedItems")) exitWith {
					_baseWeapon = configName _x;
				};
			} forEach ([(configFile >> "CfgWeapons" >> _weapon)] call BIS_fnc_returnParents);
		};

		_weapons pushBack _baseWeapon;
	} forEach _weaponsItems;

	clearItemCargoGlobal _container;
	clearBackpackCargoGlobal _container;
	clearMagazineCargoGlobal _container;
	clearWeaponCargoGlobal _container;

	{
		_container addItemCargoGlobal [_x, 1];
	} forEach _items;
	
	{
		_container addBackpackCargoGlobal [_x, 1];
	} forEach _backpacks;
	
	{
		_container addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	} forEach _mags;
	
	{
		_container addWeaponCargoGlobal [_x, 1];
	} forEach _weapons;
}];

_box setVariable ["IP_ContainerClosedEH", _id];
_id