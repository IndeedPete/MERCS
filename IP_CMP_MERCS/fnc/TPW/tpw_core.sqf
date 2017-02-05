/* 
CORE FUNCTIONS FOR TPW MODS
Author: tpw 
Date: 20140419
Version: 1.01

Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.     

To use: 
1 - Save this script into your mission directory as eg tpw_core.sqf
2 - Call it with 0 = [] execvm "tpw_core.sqf"; 

TPW MODS WILL NOT FUNCTION WITHOUT THIS SCRIPT RUNNING
*/

//CIVILIANS - REGION SPECIFIC CIVILIANS WITH RANDOMISED CLOTHING
tpw_core_fnc_civs =
	{
	private ["_civlist","_clothes","_mecivs","_meclothes","_afrcivs","_afrclothes"];
	//Greek
	_civlist = [
	"C_man_p_beggar_F",
	"C_man_1",
	"C_man_polo_1_F",
	"C_man_polo_2_F",
	"C_man_polo_3_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_6_F",
	"C_man_shorts_1_F",
	"C_man_1_1_F",
	"C_man_1_2_F",
	"C_man_1_3_F",
	"C_man_p_fugitive_F",
	"C_man_p_shorts_1_F",
	"C_man_hunter_1_F",
	"C_man_shorts_2_F",
	"C_man_shorts_3_F",
	"C_man_shorts_4_F"
	];

	//Greek clothes
	_clothes = [
	"U_Competitor",
	"U_C_HunterBody_grn",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_redwhite",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_Poor_1",
	"U_C_Poor_2",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_NikosBody",
	"U_Rangemaster"];

	
	// CAF Aggressors Middle East
	_mecivs = [
	"caf_ag_me_civ",
	"caf_ag_me_civ_02",
	"caf_ag_me_civ_03",
	"caf_ag_me_civ_04"
	];

	// Middle East clothes
	_meclothes = [
	"u_caf_ag_me_robes_01",
	"u_caf_ag_me_robes_01a",
	"u_caf_ag_me_robes_01b",
	"u_caf_ag_me_robes_01c",
	"u_caf_ag_me_robes_01d",
	"u_caf_ag_me_robes_02",
	"u_caf_ag_me_robes_02a",
	"u_caf_ag_me_robes_02b",
	"u_caf_ag_me_robes_02c",
	"u_caf_ag_me_robes_02d",
	"u_caf_ag_me_robes_03",
	"u_caf_ag_me_robes_03a",
	"u_caf_ag_me_robes_03b",
	"u_caf_ag_me_robes_03c",
	"u_caf_ag_me_robes_03d",
	"u_caf_ag_me_robes_04",
	"u_caf_ag_me_robes_04a",
	"u_caf_ag_me_robes_04b",
	"u_caf_ag_me_robes_04c",
	"u_caf_ag_me_robes_04d"
	];

	// CAF Aggressors Africans
	_afrcivs = [
	"caf_ag_afr_civ",
	"caf_ag_afr_civ_02",
	"caf_ag_afr_civ_03",
	"caf_ag_afr_civ_04"
	];

	// African clothes
	_afrclothes = [
	"U_CAF_AG_AFR_CLOTHES_01",
	"U_CAF_AG_AFR_CLOTHES_01a",
	"U_CAF_AG_AFR_CLOTHES_01b",
	"U_CAF_AG_AFR_CLOTHES_01c",
	"U_CAF_AG_AFR_CLOTHES_01d",
	"U_CAF_AG_AFR_CLOTHES_01e",
	"U_CAF_AG_AFR_CLOTHES_02",
	"U_CAF_AG_AFR_CLOTHES_02a",
	"U_CAF_AG_AFR_CLOTHES_02b"
	];

	// Switch to region specific civs if CAF Aggressors active
	if isclass(configfile/"CfgWeapons"/"H_caf_ag_turban") then 
		{
		// MID EAST
		if (worldname in 
		[
		"BMFayshkhabur",
		"clafghan",
		"fallujah",
		"fata",
		"hellskitchen",
		"hellskitchens",
		"MCN_HazarKot",
		"praa_av",
		"reshmaan",
		"Shapur_BAF",
		"Takistan",
		"torabora",
		"TUP_Qom",
		"Zargabad"
		]
		) then 
			{
			_civlist = _mecivs;
			_clothes = _meclothes;
			};
		// TROPICAL
		if (worldname in 
		[
		"mak_Jungle",
		"pja305",
		"tropica",
		"tigeria",
		"tigeria_se"
		]
		) then 
			{
			_civlist = _afrcivs;
			_clothes = _afrclothes;
			};
		};
	tpw_core_civs = _civlist;
	tpw_core_clothes = _clothes;
	};	

// HABITABLE HOUSES
tpw_core_habitable = [ // Habitable Greek houses with white walls, red roofs, intact doors and windows
"Land_i_House_Small_01_V1_F",
"Land_i_House_Small_01_V2_F",
"Land_i_House_Small_01_V3_F",
"Land_i_House_Small_02_V1_F",
"Land_i_House_Small_02_V2_F",
"Land_i_House_Small_02_V3_F",
"Land_i_House_Small_03_V1_F",
"Land_i_House_Big_01_V1_F",
"Land_i_House_Big_01_V2_F",
"Land_i_House_Big_01_V3_F",
"Land_i_House_Big_02_V1_F",
"Land_i_House_Big_02_V2_F",
"Land_i_House_Big_02_V3_F",

"Land_House_L_1_EP1", // OA classes - thanks Spliffz
"Land_House_L_3_EP1",
"Land_House_L_4_EP1",
"Land_House_L_6_EP1",
"Land_House_L_7_EP1",
"Land_House_L_8_EP1",
"Land_House_L_9_EP1",
"Land_House_K_1_EP1",
"Land_House_K_3_EP1", 
"Land_House_K_5_EP1", 
"Land_House_K_6_EP1", 
"Land_House_K_7_EP1", 
"Land_House_K_8_EP1", 
"Land_Terrace_K_1_EP1",
"Land_House_C_1_EP1",
"Land_House_C_1_v2_EP1", 
"Land_House_C_2_EP1", 
"Land_House_C_3_EP1",
"Land_House_C_4_EP1", 
"Land_House_C_5_EP1", 
"Land_House_C_5_V1_EP1", 
"Land_House_C_5_V2_EP1", 
"Land_House_C_5_V3_EP1", 
"Land_House_C_9_EP1", 
"Land_House_C_10_EP1", 
"Land_House_C_11_EP1", 
"Land_House_C_12_EP1", 
"Land_A_Villa_EP1",
"Land_A_Mosque_small_1_EP1",
"Land_A_Mosque_small_2_EP1",
//"Land_Ind_FuelStation_Feed_EP1",
"Land_Ind_FuelStation_Build_EP1",
"Land_Ind_FuelStation_Shed_EP1",
"Land_Ind_Garage01_EP1",

"Land_HouseV_1I1",  // A2 classes - thanks Reserve
"Land_HouseV_1I2",
"Land_HouseV_1I3",
"Land_HouseV_1I4",
"Land_HouseV_1L1",
"Land_HouseV_1L2",
"Land_HouseV_1T",
"Land_HouseV_2I",
"Land_HouseV_2L",
"Land_HouseV_2T1",
"Land_HouseV_2T2",
"Land_HouseV_3I1",
"Land_HouseV_3I2",
"Land_HouseV_3I3",
"Land_HouseV_3I4",
"Land_HouseV2_01A",
"Land_HouseV2_01B",
"Land_HouseV2_02",
"Land_HouseV2_03",
"Land_HouseV2_03B",
"Land_HouseV2_04",
"Land_HouseV2_05",
"Land_HouseBlock_A1",
"Land_HouseBlock_A2",
"Land_HouseBlock_A3",
"Land_HouseBlock_B1",
"Land_HouseBlock_B2",
"Land_HouseBlock_B3",
"Land_HouseBlock_C2",
"Land_HouseBlock_C3",
"Land_HouseBlock_C4",
"Land_HouseBlock_C5",
"Land_Church_02",
"Land_Church_02A",
"Land_Church_03",
//"Land_A_FuelStation_Feed",
"Land_A_FuelStation_Build",
"Land_A_FuelStation_Shed",

"Land_dum_istan2",// Fallujah
"Land_dum_istan2b",
"Land_dum_istan2_01",
"Land_dum_istan2_02",
"Land_dum_istan2_03",
"Land_dum_istan2_03a",
"Land_dum_istan2_04a",
"Land_dum_istan3",
"Land_dum_istan3_hromada",
"Land_dum_istan4",
"Land_dum_istan4_big",
"Land_dum_istan4_big_inverse",
"Land_dum_istan4_detaily1",
"Land_dum_istan4_inverse",
"Land_dum_mesto3_istan",
"Land_hotel",
"Land_stanek_1",
"Land_stanek_1b",
"Land_stanek_1c",
"Land_stanek_2",
"Land_stanek_2b",
"Land_stanek_2c",
"Land_stanek_3",
"Land_stanek_3b",
"Land_stanek_3c"
];

tpw_core_fnc_houses =
	{
	_radius = _this select 0;
	private ["_radius","_housearray"];
	_housearray = nearestObjects [position vehicle player,tpw_core_habitable,_radius]; 
	for "_i" from 0 to (count _housearray - 1) do
		{
		_house = _housearray select _i;
		_housestring = str (typeof _house);
		_uninhab = ["_u_house", _housestring] call BIS_fnc_inString; // uninhabited houses
		if (_uninhab) then 
			{
			_housearray set [_i, -1];
			}
		};
	_housearray = _housearray - [-1];
	tpw_core_houses = _housearray;	
	};
	
// SUN ANGLE - ORIGINAL CODE BY CARLGUSTAFFA
tpw_core_fnc_sunangle =
	{
	private ["_lat","_day","_hour","_sunangle"];
	while {true} do 
		{
		_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");
		_day = 360 * (dateToNumber date);
		_hour = (daytime / 24) * 360;
		tpw_core_sunangle = ((12 * cos(_day) - 78) * cos(_lat) * cos(_hour)) - (24 * sin(_lat) * cos(_day));  
		sleep 30; 
		};
	};	
	
// DETERMINE UNIT'S WEAPON TYPE 
tpw_core_fnc_weptype =
	{
	private["_unit","_weptype","_cw","_hw","_pw","_sw"];
	_unit = _this select 0;	
	
	// Weapon type
	_cw = currentweapon _unit;
	_hw = handgunweapon _unit;
	_pw = primaryweapon _unit;
	_sw = secondaryweapon _unit;
	 switch _cw do
		{
		case "": 
			{
			_weptype = 0;
			};
		case _hw: 
			{
			_weptype = 1;
			};
		case _pw: 
			{
			_weptype = 2;
			};
		case _sw: 
			{
			_weptype = 3;
			};
		default
			{
			_weptype = 0;
			};	
		};
	_unit setvariable ["tpw_core_weptype",_weptype];
	};	
	
// CALL OR SPAWN APPROPRIATE FUNCTIONS
[] call tpw_core_fnc_civs;	
0 = [] spawn tpw_core_fnc_sunangle;	

/*
// DUMMY LOOP SO SCRIPT DOESN'T TERMINATE
while {true} do
	{
	
	sleep 10;
	};
*/