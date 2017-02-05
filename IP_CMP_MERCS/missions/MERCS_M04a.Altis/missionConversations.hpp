class Conversations
{
	// EFOfficer
	class EFOfficerOpener
	{
		arguments[] = {"([IP_Engineer, false] call IP_fnc_getRank)", "(name IP_Engineer)"};
		condition = "!(triggerActivated trgParking) && (!(IP_Engineer in (units group IP_Main)))";
		responses[] = {"EFOfficerExit"};
		sentences[] = {
			"Sir, we're the contractors that were tasked to bring in the trucks.",
			"And where are they? Why are you here? Did you leave them unguarded?!",
			"No, no, of course not! But we're experiencing some technical problems. We need some help to get them moving again.",
			"Ugh, great. Then what are we paying you idiots for? Hey, %1 %2, come here! Help these guys doing their work!"
		};
	};
	class EFOfficerExit
	{
		expression = "call IP_fnc_closeConversation; [IP_Engineer] join IP_Main;";
		sentences[] = {"I can't thank you enough! And I'm still very sorry Sir!"};
	};
	
	// Worker
	class workerOpener
	{
		condition = "isNil 'IP_TalkedToWorker'";
		expression = "IP_TalkedToWorker = true; IP_Box enableSimulation true;";
		responses[] = {"workerExit"};
		sentences[] = {
			"Hey, sorry to interrupt, but can you help us out with some tools?",
			"Hi there! Having a problem? Should I take a look?",
			"No, no! I don't want to take too much of your time. I'd be the happiest man alive if you could just borrow us some of these tools. I'll bring them back soon, you have my word.",
			"All right, why shouldn't I trust the nice guy with a loaded gun? *laughs* Take what you need from the box, just bring it back when you're done."
		};
	};
	class workerExit
	{
		expression = "call IP_fnc_closeConversation";
		sentences[] = {"Great, thanks!"};
	};
};