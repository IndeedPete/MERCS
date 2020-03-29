class Conversations
{
	// Contractor
	class ContractorOpener
	{
		expression = "'mRoadBlock' setMarkerAlpha 1;";
		responses[] = {"ContractorBetty", "ContractorMortar", "ContractorUndercover", "ContractorExit"};
		sentences[] = {
			"So, what's the plan?",
			"Okay, here's the situation: Black Arrow runs a major operating base on the peninsula to the south. They're basically in control of the whole area and blocked the only road onto the peninsula. All with kind permission of the AAF - seems like Black Arrow is a good friend of the local commander; word says there's also a small AAF garrison at the camp.<br/>Anyway, MacMillian was quite generous on this operation and got us some pretty cool assets. From my point of view you have three major options to fuck up their camp: Use Betty, rain down some mortar shells or go in undercover with satchels - I'd advise against a plain attack since the camp is well guarded."
		};
	};
	class ContractorBetty
	{
		expression = "'mDrone' setMarkerAlpha 1;";
		responses[] = {"ContractorMortar", "ContractorUndercover", "ContractorExit"};
		sentences[] = {
			"Who is 'Betty'?",
			"Ha, you don't know Betty? Betty the Bombshell? She's the most beautiful piece of ass on this island! Just 2.2 tons heavy, skin as grey as the sky and her rockets - damn those six monsters brought quite a few men to their knees.",
			"'She' is a drone, right?",
			"Yup, but she's beautiful in her way. I've parked her on the runway 50 metres east of here. You just need a UAV Terminal to take her out for a ride - she's certainly not picky..."
		};
	};
	class ContractorMortar
	{
		expression = "'mOverview' setMarkerAlpha 1; 'mCar' setMarkerAlpha 1;";
		responses[] = {"ContractorBetty", "ContractorUndercover", "ContractorExit"};
		sentences[] = {
			"We've got mortar support?",
			"Not directly. We've put a disassembled mortar and some ammo in your car 30 metres west of here. If you get it assembled you could rain down hell on them from a safe distance.",
			"But we'd need a spotter.",
			"Well, there's a good overview position in some ruins west of the camp. You can spot and fire from there. I'll mark it on your map."
		};
	};
	class ContractorUndercover
	{
		expression = "'mOutpost' setMarkerAlpha 1;";
		responses[] = {"ContractorBetty", "ContractorMortar", "ContractorExit"};
		sentences[] = {
			"Undercover with satchels?",
			"Yes, we've located a smaller outpost south of the roadblock. If you're lucky you can find some corporate Black Arrow uniforms there. Might be possible to slip into the camp and plant some explosives if you're wearing those. But it's obviously a high risk."
		};
	};
	class ContractorExit
	{
		expression = "call IP_fnc_closeConversation;";
		sentences[] = {"All right, thanks!"};
	};
};