// RAD
class SURF_RSC_RAD
{
	idd = 20007;
	movingenable = false;
	duration = 1e+1000;

	class Controls
	{
		class SURF_PIC_RAD: RscPicture
		{
			idc = 1200;
			text = "\Campaigns\IP_CMP_MERCS\img\rad.paa"; // Path to image
			colorText[] = {1,1,1,1.0}; // RGBA
			x = 0.89375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.168 * safezoneH;
		};
	};
};