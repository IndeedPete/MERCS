class IP_DLG_REST
{
    idd = 30000;
    movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Bejogi)
		////////////////////////////////////////////////////////

		class IP_FRM_MAIN: RscFrame
		{
			idc = 1800;
			text = "Rest"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
		};
		class IP_BTN_CANCEL: RscButton
		{
			idc = 1600;
			text = "Cancel"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			action = "closeDialog 0";
		};
		class IP_BTN_REST: RscButton
		{
			idc = 1601;
			text = "Rest"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			action = "nul = [(sliderPosition 1900)] spawn IP_fnc_rest";
		};
		class IP_SLD_HOURS: RscSlider
		{
			idc = 1900;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 30.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			onSliderPosChanged = "[1000, (sliderPosition 1900)] call IP_fnc_setRestHoursTime";
		};
		class IP_TXT_HOURS: RscText
		{
			idc = 1000;
			text = "24 Hours - 12:00 AM"; //--- ToDo: Localize;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
