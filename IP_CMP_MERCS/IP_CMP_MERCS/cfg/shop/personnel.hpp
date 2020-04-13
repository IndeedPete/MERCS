class ShopPersonnel
{
	class BK
	{
		displayName = "British Knights";
		show = 2;

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
			show = 1; // Stage B
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
			show = 1; // Stage B
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
			show = 1; // Stage B
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
			show = 1; // Stage B
			vestPool[] = {"V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"};
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
	
	class Merc
	{
		displayName = "Mercenaries";
		
		// Mercs
		class Rifleman
		{
			backpack = "";
			baseClasses[] = {"B_Soldier_F","B_G_Soldier_F","I_Soldier_F","I_G_Soldier_F","O_Soldier_F","O_G_Soldier_F"}; // West, Independent, East
			costRate = 0.1;
			equipment = "Carbine or Rifle and Pistol";
			faction = "Mercs";
			gogglesPools[] = {"Goggles"};
			gogglesProbability = 0.5;
			handgunAttachments[] = {{"", "", "optic_MRD", "optic_Yorris"}};
			handgunMagazines = 3;
			handgunPools[] = {"Pistols"};
			headgearPools[] = {"HeadgearSoft","HeadgearCombat"};
			headgearProbability = 0.9;
			isMerc = 1;
			items[] = {"FirstAidKit"};
			linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemCompass", {"", "ItemGPS"}, {"NVGoggles_INDEP", "NVGoggles_OPFOR"}};
			magazines[] = {"HandGrenade","HandGrenade","SmokeShell","SmokeShellOrange","Chemlight_yellow","Chemlight_yellow"};
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 10;
			primaryWeaponPools[] = {"Carbines","Rifles"};
			skill = 4;
			uniformPools[] = {"Paramilitary","Military"};
			unitInsignia = "";
			unitInsignias[] = {};
			secondaryWeapon = "";
			vestPools[] = {"VestsMedium","VestsHeavy"};
			weapons[] = {{"", "Binocular", "Rangefinder"}};
		};
		
		class Light: Rifleman
		{
			baseClasses[] = {"B_Soldier_lite_F","B_G_Soldier_lite_F","I_Soldier_lite_F","I_G_Soldier_lite_F","O_Soldier_lite_F","O_G_Soldier_lite_F"}; // West, Independent, East
			costRate = 0.05;
			equipment = "SMG, Carbine, or Rifle and Pistol";
			headgearPools[] = {"HeadgearSoft"};
			linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemCompass"};
			magazines[] = {"SmokeShell","Chemlight_yellow"};
			primaryAttachments[] = {};
			primaryMagazines = 4;
			primaryWeaponPools[] = {"SMG","Carbines","Rifles"};
			vestPools[] = {"VestsLight"};
			weapons[] = {};
		};
		
		class Unarmed: Light
		{
			baseClasses[] = {};
			costRate = 0.0;
			equipment = "None";
			handgun = "";
			handgunPools[] = {};
			magazines[] = {};
			primaryWeapon = "";
			primaryWeaponPools[] = {};
			show = 0;
			vest = "";
			vestPools[] = {};
		};
		
		class Grenadier: Rifleman
		{
			baseClasses[] = {"B_Soldier_GL_F","B_G_Soldier_GL_F","I_Soldier_GL_F","I_G_Soldier_GL_F","O_Soldier_GL_F","O_G_Soldier_GL_F"}; // West, Independent, East
			costRate = 0.125;
			equipment = "Rifle (GL) and Pistol";
			primaryMagazines[] = {6,8};
			primaryWeaponPools[] = {"RiflesGL"};
		};
		
		class Autorifleman: Rifleman
		{
			baseClasses[] = {"B_Soldier_AR_F","B_G_Soldier_AR_F","I_Soldier_AR_F","I_G_Soldier_AR_F","O_Soldier_AR_F","O_G_Soldier_AR_F"}; // West, Independent, East
			costRate = 0.125;
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws_mg"}, {"bipod_01_F_blk", "bipod_02_F_blk", "bipod_03_F_blk", "bipod_03_F_oli"}}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 4;
			primaryWeaponPools[] = {"LMG"};
			rank = "CORPORAL";
		};
		
		class Marksman: Rifleman
		{
			baseClasses[] = {"B_Soldier_M_F","B_G_soldier_M_F","I_Soldier_M_F","I_G_soldier_M_F","O_Soldier_M_F","O_G_soldier_M_F"}; // West, Independent, East
			costRate = 0.125;
			equipment = "Marksman Rifle and Pistol";
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws","optic_KHS_old","optic_SOS","optic_KHS_blk","optic_AMS","optic_DMS","optic_LRPS"}, {"bipod_01_F_blk", "bipod_02_F_blk", "bipod_03_F_blk", "bipod_03_F_oli"}}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"Marksman"};
		};
		
		class LAT: Rifleman
		{
			backpack = "I_Fieldpack_oli_LAT";
			baseClasses[] = {"B_Soldier_LAT_F","B_G_Soldier_LAT_F","I_Soldier_LAT_F","I_G_Soldier_LAT_F","O_Soldier_LAT_F","O_G_Soldier_LAT_F"}; // West, Independent, East
			costRate = 0.15;
			equipment = "Carbine or Rifle, Launcher, and Pistol";
			magazines[] = {"NLAW_F","HandGrenade","HandGrenade","SmokeShell","SmokeShellOrange","Chemlight_yellow","Chemlight_yellow"};
			primaryMagazines = 6;
			secondaryWeapon = "launch_NLAW_F";
		};
		
		class Teamleader: Rifleman
		{
			baseClasses[] = {"B_Soldier_TL_F","B_G_Soldier_TL_F","I_Soldier_TL_F","I_G_Soldier_TL_F","O_Soldier_TL_F","O_G_Soldier_TL_F"}; // West, Independent, East
			costRate = 0.175;
			handgunAttachments[] = {{"optic_MRD", "optic_Yorris"}};
			linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemCompass", "ItemGPS", {"NVGoggles_INDEP", "NVGoggles_OPFOR"}};
			magazines[] = {"HandGrenade","HandGrenade","MiniGrenade","MiniGrenade","SmokeShell","SmokeShell","SmokeShellOrange","Chemlight_yellow","Chemlight_yellow"};
			primaryAttachments[] = {"", {"acc_flashlight", "acc_pointer_IR"}, {"optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"Rifles"};
			rank = "SERGEANT";
			show = 0;
			skill = 5;
			weapons[] = {{"Binocular", "Rangefinder"}};
		};
		
		class Medic: Rifleman
		{
			backpack = "B_AssaultPack_rgr_Medic";
			baseClasses[] = {"B_Medic_F","B_G_medic_F","I_Medic_F","I_G_medic_F","O_Medic_F","O_G_medic_F"}; // West, Independent, East
			costRate = 0.2;
			equipment = "SMG or Carbine, Pistol, and Medikit";
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco_smg", "optic_ACO_grn_smg", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"SMG","Carbines"};
		};
		
		class Engineer: Rifleman
		{
			backpack = "I_Carryall_oli_Eng";
			baseClasses[] = {"B_Engineer_F","B_G_engineer_F","I_Engineer_F","I_G_engineer_F","O_Engineer_F","O_G_engineer_F"}; // West, Independent, East
			costRate = 0.2;
			equipment = "SMG or Carbine, Pistol, Explosives, and Toolkit";
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco_smg", "optic_ACO_grn_smg", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"SMG","Carbines"};
		};
	};
};