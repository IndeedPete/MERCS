class IP_DLG_DICTIONARY
{
	idd = 20002;
	movingenable = false;
	duration = 1e+1000;
	onLoad = "UINamespace setVariable ['DLG_Dictionary', _this select 0]"; 
	
	class Controls
	{
		class IP_STR_DICT: RscStructuredText
		{
			idc = 1100;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
	};
};