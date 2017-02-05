private ["_person", "_weapons", "_items"];

_control = str(_this select 0);
_i = _this select 1;

if (_control == "Control #1500") then {
	_person = IP_AvailablePersonnel select _i;
} else {
	_team = player getVariable "IP_Team";
	_person = _team select _i;
};

_costRate = "Cost Rate: " + str(100 * (getNumber(missionConfigFile >> "ShopPersonnel" >> _person >> "costRate"))) + "%<br/><br/>";
_desc = if (isText(missionConfigFile >> "ShopPersonnel" >> _person >> "description")) then {("Description: " + getText(missionConfigFile >> "ShopPersonnel" >> _person >> "description") + "<br/><br/>")} else {""};
_equipment = "Equipment: " + getText(missionConfigFile >> "ShopPersonnel" >> _person >> "equipment") + "<br/><br/>";

_text = _costRate + _desc + _equipment;
((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);