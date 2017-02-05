_setNavigation = {
	for "_i" from 0 to ((count IP_Navigation) - 1) do {
		_index = lbAdd [2100, (IP_Navigation select _i select 0)];
		lbSetValue [2100, _i, (IP_Navigation select _i select 1)];
	};
};

_unit = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
_dialog = [_this, 1, IP_LastOpened, [0]] call BIS_fnc_param;
_selectedIndex = [_this, 2, 0, [0]] call BIS_fnc_param;
IP_LastOpened = _dialog;

_name = name _unit;
_rank = [_unit, false] call IP_fnc_getRank;
_money = [(_unit getVariable ["IP_Money", 0])] call IP_fnc_numberText;
_status = if ((getText(missionConfigFile >> "stage")) == "B") then {"Employed"} else {"Independent"};
_picture = _unit getVariable ["IP_Picture", ""];
_clothes = _unit getVariable ["IP_Clothes", []];
_campEnhancements = _unit getVariable ["IP_CampEnhancements", []];
_campVehicles = _unit getVariable ["IP_CampVehicles", []];
_totalCostRate = call IP_fnc_calculateTotalCostRate;

switch (_dialog) do {
	// Missions / Home
	case 10000: {
		_handle = createDialog "IP_DLG_HOME";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1002, (ctrlText 1002 + _money)];
		ctrlSetText [1003, (ctrlText 1003 + _status)];
		ctrlSetText [1200, _picture];
		
		call _setNavigation;

		for "_i" from 0 to ((count IP_AvailableMissions) - 1) do {
			_title = getText(missionConfigFile >> "ShopMissions" >> (IP_AvailableMissions select _i) >> "title"); 
			//_loc = getText(missionConfigFile >> "ShopMissions" >> (IP_AvailableMissions select _i) >> "location"); 
			_rew = [(getNumber(missionConfigFile >> "ShopMissions" >> (IP_AvailableMissions select _i) >> "reward"))] call IP_fnc_numberText;  
			_text = _title + /*" " + _loc +*/ " €" + _rew;
			_index = lbAdd [1500, _text];
		};
	};
	
	// Personnel
	case 10001: {
		_handle = createDialog "IP_DLG_PERSONNEL";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1003, (str(100 * _totalCostRate) + "%")];

		call _setNavigation;
			
		for "_i" from 0 to ((count IP_AvailablePersonnel) - 1) do {
			_entry = IP_AvailablePersonnel select _i;
			_title = getText (configFile >> "CfgVehicles" >> _entry >> "displayName");
			_costRate = str(100 * (getNumber(missionConfigFile >> "ShopPersonnel" >> _entry >> "costRate"))) + "%";
			_text = _title + " " + _costRate;
			_index = lbAdd [1500, _text];
		};
		
		_team = _unit getVariable "IP_Team";
		for "_i" from 0 to ((count _team) - 1) do {
			_entry = _team select _i;
			_title = getText (configFile >> "CfgVehicles" >> _entry >> "displayName");
			_costRate = str(100 * (getNumber(missionConfigFile >> "ShopPersonnel" >> _entry >> "costRate"))) + "%";
			_text = _title + " " + _costRate; 
			_index = lbAdd [1501, _text];
		};
	};
	
	// Weapons
	case 10002: {
		_handle = createDialog "IP_DLG_WEAPONS";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1002, (ctrlText 1002 + _money)];
		ctrlSetText [1003, (ctrlText 1003 + _status)];
		
		call _setNavigation;
			
		for "_i" from 0 to ((count IP_AvailableWeapons) - 1) do {
			_entry = IP_AvailableWeapons select _i;
			_title = getText(configFile >> "CfgWeapons" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			_price = [(getNumber(missionConfigFile >> "ShopWeapons" >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " €" + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _i, _picture];
		};
		
		_weapons = weaponCargo IP_PlayerBox;		
		for "_i" from 0 to ((count _weapons) - 1) do {
			_entry = _weapons select _i;
			_title = getText(configFile >> "CfgWeapons" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			_index = lbAdd [1501, _title];
			lbSetPicture [1501, _i, _picture];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Magazines
	case 10003: {
		private ["_temp", "_clusteredMags", "_i"];
		
		_handle = createDialog "IP_DLG_MAGAZINES";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1002, (ctrlText 1002 + _money)];
		ctrlSetText [1003, (ctrlText 1003 + _status)];
		
		call _setNavigation;
		
		for "_i" from 0 to ((count IP_AvailableMagazines) - 1) do {
			_entry = IP_AvailableMagazines select _i;
			_title = getText(configFile >> "CfgMagazines" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgMagazines" >> _entry >> "picture");
			_price = [(getNumber(missionConfigFile >> "ShopMagazines" >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " €" + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _i, _picture];
		};
		
		_magazines = (magazineCargo IP_PlayerBox) call IP_fnc_clusterArray;		
		for "_i" from 0 to ((count _magazines) - 1) do {
			_cell = _magazines select _i;
			_entry = _cell select 0;
			_count = _cell select 1;
			_title = getText(configFile >> "CfgMagazines" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgMagazines" >> _entry >> "picture");
			
			_text = str(_count) + " " +  _title;
			_index = lbAdd [1501, _text];
			lbSetPicture [1501, _i, _picture];
			lbSetData [1501, _i, _entry];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Items
	case 10004: {
		_getParent = {
			_entry = _this;				
			_parent = if (isClass(configFile >> "CfgWeapons" >> _entry)) then {
				"CfgWeapons"
			} else {
				_ret = if (isClass(configFile >> "CfgVehicles" >> _entry)) then {"CfgVehicles"} else {"CfgGlasses"};
				_ret
			};				
			_parent
		};
		
		_handle = createDialog "IP_DLG_ITEMS";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1002, (ctrlText 1002 + _money)];
		ctrlSetText [1003, (ctrlText 1003 + _status)];
		
		call _setNavigation;
			
		for "_i" from 0 to ((count IP_AvailableItems) - 1) do {			
			_entry = IP_AvailableItems select _i;
			_parent = _entry call _getParent;
			_title = getText (configFile >> _parent >> _entry >> "displayName");
			_picture = getText(configFile >> _parent >> _entry >> "picture");			
			_category = ["ShopItems", _entry] call IP_fnc_getConfigCategory;
			_price = [(getNumber(missionConfigFile >> "ShopItems" >> _category >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " €" + _price;
			
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _i, _picture];
		};
		
		_items = ((itemCargo IP_PlayerBox) + (backpackCargo IP_PlayerBox)) call IP_fnc_clusterArray;	
		for "_i" from 0 to ((count _items) - 1) do {
			_cell = _items select _i;
			_entry = _cell select 0;
			_count = _cell select 1;
			_parent = _entry call _getParent;
			_title = getText (configFile >> _parent >> _entry >> "displayName");
			_picture = getText(configFile >> _parent >> _entry >> "picture");
			
			_text = str(_count) + " " +  _title;
			_index = lbAdd [1501, _text];
			lbSetPicture [1501, _i, _picture];
			lbSetData [1501, _i, _entry];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Clothes
	case 10005: {
		_handle = createDialog "IP_DLG_CLOTHES";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1002, (ctrlText 1002 + _money)];
		ctrlSetText [1003, (ctrlText 1003 + _status)];
		
		call _setNavigation;
			
		for "_i" from 0 to ((count IP_AvailableClothes) - 1) do {
			private "_title";			
			_entry = IP_AvailableClothes select _i;
			if (isText(missionConfigFile >> "ShopClothes" >> _entry >> "displayName")) then {_title = getText(missionConfigFile >> "ShopClothes" >> _entry >> "displayName")} else {_title = getText(configFile >> "CfgWeapons" >> _entry >> "displayName")};
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			_price = [(getNumber(missionConfigFile >> "ShopClothes" >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " €" + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _i, _picture];
		};
		
		for "_i" from 0 to ((count _clothes) - 1) do {
			private "_text";			
			_entry = _clothes select _i;
			if (isText(missionConfigFile >> "ShopClothes" >> _entry >> "displayName")) then {_text = getText(missionConfigFile >> "ShopClothes" >> _entry >> "displayName")} else {_text = getText(configFile >> "CfgWeapons" >> _entry >> "displayName")};
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			_index = lbAdd [1501, _text];
			lbSetPicture [1501, _i, _picture];
		};
	};
	
	// Enhancements
	case 10006: {
		_handle = createDialog "IP_DLG_ENHANCEMENTS";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1002, (ctrlText 1002 + _money)];
		ctrlSetText [1003, (ctrlText 1003 + _status)];
		
		call _setNavigation;
			
		for "_i" from 0 to ((count IP_AvailableCampEnhancements) - 1) do {
			_entry = IP_AvailableCampEnhancements select _i;
			_title = getText(missionConfigFile >> "ShopCampEnhancements" >> _entry >> "title");
			_price = [(getNumber(missionConfigFile >> "ShopCampEnhancements" >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " €" + _price;
			_index = lbAdd [1500, _text];
		};
		
		for "_i" from 0 to ((count _campEnhancements) - 1) do {		
			_entry = _campEnhancements select _i;
			_title = getText(missionConfigFile >> "ShopCampEnhancements" >> _entry >> "title");
			_index = lbAdd [1501, _title];
		};
	};
	
	// Vehicles
	case 10007: {
		_handle = createDialog "IP_DLG_VEHICLES";
		ctrlSetText [1000, (ctrlText 1000 + _name)];
		ctrlSetText [1001, (ctrlText 1001 + _rank)];
		ctrlSetText [1002, (ctrlText 1002 + _money)];
		ctrlSetText [1003, (ctrlText 1003 + _status)];
		
		call _setNavigation;
			
		for "_i" from 0 to ((count IP_AvailableCampVehicles) - 1) do {
			_entry = IP_AvailableCampVehicles select _i;
			_picture = getText(configFile >> "CfgVehicles" >> _entry >> "picture");
			_title = getText(configFile >> "CfgVehicles" >> _entry >> "displayName");
			_price = [(getNumber(missionConfigFile >> "ShopCampVehicles" >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " €" + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _i, _picture];
		};
		
		for "_i" from 0 to ((count _campVehicles) - 1) do {		
			_entry = _campVehicles select _i;
			_picture = getText(configFile >> "CfgVehicles" >> _entry >> "picture");
			_title = getText(configFile >> "CfgVehicles" >> _entry >> "displayName");
			_index = lbAdd [1501, _title];
			lbSetPicture [1501, _i, _picture];
		};
	};
};