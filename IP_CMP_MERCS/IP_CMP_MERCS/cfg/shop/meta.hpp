class ShopMetaInformation
{
	basicCostRate = 0;
	currency = "Euro";
	currencyShort = "€";
	defaultBuildTime = 0;
	defaultPicture = "";
	excludedMods[] = {};
	sellingDisvisor = 5;
	stockPriceRange[] = {1, 100};
	teamLimit = 7;
};

class ShopCategories
{
	class Missions
	{
		active = 1;
		displayName = "Missions";
		labelName = "NAME: ";
		labelRank = "RANK: ";
		labelFunds = "FUNDS: ";
	};
	
	class Personnel
	{
		active = 1;
		displayName = "Personnel";
		labelAdditionalButtonOn = "Silencers: ON";
		labelAdditionalButtonOff = "Silencers: OFF";
		labelPurchaseButton = "Add";
		labelSellButton = "Remove";
		labelLeft = "Available Personnel";
		labelRight = "In Team";
		labelFunds = "Total Cost Rate";
	};
	
	class Weapons
	{
		active = 1;
		displayName = "Weapons";
		labelPurchaseButton = "Purchase";
		labelSellButton = "Sell";
		labelAdditionalButton = "Find Magazines";
		labelLeft = "Available Weapons";
		labelRight = "In Possession";
	};
	
	class Magazines
	{
		active = 1;
		displayName = "Magazines";
		labelLeft = "Available Magazines";
		labelRight = "In Possession";
	};
	
	class Items
	{
		active = 1;
		displayName = "Items";
		labelAdditionalButton = "Additional";
		labelLeft = "Available Items";
		labelRight = "In Possession";
	};
	
	class Uniforms
	{
		active = 1;
		displayName = "Uniforms";
		labelSellButton = "Sell";
		labelAdditionalButton = "Additional";
		labelLeft = "Available Uniforms";
		labelRight = "In Possession";
	};
	
	class CampEnhancements
	{
		active = 0;
		displayName = "Camp Enhancements";
		labelLeft = "Available Camp Enhancements";
		labelRight = "In Possession";
	};
	
	class CampVehicles
	{
		active = 0;
		displayName = "Camp Vehicles";
		labelAdditionalButton = "Select for Insertion";
		labelLeft = "Available Vehicles Enhancements";
		labelRight = "In Possession";
	};
	
	class StockMarket
	{
		active = 0;
		displayName = "Stock Market";
		labelLeft = "Available Stocks";
		labelRight = "In Depot";
	};
};

class ShopInsertionTypes
{
	class foot
	{
		displayName = "On Foot";
	};
};