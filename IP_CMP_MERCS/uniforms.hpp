// Uniforms
class UniformItem;
class U_I_CombatUniform;
class U_I_CombatUniform_shortsleeve;
class U_B_CombatUniform_mcam;
class U_B_CombatUniform_mcam_vest;
class U_B_CombatUniform_mcam_tshirt;

class IP_U_B_CombatUniform_MERCS_Classic_Arid: U_I_CombatUniform 
{
	author = "IndeedPete";
	displayName = "ION Combat Suit Classic (Arid)";
	hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\ia_soldier_01_clothing_MERCS_Coffee_co.paa"};
	picture = "\IP_CMP_MERCS\IP_CMP_MERCS\txt\ui\MERCS_Dummy_Classic_Arid_ca.paa";

	class ItemInfo: UniformItem 
	{
		containerClass = "Supply40";
		hiddenSelections[] = {"Camo"};
		mass = 40;
		scope = 0;
		type = 801;
		uniformClass = "MERCS_Dummy_Classic_Arid";
		uniformModel = "-";
	};
};

class IP_U_B_CombatUniform_MERCS_Classic_Arid_Rolled: U_I_CombatUniform_shortsleeve 
{
	author = "IndeedPete";
	displayName = "ION Combat Suit Classic (Rolled-up, Arid)";
	hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\ia_soldier_01_clothing_MERCS_Coffee_co.paa"};
	picture = "\IP_CMP_MERCS\IP_CMP_MERCS\txt\ui\MERCS_Dummy_Classic_Arid_rolled_ca.paa";

	class ItemInfo: UniformItem 
	{
		containerClass = "Supply40";
		hiddenSelections[] = {"Camo"};
		mass = 40;
		scope = 0;
		type = 801;
		uniformClass = "MERCS_Dummy_Classic_Arid_Vest";
		uniformModel = "-";
	};
};

class IP_U_B_CombatUniform_MERCS_Modern_Arid: U_B_CombatUniform_mcam 
{
	author = "IndeedPete";
	displayName = "ION Combat Suit Modern (Arid)";
	hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_MERCS_Arid_co.paa"};
	picture = "\IP_CMP_MERCS\IP_CMP_MERCS\txt\ui\clothing1_MERCS_Arid_ca.paa";

	class ItemInfo: UniformItem 
	{
		containerClass = "Supply40";
		mass = 40;
		scope = 0;
		type = 801;
		uniformClass = "MERCS_Dummy_Modern_Arid";
		uniformModel = "-";
	};
};

class IP_U_B_CombatUniform_MERCS_Modern_Arid_Rolled: U_B_CombatUniform_mcam_vest 
{
	author = "IndeedPete";
	displayName = "ION Combat Suit Modern (Rolled-up, Arid)";
	hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_MERCS_Arid_co.paa"};
	picture = "\IP_CMP_MERCS\IP_CMP_MERCS\txt\ui\clothing1_MERCS_Arid_vest_ca.paa";

	class ItemInfo: UniformItem 
	{
		containerClass = "Supply40";
		mass = 40;
		scope = 0;
		type = 801;
		uniformClass = "MERCS_Dummy_Modern_Arid_Vest";
		uniformModel = "-";
	};
};

class IP_U_B_CombatUniform_MERCS_Modern_Arid_T: U_B_CombatUniform_mcam_tshirt 
{
	author = "IndeedPete";
	displayName = "ION Combat Suit Modern (T-Shirt, Arid)";
	hiddenSelections[] = {"camo","camo2"};
	hiddenSelectionsTextures[] = {"\IP_CMP_MERCS\IP_CMP_MERCS\txt\clothing1_MERCS_Arid_co.paa","\IP_CMP_MERCS\IP_CMP_MERCS\txt\basicbody_MERCS_co.paa"};
	picture = "\IP_CMP_MERCS\IP_CMP_MERCS\txt\ui\clothing1_MERCS_Arid_t_ca.paa";

	class ItemInfo: UniformItem 
	{
		containerClass = "Supply40";
		mass = 40;
		scope = 0;
		type = 801;
		uniformClass = "MERCS_Dummy_Modern_Arid_T";
		uniformModel = "-";
	};
};