class IP_DLG_HOME
{
    idd = 10000;
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
			text = "Mission Control"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_PIC_PROFILE: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_MONEY: RscText
		{
			idc = 1002;
			text = "MONEY: €"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_DEBTS: RscText
		{
			idc = 1003;
			text = "STATUS: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_MISSIONS: RscListbox
		{
			idc = 1500;
			text = "Available Missions"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_missionDetail";
			onLBDblClick = "(lbCurSel 1500) call IP_fnc_selectMission";
		};
		class IP_STX_MISSION: RscStructuredText
		{
			idc = 1100;
			text = "Mission Summary"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_BTN_SELECTMISSION: RscButton
		{
			idc = 1601;
			text = "Select Mission"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1500) call IP_fnc_selectMission";
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_PERSONNEL
{
    idd = 10001;
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
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Wukaze)
		////////////////////////////////////////////////////////

		class IP_FRM_PERSONNEL: RscFrame
		{
			idc = 1800;
			text = "Personnel"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_COST: RscText
		{
			idc = 1002;
			text = "TOTAL COST RATE: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RATE: RscText
		{
			idc = 1003;
			text = ""; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_AVAILABLEPERSONNEL: RscListbox
		{
			idc = 1500;
			text = "Available Missions"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_personDetail";
			onLBDblClick = "(lbCurSel 1500) call IP_fnc_addPerson";
		};
		class IP_TXT_AVAILABLEPERSONNEL: RscText
		{
			idc = 1004;
			text = "Available Personnel"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_TEAM: RscListbox
		{
			idc = 1501;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_personDetail";
			onLBDblClick = "(lbCurSel 1501) call IP_fnc_removePerson";
		};
		class IP_TXT_TEAM: RscText
		{
			idc = 1005;
			text = "Team"; //--- ToDo: Localize;
			x = 20.7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.26 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_STX_PERSON: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_BTN_ADD: RscButton
		{
			idc = 1601;
			text = "Add"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1500) call IP_fnc_addPerson";
		};
		class IP_BTN_REMOVE: RscButton
		{
			idc = 1602;
			text = "Remove"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1501) call IP_fnc_removePerson";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_WEAPONS
{
    idd = 10002;
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
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Wukaze)
		////////////////////////////////////////////////////////

		class IP_FRM_WEAPONS: RscFrame
		{
			idc = 1800;
			text = "Weapons"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_MONEY: RscText
		{
			idc = 1002;
			text = "MONEY: €"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_DEBTS: RscText
		{
			idc = 1003;
			text = "STATUS: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_AVAILABLEWEAPONS: RscListbox
		{
			idc = 1500;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_weaponDetail";
			onLBDblClick = "(lbCurSel 1500) call IP_fnc_buyWeapon";
		};
		class IP_TXT_AVAILABLEWEAPONS: RscText
		{
			idc = 1004;
			text = "Available Weapons"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_BOX: RscListbox
		{
			idc = 1501;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_weaponDetail";
			onLBDblClick = "(lbCurSel 1501) call IP_fnc_sellWeapon";
		};
		class IP_TXT_BOX: RscText
		{
			idc = 1005;
			text = "In Possession"; //--- ToDo: Localize;
			x = 20.7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.26 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_STX_WEAPON: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_BTN_ADD: RscButton
		{
			idc = 1601;
			text = "Purchase"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1500) call IP_fnc_buyWeapon";
		};
		class IP_BTN_REMOVE: RscButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1501) call IP_fnc_sellWeapon";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
	
class IP_DLG_MAGAZINES
{
    idd = 10003;
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
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Wukaze)
		////////////////////////////////////////////////////////

		class IP_FRM_MAGAZINES: RscFrame
		{
			idc = 1800;
			text = "Magazines"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_MONEY: RscText
		{
			idc = 1002;
			text = "MONEY: €"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_DEBTS: RscText
		{
			idc = 1003;
			text = "STATUS: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_AVAILABLEMAGAZINES: RscListbox
		{
			idc = 1500;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_magazineDetail";
			onLBDblClick = "[(lbCurSel 1500), false] call IP_fnc_openMagazineAmountDialog";
		};
		class IP_TXT_AVAILABLEMAGAZINES: RscText
		{
			idc = 1004;
			text = "Available Magazines"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_BOX: RscListbox
		{
			idc = 1501;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_magazineDetail";
			onLBDblClick = "[(lbCurSel 1501), true] call IP_fnc_openMagazineAmountDialog";
		};
		class IP_TXT_BOX: RscText
		{
			idc = 1005;
			text = "In Possession"; //--- ToDo: Localize;
			x = 20.7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.26 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_STX_MAGAZINE: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_BTN_ADD: RscButton
		{
			idc = 1601;
			text = "Purchase"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "[(lbCurSel 1500), false] call IP_fnc_openMagazineAmountDialog";
		};
		class IP_BTN_REMOVE: RscButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "[(lbCurSel 1501), true] call IP_fnc_openMagazineAmountDialog";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_ITEMS
{
    idd = 10004;
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
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Wukaze)
		////////////////////////////////////////////////////////

		class IP_FRM_ITEMS: RscFrame
		{
			idc = 1800;
			text = "Items"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_MONEY: RscText
		{
			idc = 1002;
			text = "MONEY: €"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_DEBTS: RscText
		{
			idc = 1003;
			text = "STATUS: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_AVAILABLEITEMS: RscListbox
		{
			idc = 1500;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_itemDetail";
			onLBDblClick = "(lbCurSel 1500) call IP_fnc_buyItem";
		};
		class IP_TXT_AVAILABLEITEMS: RscText
		{
			idc = 1004;
			text = "Available Items"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_BOX: RscListbox
		{
			idc = 1501;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_itemDetail";
			onLBDblClick = "(lbCurSel 1501) call IP_fnc_sellItem";
		};
		class IP_TXT_BOX: RscText
		{
			idc = 1005;
			text = "In Possession"; //--- ToDo: Localize;
			x = 20.7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.26 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_STX_ITEM: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_BTN_ADD: RscButton
		{
			idc = 1601;
			text = "Purchase"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1500) call IP_fnc_buyItem";
		};
		class IP_BTN_REMOVE: RscButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1501) call IP_fnc_sellItem";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_CLOTHES
{
    idd = 10005;
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
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Wukaze)
		////////////////////////////////////////////////////////

		class IP_FRM_CLOTHES: RscFrame
		{
			idc = 1800;
			text = "Clothes"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_MONEY: RscText
		{
			idc = 1002;
			text = "MONEY: €"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_DEBTS: RscText
		{
			idc = 1003;
			text = "STATUS: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_AVAILABLECLOTHES: RscListbox
		{
			idc = 1500;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_clothesDetail";
			onLBDblClick = "(lbCurSel 1500) call IP_fnc_buyClothes";
		};
		class IP_TXT_AVAILABLECLOTHES: RscText
		{
			idc = 1004;
			text = "Available Clothes"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_BOX: RscListbox
		{
			idc = 1501;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_clothesDetail";
			onLBDblClick = "(lbCurSel 1501) call IP_fnc_putOnClothes";
		};
		class IP_TXT_BOX: RscText
		{
			idc = 1005;
			text = "In Possession"; //--- ToDo: Localize;
			x = 20.7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.26 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_STX_ITEM: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_BTN_ADD: RscButton
		{
			idc = 1601;
			text = "Purchase"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1500) call IP_fnc_buyClothes";
		};
		class IP_BTN_PUTON: RscButton
		{
			idc = 1602;
			text = "Put On"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1501) call IP_fnc_putOnClothes";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_ENHANCEMENTS
{
    idd = 10006;
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
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Wukaze)
		////////////////////////////////////////////////////////

		class IP_FRM_ENHANCEMENTS: RscFrame
		{
			idc = 1800;
			text = "Camp Enhancements"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_MONEY: RscText
		{
			idc = 1002;
			text = "MONEY: €"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_DEBTS: RscText
		{
			idc = 1003;
			text = "STATUS: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_AVAILABLEENHANCEMENTS: RscListbox
		{
			idc = 1500;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_enhancementDetail";
			onLBDblClick = "(lbCurSel 1500) call IP_fnc_buyEnhancement";
		};
		class IP_TXT_AVAILABLEENHANCEMENTS: RscText
		{
			idc = 1004;
			text = "Available Enhancements"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_BOX: RscListbox
		{
			idc = 1501;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_enhancementDetail";
			//onLBDblClick = "(lbCurSel 1501) call IP_fnc_sellEnhancement";
		};
		class IP_TXT_BOX: RscText
		{
			idc = 1005;
			text = "In Possession"; //--- ToDo: Localize;
			x = 20.7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.26 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_STX_ENHANCEMENT: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_BTN_ADD: RscButton
		{
			idc = 1601;
			text = "Purchase"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1500) call IP_fnc_buyEnhancement";
		};
		/*
		class IP_BTN_REMOVE: RscButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1501) call IP_fnc_sellWeapon";
		};
		*/
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_VEHICLES
{
    idd = 10007;
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
		// GUI EDITOR OUTPUT START (by Bender, v1.063, #Wukaze)
		////////////////////////////////////////////////////////

		class IP_FRM_ENHANCEMENTS: RscFrame
		{
			idc = 1800;
			text = "Camp Vehicles"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "call IP_fnc_closeShop";
		};
		class IP_TXT_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_RANK: RscText
		{
			idc = 1001;
			text = "RANK: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_MONEY: RscText
		{
			idc = 1002;
			text = "MONEY: €"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_TXT_DEBTS: RscText
		{
			idc = 1003;
			text = "STATUS: "; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_AVAILABLEVEHICLES: RscListbox
		{
			idc = 1500;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_vehicleDetail";
			onLBDblClick = "(lbCurSel 1500) call IP_fnc_buyVehicle";
		};
		class IP_TXT_AVAILABLEVEHICLES: RscText
		{
			idc = 1004;
			text = "Available Vehicles"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_LSB_BOX: RscListbox
		{
			idc = 1501;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			onLBSelChanged = "_this call IP_fnc_vehicleDetail";
			onLBDblClick = "(lbCurSel 1501) call IP_fnc_sellVehicle";
		};
		class IP_TXT_BOX: RscText
		{
			idc = 1005;
			text = "In Possession"; //--- ToDo: Localize;
			x = 20.7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.26 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_STX_ENHANCEMENT: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class IP_CMB_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "call IP_fnc_closeShop; [player, ((_this select 0) lbValue (_this select 1))] spawn IP_fnc_openShop;";
		};
		class IP_TXT_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IP_BTN_ADD: RscButton
		{
			idc = 1601;
			text = "Purchase"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1500) call IP_fnc_buyVehicle";
		};
		class IP_BTN_REMOVE: RscButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "(lbCurSel 1501) call IP_fnc_sellVehicle";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_AMOUNT
{
	idd = 10008;
	movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
		};
	
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Wodiso)
		////////////////////////////////////////////////////////
		class IP_FRM_AMOUNT: RscFrame
		{
			idc = 1800;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
		};
		class IP_TXT_HOWMANY: RscText
		{
			idc = 1000;
			text = "How Many?"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class IP_TXT_MAGAZINE: RscText
		{
			idc = 1001;
			text = "5.56mm STANAG 30"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class IP_TXT_PRICE: RscText
		{
			idc = 1002;
			text = "Price: "; //--- ToDo: Localize;
			x = 22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class IP_TXT_TOTAL: RscText
		{
			idc = 1003;
			text = "Total: "; //--- ToDo: Localize;
			x = 22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class IP_TXT_AMOUNT: RscText
		{
			idc = 1004;
			text = "Amount: "; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class IP_SLD_AMOUNT: RscSlider
		{
			idc = 1900;
			text = "Amount"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 25 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			onSliderPosChanged = "(sliderPosition 1900) call IP_fnc_magazineAmountSetTotal";
		};
		class IP_BTN_OKAY: RscButton
		{
			idc = 1600;
			text = "Okay"; //--- ToDo: Localize;
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			action = "(sliderPosition 1900) call IP_fnc_buyOrSellMagazine";
		};
		class IP_BTN_CANCEL: RscButton
		{
			idc = 1601;
			text = "Cancel"; //--- ToDo: Localize;
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			action = "closeDialog 0";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};