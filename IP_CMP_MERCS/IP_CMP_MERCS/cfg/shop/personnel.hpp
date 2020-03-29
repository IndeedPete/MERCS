class ShopPersonnel
{
	class Mercs 
	{
		displayName = "Mercenaries";

		// British Knights Player Team
		class B_CTRG_soldier_M_medic_F
		{
			backpack = "B_AssaultPack_mcamo";
			costRate = 0;
			equipment = "Marksman Rifle, Handgun, Hand Grenades, First Aid Kits, Medi Kit, Headgear, Vest, Backpack";
			description = "British Knights Combat Medic / Marksman";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			identity = "EPA_B_James";
			items[] = {"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","Medikit"};
			primMagCount = 10;
			primWeaponPool[] = {"srifle_EBR_MRCO_pointer_F","srifle_EBR_SOS_F","srifle_EBR_ARCO_pointer_F","RH_mk12mod1", "RH_samr", "RH_ar10", "Ej_m110", "Ej_m24d"};
			uniform = "U_C_WorkerCoveralls";
			unique = 1; // One time use only
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen"};
			secWeapon = "";
			show = 2; // Stage B
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_CTRG_soldier_AR_A_F
		{
			backpack = "B_Carryall_mcamo";
			costRate = 0;
			equipment = "Light Machine Gun, Handgun, Hand Grenades, First Aid Kits, Headgear, Vest, Backpack";
			description = "British Knights Automatic Rifleman / Ammo Bearer";
			handgrenadeCount = 8;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			identity = "EPA_B_McKay";
			items[] = {"FirstAidKit","FirstAidKit","FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","MMG_02_sand_RCO_LP_F"};
			uniform = "U_C_WorkerCoveralls";
			unique = 1; // One time use only
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","NLAW_F"};
			secWeapon = "";
			show = 2; // Stage B
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_CTRG_soldier_engineer_exp_F
		{
			backpack = "B_Kitbag_mcamo";
			costRate = 0;
			equipment = "Assault Rifle, Handgun, Hand Grenades, Explosive Charge, APERS Bounding Mines, Claymore Charges, M6 SLAM Mine, First Aid Kit, Tool Kit, Mine Detector, Headgear, Vest, Backpack";
			description = "British Knights Explosive Specialist / Engineer";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			identity = "EPA_B_Hardy";
			items[] = {"FirstAidKit","Toolkit","MineDetector"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_TRG21_ACO_pointer_F","arifle_TRG21_ARCO_pointer_F", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash"};
			uniform = "U_C_WorkerCoveralls";
			unique = 1; // One time use only
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen","DemoCharge_Remote_Mag","APERSBoundingMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSBoundingMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","ClaymoreDirectionalMine_Remote_Mag","SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag"};
			secWeapon = "";
			show = 2; // Stage B
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_CTRG_soldier_GL_LAT_F
		{
			backpack = "B_AssaultPack_mcamo";
			costRate = 0;
			equipment = "Assault Rifle + GL, Handgun, Launcher, Hand Grenades, PMCL Missiles, First Aid Kit, Headgear, Vest, Backpack";
			description = "British Knights Rifleman AT / Grenadier";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			identity = "EPA_B_Northgate";
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_TRG21_GL_ACO_pointer_F", "hlc_rifle_Colt727_GL", "RH_m4_m203", "RH_m4_ris_m203", "RH_m4a1_ris_m203"};
			uniform = "U_C_WorkerCoveralls";
			unique = 1; // One time use only
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen","NLAW_F","NLAW_F","NLAW_F","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
			secWeapon = "launch_NLAW_F";
			show = 2; // Stage B
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		
		// Mercs
		class B_G_Soldier_lite_F
		{
			backpackPool[] = {};
			costRate = 0.05;
			equipment = "Assault Rifle, Compact Assault Rifle or Submachine Gun, First Aid Kit";
			handgrenadeCount = 0;
			handMagCount = 0;
			handWeaponPool[] = {};
			headgear = 0;
			items[] = {"FirstAidKit"};
			primMagCount = 3;
			primWeaponPool[] = {"arifle_TRG21_F","arifle_Mk20_plain_F","arifle_Katiba_F","arifle_MX_F","hgun_PDW2000_F","SMG_02_F","SMG_01_F","arifle_TRG20_F","arifle_Mk20C_F","arifle_Katiba_C_F","arifle_MXC_F", "hlc_rifle_ak74", "hlc_rifle_aks74", "hlc_rifle_aks74u","hlc_rifle_falosw", "hlc_rifle_ak47", "hlc_rifle_akm", "hlc_rifle_ak12","hlc_rifle_l1a1slr", "hlc_rifle_SLR", "hlc_rifle_STG58F", "hlc_rifle_FAL5061", "hlc_rifle_c1A1", "hlc_rifle_LAR", "hlc_rifle_SLRchopmod", "hlc_rifle_falosw", "hlc_rifle_g3a3", "hlc_rifle_g3ka4", "hlc_rifle_hk51", "hlc_rifle_hk53", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m16a1", "RH_m16a2", "RH_m16a3", "RH_m16a4", "RH_m16a4_m" ,"SMA_SAR21_F", "SMA_SAR21_AFG_F", "SMA_HK416afg", "SMA_HK416vfg", "SMA_SKS_F", "SMA_STG_E4_F", "SMA_STG_E4_BLACK_F", "SMA_AUG_A3_F", "SMA_AUG_A3_MCAM_F", "SMA_AUG_A3_KRYPT_F", "SMA_MK16", "SMA_Mk16_black", "SMA_HK417afg", "SMA_HK417vfg", "SMA_HK417_16in_afg", "SMA_HK417_tanafg", "SMA_HK417_tanvfg","SMA_HK417_16in_afg_tan","SMA_Mk17", "SMA_Mk17_black", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb", "Ej_scarstandard", "Ej_scarstandardblack", "Ej_scar_h_short", "Ej_scar_h_shortblack", "Ej_scar_longbarrel", "Ej_scarstandardafg", "Ej_scar_h_shortafg", "EJ_hk417", "Ej_hk41712", "Ej_akm", "Ej_m468", "ej_l85a2", "ej_m8_carbine_pmc", "Ej_IAR30", "Ej_IAR30des", "Ej_hk41610", "Ej_akmtac", "Ej_hk61512", "Ej_scarstandardlongbarrel"};
			secMagazines[] = {};
			secWeapon = "";
			vest = 0;
		};
		class B_G_Soldier_F
		{
			backpackPool[] = {};
			costRate = 0.1;
			equipment = "Assault Rifle, Handgun, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_Katiba_ACO_pointer_F","arifle_MX_ACO_pointer_F","arifle_TRG21_ACO_pointer_F","arifle_Mk20C_ACO_pointer_F", "hlc_rifle_ak74", "hlc_rifle_aks74", "hlc_rifle_ak47", "hlc_rifle_akm", "hlc_rifle_ak12","hlc_rifle_l1a1slr", "hlc_rifle_SLR", "hlc_rifle_STG58F", "hlc_rifle_FAL5061", "hlc_rifle_c1A1", "hlc_rifle_LAR", "hlc_rifle_SLRchopmod", "hlc_rifle_falosw", "hlc_rifle_g3a3", "hlc_rifle_g3ka4", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m16a1", "RH_m16a2", "RH_m16a3", "RH_m16a4", "RH_m16a4_m" ,"SMA_SAR21_F", "SMA_SAR21_AFG_F", "SMA_HK416afg", "SMA_HK416vfg", "SMA_SKS_F", "SMA_STG_E4_F", "SMA_STG_E4_BLACK_F", "SMA_AUG_A3_F", "SMA_AUG_A3_MCAM_F", "SMA_AUG_A3_KRYPT_F", "SMA_MK16", "SMA_Mk16_black", "SMA_HK417afg", "SMA_HK417vfg", "SMA_HK417_16in_afg", "SMA_HK417_tanafg", "SMA_HK417_tanvfg","SMA_HK417_16in_afg_tan","SMA_Mk17", "SMA_Mk17_black", "Ej_scarstandard", "Ej_scarstandardblack", "Ej_scar_h_short", "Ej_scar_h_shortblack", "Ej_scar_longbarrel", "Ej_scarstandardafg", "Ej_scar_h_shortafg", "EJ_hk417", "Ej_hk41712", "Ej_akm", "Ej_m468", "ej_l85a2", "ej_m8_carbine_pmc", "Ej_IAR30", "Ej_IAR30des", "Ej_hk41610", "Ej_akmtac", "Ej_hk61512", "Ej_scarstandardlongbarrel"};
			secMagazines[] = {};
			secWeapon = "";
			vest = 1;
		};
		class B_G_Soldier_GL_F
		{
			backpackPool[] = {};
			costRate = 0.125;
			equipment = "Assault Rifle + Grenade Launcher, Handgun, Rifle Grenades, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_GL_ACO_pointer_F","arifle_MX_GL_ACO_pointer_F","arifle_TRG21_GL_ACO_pointer_F","arifle_Mk20_GL_ACO_F", "hlc_rifle_Colt727_GL", "RH_m4_m203", "RH_m4_ris_m203", "RH_m4a1_ris_m203", "RH_m16a1gl", "RH_m16a2gl", "RH_m16a4gl", "SMA_HK416GL", "SMA_Mk16_EGLM", "SMA_MK16_EGLM_black", "SMA_Mk17_EGLM", "SMA_MK17_EGLM_black"};
			secMagazines[] = {"1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
			secWeapon = "";
			vest = 1;
		};
		class B_G_Soldier_AR_F
		{
			backpackPool[] = {};
			costRate = 0.125;
			equipment = "Light Machine Gun, Handgun, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 4;
			primWeaponPool[] = {"MMG_01_tan_F","MMG_01_hex_ARCO_LP_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","MMG_02_sand_RCO_LP_F","MMG_02_black_RCO_BI_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","arifle_MX_SW_pointer_F","arifle_MX_SW_Hamr_pointer_F","LMG_Zafir_pointer_F", "hlc_rifle_rpk", "hlc_lmg_M60E4", "Ej_u100", "Ej_u100sb", "Ej_u100old", "ej_m249", "Ej_IAR", "Ej_IARdes"};
			secMagazines[] = {};
			secWeapon = "";
			vest = 1;
		};
		class B_G_Soldier_A_F
		{
			backpackPool[] = {"B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_khk","B_Carryall_cbr", "SMA_BackPack_Tan", "SMA_BackPack_Black", "SMA_BackPack_Green"};
			costRate = 0.125;
			equipment = "Assault Rifle, Handgun, Hand Grenades, First Aid Kits, Headgear, Vest, Backpack";
			handgrenadeCount = 8;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit","FirstAidKit","FirstAidKit"};
			primMagCount = 25;
			primWeaponPool[] = {"arifle_Katiba_ACO_pointer_F","arifle_MX_ACO_pointer_F","arifle_TRG21_ACO_pointer_F","arifle_Mk20C_ACO_pointer_F", "hlc_rifle_ak74", "hlc_rifle_aks74", "hlc_rifle_ak47", "hlc_rifle_akm", "hlc_rifle_ak12","hlc_rifle_l1a1slr", "hlc_rifle_SLR", "hlc_rifle_STG58F", "hlc_rifle_FAL5061", "hlc_rifle_c1A1", "hlc_rifle_LAR", "hlc_rifle_SLRchopmod", "hlc_rifle_falosw", "hlc_rifle_g3a3", "hlc_rifle_g3ka4", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m16a1", "RH_m16a2", "RH_m16a3", "RH_m16a4", "RH_m16a4_m" ,"SMA_SAR21_F", "SMA_SAR21_AFG_F", "SMA_HK416afg", "SMA_HK416vfg", "SMA_SKS_F", "SMA_STG_E4_F", "SMA_STG_E4_BLACK_F", "SMA_AUG_A3_F", "SMA_AUG_A3_MCAM_F", "SMA_AUG_A3_KRYPT_F", "SMA_MK16", "SMA_Mk16_black", "SMA_HK417afg", "SMA_HK417vfg", "SMA_HK417_16in_afg", "SMA_HK417_tanafg", "SMA_HK417_tanvfg","SMA_HK417_16in_afg_tan","SMA_Mk17", "SMA_Mk17_black", "Ej_scarstandard", "Ej_scarstandardblack", "Ej_scar_h_short", "Ej_scar_h_shortblack", "Ej_scar_longbarrel", "Ej_scarstandardafg", "Ej_scar_h_shortafg", "EJ_hk417", "Ej_hk41712", "Ej_akm", "Ej_m468", "ej_l85a2", "ej_m8_carbine_pmc", "Ej_IAR30", "Ej_IAR30des", "Ej_hk41610", "Ej_akmtac", "Ej_hk61512", "Ej_scarstandardlongbarrel"};
			secMagazines[] = {"1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","NLAW_F"};
			secWeapon = "";
			vest = 1;
		};	
		class B_G_Soldier_LAT_F
		{
			backpackPool[] = {"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli"};
			costRate = 0.15;
			equipment = "Assault Rifle, Handgun, Launcher, Hand Grenades, PMCL Missiles, First Aid Kit, Headgear, Vest, Backpack";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_ACO_pointer_F","arifle_MX_ACO_pointer_F","arifle_TRG21_ACO_pointer_F","arifle_Mk20C_ACO_pointer_F", "hlc_rifle_ak74", "hlc_rifle_aks74", "hlc_rifle_ak47", "hlc_rifle_akm", "hlc_rifle_ak12","hlc_rifle_l1a1slr", "hlc_rifle_SLR", "hlc_rifle_STG58F", "hlc_rifle_FAL5061", "hlc_rifle_c1A1", "hlc_rifle_LAR", "hlc_rifle_SLRchopmod", "hlc_rifle_falosw", "hlc_rifle_g3a3", "hlc_rifle_g3ka4", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m16a1", "RH_m16a2", "RH_m16a3", "RH_m16a4", "RH_m16a4_m" ,"SMA_SAR21_F", "SMA_SAR21_AFG_F", "SMA_HK416afg", "SMA_HK416vfg", "SMA_SKS_F", "SMA_STG_E4_F", "SMA_STG_E4_BLACK_F", "SMA_AUG_A3_F", "SMA_AUG_A3_MCAM_F", "SMA_AUG_A3_KRYPT_F", "SMA_MK16", "SMA_Mk16_black", "SMA_HK417afg", "SMA_HK417vfg", "SMA_HK417_16in_afg", "SMA_HK417_tanafg", "SMA_HK417_tanvfg","SMA_HK417_16in_afg_tan","SMA_Mk17", "SMA_Mk17_black", "Ej_scarstandard", "Ej_scarstandardblack", "Ej_scar_h_short", "Ej_scar_h_shortblack", "Ej_scar_longbarrel", "Ej_scarstandardafg", "Ej_scar_h_shortafg", "EJ_hk417", "Ej_hk41712", "Ej_akm", "Ej_m468", "ej_l85a2", "ej_m8_carbine_pmc", "Ej_IAR30", "Ej_IAR30des", "Ej_hk41610", "Ej_akmtac", "Ej_hk61512", "Ej_scarstandardlongbarrel"};
			secMagazines[] = {"NLAW_F","NLAW_F","NLAW_F"};
			secWeapon = "launch_NLAW_F";
			vest = 1;
		};
		class B_G_soldier_M_F
		{
			backpackPool[] = {};
			costRate = 0.15;
			equipment = "Marksman Rifle, Handgun, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"srifle_DMR_06_camo_khs_F","srifle_DMR_05_KHS_LP_F","srifle_DMR_04_SOS_F","srifle_DMR_03_AMS_F","srifle_DMR_02_camo_AMS_LP_F","srifle_EBR_MRCO_pointer_F","srifle_EBR_SOS_F","srifle_EBR_ARCO_pointer_F","arifle_MXM_Hamr_pointer_F","arifle_MXM_SOS_pointer_F","srifle_DMR_01_SOS_F","srifle_DMR_01_DMS_F","srifle_EBR_DMS_F","srifle_EBR_Hamr_pointer_F","arifle_MXM_DMS_F", "hlc_rifle_g3sg1", "hlc_rifle_psg1", "hlc_rifle_M14", "hlc_rifle_M21", "hlc_rifle_M14DMR", "hlc_rifle_m14sopmod","RH_mk12mod1", "RH_samr", "RH_ar10", "Ej_m110", "Ej_m24d"};
			secMagazines[] = {};
			secWeapon = "";
			vest = 1;
		};
		class B_G_Soldier_TL_F
		{
			backpackPool[] = {};
			costRate = 0.175;
			equipment = "Assault Rifle + Grenade Launcher, Handgun, Rifle Grenades, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_Katiba_GL_ARCO_pointer_F","arifle_MX_GL_Hamr_pointer_F","arifle_TRG21_GL_MRCO_F","arifle_Mk20_GL_MRCO_pointer_F", "hlc_rifle_Colt727_GL", "RH_m4_m203", "RH_m4_ris_m203", "RH_m4a1_ris_m203", "RH_m16a1gl", "RH_m16a2gl", "RH_m16a4gl", "SMA_HK416GL", "SMA_Mk16_EGLM", "SMA_MK16_EGLM_black", "SMA_Mk17_EGLM", "SMA_MK17_EGLM_black"};
			secMagazines[] = {"1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
			secWeapon = "";
			vest = 1;
		};
		class B_soldier_repair_F
		{
			backpackPool[] = {"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli"};
			costRate = 0.175;
			equipment = "Assault Rifle, Handgun, Hand Grenades, First Aid Kit, Tool Kit, Headgear, Vest, Backpack";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit","Toolkit"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_ACO_pointer_F","arifle_MX_ACO_pointer_F","arifle_TRG21_ACO_pointer_F","arifle_Mk20C_ACO_pointer_F", "hlc_rifle_ak74", "hlc_rifle_aks74", "hlc_rifle_ak47", "hlc_rifle_akm", "hlc_rifle_ak12","hlc_rifle_l1a1slr", "hlc_rifle_SLR", "hlc_rifle_STG58F", "hlc_rifle_FAL5061", "hlc_rifle_c1A1", "hlc_rifle_LAR", "hlc_rifle_SLRchopmod", "hlc_rifle_falosw", "hlc_rifle_g3a3", "hlc_rifle_g3ka4", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m16a1", "RH_m16a2", "RH_m16a3", "RH_m16a4", "RH_m16a4_m" ,"SMA_SAR21_F", "SMA_SAR21_AFG_F", "SMA_HK416afg", "SMA_HK416vfg", "SMA_SKS_F", "SMA_STG_E4_F", "SMA_STG_E4_BLACK_F", "SMA_AUG_A3_F", "SMA_AUG_A3_MCAM_F", "SMA_AUG_A3_KRYPT_F", "SMA_MK16", "SMA_Mk16_black", "SMA_HK417afg", "SMA_HK417vfg", "SMA_HK417_16in_afg", "SMA_HK417_tanafg", "SMA_HK417_tanvfg","SMA_HK417_16in_afg_tan","SMA_Mk17", "SMA_Mk17_black", "Ej_scarstandard", "Ej_scarstandardblack", "Ej_scar_h_short", "Ej_scar_h_shortblack", "Ej_scar_longbarrel", "Ej_scarstandardafg", "Ej_scar_h_shortafg", "EJ_hk417", "Ej_hk41712", "Ej_akm", "Ej_m468", "ej_l85a2", "ej_m8_carbine_pmc", "Ej_IAR30", "Ej_IAR30des", "Ej_hk41610", "Ej_akmtac", "Ej_hk61512", "Ej_scarstandardlongbarrel"};
			secMagazines[] = {};
			secWeapon = "";
			vest = 1;
		};
		class B_G_medic_F
		{
			backpackPool[] = {"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli"};
			costRate = 0.2;
			equipment = "Compact Assault Rifle or Submachine Gun, Handgun, Hand Grenades, First Aid Kits, Medi Kit, Headgear, Vest, Backpack";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","Medikit"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_C_ACO_pointer_F","arifle_MXC_Holo_pointer_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_Holo_F","arifle_Mk20C_ACO_pointer_F","SMG_01_Holo_F","SMG_01_ACO_F","SMG_02_ARCO_pointg_F","hgun_PDW2000_Holo_F", "hlc_rifle_aks74u","hlc_rifle_falosw", "hlc_rifle_hk51", "hlc_rifle_hk53", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb"};
			secMagazines[] = {};
			secWeapon = "";
			vest = 1;
		};
		class B_G_engineer_F
		{
			backpackPool[] = {"B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr","B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk"};
			costRate = 0.2;
			equipment = "Compact Assault Rifle or Submachine Gun, Handgun, Hand Grenades, Explosive Charges, Explosive Satchel, First Aid Kit, Tool Kit, Mine Detector, Headgear, Vest, Backpack";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit","Toolkit","MineDetector"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_C_ACO_pointer_F","arifle_MXC_Holo_pointer_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_Holo_F","arifle_Mk20C_ACO_pointer_F","SMG_01_Holo_F","SMG_01_ACO_F","SMG_02_ARCO_pointg_F","hgun_PDW2000_Holo_F", "hlc_rifle_aks74u","hlc_rifle_falosw", "hlc_rifle_hk51", "hlc_rifle_hk53", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb"};
			secMagazines[] = {"DemoCharge_Remote_Mag","DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"};
			secWeapon = "";
			vest = 1;
		};
		class B_G_Soldier_exp_F
		{
			backpackPool[] = {"B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr","B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk"};
			costRate = 0.2;
			equipment = "Compact Assault Rifle or Submachine Gun, Handgun, Hand Grenades, Explosive Charge, APERS Bounding Mines, Claymore Charges, M6 SLAM Mine, First Aid Kit, Tool Kit, Mine Detector, Headgear, Vest, Backpack";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit","Toolkit","MineDetector"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_C_ACO_pointer_F","arifle_MXC_Holo_pointer_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_Holo_F","arifle_Mk20C_ACO_pointer_F","SMG_01_Holo_F","SMG_01_ACO_F","SMG_02_ARCO_pointg_F","hgun_PDW2000_Holo_F", "hlc_rifle_aks74u","hlc_rifle_falosw", "hlc_rifle_hk51", "hlc_rifle_hk53", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb"};
			secMagazines[] = {"DemoCharge_Remote_Mag","APERSBoundingMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSBoundingMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","ClaymoreDirectionalMine_Remote_Mag","SLAMDirectionalMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag"};
			secWeapon = "";
			vest = 1;
		};
		class B_soldier_AT_F
		{
			backpackPool[] = {"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli"};
			costRate = 0.2;
			equipment = "Compact Assault Rifle or Submachine Gun, Handgun, Launcher, Hand Grenades, Titan AT Missiles, First Aid Kit, Headgear, Vest, Backpack";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_C_ACO_pointer_F","arifle_MXC_Holo_pointer_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_Holo_F","arifle_Mk20C_ACO_pointer_F","SMG_01_Holo_F","SMG_01_ACO_F","SMG_02_ARCO_pointg_F","hgun_PDW2000_Holo_F", "hlc_rifle_aks74u","hlc_rifle_falosw", "hlc_rifle_hk51", "hlc_rifle_hk53", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb"};
			secMagazines[] = {"Titan_AT","Titan_AT","Titan_AT"};
			secWeapon = "launch_Titan_short_F";
			vest = 1;
		};	
		class B_soldier_AA_F
		{
			backpackPool[] = {"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli"};
			costRate = 0.2;
			equipment = "Compact Assault Rifle or Submachine Gun, Handgun, Launcher, Hand Grenades, Titan AA Missiles, First Aid Kit, Headgear, Vest, Backpack";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 6;
			primWeaponPool[] = {"arifle_Katiba_C_ACO_pointer_F","arifle_MXC_Holo_pointer_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_Holo_F","arifle_Mk20C_ACO_pointer_F","SMG_01_Holo_F","SMG_01_ACO_F","SMG_02_ARCO_pointg_F","hgun_PDW2000_Holo_F", "hlc_rifle_aks74u","hlc_rifle_falosw", "hlc_rifle_hk51", "hlc_rifle_hk53", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb"};
			secMagazines[] = {"Titan_AA","Titan_AA"};
			secWeapon = "launch_Titan_F";
			vest = 1;
		};
		class B_G_Soldier_SL_F
		{
			backpackPool[] = {};
			costRate = 0.2;
			equipment = "Assault Rifle + Grenade Launcher, Handgun, Rifle Grenades, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F","hgun_Pistol_heavy_01_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_Katiba_ARCO_pointer_F","arifle_MX_Hamr_pointer_F","arifle_TRG21_ARCO_pointer_F","arifle_Mk20_MRCO_pointer_F", "hlc_rifle_ak74", "hlc_rifle_aks74", "hlc_rifle_ak47", "hlc_rifle_akm", "hlc_rifle_ak12","hlc_rifle_l1a1slr", "hlc_rifle_SLR", "hlc_rifle_STG58F", "hlc_rifle_FAL5061", "hlc_rifle_c1A1", "hlc_rifle_LAR", "hlc_rifle_SLRchopmod", "hlc_rifle_falosw", "hlc_rifle_g3a3", "hlc_rifle_g3ka4", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m16a1", "RH_m16a2", "RH_m16a3", "RH_m16a4", "RH_m16a4_m" ,"SMA_SAR21_F", "SMA_SAR21_AFG_F", "SMA_HK416afg", "SMA_HK416vfg", "SMA_SKS_F", "SMA_STG_E4_F", "SMA_STG_E4_BLACK_F", "SMA_AUG_A3_F", "SMA_AUG_A3_MCAM_F", "SMA_AUG_A3_KRYPT_F", "SMA_MK16", "SMA_Mk16_black", "SMA_HK417afg", "SMA_HK417vfg", "SMA_HK417_16in_afg", "SMA_HK417_tanafg", "SMA_HK417_tanvfg","SMA_HK417_16in_afg_tan","SMA_Mk17", "SMA_Mk17_black", "Ej_scarstandard", "Ej_scarstandardblack", "Ej_scar_h_short", "Ej_scar_h_shortblack", "Ej_scar_longbarrel", "Ej_scarstandardafg", "Ej_scar_h_shortafg", "EJ_hk417", "Ej_hk41712", "Ej_akm", "Ej_m468", "ej_l85a2", "ej_m8_carbine_pmc", "Ej_IAR30", "Ej_IAR30des", "Ej_hk41610", "Ej_akmtac", "Ej_hk61512", "Ej_scarstandardlongbarrel"};
			secMagazines[] = {};
			secWeapon = "";
			show = 0; // Never
			vest = 1;
		};
		class B_G_officer_F
		{
			backpackPool[] = {};
			costRate = 0.225;
			equipment = "Compact Assault Rifle or Submachine Gun, Handgun, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_Katiba_C_ACO_pointer_F","arifle_MXC_Holo_pointer_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_Holo_F","arifle_Mk20C_ACO_pointer_F","SMG_01_Holo_F","SMG_01_ACO_F","SMG_02_ARCO_pointg_F","hgun_PDW2000_Holo_F", "hlc_rifle_aks74u", "hlc_rifle_hk51", "hlc_rifle_hk53", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb"};
			secMagazines[] = {};
			secWeapon = "";
			show = 0; // Never
			vest = 1;
		};
		class B_sniper_F
		{
			backpackPool[] = {};
			costRate = 0.175;
			equipment = "Sniper Rifle, Handgun, Hand Grenades, First Aid Kit, Headgear, Vest";
			handgrenadeCount = 4;
			handMagCount = 5;
			handWeaponPool[] = {"hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 10;
			primWeaponPool[] = {"srifle_GM6_SOS_F","srifle_LRR_SOS_F", "Ej_m107", "Ej_LRR_Scoped", "Ej_LRR_w"};
			secMagazines[] = {};
			secWeapon = "";
			show = 0; // Never
			vest = 1;
		};
		
		// British Knights Regular
		class B_Soldier_F
		{
			backpack = "";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			items[] = {"FirstAidKit"};
			primMagCount = 10;
			primWeaponPool[] = {"arifle_TRG21_F","arifle_TRG21_ACO_pointer_F","arifle_TRG21_ARCO_pointer_F", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen"};
			secWeapon = "";
			show = 0; // Never
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_Soldier_GL_F
		{
			backpack = "";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_TRG21_GL_ACO_pointer_F","arifle_TRG21_GL_F", "hlc_rifle_Colt727_GL"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"1Rnd_Smoke_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "smokeGrenadeRed", "smokeGrenadeGreen","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
			secWeapon = "";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_Soldier_AR_F
		{
			backpack = "";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			items[] = {"FirstAidKit"};
			primMagCount = 4;
			primWeaponPool[] = {"MMG_02_black_RCO_BI_F","MMG_02_sand_RCO_LP_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen"};
			secWeapon = "";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};	
		class B_Soldier_A_F
		{
			backpack = "B_Carryall_mcamo";
			handgrenadeCount = 8;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			items[] = {"FirstAidKit","FirstAidKit","FirstAidKit"};
			primMagCount = 30;
			primWeaponPool[] = {"arifle_TRG20_F","arifle_TRG20_Holo_F","arifle_TRG20_ACO_F"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","NLAW_F"};
			secWeapon = "";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_Soldier_LAT_F
		{
			backpack = "B_TacticalPack_mcamo";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			items[] = {"FirstAidKit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_TRG20_F","arifle_TRG20_Holo_F","arifle_TRG20_ACO_F"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen","NLAW_F","NLAW_F","NLAW_F"};
			secWeapon = "launch_NLAW_F";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_soldier_M_F
		{
			backpack = "";
			handgrenadeCount = 4;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			items[] = {"FirstAidKit"};
			primMagCount = 10;
			primWeaponPool[] = {"srifle_DMR_06_camo_khs_F","srifle_DMR_05_KHS_LP_F","srifle_DMR_04_SOS_F","srifle_DMR_03_AMS_F","srifle_DMR_02_camo_AMS_LP_F","srifle_EBR_F","srifle_EBR_ACO_F","srifle_EBR_MRCO_pointer_F","srifle_EBR_SOS_F","srifle_EBR_ARCO_pointer_F","RH_mk12mod1", "RH_samr", "RH_ar10", "Ej_m110", "Ej_m24d"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen"};
			secWeapon = "";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_medic_F
		{
			backpack = "B_AssaultPack_mcamo";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo"};
			items[] = {"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","Medikit"};
			primMagCount = 8;
			primWeaponPool[] = {"arifle_TRG20_F","arifle_TRG20_Holo_F","arifle_TRG20_ACO_F", "RH_pdw", "RH_pdw_Holo", "RH_pdw_ACO_point", "RH_pdw_ACOg_point", "RH_pdw_ARCO_point", "RH_pdw_Hamr_point", "RH_pdw_ACO_flash", "RH_pdw_Holo_flash","Ej_scar", "Ej_scarblack", "Ej_scar_h_shortmlb"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen"};
			secWeapon = "";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_Soldier_TL_F
		{
			backpack = "";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo", "H_Watchcap_blk"};
			items[] = {"FirstAidKit"};
			primMagCount = 10;
			primWeaponPool[] = {"arifle_TRG21_MRCO_F","arifle_TRG21_GL_MRCO_F", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m4_m203", "RH_m4_ris_m203", "RH_m4a1_ris_m203"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
			secWeapon = "";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
		class B_Soldier_SL_F
		{
			backpack = "";
			handgrenadeCount = 2;
			handMagCount = 3;
			handWeapon = "hgun_P07_F";
			headgearPool[] = {"", "H_HelmetSpecB", "H_HelmetB_camo", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_Booniehat_mcamo", "H_Cap_khaki_specops_UK", "H_MilCap_mcamo", "H_Bandanna_mcamo", "H_Watchcap_blk"};
			items[] = {"FirstAidKit"};
			primMagCount = 10;
			primWeaponPool[] = {"arifle_TRG21_MRCO_F","arifle_TRG21_GL_MRCO_F", "hlc_rifle_RU556", "hlc_rifle_RU5562", "hlc_rifle_Colt727", "hlc_rifle_bcmjack", "hlc_rifle_Bushmaster300", "hlc_rifle_vendimus", "hlc_rifle_SAMR","RH_m4", "RH_m4_ris", "RH_m4a1_ris", "RH_m4sbr", "RH_m4sbr_g", "RH_m4sbr_b", "RH_m4_m203", "RH_m4_ris_m203", "RH_m4a1_ris_m203"};
			uniform = "U_C_WorkerCoveralls";
			secMagazines[] = {"smokeGrenade", "smokeGrenade", "smokeGrenadeRed", "smokeGrenadeGreen","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
			secWeapon = "";
			show = 0;
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
		};
	};
};