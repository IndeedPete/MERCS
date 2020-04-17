class ShopItems
{
	// Misc
	class Misc
	{	
		displayName = "Miscellaneous";
		
		// Kits
		class FirstAidKit
		{
			price = 100;
		};
		class ItemCompass
		{
			price = 50;
		};
		class ItemWatch
		{
			price = 100;
		};
		class ItemMap
		{
			price = 150;
		};		
		class ItemRadio
		{
			price = 250;
		};
		class ItemGPS
		{
			price = 250;
		};
		class Medikit
		{
			price = 2000;
		};
		class Toolkit
		{
			price = 2000;
		};
		class MineDetector
		{
			price = 1000;
		};
		class ChemicalDetector_01_watch_F
		{
			price = 1000;
		};
		class B_UavTerminal
		{
			price = 4000;
		};
		class I_UavTerminal: B_UavTerminal
		{
			show = 0;
		};
		class I_E_UavTerminal: B_UavTerminal
		{
			show = 0;
		};
		class O_UavTerminal: B_UavTerminal
		{
			show = 0;
		};
		class C_UavTerminal: B_UavTerminal
		{
			show = 0;
		};
		// non weapon optics
		class NVGoggles
		{
			price = 2000;
			show = 0;
		};
		class NVGoggles_INDEP: NVGoggles {};		
		class NVGoggles_OPFOR: NVGoggles 
		{
			show = 1;
		};
		class NVGoggles_tna_F: NVGoggles {};
		class O_NVGoggles_hex_F
		{
			price = 2000;
			show = 0;
		};
		class O_NVGoggles_urb_F: O_NVGoggles_hex_F {};
		class O_NVGoggles_ghex_F: O_NVGoggles_hex_F {};
		class O_NVGoggles_grn_F: O_NVGoggles_hex_F 
		{
			show = 1;
		};
		class NVGogglesB_blk_F
		{
			price = 4000;
		};
		class NVGogglesB_grn_F: NVGogglesB_blk_F
		{
			show = 0;
		};
		class NVGogglesB_gry_F: NVGogglesB_blk_F 
		{
			show = 0;
		};
	};
	
	// Vests (Light)
	class VestsLight
	{
		basePrice = 500;
		displayName = "Vests (Light)";
		
		class V_Plain_medical_F
		{
			merc = 0;
			price = 50;
			show = 0;
		};
		class V_Plain_crystal_F: V_Plain_medical_F {};
		class V_Safety_yellow_F
		{
			merc = 0;
			price = 100;
			show = 0;
		};
		class V_Safety_orange_F: V_Safety_yellow_F {};
		class V_Safety_blue_F: V_Safety_yellow_F {};
		class V_LegStrapBag_olive_F
		{
			price = 250;
		};
		class V_LegStrapBag_coyote_F: V_LegStrapBag_olive_F {};
		class V_LegStrapBag_black_F: V_LegStrapBag_olive_F {};
		class V_Rangemaster_belt
		{
			price = 250;
		};
		class V_Pocketed_olive_F
		{
			price = 350;
		};
		class V_Pocketed_coyote_F: V_Pocketed_olive_F {};
		class V_Pocketed_black_F: V_Pocketed_olive_F {};
		class V_BandollierB_rgr
		{
			price = 500;
		};	
		class V_BandollierB_khk: V_BandollierB_rgr
		{
			merc = 0;
			show = 0;			
		};
		class V_BandollierB_cbr: V_BandollierB_rgr
		{
			merc = 0;
			show = 0;			
		};
		class V_BandollierB_ghex_F: V_BandollierB_rgr
		{
			merc = 0;
			show = 0;			
		};
		class V_BandollierB_blk: V_BandollierB_rgr {};
		class V_BandollierB_oli: V_BandollierB_rgr {};
		class V_TacChestrig_grn_F
		{
			price = 750;
		};
		class V_TacChestrig_cbr_F: V_TacChestrig_grn_F
		{
			merc = 0;
			show = 0;			
		};
		class V_TacChestrig_oli_F: V_TacChestrig_grn_F {};
		class V_Chestrig_blk
		{
			price = 1000;
		};
		class V_Chestrig_khk: V_Chestrig_blk
		{
			merc = 0;
			show = 0;
		};
		class V_Chestrig_oli: V_Chestrig_blk {};
		class V_Chestrig_rgr: V_Chestrig_blk {};
		class IP_V_Chestrig_KSK_Fleck: V_Chestrig_blk
		{
			merc = 0;
			show = 0;			
		};
		class IP_V_Chestrig_KSK_Fleck_Arid: IP_V_Chestrig_KSK_Fleck {};
		class IP_V_Chestrig_KSK_Fleck_Tropic: IP_V_Chestrig_KSK_Fleck {};
	};
	
	// Vests (Medium)
	class VestsMedium
	{
		basePrice = 2000;
		displayName = "Vests (Medium)";
		
		class V_SmershVest_01_F
		{
			price = 1500;
		};	
		class V_SmershVest_01_radio_F: V_SmershVest_01_F {};
		class V_HarnessO_brn
		{
			merc = 0;
			price = 1500;
			show = 0;
		};	
		class V_HarnessO_gry: V_HarnessO_brn {};
		class V_HarnessO_ghex_F: V_HarnessO_brn {};
		class IP_V_HarnessO_KSK_Tropic: V_HarnessO_brn {};
		class IP_V_HarnessO_KSK_Arid: IP_V_HarnessO_KSK_Tropic {};
		class IP_V_HarnessO_KSK: IP_V_HarnessO_KSK_Tropic {};
		class V_HarnessOGL_brn
		{
			merc = 0;
			price = 1500;
			show = 0;
		};
		class V_HarnessOGL_gry: V_HarnessOGL_brn {};
		class V_HarnessOGL_ghex_F: V_HarnessOGL_brn {};
		class IP_V_HarnessOGL_KSK: V_HarnessOGL_brn {};
		class IP_V_HarnessOGL_KSK_Tropic: IP_V_HarnessOGL_KSK {};
		class IP_V_HarnessOGL_KSK_Arid: IP_V_HarnessOGL_KSK {};
		class V_HarnessOSpec_brn
		{
			merc = 0;
			price = 1500;
			show = 0;
		};
		class V_HarnessOSpec_gry: V_HarnessOSpec_brn {};
		class V_TacVest_khk
		{
			merc = 1;
			price = 1500;
			show = 1;			
		};
		class V_TacVest_brn: V_TacVest_khk {};
		class V_TacVest_gen_F: V_TacVest_khk {};
		class IP_V_TacVest_KSK_Tropic: V_TacVest_khk 
		{
			merc = 0;
			show = 0;
		};
		class IP_V_TacVest_KSK_Arid: IP_V_TacVest_KSK_Tropic {};
		class IP_V_TacVest_KSK: IP_V_TacVest_KSK_Tropic {};
		class V_TacVest_oli: V_TacVest_khk
		{
			merc = 1;
			show = 1;			
		};
		class V_TacVest_blk: V_TacVest_oli {};
		class V_TacVest_camo: V_TacVest_oli {};
		class V_TacVest_blk_POLICE: V_TacVest_khk {};
		class V_TacVestCamo_khk: V_TacVest_oli {};		
		class V_I_G_resistanceLeader_F: V_TacVest_oli
		{
			merc = 0;
			show = 0;
		};
		class V_Press_F
		{
			merc = 0;
			price = 2000;
			show = 0;
		};
		class V_TacVestIR_blk
		{
			price = 2000;
		};
		class V_DeckCrew_yellow_F
		{
			merc = 0;
			price = 2000;
			show = 0;
		};
		class V_DeckCrew_blue_F: V_DeckCrew_yellow_F {};
		class V_DeckCrew_green_F: V_DeckCrew_yellow_F {};
		class V_DeckCrew_red_F: V_DeckCrew_yellow_F {};
		class V_DeckCrew_white_F: V_DeckCrew_yellow_F {};
		class V_DeckCrew_brown_F: V_DeckCrew_yellow_F {};
		class V_DeckCrew_violet_F: V_DeckCrew_yellow_F {};
		class IP_V_6094_KSK_1_Fleck_Tropic
		{
			merc = 0;
			price = 3000;
			show = 0;
		};
		class IP_V_6094_KSK_1_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_2_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_2_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_3_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_3_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_4_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_4_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_5_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_5_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_6_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_6_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_7_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_7_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_8_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_8_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_9_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_9_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_10_Fleck_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_10_Green_Tropic: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_1_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_1_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_2_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_2_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_3_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_3_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_4_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_4_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_5_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_5_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_6_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_6_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};		
		class IP_V_6094_KSK_7_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_7_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_8_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_8_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_9_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_9_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_10_Fleck_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_10_Sage_Arid: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_1: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_1_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_2: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_2_Green: IP_V_6094_KSK_1_Fleck_Tropic {};		
		class IP_V_6094_KSK_3: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_3_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_4: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_5: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_5_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_6: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_6_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_7: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_7_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_8: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_8_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_9: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_9_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_10: IP_V_6094_KSK_1_Fleck_Tropic {};
		class IP_V_6094_KSK_10_Green: IP_V_6094_KSK_1_Fleck_Tropic {};
		class V_CarrierRigKBT_01_light_EAF_F
		{
			merc = 0;
			price = 2500;
			show = 0;
		};
		class V_CarrierRigKBT_01_light_Olive_F: V_CarrierRigKBT_01_light_EAF_F
		{
			merc = 1;
			show = 1;
		};
		class V_PlateCarrier1_blk
		{
			price = 3000;
		};	
		class V_PlateCarrier1_rgr: V_PlateCarrier1_blk {};
		class V_PlateCarrier1_rgr_noflag_F: V_PlateCarrier1_blk {};
		class V_PlateCarrier1_wdl: V_PlateCarrier1_blk {};
		class V_PlateCarrier_Kerry: V_PlateCarrier1_blk {};
		class V_PlateCarrierL_CTRG: V_PlateCarrier1_blk {};
		class V_PlateCarrier1_tna_F: V_PlateCarrier1_blk
		{
			merc = 0;
			show = 0;			
		};
		class IP_V_PlateCarrier1_KSK_Fleck_Tropic: V_PlateCarrier1_blk
		{
			merc = 0;
			show = 0;			
		};
		class IP_V_PlateCarrier1_KSK_Fleck_Arid: IP_V_PlateCarrier1_KSK_Fleck_Tropic {};
		class IP_V_PlateCarrier1_KSK_Fleck: IP_V_PlateCarrier1_KSK_Fleck_Tropic {};
		class V_PlateCarrierIA1_dgtl
		{
			price = 3000;
		};
		class V_CarrierRigKBT_01_EAF_F
		{
			merc = 0;
			price = 3000;
			show = 0;
		};
		class V_CarrierRigKBT_01_Olive_F: V_CarrierRigKBT_01_EAF_F
		{
			merc = 1;
			show = 1;
		};
		class V_PlateCarrier2_rgr
		{
			price = 3500;
		};
		class V_PlateCarrier2_blk: V_PlateCarrier2_rgr {};
		class V_PlateCarrier2_rgr_noflag_F: V_PlateCarrier2_rgr {};
		class V_PlateCarrier2_wdl: V_PlateCarrier2_rgr {};
		class V_PlateCarrier2_tna_F: V_PlateCarrier2_rgr
		{
			merc = 0;
			show = 0;			
		};
		class IP_V_PlateCarrier2_KSK_Fleck_Tropic: V_PlateCarrier2_rgr
		{
			merc = 0;
			show = 0;			
		};
		class IP_V_PlateCarrier2_KSK_Fleck_Arid: IP_V_PlateCarrier2_KSK_Fleck_Tropic {};
		class IP_V_PlateCarrier2_KSK_Fleck: IP_V_PlateCarrier2_KSK_Fleck_Tropic {};
		class V_PlateCarrierH_CTRG: V_PlateCarrier2_rgr {};
		class V_PlateCarrier3_rgr
		{
			price = 4000;
		};
		class V_PlateCarrierIA2_dgtl
		{
			price = 4000;
		};
	};
	
	// Vests (Heavy)
	class VestsHeavy
	{
		basePrice = 4000;
		displayName = "Vests (Heavy)";
		
		class V_CarrierRigKBT_01_heavy_EAF_F
		{
			merc = 0;
			price = 4500;
			show = 0;
		};
		class V_CarrierRigKBT_01_heavy_Olive_F: V_CarrierRigKBT_01_heavy_EAF_F
		{
			merc = 1;
			show = 1;
		};
		class V_PlateCarrierIAGL_dgtl
		{
			price = 5000;
		};
		class V_PlateCarrierIAGL_oli: V_PlateCarrierIAGL_dgtl {};
		class V_PlateCarrierGL_rgr
		{
			price = 5000;
		};
		class V_PlateCarrierGL_blk: V_PlateCarrierGL_rgr {};
		class V_PlateCarrierGL_mtp: V_PlateCarrierGL_rgr
		{
			merc = 0;
			show = 0;			
		};
		class V_PlateCarrierGL_tna_F: V_PlateCarrierGL_rgr
		{
			merc = 0;
			show = 0;			
		};
		class V_PlateCarrierGL_wdl: V_PlateCarrierGL_rgr {};
		class V_PlateCarrierSpec_rgr 
		{
			price = 5000;
		};
		class V_PlateCarrierSpec_blk: V_PlateCarrierSpec_rgr {};
		class V_PlateCarrierSpec_mtp: V_PlateCarrierSpec_rgr
		{
			merc = 0;
			show = 0;			
		};
		class V_PlateCarrierSpec_tna_F: V_PlateCarrierSpec_rgr
		{
			merc = 0;
			show = 0;		
		};
		class V_PlateCarrierSpec_wdl: V_PlateCarrierSpec_rgr {};
		class V_EOD_blue_F 
		{
			merc = 0;
			price = 5000;
			show = 0;
		};
		class V_EOD_olive_F: V_EOD_blue_F {};
		class V_EOD_coyote_F: V_EOD_blue_F {};
		class V_EOD_IDAP_blue_F: V_EOD_blue_F {};
	};
	
	// Diving
	class DivingGear
	{
		displayName = "Diving Gear";
		show = 0;
		
		class G_Diving
		{
			price = 250;
			show = 0;
		};
		class V_RebreatherB
		{
			price = 3000;
			show = 0;
		};	
		class V_RebreatherIR: V_RebreatherB {};
		class IP_V_RebreatherIR_ST: V_RebreatherB {};
		class V_RebreatherIA: V_RebreatherB {};
	};
	
	// Goggles
	class Goggles
	{
		basePrice = 100;
		displayName = "Facewear";
		
		class G_Bandanna_tan
		{
			price = 10;
		};
		class G_Bandanna_blk: G_Bandanna_tan {};
		class G_Bandanna_oli: G_Bandanna_tan {};
		class G_Bandanna_khk: G_Bandanna_tan {};
		class G_Bandanna_beast: G_Bandanna_tan {};
		class G_Bandanna_shades
		{
			price = 110;
		};
		class G_Bandanna_sport
		{
			price = 110;
		};
		class G_Bandanna_aviator
		{
			price = 210;
		};
		class G_Balaclava_blk
		{
			price = 20;
		};
		class G_Balaclava_oli: G_Balaclava_blk {};
		class G_Balaclava_lowprofile
		{
			price = 70;
		};
		class G_Balaclava_combat
		{
			price = 320;
		};
		class G_Spectacles
		{
			price = 50;
		};	
		class G_Spectacles_Tinted: G_Spectacles {};		
		class G_Lowprofile
		{
			price = 50;
		};	
		class G_Squares
		{
			price = 50;
		};
		class G_Squares_Tinted: G_Squares {};
		class G_Sport_Blackred
		{
			price = 100;
		};
		class G_Sport_BlackWhite: G_Sport_Blackred {};
		class G_Sport_Blackyellow: G_Sport_Blackred {};
		class G_Sport_Greenblack: G_Sport_Blackred {};
		class G_Sport_Checkered: G_Sport_Blackred {};
		class G_Sport_Red: G_Sport_Blackred {};
		class G_Shades_Black
		{
			price = 100;
		};	
		class G_Shades_Blue: G_Shades_Black {};
		class G_Shades_Green: G_Shades_Black {};
		class G_Shades_Red: G_Shades_Black {};		
		class G_Lady_Mirror
		{
			price = 150;
		};	
		class G_Lady_Dark: G_Lady_Mirror {};
		class G_Lady_Red: G_Lady_Mirror {};
		class G_Lady_Blue: G_Lady_Mirror {};
		class G_Aviator
		{
			price = 200;
		};
		class G_Combat
		{
			price = 300;
		};
		class G_Tactical_Black
		{
			description = "Compatible to BIS Glass.";
			price = 10000;
		};
		class G_Tactical_Clear
		{
			description = "Compatible to BIS Glass.";
			price = 10000;
		};	
	};	
	
	// Headgear (Soft)
	class HeadgearSoft
	{
		basePrice = 15;
		displayName = "Headgear (Soft)";
		
		class H_Hat_Tinfoil_F
		{
			merc = 0;
			price = 1;
		};
		class H_HeadBandage_clean_F
		{
			merc = 0;
			price = 5;
			show = 0;
		};
		class H_HeadBandage_stained_F: H_HeadBandage_clean_F {};
		class H_HeadBandage_bloody_F: H_HeadBandage_clean_F {};
		class H_Bandanna_surfer
		{
			merc = 0;
			price = 10;
			show = 0;
		};
		class H_Bandanna_surfer_blk: H_Bandanna_surfer {};
		class H_Bandanna_surfer_grn: H_Bandanna_surfer {};
		class H_Bandanna_blu: H_Bandanna_surfer {};
		class H_Bandanna_khk: H_Bandanna_surfer {};
		class H_Bandanna_cbr: H_Bandanna_surfer {};
		class H_Bandanna_sgg: H_Bandanna_surfer
		{
			merc = 1;
			show = 1;
		};
		class H_Bandanna_gry: H_Bandanna_sgg {};
		class H_Bandanna_camo: H_Bandanna_sgg {};
		class H_Bandanna_mcamo: H_Bandanna_surfer {};
		class H_Bandanna_sand: H_Bandanna_surfer {};
		class H_Bandanna_khk_hs
		{
			price = 30;
		};
		class H_WirelessEarpiece_F
		{
			price = 15;
		};
		class H_Shemag_khk
		{
			price = 20;
		};
		class H_Shemag_tan: H_Shemag_khk {};
		class H_Shemag_olive: H_Shemag_khk {};
		class H_ShemagOpen_khk: H_Shemag_khk {};
		class H_ShemagOpen_tan: H_Shemag_khk {};
		class H_HeadSet_yellow_F
		{
			merc = 0;
			price = 30;
			show = 0;
		};
		class H_HeadSet_white_F: H_HeadSet_yellow_F {};
		class H_HeadSet_orange_F: H_HeadSet_yellow_F {};
		class H_HeadSet_red_F: H_HeadSet_yellow_F {};
		class H_HeadSet_black_F: H_HeadSet_yellow_F 
		{
			merc = 1;
			show = 1;
		};
		class H_Shemag_olive_hs
		{
			price = 40;
		};		
		class H_Booniehat_khk
		{
			price = 30;
		};
		class H_Booniehat_indp: H_Booniehat_khk {};
		class H_Booniehat_mcamo: H_Booniehat_khk
		{
			merc = 0;
			show = 0;			
		};
		class H_Booniehat_grn: H_Booniehat_khk {};
		class H_Booniehat_tan: H_Booniehat_khk {};
		class H_Booniehat_dirty: H_Booniehat_khk {};
		class H_Booniehat_oli: H_Booniehat_khk {};
		class H_Booniehat_dgtl: H_Booniehat_khk {};
		class H_Booniehat_tna_F: H_Booniehat_mcamo {};
		class H_Booniehat_mgrn: H_Booniehat_khk {};
		class H_Booniehat_taiga: H_Booniehat_khk {};
		class H_Booniehat_wdl: H_Booniehat_khk {};
		class H_Booniehat_eaf: H_Booniehat_mcamo {};
		class H_Booniehat_khk_hs
		{
			price = 50;
		};
		class H_Cap_red
		{
			merc = 0;
			price = 40;
			show = 0;
		};
		class H_Cap_blu: H_Cap_red {};
		class H_Cap_surfer: H_Cap_red {};
		class H_Cap_oli: H_Cap_red
		{
			merc = 1;
			show = 1;
		};
		class H_Cap_tan: H_Cap_red {};
		class H_Cap_blk: H_Cap_oli {};
		class H_Cap_blk_CMMG: H_Cap_oli {};
		class H_Cap_brn_SPECOPS: H_Cap_oli {};
		class H_Cap_tan_specops_US: H_Cap_red {};
		class H_Cap_khaki_specops_UK: H_Cap_oli {};
		class H_Cap_grn: H_Cap_oli {};
		class H_Cap_grn_BI: H_Cap_oli {};
		class H_Cap_blk_Raven: H_Cap_oli {};
		class H_Cap_blk_ION: H_Cap_oli {};
		class H_Cap_usblack: H_Cap_oli {};
		class H_Cap_police: H_Cap_red {};
		class H_Cap_press: H_Cap_red {};
		class H_Cap_Black_IDAP_F: H_Cap_oli {};
		class H_Cap_Orange_IDAP_F: H_Cap_red {};
		class H_Cap_White_IDAP_F: H_Cap_red {};
		class H_BandMask_blk
		{
			price = 50;
		};	
		class H_Cap_oli_hs
		{
			price = 60;
		};
		class H_Cap_headphones
		{
			price = 60;
		};
		class H_Cap_marshal: H_Cap_headphones {};
		class H_Watchcap_blk
		{
			price = 40;
		};
		class H_Watchcap_khk: H_Watchcap_blk {};
		class H_Watchcap_camo: H_Watchcap_blk {};
		class H_Watchcap_sgg: H_Watchcap_blk {};
		class H_Watchcap_cbr: H_Watchcap_blk {};
		class H_MilCap_ocamo
		{
			show = 0;
			price = 60;
			merc = 0;
		};
		class H_MilCap_mcamo: H_MilCap_ocamo {};
		class H_MilCap_tna_F: H_MilCap_ocamo {};
		class H_MilCap_ghex_F: H_MilCap_ocamo {};
		class H_MilCap_gen_F: H_MilCap_ocamo {};
		class H_MilCap_oucamo: H_MilCap_ocamo
		{
			show = 1;
			merc = 1;
		};
		class H_MilCap_rucamo: H_MilCap_oucamo {};
		class H_MilCap_gry: H_MilCap_oucamo {};
		class H_MilCap_blue: H_MilCap_oucamo {};	
		class H_MilCap_dgtl: H_MilCap_oucamo {};
		class H_MilCap_grn: H_MilCap_oucamo {};
		class H_MilCap_taiga: H_MilCap_oucamo {};
		class H_MilCap_eaf: H_MilCap_oucamo
		{
			show = 0;
			merc = 0;
		};
		class H_MilCap_wdl: H_MilCap_oucamo {};
		class H_Beret_blk
		{
			price = 60;
		};
		class H_Beret_blk_POLICE: H_Beret_blk {};
		class H_Beret_red: H_Beret_blk {};
		class H_Beret_grn: H_Beret_blk {};
		class H_Beret_grn_SF: H_Beret_blk {};
		class H_Beret_brn_SF: H_Beret_blk {};
		class H_Beret_gen_F: H_Beret_blk 
		{
			show = 0;
			merc = 0;
		};
		class H_Beret_EAF_01_F: H_Beret_blk 
		{
			show = 0;
			merc = 0;
		};
		class H_Hat_Safari_sand_F
		{
			merc = 0;
			price = 80;
			show = 0;
		};
		class H_Hat_Safari_olive_F: H_Hat_Safari_sand_F 
		{
			show = 1;
			merc = 1;
		};
		class H_Beret_02
		{
			merc = 0;
			price = 100;
			show = 0;
		};
		class H_Beret_Colonel: H_Beret_02 {};
		class H_StrawHat
		{
			merc = 0;
			price = 100;
			show = 0;
		};
		class H_StrawHat_dark: H_StrawHat {};
		class H_Hat_blue: H_StrawHat {};
		class H_Hat_brown: H_StrawHat {};
		class H_Hat_camo: H_StrawHat {};
		class H_Hat_grey: H_StrawHat {};
		class H_Hat_checker: H_StrawHat {};
		class H_Hat_tan: H_StrawHat {};
		class H_EarProtectors_yellow_F
		{
			merc = 0;
			price = 100;
			show = 0;
		};
		class H_EarProtectors_white_F: H_EarProtectors_yellow_F {};
		class H_EarProtectors_orange_F: H_EarProtectors_yellow_F {};
		class H_EarProtectors_red_F: H_EarProtectors_yellow_F {};
		class H_EarProtectors_black_F: H_EarProtectors_yellow_F {};
	};
	
	// Headgear (Combat)
	class HeadgearCombat
	{
		basePrice = 1000;
		displayName = "Headgear (Combat)";
		
		class H_Helmet_Skate
		{
			price = 500;
		};
		class H_PASGT_basic_blue_F
		{
			price = 750;
		};
		class H_PASGT_basic_black_F: H_PASGT_basic_blue_F {};
		class H_PASGT_basic_olive_F: H_PASGT_basic_blue_F {};
		class H_PASGT_basic_white_F: H_PASGT_basic_blue_F 
		{
			merc = 0;
			show = 0;
		};
		class H_PASGT_basic_blue_press_F: H_PASGT_basic_blue_F 
		{
			merc = 0;
			show = 0;
		};
		class H_PASGT_neckprot_blue_press_F
		{
			merc = 0;
			price = 750;
			show = 0;
		};
		class H_HelmetB_light
		{
			price = 1000;
		};
		class H_HelmetB_light_grass: H_HelmetB_light {};
		class H_HelmetB_light_snakeskin: H_HelmetB_light {};
		class H_HelmetB_light_desert: H_HelmetB_light
		{
			merc = 0;
			show = 0;
		};
		class H_HelmetB_light_black: H_HelmetB_light {};
		class H_HelmetB_light_wdl: H_HelmetB_light {};
		class H_HelmetB_light_sand: H_HelmetB_light_desert {};
		class H_HelmetB_Light_tna_F: H_HelmetB_light_desert {};
		class H_HelmetIA
		{
			price = 2000;
		};
		class H_HelmetAggressor_F
		{
			price = 2000;
		};
		class H_HelmetAggressor_cover_F: H_HelmetAggressor_F {};
		class H_HelmetAggressor_cover_taiga_F: H_HelmetAggressor_F
		{
			merc = 0;
			show = 0;
		};
		class H_HelmetHBK_F
		{
			price = 2000;
		};
		class H_HelmetHBK_chops_F: H_HelmetHBK_F
		{
			merc = 0;
			show = 0;
		};
		class H_HelmetHBK_ear_F: H_HelmetHBK_chops_F {};
		class H_HelmetHBK_headset_F: H_HelmetHBK_chops_F {};
		class H_HelmetB
		{
			price = 2000;
		};
		class H_HelmetB_plain_mcamo: H_HelmetB
		{
			merc = 0;
			show = 0;
		};
		class H_HelmetB_plain_blk: H_HelmetB {};
		class H_HelmetB_camo: H_HelmetB {};
		class H_HelmetB_paint: H_HelmetB {};
		class H_HelmetB_grass: H_HelmetB {};
		class H_HelmetB_snakeskin: H_HelmetB {};
		class H_HelmetB_black: H_HelmetB {};
		class H_HelmetB_desert: H_HelmetB_plain_mcamo {};
		class H_HelmetB_sand: H_HelmetB_plain_mcamo {};
		class H_HelmetB_tna_F: H_HelmetB_plain_mcamo {};
		class H_HelmetB_plain_wdl: H_HelmetB {};
		class H_HelmetSpecB
		{
			price = 3000;
		};
		class H_HelmetSpecB_paint1: H_HelmetSpecB {};
		class H_HelmetSpecB_paint2: H_HelmetSpecB {};
		class H_HelmetSpecB_blk: H_HelmetSpecB {};
		class H_HelmetSpecB_snakeskin: H_HelmetSpecB {};
		class H_HelmetSpecB_wdl: H_HelmetSpecB {};
		class H_HelmetSpecB_sand: H_HelmetSpecB 
		{
			merc = 0;
			show = 0;
		};
		class H_HelmetB_Enh_tna_F: H_HelmetSpecB_sand {};
		class H_HelmetB_TI_tna_F
		{
			merc = 0;
			price = 4000;
			show = 0;
		};
		class H_HelmetO_ocamo
		{
			merc = 0;
			price = 4000;
			show = 0;
		};
		class H_HelmetO_oucamo: H_HelmetO_ocamo {};
		class H_HelmetO_ghex_F: H_HelmetO_ocamo {};
		class H_HelmetLeaderO_ocamo
		{
			merc = 0;
			price = 4000;
			show = 0;
		};
		class H_HelmetLeaderO_oucamo: H_HelmetLeaderO_ocamo {};
		class H_HelmetLeaderO_ghex_F: H_HelmetLeaderO_ocamo {};
		class H_HelmetSpecO_ocamo
		{
			merc = 0;
			price = 4000;
			show = 0;
		};
		class H_HelmetSpecO_blk: H_HelmetSpecO_ocamo
		{
			merc = 1;
			show = 1;
		};
		class H_HelmetSpecO_ghex_F: H_HelmetSpecO_ocamo {};
		class H_HelmetO_ViperSP_hex_F
		{
			merc = 0;
			price = 5000;
			show = 0;
		};
		class H_HelmetO_ViperSP_ghex_F: H_HelmetO_ViperSP_hex_F {};
	};
	
	// Headgear (Special)
	class HeadgearSpecial
	{	
		displayName = "Headgear (Special)";
		show = 0;
		
		class H_Tank_black_F
		{
			price = 100;
			show = 0;
		};
		class H_Construction_basic_yellow_F
		{
			price = 250;
			show = 0;
		};
		class H_Construction_basic_white_F: H_Construction_basic_yellow_F {};
		class H_Construction_basic_orange_F: H_Construction_basic_yellow_F {};
		class H_Construction_basic_red_F: H_Construction_basic_yellow_F {};
		class H_Construction_basic_vrana_F: H_Construction_basic_yellow_F {};
		class H_Construction_basic_black_F: H_Construction_basic_yellow_F {};
		class H_Construction_earprot_yellow_F: H_Construction_basic_yellow_F {};
		class H_Construction_earprot_white_F: H_Construction_basic_yellow_F {};
		class H_Construction_earprot_orange_F: H_Construction_basic_yellow_F {};
		class H_Construction_earprot_red_F: H_Construction_basic_yellow_F {};
		class H_Construction_earprot_vrana_F: H_Construction_basic_yellow_F {};
		class H_Construction_earprot_black_F: H_Construction_basic_yellow_F {};
		class H_Construction_headset_yellow_F: H_Construction_basic_yellow_F {};
		class H_Construction_headset_white_F: H_Construction_basic_yellow_F {};		
		class H_Construction_headset_orange_F: H_Construction_basic_yellow_F {};
		class H_Construction_headset_red_F: H_Construction_basic_yellow_F {};
		class H_Construction_headset_vrana_F: H_Construction_basic_yellow_F {};
		class H_Construction_headset_black_F: H_Construction_basic_yellow_F {};
		class H_RacingHelmet_1_F
		{
			price = 1000;
			show = 0;
		};
		class H_RacingHelmet_2_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_3_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_4_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_black_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_blue_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_green_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_red_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_white_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_yellow_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_orange_F: H_RacingHelmet_1_F {};
		class H_HelmetCrew_B
		{
			price = 2000;
		};
		class H_HelmetCrew_I: H_HelmetCrew_B {};
		class H_HelmetCrew_I_E: H_HelmetCrew_B {};
		class H_HelmetCrew_O: H_HelmetCrew_B {};		
		class H_HelmetCrew_O_ghex_F: H_HelmetCrew_B {};
		class H_PilotHelmetHeli_B
		{
			price = 2000;
		};
		class H_PilotHelmetHeli_I: H_PilotHelmetHeli_B {};
		class H_PilotHelmetHeli_I_E: H_PilotHelmetHeli_B {};
		class H_PilotHelmetHeli_O: H_PilotHelmetHeli_B {};
		class H_Tank_eaf_F
		{
			price = 2000;
		};
		class H_CrewHelmetHeli_B
		{
			price = 2000;
		};
		class H_CrewHelmetHeli_I: H_CrewHelmetHeli_B {};
		class H_CrewHelmetHeli_I_E: H_CrewHelmetHeli_B {};
		class H_CrewHelmetHeli_O: H_CrewHelmetHeli_B {};
		class H_PilotHelmetFighter_B
		{
			price = 5000;
		};
		class H_PilotHelmetFighter_I: H_PilotHelmetFighter_B {};
		class H_PilotHelmetFighter_I_E: H_PilotHelmetFighter_B {};
		class H_PilotHelmetFighter_O: H_PilotHelmetFighter_B {};
	};
	
	// Attachments (Muzzle)
	class AttachmentsMuzzle
	{	
		basePrice = 1000;
		displayName = "Attachments (Muzzle)";
		
		// Muzzles
		class muzzle_snds_L
		{
			price = 500;
		};
		class muzzle_snds_acp
		{
			price = 750;
		};
		class muzzle_snds_m
		{
			price = 1000;
		};
		class muzzle_snds_H
		{
			price = 1250;
		};
		class muzzle_snds_H_MG
		{
			price = 1250;
		};
		class muzzle_snds_B
		{
			price = 1500;
		};
		class muzzle_snds_338_black
		{
			price = 2000;
		};
		class muzzle_snds_338_green: muzzle_snds_338_black {};
		class muzzle_snds_338_sand: muzzle_snds_338_black
		{
			show = 0;
		};
		class muzzle_snds_93mmg
		{
			price = 2000;
		};
		class muzzle_snds_93mmg_tan: muzzle_snds_93mmg
		{
			show = 0;
		};
		class muzzle_antenna_01_f
		{
			price = 500;
			show = 0;
		};
		class muzzle_antenna_02_f: muzzle_antenna_01_f {};
		class muzzle_antenna_03_f: muzzle_antenna_01_f {};
	};
	
	// Attachments (Rail)
	class AttachmentsRail
	{
		basePrice = 100;
		displayName = "Attachments (Rail)";
		
		class acc_flashlight
		{
			price = 50;
		};
		class acc_pointer_IR
		{
			price = 100;
		};
	};
	
	// Attachments (Optics)
	class AttachmentsOptics
	{
		basePrice = 250;
		displayName = "Attachments (Optics)";
		
		// Optics
		class optic_MRD
		{
			price = 100;
		};
		class optic_Yorris
		{
			price = 150;
		};
		class optic_Aco
		{
			price = 200;
		};
		class optic_ACO_grn: optic_Aco {};
		class optic_Aco_smg
		{
			price = 200;
		};
		class optic_ACO_grn_smg: optic_Aco_smg {};
		class hlc_optic_kobra
		{
			price = 200;
		};
		class optic_Holosight
		{
			price = 500;
		};
		class optic_Holosight_smg
		{
			price = 500;
		};
		class optic_MRCO
		{
			price = 1000;
		};
		class optic_Arco
		{
			price = 1000;
		};
		class optic_Hamr
		{
			price = 1000;
		};
		class optic_SOS
		{
			price = 2000;
		};		
		class optic_KHS_blk
		{
			price = 2000;
		};
		class optic_KHS_hex: optic_KHS_blk
		{
			show = 0;
		};
		class optic_KHS_tan: optic_KHS_hex {};		
		class optic_AMS
		{
			price = 2000;
		};
		class optic_AMS_khk: optic_AMS
		{
			show = 0;
		};
		class optic_AMS_snd: optic_AMS_khk {};		
		class optic_DMS
		{
			price = 2000;
		};
		class optic_LRPS
		{
			price = 4000;
		};
		class optic_NVS
		{
			price = 4000;
		};
		class optic_Nightstalker
		{
			price = 4000;
		};
		class optic_tws
		{
			price = 4000;
		};
		class optic_tws_mg
		{
			price = 4000;
		};
	};
	
	// Attachments (Under Barrel)
	class AttachmentsUnderBarrel
	{
		basePrice = 100;
		displayName = "Attachments (Under Barrel)";
		
		class bipod_01_F_snd
		{
			price = 100;
			show = 0;
		};
		class bipod_01_F_blk: bipod_01_F_snd
		{
			show = 1;
		};
		class bipod_01_F_mtp: bipod_01_F_snd {};
		class bipod_02_F_blk
		{
			price = 100;
		};
		class bipod_02_F_tan: bipod_02_F_blk 
		{
			show = 0;
		};
		class bipod_02_F_hex: bipod_02_F_tan {};
		class bipod_03_F_blk
		{
			price = 100;
		};
		class bipod_03_F_oli: bipod_03_F_blk {};
	};
	
	// Backpacks
	class Backpacks
	{
		basePrice = 500;
		displayName = "Backpacks";
		
		class B_AssaultPack_khk
		{
			price = 500;
		};
		class B_AssaultPack_dgtl: B_AssaultPack_khk {};
		class B_AssaultPack_rgr: B_AssaultPack_khk {};
		class B_AssaultPack_sgg: B_AssaultPack_khk {};
		class B_AssaultPack_blk: B_AssaultPack_khk {};
		class B_AssaultPack_cbr: B_AssaultPack_khk {};
		class B_AssaultPack_mcamo: B_AssaultPack_khk {};
		class B_AssaultPack_ocamo: B_AssaultPack_khk {};
		class B_AssaultPack_Kerry: B_AssaultPack_khk {};
		class B_FieldPack_khk
		{
			price = 1000;
		};
		class B_FieldPack_ocamo: B_FieldPack_khk {};
		class B_FieldPack_oucamo: B_FieldPack_khk {};
		class B_FieldPack_cbr: B_FieldPack_khk {};
		class B_FieldPack_blk: B_FieldPack_khk {};
		class B_FieldPack_oli: B_FieldPack_khk {};
		class B_Kitbag_rgr
		{
			price = 1500;
		};
		class B_Kitbag_mcamo: B_Kitbag_rgr {};
		class B_Kitbag_sgg: B_Kitbag_rgr {};
		class B_Kitbag_cbr: B_Kitbag_rgr {};
		class B_TacticalPack_rgr
		{
			price = 2000;
		};
		class B_TacticalPack_mcamo: B_TacticalPack_rgr {};
		class B_TacticalPack_ocamo: B_TacticalPack_rgr {};
		class B_TacticalPack_blk: B_TacticalPack_rgr {};
		class B_TacticalPack_oli: B_TacticalPack_rgr {};
		class B_Carryall_ocamo
		{
			price = 2500;
		};
		class B_Carryall_oucamo: B_Carryall_ocamo {};
		class B_Carryall_mcamo: B_Carryall_ocamo {};
		class B_Carryall_khk: B_Carryall_ocamo {};
		class B_Carryall_cbr: B_Carryall_ocamo {};
		class B_Carryall_oli: B_Carryall_ocamo {};
	};
	
	// Backpacks Parachutes
	class BackpacksParachutes
	{
		basePrice = 3000;
		displayName = "Backpacks (Parachutes)";
		show = 0;
		
		class B_Parachute
		{
			price = 3000;
		};
	};
	
	// Backpacks Statics
	class BackpacksStatics
	{
		basePrice = 5000;
		displayName = "Backpacks (Statics)";
		show = 0;
		
		class B_HMG_01_weapon_F
		{
			price = 5000;
		};
		class I_HMG_01_weapon_F: B_HMG_01_weapon_F {};
		class O_HMG_01_weapon_F: B_HMG_01_weapon_F {};
		class B_HMG_01_support_F 
		{
			price = 5000;
		};
		class I_HMG_01_support_F: B_HMG_01_support_F {};
		class O_HMG_01_support_F: B_HMG_01_support_F {};
		class B_GMG_01_weapon_F
		{
			price = 5000;
		};
		class I_GMG_01_weapon_F: B_GMG_01_weapon_F {};
		class O_GMG_01_weapon_F: B_GMG_01_weapon_F {};
		class B_Mortar_01_weapon_F
		{
			price = 5000;
		};
		class I_Mortar_01_weapon_F: B_Mortar_01_weapon_F {};
		class O_Mortar_01_weapon_F: B_Mortar_01_weapon_F {};
		class B_Mortar_01_support_F 
		{
			price = 5000;
		};
		class I_Mortar_01_support_F: B_Mortar_01_support_F {};
		class O_Mortar_01_support_F: B_Mortar_01_support_F {};
	};
};