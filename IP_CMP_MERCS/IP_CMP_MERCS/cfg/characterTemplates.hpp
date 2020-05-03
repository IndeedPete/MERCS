// Character Templates
class CharacterTemplates {
	// Agent
	class agent {
		code = "removeHeadgear _this; _this allowDamage false; (group _this) setGroupID ['Swordsman'];";
		goggles = "G_Aviator";
		identity = "agent";
		rank = "CAPTAIN";
		skill = 5;
		variables = "[['IP_Faction', 'DSE'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\agentAvatar.jpg'], ['IP_Rank', 'Agent']]";
		
		class combat {
			code = "[_this] call IP_fnc_automaticRearm;";
			items[] = {"FirstAidKit"};
			magazines = "[['30Rnd_9x21_Mag', 6], ['11Rnd_45ACP_Mag', 3], ['HandGrenade', 2]]";
			vest = "V_TacVest_blk";
			weapons[] = {"SMG_02_ACO_F", "", "hgun_Pistol_heavy_01_F"};
		};
	};
	
	// Captain
	class captain {
		code = "removeHeadgear _this;";
		goggles = "G_Tactical_Black";
		identity = "captain";
		items[] = {"FirstAidKit"};
		magazines = "[['30Rnd_556x45_Stanag', 10], ['16Rnd_9x21_Mag', 3], ['HandGrenade', 4], ['SmokeShell', 2], ['SmokeShellRed', 1], ['SmokeShellGreen', 1]]";
		rank = "CAPTAIN";
		skill = 5;
		texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\coveralls_urbancamo_coBKGabriel.paa";
		uniform = "U_C_WorkerCoveralls";
		variables = "[['IP_Faction', 'BritishKnights'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\captainAvatar.jpg'], ['IP_ConvSpecial', 'Tactical Officer']]";
		vest = "V_PlateCarrierH_CTRG";
		weapons[] = {"arifle_TRG21_ARCO_pointer_F", "", "hgun_P07_F"};
		
		class combat {
			code = "[_this] call IP_fnc_automaticRearm; _this allowDamage false; (group _this) setGroupID ['Paladin'];";
			//night[] = {"((dayTime < 7) OR (dayTime > 19))", "true"};
			night[] = {"false", "false"};
		};
		
		class hub {
			night[] = {"false", "false"};
		};
	};
	
	// Colonel
	class colonel {
		code = "_this allowDamage false; removeAllWeapons _this; removeVest _this;";
		goggles = "G_Aviator";
		headgear = "H_Beret_Colonel";
		identity = "Bootcamp_I_Akhanteros";
		rank = "COLONEL";
		skill = 5;
		variables = "[['IP_Faction', 'AltisMil'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\briefing\Briefing_M07a_Colonel.jpg'], ['IP_ConvSpecial', 'Commander in chief of the AAF and de-facto ruler of Altis.']]";
	};

	// Commander
	class commander {
		code = "[_this, 'Executive'] call BIS_fnc_setUnitInsignia;";
		identity = "commander";
		rank = "CAPTAIN";
		skill = 5;
		//texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_mtp_coION.paa";
		uniform = "IP_U_B_CombatUniform_MERCS_Modern_Arid_Rolled";
		variables = "[['IP_Faction', 'ION'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\commanderAvatar.jpg'], ['IP_ConvSpecial', 'Head of IONs Mediterranean operations.']]";
		weapons[] = {"", "", "hgun_ACPC2_F"};
		
		class combat {
			code = "[_this] call IP_fnc_automaticRearm; _this allowDamage false; (group _this) setGroupID ['Black Knight'];";
			goggles = "G_Tactical_Black";
			items[] = {"FirstAidKit"};
			magazines = "[['30Rnd_65x39_caseless_green', 8], ['9Rnd_45ACP_Mag', 3], ['HandGrenade', 2], ['SmokeShell', 2], ['1Rnd_HE_Grenade_shell', 6]]";
			night[] = {"false", "false"};
			weapons[] = {"arifle_Katiba_GL_Nstalker_pointer_F", "", "hgun_ACPC2_F"};
			vest = "V_PlateCarrierH_CTRG";
		};
		
		class hub {
			code = "removeAllWeapons _this; removeGoggles _this;";
			night[] = {"false", "false"};
			vest = "V_PlateCarrierL_CTRG";
		};
	};
	
	// CSAT Officer
	class CSATOfficer {
		code = "(group _this) setGroupID ['Mirza']; removeGoggles _this;";
		identity = "csat_officer";
		rank = "SERGEANT";
		skill = 5;
		variables = "[['IP_Faction', 'CSAT'], ['IP_LiveFeed', true]]";
		
		class combat {
			code = "[_this, 'GryffinRegiment'] call BIS_fnc_setUnitInsignia;";
			headgear = "H_Beret_ocamo";
			night[] = {"false", "true"};
			variables = "[['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\CSATOfficerAvatar2.jpg']]";
		};
		
		class covert {
			headgear = "H_Cap_press";
			items[] = {"FirstAidKit"};
			magazines = "[['16Rnd_9x21_Mag', 5]]";
			night[] = {"false", "false"};
			uniform = "U_C_Journalist";
			weapons[] = {"hgun_Rook40_F"};
			variables = "[['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\CSATOfficerAvatar1.jpg']]";
			vest = "V_Press_F";
		};
	};
	
	// EF Officer
	class EFOfficer {
		code = "(group _this) setGroupID ['Liberty']; [_this, 'TFAegis'] call BIS_fnc_setUnitInsignia;";
		identity = "ef_officer";
		rank = "CAPTAIN";
		skill = 5;
		texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_coMOD.paa";
		variables = "[['IP_Faction', 'EFMil'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\EFOfficerAvatar.jpg'], ['IP_Rank', 'Lt.Cdr.']]";
	};
	
	// IT-Security Specialist
	class hacker {
		code = "_this setName profileName; _this allowDamage false;";
		face = "WhiteHead_11";
		goggles = "G_Spectacles";
		headgear = "H_StrawHat";
		rank = "LIEUTENANT";
		skill = 5;
		speaker = "Male12ENG";
		texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\ig_guerrilla2_1_coMOD.paa";
		uniform = "U_BG_Guerilla2_1";
		variables = "[['IP_Faction', 'Private'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\hackerAvatar.jpg'], ['IP_Rank', 'Freelancer'], ['IP_ConvSpecial', 'IT-Security Specialist']]";
		
		class combat {
			items[] = {"FirstAidKit"};
			magazines = "[['16Rnd_9x21_Mag', 3]]";
			night[] = {"false", "false"};
			weapons[] = {"", "", "hgun_P07_F", "Binocular"};
		};
		
		class hub {
			items[] = {"FirstAidKit"};
			night[] = {"false", "false"};
		};
	};
	
	// Lord
	class lord {
		code = "removeAllWeapons _this; removeGoggles _this; removeVest _this;";
		headgear = "H_Beret_brn_SF";
		identity = "lord";
		items[] = {"FirstAidKit"};
		rank = "MAJOR";
		skill = 5;
		texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\coveralls_urbancamo_coBKTitus.paa";
		uniform = "U_C_WorkerCoveralls";
		variables = "[['IP_Faction', 'BritishKnights'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\lordAvatar.jpg'], ['IP_ConvSpecial', 'Head of the British Knights detachment on Altis.']]";
		
		class combat {
			code = "[_this] call IP_fnc_automaticRearm; _this allowDamage false; (group _this) setGroupID ['White King'];";
			goggles = "G_Tactical_Clear";
			items[] = {"FirstAidKit"};
			magazines = "[['30Rnd_556x45_Stanag', 8], ['16Rnd_9x21_Mag', 3], ['HandGrenade', 4], ['SmokeShell', 2], ['SmokeShellRed', 1], ['SmokeShellGreen', 1]]";
			weapons[] = {"arifle_TRG20_Holo_F", "", "hgun_P07_F"};
			vest = "V_PlateCarrierL_CTRG";
		};
		
		class command {
			code = "_this allowDamage false; (group _this) setGroupID ['White King'];";
			variables = "[['IP_LiveFeed', false]]";		
		};
	};
	
	// Main Dummy
	class main {
		attachments = "[['acc_pointer_IR', 'optic_Nightstalker']]";
		//backpack = "B_AssaultPack_sgg";
		code = "_this allowDamage false; _this linkItem 'ItemGPS'; [_this, 'TacPad'] call BIS_fnc_addCommMenuItem; [_this, 'SectionLeader'] call BIS_fnc_setUnitInsignia;";
		goggles = ""; //"G_Tactical_Clear";
		headgear = ""; //"H_HelmetSpecB_paint1";
		identity = "main";
		items[] = {"FirstAidKit"};
		magazines = "[['30Rnd_65x39_caseless_mag', 8], ['1Rnd_HE_Grenade_shell', 6], ['16Rnd_9x21_Mag', 3], ['HandGrenade', 2], ['SmokeShell', 2], ['DemoCharge_Remote_Mag', 1], ['ATMine_Range_Mag', 3]]";
		rank = "LIEUTENANT";
		//texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_mtp_coION.paa";
		texture[] = {"IP_CMP_MERCS\IP_CMP_MERCS\txt\clothingMOD.rvmat", "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing_rus_coBA.paa"};
		uniform = "U_O_CombatUniform_ocamo";//"U_B_CTRG_3";
		night[] = {"false", "true"};
		weapons[] = {"arifle_MX_Black_F", "", "hgun_P07_F", "Binocular"};
		variables = "[['IP_Faction', 'ION'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\mainAvatar4.jpg'], ['IP_Team', ['B_CTRG_soldier_M_medic_F', 'B_CTRG_soldier_AR_A_F', 'B_CTRG_soldier_engineer_exp_F', 'B_CTRG_soldier_GL_LAT_F']]]";
		vest = "V_PlateCarrier3_rgr";
	};
	
	// Main AAF
	class mainAAF {
		code = "[_this, 'Curator'] call BIS_fnc_setUnitInsignia;";
		backpack = "";
		goggles = "";
		headgear = "H_Booniehat_dgtl";
		items[] = {"FirstAidKit"};
		magazines = "[]";
		uniform = "U_I_CombatUniform";
		weapons[] = {};
		vest = "";
	};
	
	// Medic
	class medic {
		goggles = "G_Tactical_Black";
		headgear = "H_Cap_khaki_specops_UK";
		identity = "medic";
		rank = "LIEUTENANT";
		skill = 5;
		texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\coveralls_urbancamo_coBKVictus.paa";
		uniform = "U_C_WorkerCoveralls";
		variables = "[['IP_Faction', 'BritishKnights'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\medicAvatar.jpg'], ['IP_ConvSpecial', 'Staff Medic.']]";
		vest = "V_PlateCarrierL_CTRG";		
		
		class combat {
			backpack = "B_AssaultPack_mcamo";
			code = "[_this] call IP_fnc_automaticRearm; _this allowDamage false;";
			items[] = {"FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "MediKit"};
			magazines = "[['30Rnd_556x45_Stanag', 10], ['16Rnd_9x21_Mag', 3], ['HandGrenade', 4], ['SmokeShell', 2], ['SmokeShellRed', 1], ['SmokeShellGreen', 1]]";
			//night[] = {"((dayTime < 7) OR (dayTime > 19))", "true"};
			night[] = {"false", "false"};
			weapons[] = {"arifle_TRG20_Holo_F", "", "hgun_P07_F"};
		};
		
		class hub {
			code = "removeAllWeapons _this; removeBackpack _this;";
			items[] = {"FirstAidKit"};
			night[] = {"false", "false"};
		};
	};
	
	// Rival
	class rival {
		attachments = "[['optic_Nightstalker']]";
		code = "[_this] call IP_fnc_automaticRearm; removeGoggles _this; removeHeadgear _this; _this allowDamage false; (group _this) setGroupID ['Sabre'];";
		identity = "rival";
		items[] = {"FirstAidKit"};
		magazines = "[['150Rnd_762x51_Box', 3], ['9Rnd_45ACP_Mag', 3], ['HandGrenade', 2], ['SmokeShell', 1], ['SmokeShellGreen', 1]]";
		night[] = {"false", "false"};
		rank = "CAPTAIN";
		skill = 5;
		texture[] = {"IP_CMP_MERCS\IP_CMP_MERCS\txt\clothingMOD.rvmat", "IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing_rus_coBA.paa"};
		uniform = "U_O_CombatUniform_ocamo";
		variables = "[['IP_Faction', 'BlackArrow'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\rivalAvatar.jpg']]";
		vest = "V_PlateCarrier1_blk";
		weapons[] = {"LMG_Zafir_pointer_F", "", "hgun_ACPC2_F"};
	};
	
	// Scientist
	class scientist {
		code = "removeGoggles _this; removeHeadgear _this;";
		identity = "scientist";
		items[] = {"FirstAidKit"};
		texture = "IP_CMP_MERCS\IP_CMP_MERCS\txt\scientist_02_coScientist.paa";
		variables = "[['IP_Faction', 'DSE'], ['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\scientistAvatar.jpg']]";
	};
	
	// Trafficker
	class trafficker {
		identity = "trafficker";
		items[] = {"FirstAidKit"};
		magazines = "[['30Rnd_65x39_caseless_mag', 6], ['HandGrenade', 2], ['1Rnd_HE_Grenade_shell', 6]]";
		rank = "CAPTAIN";
		skill = 5;
		variables = "[['IP_LiveFeed', true], ['IP_Avatar', 'IP_CMP_MERCS\IP_CMP_MERCS\img\traffickerAvatar.jpg']]";
		vest = "V_TacVest_blk";
		weapons[] = {"arifle_MX_GL_Hamr_pointer_F"};
	};
};