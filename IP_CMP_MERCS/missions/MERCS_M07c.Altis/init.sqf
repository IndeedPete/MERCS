IP_TESTMODE = if ((getNumber(missionConfigFile >> "MainValues" >> "testmode")) == 1) then {true} else {false};

// Variables
IP_ShowIntro = true;
IP_TankCrew = units(group IP_TankLeader);

// Main Setup
[] call IP_fnc_mainInit;
(group IP_Main) setGroupID ["Templar"];

// Commander Setup
[IP_Commander, "commander", "combat"] call IP_fnc_applyTemplate;
{_x setVariable ["IP_Faction", "ION"]} forEach (units(group IP_Commander));
[IP_Commander, 0.03, "ICON", "mil_marker", "colorUnknown", "Black Knight", true, {true}] call IP_fnc_track;

// HQ
[IP_Lord, "lord", "command"] call IP_fnc_applyTemplate;

// British Knights Setup
[IP_Captain, "captain", "combat"] call IP_fnc_applyTemplate;
[IP_Medic, "medic", "combat"] call IP_fnc_applyTemplate;
{_x setVariable ["IP_Faction", "BritishKnights"]} forEach (units(group IP_Captain));
[IP_Captain, 0.03, "ICON", "mil_marker", "colorUnknown", "Paladin", true, {true}] call IP_fnc_track;

// Mortar Group
(group IP_Mortar) setGroupID ["Archer"];

// Tank Crew
{
	_x setVariable ["IP_Faction", "ION"];
	if (_x == (leader(group _x))) then {
		_x assignAsDriver IP_TankCrewCar;
		_x moveInDriver IP_TankCrewCar;
	} else {
		_x assignAsCargo IP_TankCrewCar;
		_x moveInCargo IP_TankCrewCar;
	};
} forEach IP_TankCrew;

// Tanks
{
	_x setObjectTexture [0, "Campaigns\IP_CMP_MERCS\txt\mbt_01_body_coEF.paa"];
	_x setObjectTexture [1, "Campaigns\IP_CMP_MERCS\txt\mbt_01_tow_coEF.paa"];
	if (IP_TESTMODE) then {_x allowDamage false};
} forEach [IP_Tank1, IP_Tank2];

// Briefing
_prefix = "";
_suffix = "<br/><br/><img image='Campaigns\IP_CMP_MERCS\img\BK_LogoSmall.paa' width='128'/>";
_rank = if (isClass(campaignConfigFile >> "campaign")) then {(getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> (([] call IP_fnc_getMainRankData) select 0) >> "displayName"))} else {"Section Leader"};

player createDiaryRecord ["Diary", ["Signal", (_prefix + "White King - Command, Lord Commander Titus<br/>Black Knight - Attack, Executive Ian McMillian<br/>Paladin - Support, Knight Captain Gabriel<br/>Templar - Attack, " + _rank + " Raif Salih<br/>Archer - Mortar Support, Senior Contractor Ahmet Birol" + _suffix)]];
player createDiaryRecord ["Diary", ["Execution", (_prefix + "1. Callsigns 'Black Knight', 'Paladin' and 'Templar' will deploy north of the <marker name=""mFIA"">FIA Base</marker>. Mortar support, callsign <marker name=""mMortar"">'Archer'</marker>, will deploy in a safe distance from the AO.<br/>2. Black Knight, Paladin and Templar, supported by Archer, will move in on the <marker name=""mFIA"">FIA Base</marker> and secure the area around the <marker name=""mTanks"">Tanks</marker>.<br/>3. Black Knight stays in position and covers the other teams. Paladin will retreat to not compromise the British Knights any further. Templar will join with a small tank crew waiting outside of the AO and take control of the <marker name=""mTanks"">Tanks</marker>.<br/>4. Templar will use the <marker name=""mTanks"">Tanks</marker> to engage and clear the <marker name=""mDefence"">AAF Defences</marker>.<br/>5. If possible, Templar will proceed to engage and clear the <marker name=""mDepot"">AAF Tank Depot</marker>.<br/>6. Black Knight and Templar will extract from AO and leave the tanks behind." + _suffix)]];
player createDiaryRecord ["Diary", ["Mission", (_prefix + "Main objective is to break the cease-fire and peace negotiations in order to further destabilise the Republic of Altis, making covert operations by the British Knights and ION possible. Therefore, a combined force of both British Knights and ION contractors will engage the <marker name=""mFIA"">FIA Base in a factory near Kore</marker>, capture the <marker name=""mTanks"">two M2A1 Slammer MBTs</marker> and use them to engage the <marker name=""mDefence"">AAF Defences</marker> in order to provoke a diplomatic incident breaking the fragile peace. If the tanks are still operational after engaging the <marker name=""mDefence"">AAF Defences</marker>, the attack may continue on the <marker name=""mDepot"">AAF Tank Depot</marker>. On extraction, the European tanks may be left in the AO in order to serve as evidence for the AAF that this was a European-led attack." + _suffix)]];
player createDiaryRecord ["Diary", ["Situation", (_prefix + "The AAF and the Pro-European FIA agreed to a temporary cease-fire after the heavy fightings around Kavala. A cease-fire at this particular time as well as peace negotiations or any other measure to stabilise the Republic of Altis is a potential thread to the British Knight's Operation Crusader.<br/><br/>Latest reports of informants within the European Federation state that - prior to the cease-fire agreement - a shipment of <marker name=""mTanks"">two M2A1 Slammer MBTs</marker> has been delivered to an <marker name=""mFIA"">FIA Base in a factory near Kore</marker>. Since the FIA lacks for trained personnel to operate the MBTs they're inactive at the moment.<br/><br/>Meanwhile the AAF established a <marker name=""mDefence"">Defensive Perimeter</marker> around Kavala, consisting of checkpoints, a light infantry platoon, several APCs, at least one MBT-52 Kuma and support vehicles. They have transferred their local HQ to what is left of the <marker name=""mDepot"">AAF Tank Depot</marker>." + _suffix)]];

[player, "tTanks", ["Secure the <marker name=""mTanks"">Tanks</marker> in the <marker name=""mFIA"">FIA Base</marker>!", "Secure Tanks", "Tanks"], "mTanks", true, 1] call BIS_fnc_taskCreate;
[player, "tDefences", ["Use the tanks to engage and clear the <marker name=""mDefence"">AAF Defences</marker>!", "Attack Defences", "AAF Defences"], "mDefence", false, 1] call BIS_fnc_taskCreate;
[player, "tDepot", ["(OPTIONAL) Use the tanks to engage and clear what's let of the <marker name=""mDepot"">AAF Tank Depot</marker>!", "(OPTIONAL) Attack Depot", "AAF Tank Depot"], "mDepot", false, 1] call BIS_fnc_taskCreate;
[player, "tExtract", ["Leave the EUROFORCE tanks in the AO and extract!", "Extract", ""], nil, false, 1] call BIS_fnc_taskCreate;

// All Units
{
	if ((side _x) == west) then {
		switch ((_x getVariable ["IP_Faction", ""])) do {
			case "ION":{
				[_x, 5, false, [((dayTime < 7) OR (dayTime > 19)), true], false] call IP_fnc_createMerc;
			};
			
			case "BritishKnights":{
				[_x, 5, false, [((dayTime < 7) OR (dayTime > 19)), true]] call IP_fnc_createBK;
			};
			
			default {};
		};	
	};
	
	if ((side _x) == east) then {
		_x setVariable ["IP_Faction", "FIA"];
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};
	
	if ((side _x) == independent) then {
		_x setVariable ["IP_Faction", "AltisMil"];
		if ((dayTime > 7) && (dayTime < 19)) then {_x unassignItem "NVGoggles_INDEP"};
	};
} forEach (allUnits - [IP_Main, IP_Lord, IP_Commander, IP_Captain, IP_Medic]);

// Debug Marker
if (IP_TESTMODE) then {{[(leader _x)] call IP_fnc_track} forEach allGroups};

// Music
[] call BIS_fnc_jukebox;

// Ambient Civilians
[] call IP_fnc_ambientLife;