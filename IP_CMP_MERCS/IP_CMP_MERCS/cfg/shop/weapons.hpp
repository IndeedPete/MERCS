class ShopWeapons
{	
	class Optics
	{
		basePrice = 500;
		displayName = "Optics";
		
		class Binocular
		{
			price = 500;
		};
		class Rangefinder
		{
			price = 1000;
		};
		class Laserdesignator
		{
			price = 1500;
		};
		class Laserdesignator_02: Laserdesignator {};
		class Laserdesignator_03: Laserdesignator {};
	};
	
	class Pistols
	{
		basePrice = 450;
		displayName = "Pistols";
		
		class hgun_Pistol_Signal_F
		{
			merc = 0;
			origin = "USA";
			price = 250;
			show = 0;
		};
		class hgun_Pistol_01_F
		{
			origin = "Russia";
			price = 250;
		};
		class hgun_P07_F
		{
			origin = "Germany";
			price = 500;
		};
		class hgun_P07_khk_F: hgun_P07_F {};
		class hgun_Rook40_F
		{
			origin = "Russia";
			price = 500;
		}; 
		class hgun_ACPC2_F
		{
			origin = "USA";
			price = 500;
		}; 
		class hgun_Pistol_heavy_01_F
		{
			merc = 1;
			origin = "USA";
			price = 750;
			show = 1;
		};
		class hgun_Pistol_heavy_01_green_F : hgun_Pistol_heavy_01_F {};
		class hgun_Pistol_heavy_02_F
		{
			origin = "EU";
			price = 750;
		};
	};
	
	class Shotguns
	{
		basePrice = 1500;
		displayName = "Shotguns";
		
		class sgun_HunterShotgun_01_F
		{
			origin = "Czech Republic";
			price = 1500;
		};		
		class sgun_HunterShotgun_01_sawedoff_F
		{
			origin = "Czech Republic";
			price = 1500;
		};
	};
	
	class SMG
	{
		basePrice = 1250;
		displayName = "SMGs";
		
		class hgun_PDW2000_F
		{
			origin = "Singapore";
			price = 1500;
		};
		class SMG_02_F
		{
			origin = "EU";
			price = 1500;
		};
		class SMG_05_F
		{
			origin = "Germany";
			price = 1500;
		};
		class SMG_01_F
		{
			origin = "USA";
			price = 2000;
		};
		class SMG_03C_TR_black
		{
			origin = "Belgium";
			price = 2500;
		};
		class SMG_03C_TR_camo: SMG_03C_TR_black {};
		class SMG_03C_TR_khaki: SMG_03C_TR_black {};
		class SMG_03C_TR_hex: SMG_03C_TR_black
		{
			merc = 0;
			show = 0;
		};
		class SMG_03C_black
		{
			origin = "Belgium";
			price = 2750;
		};
		class SMG_03C_camo: SMG_03C_black {};
		class SMG_03C_khaki: SMG_03C_black {};
		class SMG_03C_hex: SMG_03C_black
		{
			merc = 0;
			show = 0;
		};
	};
	
	class Carbines
	{
		basePrice = 2500;
		displayName = "Carbines";
		
		class arifle_AKS_F
		{
			origin = "Russia";
			price = 2500;
		};
		class SMG_03_TR_black
		{
			origin = "Belgium";
			price = 2750;
		};
		class SMG_03_TR_camo: SMG_03_TR_black {};
		class SMG_03_TR_khaki: SMG_03_TR_black {};
		class SMG_03_TR_hex: SMG_03_TR_black 
		{
			merc = 0;
			show = 0;
		};
		class SMG_03_black
		{
			origin = "Belgium";
			price = 3000;
		};
		class SMG_03_camo: SMG_03_black {};
		class SMG_03_khaki: SMG_03_black {};
		class SMG_03_hex: SMG_03_black
		{
			merc = 0;
			show = 0;
		};
		class arifle_TRG20_F
		{
			origin = "Israel";
			price = 3000;
		};
		class arifle_Mk20C_F
		{
			origin = "Belgium";
			price = 3000;
		};
		class arifle_Mk20C_plain_F: arifle_Mk20C_F {};
		class arifle_AK12U_F
		{
			origin = "Russia";
			price = 3500;
		};
		class arifle_AK12U_lush_F: arifle_AK12U_F {};
		class arifle_AK12U_arid_F: arifle_AK12U_F {};
		class arifle_Katiba_C_F
		{
			origin = "Iran";
			price = 4000;
		};
		class arifle_MXC_F
		{
			merc = 0;
			origin = "USA";
			price = 4000;
			show = 0;
		};
		class arifle_MXC_Black_F: arifle_MXC_F 
		{
			merc = 1;
			show = 1;
		};
		class arifle_MXC_khk_F: arifle_MXC_F {};
	};
	
	class Rifles
	{
		basePrice = 3000;
		displayName = "Rifles";
		
		class arifle_AKM_F
		{
			origin = "Russia";
			price = 3000;
		};
		class arifle_TRG21_F
		{
			origin = "Israel";
			price = 3500;
		};
		class arifle_Mk20_plain_F
		{
			origin = "Belgium";
			price = 3500;
		};
		class arifle_Mk20_F: arifle_Mk20_plain_F {};
		class arifle_SPAR_01_blk_F
		{
			origin = "Germany";
			price = 4000;
		};
		class arifle_SPAR_01_khk_F: arifle_SPAR_01_blk_F {};
		class arifle_SPAR_01_snd_F: arifle_SPAR_01_blk_F {};
		class arifle_CTAR_blk_F
		{
			origin = "China";
			price = 4000;
		};
		class arifle_CTAR_hex_F: arifle_CTAR_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_CTAR_ghex_F: arifle_CTAR_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_AK12_F
		{
			origin = "Russia";
			price = 4500;
		};
		class arifle_AK12_lush_F: arifle_AK12_F {};
		class arifle_AK12_arid_F: arifle_AK12_F {};
		class arifle_MSBS65_F
		{
			origin = "EU";
			price = 5000;
		};
		class arifle_MSBS65_black_F: arifle_MSBS65_F {};
		class arifle_MSBS65_camo_F: arifle_MSBS65_F {};
		class arifle_MSBS65_sand_F: arifle_MSBS65_F {};
		class arifle_Katiba_F
		{
			origin = "Iran";
			price = 5000;
		};
		class arifle_MX_F
		{
			merc = 0;
			origin = "USA";
			price = 5000;
			show = 0;
		};
		class arifle_MX_black_F: arifle_MX_F 
		{
			merc = 1;
			show = 1;
		};
		class arifle_MX_khk_F: arifle_MX_F {};
	};
	
	class RiflesU
	{
		displayName = "Rifles (Underwater)";
		show = 0;
		
		class arifle_SDAR_F
		{
			price = 7500;
		};		
	};
	
	class RiflesGL
	{
		basePrice = 4000;
		displayName = "Rifles (Launcher)";
		
		class arifle_TRG21_GL_F
		{
			origin = "Israel";
			price = 4000;
		};
		class arifle_Mk20_GL_plain_F
		{
			origin = "Belgium";
			price = 4000;
		};
		class arifle_Mk20_GL_F: arifle_Mk20_GL_plain_F {};
		class arifle_SPAR_01_GL_blk_F
		{
			origin = "Germany";
			price = 4500;
		};
		class arifle_SPAR_01_GL_khk_F: arifle_SPAR_01_GL_blk_F {};
		class arifle_SPAR_01_GL_snd_F: arifle_SPAR_01_GL_blk_F {};
		class arifle_CTAR_GL_blk_F
		{
			origin = "China";
			price = 4500;
		};
		class arifle_CTAR_GL_hex_F: arifle_CTAR_GL_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_CTAR_GL_ghex_F: arifle_CTAR_GL_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_MSBS65_UBS_F
		{
			origin = "EU";
			price = 5500;
		};
		class arifle_MSBS65_UBS_black_F: arifle_MSBS65_UBS_F {};
		class arifle_MSBS65_UBS_camo_F: arifle_MSBS65_UBS_F {};
		class arifle_MSBS65_UBS_sand_F: arifle_MSBS65_UBS_F {};
		class arifle_AK12_GL_F
		{
			origin = "Russia";
			price = 5500;
		};
		class arifle_AK12_GL_lush_F: arifle_AK12_GL_F {};
		class arifle_AK12_GL_arid_F: arifle_AK12_GL_F {};
		class arifle_MSBS65_GL_F
		{
			origin = "EU";
			price = 5000;
		};
		class arifle_MSBS65_GL_black_F: arifle_MSBS65_GL_F {};
		class arifle_MSBS65_GL_camo_F: arifle_MSBS65_GL_F {};
		class arifle_MSBS65_GL_sand_F: arifle_MSBS65_GL_F {};
		class arifle_Katiba_GL_F
		{
			origin = "Iran";
			price = 6000;
		};
		class arifle_MX_GL_F
		{
			merc = 0;
			origin = "USA";
			price = 6000;
			show = 0;
		};
		class arifle_MX_GL_black_F: arifle_MX_GL_F 
		{
			merc = 1;
			show = 1;
		};
		class arifle_MX_GL_khk_F: arifle_MX_GL_F {};
		class arifle_ARX_blk_F
		{
			origin = "China";
			price = 7500;
		};
		class arifle_ARX_hex_F: arifle_ARX_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_ARX_ghex_F: arifle_ARX_blk_F 
		{
			merc = 0;
			show = 0;
		};
	};
	
	class LMG
	{
		basePrice = 5000;
		displayName = "L/MMGs";
		
		class arifle_SPAR_02_blk_F
		{
			origin = "Germany";
			price = 5000;
		};
		class arifle_SPAR_02_khk_F: arifle_SPAR_02_blk_F {};
		class arifle_SPAR_02_snd_F: arifle_SPAR_02_blk_F {};
		class arifle_CTARS_blk_F
		{
			origin = "China";
			price = 5500;
		};
		class arifle_CTARS_hex_F: arifle_CTARS_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_CTARS_ghex_F: arifle_CTARS_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_RPK12_F
		{
			origin = "Russia";
			price = 5500;
		};
		class arifle_RPK12_lush_F: arifle_RPK12_F {};
		class arifle_RPK12_arid_F: arifle_RPK12_F {};
		class arifle_MX_SW_F
		{
			merc = 0;
			origin = "USA";
			price = 6000;
			show = 0;
		};
		class arifle_MX_SW_black_F: arifle_MX_SW_F 
		{
			merc = 1;
			show = 1;
		};
		class arifle_MX_SW_khk_F: arifle_MX_SW_F {};
		class LMG_Mk200_F
		{
			origin = "USA";
			price = 7000;
		};
		class LMG_Mk200_black_F: LMG_Mk200_F {};
		class LMG_Zafir_F
		{
			origin = "Israel";
			price = 7500;
		};
		class LMG_03_F
		{
			origin = "USA";
			price = 8000;
		};
		class MMG_01_hex_F
		{
			merc = 0;
			origin = "Germany";
			price = 9000;
			show = 0;
		};
		class MMG_01_tan_F: MMG_01_hex_F 
		{
			merc = 1;
			show = 1;
		};
		class MMG_02_camo_F
		{
			origin = "USA";
			price = 9000;
		};
		class MMG_02_sand_F: MMG_02_camo_F {};
		class MMG_02_black_F: MMG_02_camo_F {};
	};
	
	class Marksman
	{
		basePrice = 5000;
		displayName = "Marksman Rifles";
		
		class srifle_DMR_07_blk_F
		{
			origin = "China";
			price = 5500;
		};
		class srifle_DMR_07_hex_F: srifle_DMR_07_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class srifle_DMR_07_ghex_F: srifle_DMR_07_blk_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_MSBS65_Mark_F
		{
			origin = "EU";
			price = 6000;
		};
		class arifle_MSBS65_Mark_black_F: arifle_MSBS65_Mark_F {};
		class arifle_MSBS65_Mark_camo_F: arifle_MSBS65_Mark_F {};
		class arifle_MSBS65_Mark_sand_F: arifle_MSBS65_Mark_F {};		
		class arifle_MXM_F
		{
			merc = 0;
			origin = "USA";
			price = 6000;
			show = 0;
		};
		class arifle_MXM_Black_F: arifle_MXM_F 
		{
			merc = 1;
			show = 1;
		};
		class arifle_MXM_khk_F: arifle_MXM_F {};
		class srifle_DMR_06_olive_F
		{
			origin = "USA";
			price = 6000;
		};
		class srifle_DMR_06_camo_F: srifle_DMR_06_olive_F {};
		class srifle_DMR_06_hunter_F: srifle_DMR_06_olive_F {};
		class srifle_DMR_01_F
		{
			origin = "Russia";
			price = 6500;
		};
		class arifle_SPAR_03_blk_F
		{
			origin = "Germany";
			price = 7000;
		};
		class arifle_SPAR_03_khk_F: arifle_SPAR_03_blk_F {};
		class arifle_SPAR_03_snd_F: arifle_SPAR_03_blk_F {};
		class srifle_EBR_F
		{
			origin = "USA";
			price = 7000;
		};
		class srifle_DMR_03_F
		{
			origin = "EU";
			price = 7000;
		};
		class srifle_DMR_03_camo_F: srifle_DMR_03_F {};
		class srifle_DMR_03_khaki_F: srifle_DMR_03_F {};
		class srifle_DMR_03_tan_F: srifle_DMR_03_khaki_F {};
		class srifle_DMR_03_multicam_F: srifle_DMR_03_khaki_F {};
		class srifle_DMR_03_woodland_F: srifle_DMR_03_F {};
		class srifle_DMR_04_F
		{
			origin = "Russia";
			price = 9000;
		};
		class srifle_DMR_04_Tan_F: srifle_DMR_04_F {};
		class srifle_DMR_05_blk_F
		{
			origin = "Iran";
			price = 9000;
		};
		class srifle_DMR_05_hex_F: srifle_DMR_05_blk_F
		{
			merc = 0;
			show = 0;
		};
		class srifle_DMR_05_tan_f: srifle_DMR_05_blk_F {};
		class srifle_DMR_02_F
		{
			origin = "USA";
			price = 9000;
		};
		class srifle_DMR_02_camo_F: srifle_DMR_02_F {};
		class srifle_DMR_02_sniper_F: srifle_DMR_02_F {};
	};
	
	class Sniper
	{
		basePrice = 7000;
		displayName = "Sniper Rifles";
		show = 1;
		
		class srifle_GM6_F
		{
			origin = "EU";
			price = 10000;
		};
		class srifle_GM6_camo_F: srifle_GM6_F {};
		class srifle_GM6_ghex_F: srifle_GM6_F 
		{
			merc = 0;
			show = 0;
		};
		class srifle_LRR_F
		{
			origin = "USA";
			price = 10000;
		};
		class srifle_LRR_camo_F: srifle_LRR_F {};
		class srifle_LRR_tna_F: srifle_LRR_F {};
	};
	
	class Launchers
	{
		basePrice = 9000;
		displayName = "Launchers";
		
		class launch_RPG7_F
		{
			origin = "Russia";
			price = 8000;
		};
		class launch_RPG32_F
		{
			merc = 0;
			origin = "Iran";
			price = 10000;
			show = 0;
		};
		class launch_RPG32_ghex_F: launch_RPG32_F {};
		class launch_RPG32_green_F: launch_RPG32_F
		{
			merc = 1;
			show = 1;
		};
		class launch_NLAW_F
		{
			origin = "USA";
			price = 15000;
		};
		class launch_O_Vorona_brown_F
		{
			merc = 0;
			origin = "Russia";
			price = 15000;
			show = 0;
		};
		class launch_O_Vorona_green_F: launch_O_Vorona_brown_F 
		{
			merc = 1;
			show = 1;
		};
		class launch_MRAWS_olive_rail_F
		{
			merc = 0;
			origin = "EU";
			price = 15000;
			show = 0;
		};
		class launch_MRAWS_green_rail_F: launch_MRAWS_olive_rail_F 
		{
			merc = 1;
			show = 1;
		};
		class launch_MRAWS_sand_rail_F: launch_MRAWS_olive_rail_F {};
		class launch_MRAWS_olive_F
		{
			merc = 0;
			origin = "EU";
			price = 20000;
			show = 0;
		};
		class launch_MRAWS_green_F: launch_MRAWS_olive_F 
		{
			merc = 1;
			show = 1;
		};
		class launch_MRAWS_sand_F: launch_MRAWS_olive_F {};
		class launch_Titan_short_F
		{
			merc = 0;
			origin = "USA";
			price = 25000;
			show = 0;
		};
		class launch_B_Titan_short_F: launch_Titan_short_F {};
		class launch_B_Titan_short_tna_F: launch_Titan_short_F {};
		class launch_I_Titan_short_F: launch_Titan_short_F
		{
			merc = 1;
			show = 1;			
		};
		class launch_O_Titan_short_F: launch_Titan_short_F {};
		class launch_O_Titan_short_ghex_F: launch_Titan_short_F {};
		class launch_Titan_F
		{
			merc = 0;
			origin = "USA";
			price = 25000;
			show = 0;
		};
		class launch_B_Titan_F: launch_Titan_F {};
		class launch_B_Titan_tna_F: launch_Titan_F {};
		class launch_B_Titan_olive_F: launch_Titan_F
		{
			merc = 1;
			show = 1;			
		};
		class launch_I_Titan_F: launch_Titan_F {};
		class launch_I_Titan_eaf_F: launch_Titan_F {};
		class launch_O_Titan_F: launch_Titan_F {};
		class launch_O_Titan_ghex_F: launch_Titan_F {};
	};
};