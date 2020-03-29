class Conversations
{
	// Buddy
	class buddyOpener
	{
		responses[] = {"buddyExitYes", "buddyWhy", "buddyWhere", "buddyWhat", "buddyJob", "buddyExitNo"};
		sentences[] = {
			"Dražen, what the hell are you doing here?",
			"Getting you out of here! Listen, I know you don't want to have anything to do with ION and shit. And it's not about a contract this time. But, I was there when you said you weren't done with Nikos, remember? Well, he's not far from here right now. We could go there together. One last time."
		};
	};
	class buddyWhy
	{
		responses[] = {"buddyExitYes", "buddyWhere", "buddyWhat", "buddyJob", "buddyExitNo"};
		sentences[] = {
			"Why are you doing this?",
			"I feel like I owe you one. Because you saved my ass a couple of times and because I was part of the people who dragged you into this mercenary shit. And I don't like Nikos."
		};
	};
	class buddyWhere
	{
		responses[] = {"buddyExitYes", "buddyWhy", "buddyWhat", "buddyJob", "buddyExitNo"};
		sentences[] = {
			"Where is this guy?",
			"At an airfield not far from here. He has some mercs with him. But nothing we couldn't handle. And I hear he's got cash, lots of cash."
		};
	};
	class buddyWhat
	{
		responses[] = {"buddyExitYes", "buddyWhy", "buddyWhere", "buddyJob", "buddyExitNo"};
		sentences[] = {
			"And what should I do when we get there?",
			"I don't know, this is not a contract with orders and stuff. Kill him, beat him, rob him. Whatever you want to. Maybe just talk to him. Anyway, I'd go for putting a bullet to his head but I leave that to you."
		};
	};
	class buddyJob
	{
		responses[] = {"buddyExitYes", "buddyWhy", "buddyWhere", "buddyWhat", "buddyExitNo"};
		sentences[] = {
			"But I have a job here.",
			"Yeah, you are a construction worker on Altis. Your wage is so small you can't even afford a proper flat. I know your place, I drove by it the other day.",
			"Yes, I don't earn much. But it's an honest job. And I don't have to kill people.",
			"Your choice. I'm offering you a way out, maybe even off this crappy island. You've always wanted a better future, this might be your chance. But of course you can stay here and carry around rocks 60 hours a week for the rest of your poor life - just saying."
		};
	};
	class buddyExitYes
	{
		expression = "call IP_fnc_closeConversation; IP_BuddyConvDone = true;";
		sentences[] = {"Okay, let's go!"};
	};
	class buddyExitNo
	{
		expression = "call IP_fnc_closeConversation; IP_BuddyConvDone = false;";
		sentences[] = {"No, I don't want to go. I'm sorry, but this part of my life - it's over."};
	};
	
	// Trafficker
	class traffickerOpener
	{
		responses[] = {"traffickerMoney", "traffickerPilots", "traffickerExit"};
		sentences[] = {
			"Hi there!",
			"It's you ... ah ... fuck ... you got me, you bastard. What do you want?",
			"Revenge? Justice? Shut down your business? I have enough reasons to kill you.",
			"Please... think... murdering me is not necessary ... I have money, I can pay you. And get you to Europe... ah. The pilots will take you to Greece, no questions asked. Just leave, please don't kill me!"
		};
	};
	class traffickerMoney
	{
		responses[] = {"traffickerPilots", "traffickerExit"};
		sentences[] = {
			"What money?",
			"The suitcase ... just take it. It's more than enough ... argh. Please...",
		};
	};
	class traffickerPilots
	{
		responses[] = {"traffickerMoney", "traffickerExit"};
		sentences[] = {
			"Pilots?",
			"I've already paid them. They're supposed to fly to Greece. Enter Europe, the chopper's registered. Argh... just... just go with them."
		};
	};
	class traffickerExit
	{
		expression = "call IP_fnc_closeConversation; IP_TraffickerConvDone = true;";
		sentences[] = {"Hasta la vista."};
	};
};