/*
Name: openConversation
Author: IndeedPete
Purpose: Opens a conversation (dialog) from config.
----------
Parameters:
_first - OBJECT: The first conversation participant saying every EVEN sentence. - player
_second - OBJECT: The second conversation participant saying every ODD sentence.  - MyInterestingConversationPartner
_conversation - STRING: The config entry referring to the desired conversation. - "MyFirstConversation"
----------
Requires:
Dialog "IP_DLG_CONVERSATION"
.jpg - "IP_CMP_MERCS\IP_CMP_MERCS\img\defaultAvatar.jpg"
*/

_getArguments = {
	private "_arguments";
	
	_arguments = (missionConfigFile >> "Conversations" >> _this >> "arguments");
	if ((isArray _arguments) && {count(getArray _arguments) > 0}) then {
		_arguments = getArray _arguments;
		for "_i" from 0 to ((count _arguments) - 1) do {
			_arguments set [_i, (call compile (_arguments select _i))];
		};
	} else {
		_arguments = [];
	};
	
	_arguments
}; 

private ["_str", "_i"];

_first = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_second = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_conversation = [_this, 2, "", [""]] call BIS_fnc_param;

_handle = createDialog "IP_DLG_CONVERSATION";
_picture = _first getVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\defaultAvatar.jpg"];
ctrlSetText [1200, _picture];
_rank = if ((side _first) != civilian) then {if (!isNil "IP_fnc_getRank") then {([_first, false] call IP_fnc_getRank)} else {(rank _first)}} else {""};
_faction = if ((_first getVariable ["IP_Faction", ""]) != "") then {((getText(missionConfigFile >> "Factions" >> (_first getVariable "IP_Faction") >> "displayName")) + "<br/>")} else {""};
((findDisplay 20001) displayCtrl 1101) ctrlSetStructuredText (parseText(_rank + "<br/>" + (name _first) + "<br/>" + _faction + (_first getVariable ["IP_ConvSpecial", ""])));
_picture = _second getVariable ["IP_Avatar", "IP_CMP_MERCS\IP_CMP_MERCS\img\defaultAvatar.jpg"];
ctrlSetText [1201, _picture];
_rank = if ((side _second) != civilian) then {if (!isNil "IP_fnc_getRank") then {([_second, false] call IP_fnc_getRank)} else {(rank _second)}} else {""};
_faction = if ((_second getVariable ["IP_Faction", ""]) != "") then {((getText(missionConfigFile >> "Factions" >> (_second getVariable "IP_Faction") >> "displayName")) + "<br/>")} else {""};
((findDisplay 20001) displayCtrl 1102) ctrlSetStructuredText (parseText(_rank + "<br/>" + (name _second) + "<br/>" + _faction + (_second getVariable ["IP_ConvSpecial", ""])));

_str = "";
_sentences = getArray(missionConfigFile >> "Conversations" >> _conversation >> "sentences");
if (count _sentences == 0) exitWith {call IP_fnc_closeConversation; hint ("IP_fnc_openDialog\nConversation " + str(_conversation) + " has no sentences!");};
for "_i" from 0 to ((count _sentences) - 1) do {
	if (_i mod 2 == 0) then {
		_str = _str + "<t align='left'>" + (name _first) + ": " + (_sentences select _i) + "</t><br/><br/>";
	} else {
		_str = _str + "<t align='right'>" + (name _second) + ": " + (_sentences select _i) + "</t><br/><br/>";
	};
};

_arguments = _conversation call _getArguments;
_str = format ([_str] + _arguments);

player createDiarySubject ["ConvLog", "Conversation Log"];
player createDiaryRecord ["ConvLog", [(name _second), _str]];
_text = parseText _str;
((findDisplay 20001) displayCtrl 1100) ctrlSetStructuredText _text;

_responses = (missionConfigFile >> "Conversations" >> _conversation >> "responses");
if ((isArray _responses) && {count (getArray _responses) > 0}) then {
	_responses = getArray _responses;
	_i = 0;
	{
		_condition = (missionConfigFile >> "Conversations" >> _x >> "condition");
		if ((!isText _condition) OR {((getText _condition) == "") OR {call compile (getText _condition)}}) then {
			_arguments = _x call _getArguments;
			_sentence = str(_i + 1) + ". " + format ([((getArray(missionConfigFile >> "Conversations" >> _x >> "sentences")) select 0)] + _arguments);
			_index = lbAdd [1500, _sentence];
			_hiddenData = "[" + str(_first) + ", " + str(_second) + ", '" + _x + "']";
			lbSetData [1500, _index, _hiddenData];
			_i = _i + 1;
		};
	} forEach _responses;
};

_expression = (missionConfigFile >> "Conversations" >> _conversation >> "expression");
if (isText _expression) then {
	_expression = getText _expression;
	if (_expression != "") then {
		[_first, _second, _conversation] spawn (compile _expression);
	}; 
};