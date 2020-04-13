class ShopCampVehicles
{
	class Cars
	{
		displayName = "Cars";

		class B_G_Quadbike_01_F
		{
			description = "A camouflaged quad-bike with two seats.";
			isCar = 1;
			price = 1000;
			requires = "Garage";
			unique = 1;
		};
		class B_G_Offroad_01_F
		{
			description = "A used camouflaged off-road with six seats.";
			isCar = 1;
			price = 5000;
			requires = "Garage";
			unique = 1;
		};
		class B_G_Offroad_01_armed_F
		{
			description = "A used camouflaged off-road with a mounted .50 machine-gun and three seats.";
			isCar = 1;
			price = 10000;
			requires = "Garage";
			unique = 1;
		};
		class B_G_Van_01_transport_F
		{
			description = "A used truck with 13 seats.";
			isCar = 1;
			price = 7500;
			requires = "Garage";
			unique = 1;
		};
		class B_LSV_01_unarmed_F
		{
			description = "A used Prowler LSV with seven seats.";
			isCar = 1;
			price = 10000;
			requires = "Garage";
			unique = 1;
		};
		class B_LSV_01_armed_F
		{
			description = "A used Prowler LSV with two mounted machine-guns and five seats.";
			isCar = 1;
			price = 15000;
			requires = "Garage";
			unique = 1;
		};
		class B_LSV_01_AT_F
		{
			description = "A used Prowler LSV with a mounted machine-gun and AT launcher, and five seats.";
			isCar = 1;
			price = 15000;
			requires = "Garage";
			unique = 1;
		};
	};

	class Boats
	{
		displayName = "Boats";

		class B_G_Boat_Transport_01_F
		{
			description = "A rubber boat with five seats.";
			identifier = "Boat";
			isCar = 0;
			price = 5000;
			unique = 1;
		};
	};

	class Air
	{
		displayName = "Air";

		class B_Heli_Light_01_F
		{
			cas = 1;
			description = "A previously owned helicopter that offers space for six operatives. If needs be, ION engineers can remove the outboard 'benches' and re-equip the vehicle for CAS missions.";
			identifier = "Heli";
			isCar = 0;
			price = 25000;
			requires = "HeliPad";
			unique = 1;
		};
	};
};