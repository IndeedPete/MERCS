class CfgPatches
{
	class IP_CMP_MERCS
	{
		units[] = {"MERCS_Dummy_Modern_Arid","MERCS_Dummy_Modern_Arid_Vest","MERCS_Dummy_Modern_Arid_T","MERCS_Dummy_Classic_Arid","MERCS_Dummy_Classic_Arid_Vest"};
		weapons[] = {"IP_U_B_CombatUniform_MERCS_Modern_Arid","IP_U_B_CombatUniform_MERCS_Modern_Arid_Rolled","IP_U_B_CombatUniform_MERCS_Modern_Arid_T","IP_U_B_CombatUniform_MERCS_Classic_Arid","IP_U_B_CombatUniform_MERCS_Classic_Arid_Rolled"};
		requiredVersion = 1.0;
		requiredAddons[] = {"a3_map_stratis", "a3_map_altis","A3_Characters_F","A3_characters_F_gamma","A3_Characters_F_EPB","A3_Characters_F_Bootcamp"};
		author = "IndeedPete";
		authorUrl = "";
		version = 1.0;
		versionStr = "1.0";
		versionAr[] = {1,0};
	};	
};

class CfgMissions
{
	class Campaigns
	{
		class IP_CMP_MERCS
		{
			directory = "IP_CMP_MERCS\IP_CMP_MERCS";
		};
	};
};

class CfgMainMenuSpotlight
{
	class IP_KSK_MEW
	{
		text = "M.E.R.C.S."; // Text displayed on the square button, converted to upper-case
		textIsQuote = 1; // 1 to add quotation marks around the text
		picture = "\IP_CMP_MERCS\IP_CMP_MERCS\img\Main_Menu.paa"; // Square picture, ideally 512x512
		//video = "\IP_KSK_MEW\vid\MEW_Main_Menu.ogv"; // Video played on mouse hover
		action = "uiNamespace setVariable ['RscDisplayCampaignLoad_filter', 'IP_CMP_MERCS']; ctrlActivate ((ctrlParent (_this select 0)) displayCtrl 101);";
		//action = "ctrlactivate ((ctrlparent (_this select 0)) displayctrl 101);"; // Code called upon clicking, passed arguments are [<button:Control>]
		actionText = $STR_A3_RscDisplayMain_Spotlight_Play; // Text displayed in top left corner of on-hover white frame
		condition = "true"; // Condition for showing the spotlight
	};
};

class CfgVehicles
{	
	// Uniform Dummies
	class B_Soldier_F;
	
	class MERCS_Dummy_Classic_Arid: B_Soldier_F
	{
		hiddenSelections[] = {"Camo","Insignia"};
		hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\ia_soldier_01_clothing_MERCS_Coffee_co.paa"};
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01.p3d";
		scope = 1;
		uniformClass = "IP_U_B_CombatUniform_MERCS_Classic_Arid";
	};

	class MERCS_Dummy_Classic_Arid_Vest: MERCS_Dummy_Classic_Arid
	{
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
		uniformClass = "IP_U_B_CombatUniform_MERCS_Classic_Arid_Rolled";
	};
	
	class MERCS_Dummy_Modern_Arid: B_Soldier_F
	{
		hiddenSelections[] = {"Camo","Insignia"};
		hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_MERCS_Arid_co.paa"};
		model = "\A3\characters_F\BLUFOR\b_soldier_01.p3d";
		scope = 1;
		uniformClass = "IP_U_B_CombatUniform_MERCS_Modern_Arid";
	};
	
	class MERCS_Dummy_Modern_Arid_Vest: MERCS_Dummy_Modern_Arid
	{
		model = "\A3\characters_F\BLUFOR\b_soldier_03.p3d";
		uniformClass = "IP_U_B_CombatUniform_MERCS_Modern_Arid_Rolled";
	};
	
	class MERCS_Dummy_Modern_Arid_T: MERCS_Dummy_Modern_Arid
	{
		hiddenSelections[] = {"camo","camo2","Insignia"};
		hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_MERCS_Arid_co.paa","\IP_CMP_MERCS\IP_CMP_MERCS\txt\basicbody_MERCS_co.paa"};
		model = "\A3\characters_F\BLUFOR\b_soldier_02.p3d";
		uniformClass = "IP_U_B_CombatUniform_MERCS_Modern_Arid_T";
	};
};

class CfgWeapons 
{
	#include "uniforms.hpp"
};

#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\functions.hpp"