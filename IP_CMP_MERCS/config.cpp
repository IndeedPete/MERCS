class CfgPatches
{
	class IP_CMP_MERCS
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"a3_map_stratis", "a3_map_altis"};
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

#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\functions.hpp"