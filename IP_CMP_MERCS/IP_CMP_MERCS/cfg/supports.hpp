class CfgCommunicationMenu
{
	// TacPad
    class TacPad
    {
        text = "Open TacPad"; // Text displayed in the menu and in a notification
        expression = "nul = [] spawn IP_fnc_openTacPadDialog"; // Code executed upon activation
        icon = "\a3\ui_f\data\map\diary\signal_ca.paa"; // Icon displayed permanently next to the command menu
        removeAfterExpressionCall = 0; // 1 to remove the item after calling
    };
	
	// M01c
    class callFIA
    {
        text = "Call FIA Support"; // Text displayed in the menu and in a notification
        expression = "IP_FIACalled = true;"; // Code executed upon activation
        icon = "\a3\ui_f\data\map\markers\nato\b_inf.paa"; // Icon displayed permanently next to the command menu
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
	
	// M02a
	class callAAF
    {
        text = "Call AAF Reinforcements"; // Text displayed in the menu and in a notification
        expression = "IP_AAFCalled = true;"; // Code executed upon activation
        icon = "\a3\ui_f\data\map\markers\nato\n_mech_inf.paa"; // Icon displayed permanently next to the command menu
        removeAfterExpressionCall = 0; // 1 to remove the item after calling
	};
	
	// M07a
	class callBadassOne
    {
        text = "Call In EUROFORCE"; // Text displayed in the menu and in a notification
        expression = "IP_CASCalled = true;"; // Code executed upon activation
        icon = "\a3\ui_f\data\map\markers\nato\b_plane.paa"; // Icon displayed permanently next to the command menu
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
	};
};