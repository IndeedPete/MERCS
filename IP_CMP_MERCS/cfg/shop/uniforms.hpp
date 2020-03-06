class ShopUniforms
{
	basePrice = 250;
	
	class Civilian
	{
		displayName = "Civilian";
		
		class U_C_Poloshirt_blue
		{
			price = 50;
			show = 0;
		};
		class U_C_Poloshirt_burgundy: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_stripped: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_tricolour: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_salmon: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_redwhite: U_C_Poloshirt_blue {};
		class U_C_Commoner1_1: U_C_Poloshirt_blue {};
		class U_C_Commoner1_2: U_C_Poloshirt_blue {};
		class U_C_Commoner1_3: U_C_Poloshirt_blue {};
		class U_C_Poor_shorts_1: U_C_Poloshirt_blue {};
		class U_C_Commoner_shorts: U_C_Poloshirt_blue {};
		class U_C_ShirtSurfer_shorts: U_C_Poloshirt_blue {};
		class U_C_TeeSurfer_shorts_1: U_C_Poloshirt_blue {};
		class U_C_TeeSurfer_shorts_2: U_C_Poloshirt_blue {};
		class U_C_man_sport_1_F: U_C_Poloshirt_blue {};
		class U_C_man_sport_2_F: U_C_Poloshirt_blue {};
		class U_C_man_sport_3_F: U_C_Poloshirt_blue {};
		class U_C_Man_casual_1_F: U_C_Poloshirt_blue {};
		class U_C_Man_casual_2_F: U_C_Poloshirt_blue {};
		class U_C_Man_casual_3_F: U_C_Poloshirt_blue {};
		class U_C_Man_casual_4_F: U_C_Poloshirt_blue {};
		class U_C_Man_casual_5_F: U_C_Poloshirt_blue {};
		class U_C_Man_casual_6_F: U_C_Poloshirt_blue {};		
		class U_C_IDAP_Man_shorts_F: U_C_Poloshirt_blue {};
		class U_C_IDAP_Man_casual_F: U_C_Poloshirt_blue {};
		class U_C_IDAP_Man_cargo_F: U_C_Poloshirt_blue {};
		class U_C_IDAP_Man_Tee_F: U_C_Poloshirt_blue {};
		class U_C_IDAP_Man_Jeans_F: U_C_Poloshirt_blue {};
		class U_C_IDAP_Man_TeeShorts_F: U_C_Poloshirt_blue {};
		class U_C_Paramedic_01_F: U_C_Poloshirt_blue {};
		class U_C_Mechanic_01_F: U_C_Poloshirt_blue {};		
		class U_C_ConstructionCoverall_Red_F: U_C_Poloshirt_blue {};
		class U_C_ConstructionCoverall_Vrana_F: U_C_Poloshirt_blue {};
		class U_C_ConstructionCoverall_Black_F: U_C_Poloshirt_blue {};
		class U_C_ConstructionCoverall_Blue_F: U_C_Poloshirt_blue {};
		class U_C_Uniform_Farmer_01_F: U_C_Poloshirt_blue {};
		class U_C_Uniform_Scientist_01_F: U_C_Poloshirt_blue {};
		class U_C_Uniform_Scientist_01_formal_F: U_C_Poloshirt_blue {};
		class U_C_Uniform_Scientist_02_F: U_C_Poloshirt_blue {};
		class U_C_Uniform_Scientist_02_formal_F: U_C_Poloshirt_blue {};		
		class U_C_Poor_1
		{
			price = 100;
			show = 1;
		};
		class U_Competitor
		{
			price = 200;
			show = 0;
		}; 
		class U_Rangemaster
		{
			price = 200;
			show = 0;
		};
		class IP_U_B_Instructor_KSK_Green: U_Rangemaster {};
		class U_I_C_Soldier_Bandit_1_F
		{
			price = 200;
			show = 0;
		};
		class U_I_C_Soldier_Bandit_2_F
		{
			price = 200;
		};
		class U_I_C_Soldier_Bandit_3_F
		{
			price = 200;
		};
		class U_I_C_Soldier_Bandit_4_F
		{
			price = 200;
			show = 0;
		};
		class U_I_C_Soldier_Bandit_5_F
		{
			price = 200;
			show = 0;
		};
		class U_C_WorkerCoveralls
		{
			price = 250;
			show = 0;
		};
		class U_C_Scientist
		{
			price = 250;
			show = 0;
		};
		class U_BG_Guerilla3_1
		{
			price = 250;
			show = 0;
		};
		class U_C_Journalist
		{
			price = 250;
			show = 0;
		};
		class U_Marshal
		{
			price = 250;
			show = 0;
		};
		class U_C_HunterBody_grn
		{
			price = 400;
			show = 0;
		};
		class U_NikosAgedBody
		{
			price = 1000;
			show = 0;
		};
		class U_OrestesBody
		{
			price = 1500;
			show = 0;
		};
		class U_NikosBody
		{
			price = 2000;
			show = 0;
		};
		class U_C_Driver_1
		{
			price = 3000;
			show = 0;
		};
		class U_C_Driver_2: U_C_Driver_1 {};
		class U_C_Driver_3: U_C_Driver_1 {};
		class U_C_Driver_4: U_C_Driver_1 {};
		class U_C_Driver_1_black: U_C_Driver_1 {};
		class U_C_Driver_1_blue: U_C_Driver_1 {};
		class U_C_Driver_1_green: U_C_Driver_1 {};
		class U_C_Driver_1_red: U_C_Driver_1 {};
		class U_C_Driver_1_white: U_C_Driver_1 {};
		class U_C_Driver_1_yellow: U_C_Driver_1 {};
		class U_C_Driver_1_orange: U_C_Driver_1 {};
	};
	
	class Paramilitary
	{
		displayName = "Paramilitary";
		
		class U_C_E_LooterJacket_01_F
		{
			merc = 0;
			price = 200;
			show = 0;
		};
		class U_I_L_Uniform_01_camo_F: U_C_E_LooterJacket_01_F {};
		class U_I_L_Uniform_01_deserter_F: U_C_E_LooterJacket_01_F {};
		class U_I_L_Uniform_01_tshirt_skull_F: U_C_E_LooterJacket_01_F {};
		class U_I_L_Uniform_01_tshirt_black_F: U_C_E_LooterJacket_01_F {};
		class U_I_L_Uniform_01_tshirt_sport_F: U_C_E_LooterJacket_01_F {};
		class U_I_L_Uniform_01_tshirt_olive_F: U_C_E_LooterJacket_01_F {};
		class U_I_G_resistanceLeader_F
		{
			merc = 0;
			price = 200;
			show = 0;
		};
		class U_BG_Guerilla1_1
		{
			price = 300;
		};
		class U_BG_Guerilla1_2_F: U_BG_Guerilla1_1 {};
		class U_BG_Guerilla2_1
		{
			merc = 1;
			price = 300;
			show = 1;
		};
		class U_BG_Guerilla2_2
		{
			merc = 1;
			price = 300;
			show = 1;
		};
		class U_BG_Guerilla2_3
		{
			merc = 1;
			price = 300;
			show = 1;
		};
		class U_BG_Guerilla3_2
		{
			merc = 1;
			price = 300;
			show = 1;
		};
		class U_BG_Guerrilla_6_1
		{
			price = 300;
		};
		class U_BG_leader
		{
			price = 300;
		};
		class U_B_GEN_Soldier_F
		{
			merc = 0;
			price = 300;
			show = 0;
		};
		class U_B_GEN_Commander_F
		{
			merc = 0;
			price = 300;
			show = 0;
		};
		class U_I_C_Soldier_Para_1_F
		{
			price = 300;
		};
		class U_I_C_Soldier_Para_2_F
		{
			price = 300;
		};
		class U_I_C_Soldier_Para_3_F
		{
			price = 300;
		};
		class U_I_C_Soldier_Para_4_F
		{
			merc = 0;
			price = 300;
			show = 0;
		};
		class U_I_C_Soldier_Para_5_F
		{
			merc = 0;
			price = 300;
			show = 0;
		};
		class IP_U_B_Irregular_1_KSK_Green_Black
		{
			merc = 0;
			price = 300;
			show = 0;
		};
		class IP_U_B_Irregular_1_KSK_Black_Green: IP_U_B_Irregular_1_KSK_Green_Black {};
		class IP_U_B_Irregular_1_KSK_Green_Checkered: IP_U_B_Irregular_1_KSK_Green_Black {};
		class IP_U_B_Irregular_1_KSK_Black_Checkered: IP_U_B_Irregular_1_KSK_Green_Black {};
		class IP_U_B_Irregular_2_KSK_Green_Black
		{
			merc = 0;
			price = 300;
			show = 0;
		};
		class IP_U_B_Irregular_2_KSK_Arid_Sage: IP_U_B_Irregular_2_KSK_Green_Black {};
		class IP_U_B_Irregular_2_KSK_Tropic_Green: IP_U_B_Irregular_2_KSK_Green_Black {};
		class IP_U_B_Irregular_3_KSK
		{
			merc = 0;
			price = 300;
			show = 0;
		};
		class IP_U_B_Irregular_3_KSK_Tropic: IP_U_B_Irregular_3_KSK {};
		class IP_U_B_Irregular_3_KSK_Arid: IP_U_B_Irregular_3_KSK {};
		class IP_U_B_Irregular_3_KSK_Green_Black: IP_U_B_Irregular_3_KSK {};
		class U_O_R_Gorka_01_F
		{
			price = 400;
		};
		class U_O_R_Gorka_01_brown_F: U_O_R_Gorka_01_F {};
		class U_O_R_Gorka_01_camo_F: U_O_R_Gorka_01_F 
		{
			merc = 0;
			show = 0;
		};
		class U_O_R_Gorka_01_black_F: U_O_R_Gorka_01_F {};
	};
	
	class Military
	{
		displayName = "Military";
		
		class U_I_C_Soldier_Camo_F
		{
			merc = 0;
			price = 500;
			show = 0;
		};
		class U_Tank_green_F
		{
			merc = 0;
			price = 500;
			show = 0;
		};
		class U_I_CombatUniform
		{
			merc = 0;
			price = 500;
			show = 0;
		};
		class U_I_CombatUniform_tshirt: U_I_CombatUniform {};
		class U_I_CombatUniform_shortsleeve: U_I_CombatUniform {};
		class IP_U_B_CombatUniform_light_KSK_Tropic: U_I_CombatUniform {};
		class IP_U_B_CombatUniform_light_KSK_Tropic_shortsleeve: U_I_CombatUniform {};
		class IP_U_B_CombatUniform_light_KSK_Arid: U_I_CombatUniform {};
		class IP_U_B_CombatUniform_light_KSK_Arid_shortsleeve: U_I_CombatUniform {};
		class IP_U_B_CombatUniform_light_KSK: U_I_CombatUniform {};
		class IP_U_B_CombatUniform_light_KSK_shortsleeve: U_I_CombatUniform {};
		class U_I_OfficerUniform
		{
			merc = 0;
			price = 750;
			show = 0;
		};
		class U_I_E_Uniform_01_F
		{
			merc = 0;
			price = 500;
			show = 0;
		};
		class U_I_E_Uniform_01_tanktop_F: U_I_E_Uniform_01_F {};
		class U_I_E_Uniform_01_shortsleeve_F: U_I_E_Uniform_01_F {};
		class U_I_E_Uniform_01_officer_F: U_I_E_Uniform_01_F {};
		class U_I_E_Uniform_01_coveralls_F: U_I_E_Uniform_01_F {};
		class U_I_E_Uniform_01_sweater_F: U_I_E_Uniform_01_F {};
		class U_B_CombatUniform_mcam_tshirt
		{
			merc = 0;
			price = 500;
			show = 0;
		};
		class U_B_T_Soldier_AR_F: U_B_CombatUniform_mcam_tshirt {};
		class U_I_G_Story_Protagonist_F
		{
			merc = 0;
			price = 600;
			show = 0;
		};
		class IP_U_B_G_Story_Protagonist_F: U_I_G_Story_Protagonist_F {};
		class U_B_CombatUniform_mcam
		{
			merc = 0;
			price = 750;
			show = 0;
		};
		class U_B_CombatUniform_mcam_worn: U_B_CombatUniform_mcam {};
		class U_B_CombatUniform_mcam_vest: U_B_CombatUniform_mcam {};
		class U_B_T_Soldier_F: U_B_CombatUniform_mcam {};
		class U_B_T_Soldier_SL_F: U_B_CombatUniform_mcam {};
		class U_B_CombatUniform_vest_mcam_wdl_f: U_B_CombatUniform_mcam {};
		class U_B_CombatUniform_mcam_wdl_f: U_B_CombatUniform_mcam {};
		class U_B_CombatUniform_tshirt_mcam_wdL_f: U_B_CombatUniform_mcam {};
		class U_B_CTRG_2
		{
			merc = 0;
			price = 500;
			show = 0;
		};
		class U_B_CTRG_1
		{
			merc = 0;
			price = 750;
			show = 0;
		};
		class U_B_CTRG_3: U_B_CTRG_1 {};
		class U_B_CTRG_Soldier_urb_1_F: U_B_CTRG_1 {};
		class U_B_CTRG_Soldier_urb_2_F: U_B_CTRG_1 {};
		class U_B_CTRG_Soldier_urb_3_F: U_B_CTRG_1 {};
		class U_O_CombatUniform_ocamo
		{
			merc = 0;
			description = "Compatible to BIS Glass, equipped with hologram emitters.";
			price = 25000;
			show = 0;
		};
		class U_O_SpecopsUniform_ocamo: U_O_CombatUniform_ocamo {};
		class U_O_CombatUniform_oucamo: U_O_CombatUniform_ocamo {};
		class U_O_T_Soldier_F: U_O_CombatUniform_ocamo {};
		class U_O_OfficerUniform_ocamo
		{
			merc = 0;
			price = 750;
			show = 0;
		};
		class U_O_T_Officer_F: U_O_OfficerUniform_ocamo {};
		class U_O_officer_noInsignia_hex_F: U_O_OfficerUniform_ocamo {};
		class U_B_CTRG_Soldier_F
		{
			merc = 0;
			price = 1000;
			show = 0;
		};
		class U_B_CTRG_Soldier_2_F: U_B_CTRG_Soldier_F {};
		class U_B_CTRG_Soldier_3_F: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_KSK_Tropic: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_T_KSK_Tropic: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_Rolled_KSK_Tropic: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_KSK_Arid: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_T_KSK_Arid: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_Rolled_KSK_Arid: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_KSK: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_T_KSK: U_B_CTRG_Soldier_F {};
		class IP_U_B_ReconUniform_Rolled_KSK: U_B_CTRG_Soldier_F {};
		class U_B_T_Sniper_F
		{
			merc = 0;
			price = 1000;
			show = 0;
		};
		class U_B_T_FullGhillie_tna_F: U_B_T_Sniper_F {};
		class U_O_T_Sniper_F
		{
			merc = 0;
			price = 1000;
			show = 0;
		};
		class U_O_T_FullGhillie_tna_F: U_O_T_Sniper_F {};
		class U_O_V_Soldier_Viper_F
		{
			merc = 0;
			description = "Compatible to BIS Glass, equipped with hologram emitters.";
			price = 25000;
			show = 0;
		};
		class U_O_V_Soldier_Viper_hex_F: U_O_V_Soldier_Viper_F {};
	};
	
	class Special
	{
		displayName = "Special";
		
		class U_B_HeliPilotCoveralls
		{
			price = 250;
			show = 0;
		};
		class U_I_HeliPilotCoveralls: U_B_HeliPilotCoveralls {};
		class U_O_HeliPilotCoveralls: U_B_HeliPilotCoveralls {};
		class U_B_survival_uniform
		{
			price = 750;
			show = 0;
		};
		class U_B_Wetsuit
		{
			price = 1000;
			show = 0;
		};
		class U_I_Wetsuit: U_B_Wetsuit {};
		class U_O_Wetsuit: U_B_Wetsuit {};
		class U_I_GhillieSuit
		{
			price = 750;
			show = 0;
		};
		class U_I_FullGhillie_lsh: U_I_GhillieSuit {};
		class U_I_FullGhillie_sard: U_I_GhillieSuit {};
		class U_I_FullGhillie_ard: U_I_GhillieSuit {};
		class U_B_GhillieSuit
		{
			price = 1000;
			show = 0;
		};
		class U_B_FullGhillie_lsh: U_B_GhillieSuit {};
		class U_B_FullGhillie_sard: U_B_GhillieSuit {};
		class U_B_FullGhillie_ard: U_B_GhillieSuit {};
		class U_O_GhillieSuit
		{
			price = 1250;
			show = 0;
		};
		class U_O_FullGhillie_lsh: U_O_GhillieSuit {};
		class U_O_FullGhillie_sard: U_O_GhillieSuit {};
		class U_O_FullGhillie_ard: U_O_GhillieSuit {};
		class U_B_pilotCoveralls
		{
			price = 2500;
			show = 0;
		};
		class U_I_pilotCoveralls: U_B_pilotCoveralls {};
		class U_O_pilotCoveralls: U_B_pilotCoveralls {};
		class U_B_CBRN_Suit_01_MTP_F
		{
			price = 2500;
			show = 0;
		};
		class U_B_CBRN_Suit_01_Tropic_F: U_B_CBRN_Suit_01_MTP_F {};
		class U_B_CBRN_Suit_01_Wdl_F: U_B_CBRN_Suit_01_MTP_F {};
		class U_I_CBRN_Suit_01_AAF_F: U_B_CBRN_Suit_01_MTP_F {};
		class U_I_E_CBRN_Suit_01_EAF_F: U_B_CBRN_Suit_01_MTP_F {};
		class U_C_CBRN_Suit_01_Blue_F: U_B_CBRN_Suit_01_MTP_F 
		{
			show = 1;
		};
		class U_C_CBRN_Suit_01_White_F: U_B_CBRN_Suit_01_MTP_F {};
		class U_B_Protagonist_VR
		{
			price = 3000;
			show = 0;
		};
		class U_O_Protagonist_VR: U_B_Protagonist_VR {};
		class U_I_Protagonist_VR: U_B_Protagonist_VR {};
		class U_C_Protagonist_VR: U_B_Protagonist_VR {};
	};
};