class IP_DLG_GLASSBOOT
{
	idd = 20004;
	movingenable = false;
	duration = 1e+1000;
	onLoad = "UINamespace setVariable ['DLG_GlassBoot', _this select 0]"; 
	
	class Controls
	{
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Rufiqa)
		////////////////////////////////////////////////////////
		class IP_FRM_GLASSBOOT: RscFrame
		{
			idc = 1800;
			text = "BIS Glass v2.09"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
		};
		class IP_FRM_GLASSBOOTLOW: RscFrame
		{
			idc = 1801;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
		class IP_STX_GLASSLOADING: RscStructuredText
		{
			idc = 1100;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class IP_STX_GLASSLOADINGLOW: RscStructuredText
		{
			idc = 1101;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_GLASSSTATUS
{
	idd = 20005;
	movingenable = false;
	duration = 1e+1000;
	onLoad = "UINamespace setVariable ['DLG_GlassStatus', _this select 0]";
	
	class Controls
	{
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.11 * safezoneH;
		};
	
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Zucyle)
		////////////////////////////////////////////////////////
		class IP_FRM_GLASSSTATUS: RscFrame
		{
			idc = 1800;
			text = "Operator Status"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class IP_STX_GRID: RscStructuredText
		{
			idc = 1100;
			text = "Grid: 000000"; //--- ToDo: Localize;
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			size = "0.02 * safezoneH";
		};
		class IP_STX_CONDITION: RscStructuredText
		{
			idc = 1101;
			text = "Condition: CRITICAL"; //--- ToDo: Localize;
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			size = "0.02 * safezoneH";
		};
		class IP_STX_HEADING: RscStructuredText
		{
			idc = 1102;
			text = "Heading: NNW"; //--- ToDo: Localize;
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			size = "0.02 * safezoneH";
		};
		class IP_STX_PULSE: RscStructuredText
		{
			idc = 1103;
			text = "Pulse: 180/min"; //--- ToDo: Localize;
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			size = "0.02 * safezoneH";
		};
		class IP_STX_BREATHING: RscStructuredText
		{
			idc = 1104;
			text = "Breathing: 15/min"; //--- ToDo: Localize;
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			size = "0.02 * safezoneH";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_GLASSDETAILS
{
	idd = 20006;
	movingenable = false;
	duration = 1e+1000;
	onLoad = "UINamespace setVariable ['DLG_GlassDetails', _this select 0]"; 
	
	class Controls
	{
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.886719 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.319 * safezoneH;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Xovadu)
		////////////////////////////////////////////////////////

		class IP_FRM_DETAILS: RscFrame
		{
			idc = 1800;
			text = "Target Details"; //--- ToDo: Localize;
			x = 0.886719 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.319 * safezoneH;
		};
		class IP_IMG_AVATAR: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class IP_STX_DETAILS: RscStructuredText
		{
			idc = 1100;
			x = 0.897031 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.176 * safezoneH;
			size = "0.02 * safezoneH";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};