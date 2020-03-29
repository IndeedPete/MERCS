class IP_DLG_TACPAD
{
    idd = 40000;
    movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Hetowu)
		////////////////////////////////////////////////////////

		class IP_FRM_MAIN: RscFrame
		{
			idc = 1800;
			//text = "TacPad v1.00"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_FRM_REST: RscFrame
		{
			idc = 1800;
			text = "Wait"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 34.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			action = "closeDialog 0";
		};
		class IP_BTN_REST: RscButton
		{
			idc = 1601;
			text = "Wait"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			action = "nul = [(sliderPosition 1900)] spawn IP_fnc_rest";
		};
		class IP_SLD_HOURS: RscSlider
		{
			idc = 1900;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 37 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			onSliderPosChanged = "[1000, (sliderPosition 1900)] call IP_fnc_setRestHoursTime";
		};
		class IP_TXT_HOURS: RscText
		{
			idc = 1000;
			text = "24 Hours - 12:00 AM"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class IP_FRM_INFO: RscFrame
		{
			idc = 1801;
			text = "Mission Info"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 16 * GUI_GRID_H;
		};
		class IP_STX_MISSIONDETAILS: RscStructuredText
		{
			idc = 1100;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 27 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
		};
		class IP_FRM_CONTROL: RscFrame
		{
			idc = 1802;
			text = "Mission Control"; //--- ToDo: Localize;
			x = 29.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 16 * GUI_GRID_H;
		};
		class IP_BTN_EXTRACT: RscButton
		{
			idc = 1602;
			text = "Extract"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Press for extraction once the mission's done."; //--- ToDo: Localize;
			action = "call IP_fnc_extraction";
		};
		class IP_BTN_PPEFFECTS: RscButton
		{
			idc = 1607;
			text = "PPEffects Off"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Turn PPEffects (Colour Corrections) On/Off."; //--- ToDo: Localize;
			action = "call IP_fnc_PPEffects";
		};
		class IP_BTN_GLASSONOFF: RscButton
		{
			idc = 1603;
			text = "Glass On"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Turn Glass System On/Off."; //--- ToDo: Localize;
			action = "nul = [] spawn IP_fnc_glassBoot";
		};
		class IP_BTN_GLASSSTATUSONOFF: RscButton
		{
			idc = 1604;
			text = "Glass Status On"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Turn Glass Status On/Off."; //--- ToDo: Localize;
			action = "nul = ['IP_Glass_Status'] spawn IP_fnc_glassDeActivate";
		};
		class IP_BTN_GLASSDETAILSONOFF: RscButton
		{
			idc = 1605;
			text = "Glass Details On"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Turn Glass Details On/Off."; //--- ToDo: Localize;
			action = "nul = ['IP_Glass_Details'] spawn IP_fnc_glassDeActivate";
		};
		class IP_BTN_GLASSCOREONOFF: RscButton
		{
			idc = 1606;
			text = "Glass Core On"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Turn Glass Core On/Off."; //--- ToDo: Localize;
			action = "nul = ['IP_Glass_Core'] spawn IP_fnc_glassDeActivate";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};