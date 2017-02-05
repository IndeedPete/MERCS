class ShopCampEnhancements
{
	class Checkpoint
    {
        description = "Deploys a checkpoint on the road leading to the camp with one static MG. Gains four additional mercenaries in case of defence.";
		marker = "mCheckpoint";
		price = 7500;
		title = "Checkpoint";
    };
	class Garage
    {
        description = "Deploys a camouflage net as vehicle shelter. Offers space for two ground vehicles.";
		marker = "mGarage";
		price = 500;
		title = "Garage";
    };
	class HeliPad
    {
        description = "Deploys a heli pad for one small helicopter and a fuel truck.";
		marker = "mHeliPad";
		price = 5000;
		title = "Heli Pad";
    };
	class Minefield
    {
        description = "Deploys large anti-infantry minefields north-west, east, south-east and south of the camp, leaving only the road passable.";
		price = 12500;
		title = "Minefields";
    };
	class InnerDefences
    {
        description = "Deploys H-Barrier fortifications, razor wire barriers, one AA-Launcher and two static MGs around the central camp. Gains nine additional mercenaries in case of defence.";
		price = 20000;
		title = "Inner Defences";
    };
	class Overview
    {
        description = "Fortifies the overview position on the western hill will bag fences, one static GL and one static AT-Launcher. Gains two additional mercenaries in case of defence.";
		price = 10000;
		title = "Overview";
    };
	class SeaDefences
    {
        description = "Deploys bag fence fortifications, razor wire barriers, a small minefield, one static GL and one static MG covering the sea side north of the camp. Gains seven additional mercenaries in case of defence.";
		marker[] = {"mSeaDefences1", "mSeaDefences2"};
		price = 12500;
		title = "Sea Defences";
    };
	class SeaMinefield
    {
        description = "Deploys large sea-minefields west and north of the camp, making the west coast virtually impassable and just leaving a small passage for a boat on the northern beach.";
		price = 7500;
		title = "Sea Minefields";
    };
	class Tents
    {
        description = "Deploys tents for additional personnel at the camp. Gains seven additional mercenaries which will join Raif in case of defence.";
		price = 2500;
		title = "Tents";
    };
	class WesternDefences
    {
        description = "Deploys bag fence fortifications and one static MG on the foot of the western hill. Overviews the direction west of Bomos and covers the backside of the overview position. Gains five additional mercenaries in case of defence.";
		marker = "mWesternDefences";
		price = 7500;
		title = "Western Defences";
    };
};