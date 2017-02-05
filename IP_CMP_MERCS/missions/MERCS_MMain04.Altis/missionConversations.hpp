class Conversations
{
	// Colonel
	class colonelOpener
	{
		responses[] = {"colonelYes", "colonelExitNo"};
		sentences[] = {
			"Uhm, Colonel, Sir? I just wanted to tell you I'm really grateful for the chance to serve in the AAF.",
			"Hm? Oh, at ease, soldier. You're one of Staff Sergeant Strambopoulos' freshmen, aren't you?"
		};
	};
	class colonelYes
	{
		responses[] = {"colonelExitYes"};
		sentences[] = {
			"Yes, Sir! And I am proud to serve in this exceptional force! (Start Copying)",
			"You are welcome. And you did an outstanding job today. It's courageous people like you that make this country great. It doesn't matter where we're coming from as long as we stand strong in unity, opposing the terrorist thread! We must hold the line against the traitors! Fight with blood, sweat and tears for every centimetre of this proud country! We need to continue the fight! I won't rest until every FIA terrorist lies before me like this, covered in his own blood!"
		};
	};
	class colonelExitYes
	{
		expression = "call IP_fnc_closeConversation; [IP_Colonel, 'colonelOpener'] call IP_fnc_removeConversation; ['tKey', 'SUCCEEDED'] call BIS_fnc_taskSetState;";
		sentences[] = {
			"Yes, Sir! I'm with you and I will return to my post immediately! (Complete Copying)"
		};
	};
	class colonelExitNo
	{
		expression = "call IP_fnc_closeConversation; [IP_Colonel, 'colonelOpener'] call IP_fnc_removeConversation; ['tKey', 'FAILED'] call BIS_fnc_taskSetState; [IP_Colonel, 'Grab this terrorist bastard!', 'DIRECT'] call IP_fnc_simpleSentence; IP_CriticalViolation = true;";
		sentences[] = {
			"No, I'm a hired merc. And now give me your damn access codes! (Start Copying)"
		};
	};
	
	// Commander (Toilet)
	class commanderOpener
	{
		responses[] = {"commanderPlan"};
		sentences[] = {
			"This is Raif, I can talk now. But not for long, the drill sergeant is constantly picking on me.",
			"Good to hear somebody's finally teaching you some manners. Anyway, how's your progress?",
			"Nothing so far. I didn't even see the Colonel. There's just no way a recruit could -",
			"Quit the bloody whining, dammit! We have a plan."
		};
	};
	class commanderPlan
	{
		responses[] = {"commanderExit"};
		sentences[] = {
			"Okay, enlighten me.",
			"The Knights and I will leak some information about an AAF's top target - the local FIA leader - in a few days causing you guys to move out and engage his position. Just make sure you catch this guy dead or alive and it will most certainly get the Colonel's attention. Then get close to him, copy the key and meet us at a set of coordinates I'll send you soon enough. Hang in there, just a few more days."
		};
	};
	class commanderExit
	{
		expression = "call IP_fnc_closeConversation; ['tTalk', 'SUCCEEDED'] call BIS_fnc_taskSetState; [IP_Commander, 'commanderOpener'] call IP_fnc_removeConversation;";
		sentences[] = {
			"Copy that. I guess I'll get back to my training then..."
		};
	};
};