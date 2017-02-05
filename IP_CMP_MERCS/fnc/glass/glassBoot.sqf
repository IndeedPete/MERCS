_goggles = getArray(missionConfigFile >> "mainValues" >> "glassGoggles");

if (!(goggles player in _goggles)) exitWith {
	private "_str";
	_str = "";
	{
		_str = _str + (getText(configFile >> "CfgGlasses" >> _x >> "displayName")) + "\n";
	} forEach _goggles;
	hint ("ERROR: Hardware not found! Connect one of the following models:\n" + _str);
};

if (player getVariable ["IP_Glass_Booting", false]) exitWith {hint "ABORTED: Another instance of BIS Glass is already running!"};

if (player getVariable ["IP_Glass_Boot", false]) then {
	{
		player setVariable [_x, false];
	} forEach ["IP_Glass_Boot", "IP_Glass_Core", "IP_Glass_Status", "IP_Glass_Details"];
	
	((findDisplay 40000) displayCtrl 1603) ctrlSetText "Glass On";
	((findDisplay 40000) displayCtrl 1606) ctrlSetText "Glass Core On";
	((findDisplay 40000) displayCtrl 1604) ctrlSetText "Glass Status On";
	((findDisplay 40000) displayCtrl 1605) ctrlSetText "Glass Details On";
	
	if (!isNil "IP_Glass_LoadEH") then {removeMissionEventHandler ["Loaded", IP_Glass_LoadEH]};
} else { // Boot procedure
	#define CHECK if (!(goggles player in _goggles)) exitWith {64 cutText ["", "PLAIN"]; hint "ERROR: Device removed!";};
	
	closeDialog 0;
	player setVariable ["IP_Glass_Booting", true];	
	64 cutRsc ["IP_DLG_GLASSBOOT", "PLAIN"]; 
	
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>BOOTING</t>");
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1101) ctrlSetStructuredText (parseText "<t align='center'>Böhmen Integrated Systems</t>");
	sleep 1;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>BOOTING.</t>");
	sleep 0.5;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>BOOTING..</t>");
	sleep 0.5;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>BOOTING...</t>");
	sleep 0.5;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1101) ctrlSetStructuredText (parseText "<t align='center'>BBT APU QuantumGenius Z1 1.2 GHz - OK!</t>");
	sleep 1;
	
	CHECK
	
	for "_i" from 1 to 2048 do {
		((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1101) ctrlSetStructuredText (parseText ("<t align='center'>Memory: " + str(_i) + " MQubytes - OK!</t>"));
		CHECK
		//sleep 0.003;
	};
	
	sleep 1;
	CHECK
	
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>LOADING</t>");
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1101) ctrlSetStructuredText (parseText "<t align='center'>Initialising Java Quantum Machine 1.7</t>");
	sleep 0.5;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>LOADING.</t>");
	sleep 0.5;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>LOADING..</t>");
	sleep 0.5;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>LOADING...</t>");
	sleep 0.5;
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1101) ctrlSetStructuredText (parseText "<t align='center'>Initialising Java Virtual Quantum Machine 1.7 - OK!</t>");
	sleep 1;
	
	CHECK
	
	{
		((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1101) ctrlSetStructuredText (parseText ("<t align='center'>Libraries: " + _x + ".jar</t>"));
		CHECK
		sleep 0.75;
	} forEach ["OS", "Core", "Status", "Details"];
	
	CHECK
	
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1100) ctrlSetStructuredText (parseText "<t size=2 align='center'>BOOT</t>");
	((uiNamespace getVariable "DLG_GlassBoot") displayCtrl 1101) ctrlSetStructuredText (parseText "<t size=2 align='center'>COMPLETE</t>");
	
	sleep 1;	
	64 cutText ["", "PLAIN"];
	
	{
		player setVariable [_x, true];
	} forEach ["IP_Glass_Boot", "IP_Glass_Core", "IP_Glass_Status", "IP_Glass_Details"];
	
	[_goggles] spawn IP_fnc_glassCore;
	[_goggles] spawn IP_fnc_glassStatus;
	[_goggles] spawn IP_fnc_glassDetails;
	player setVariable ["IP_Glass_Booting", false];
	
	if (isNil "IP_Glass_LoadEH") then {
		IP_Glass_LoadEH = addMissionEventHandler [
			"Loaded",
			{
				_goggles = getArray(missionConfigFile >> "mainValues" >> "glassGoggles");
				if (!(player getVariable ["IP_Glass_Boot", false]) OR !(goggles player in _goggles)) exitWith {};
				//if (player getVariable ["IP_Glass_Core", false]) then {[_goggles] spawn IP_fnc_glassCore};
				if (player getVariable ["IP_Glass_Status", false]) then {[_goggles] spawn IP_fnc_glassStatus};
				//if (player getVariable ["IP_Glass_Details", false]) then {[_goggles] spawn IP_fnc_glassDetails};
			}
		];
	};
};