class Conversations
{
	// Scientist
	class scientistExit
	{
		expression = "call IP_fnc_closeConversation; [IP_Scientist, 'scientistOpener'] call IP_fnc_removeConversation; IP_ScientistAbducted = true;";
		sentences[] = {
			"Follow me and don't try any monkey business or you'll end up with a bullet in your head."
		};
	};
	class scientistOpener
	{
		expression = "IP_Scientist stop true;";
		responses[] = {"scientistExit"};
		sentences[] = {
			"(Grab Díaz.)",
			"¡Dios mío! Who are you?! What do you want from me?!",
			"You're being kidnapped."
		};
	};
	
	// Phone
	class phoneOpener
	{
		condition = "(triggerActivated trgHouse) && ({alive _x} count IP_Sons > 0)";
		responses[] = {"phoneDrive"};
		sentences[] = {
			"(Call Díaz.)",
			"Díaz, who is calling?",
			"Doesn't matter. But what does matter is that I've got a gun pointed towards your first son's head.",
			"What?! Is this some kind of prank?! It's not funny!",
			"(Puts Díaz's son on the phone for a few seconds.)",
			"Please, don't hurt them! Please! What do you want?! I have money, I can-"
		};
	};
	class phoneDrive
	{
		responses[] = {"phoneHangUp"};
		sentences[] = {
			"Drive home, now. And activate your phone's GPS. No AAF, no bodyguards and no funny business. You've got ten minutes, then I'll shoot the first one of your sons.",
			"Yes, I'll go now. Please don't hurt my sons, please!"
		};
	};
	class phoneHangUp
	{
		expression = "call IP_fnc_closeConversation; IP_PhoneCallDone = true; [IP_Scientist, 'phoneOpener'] call IP_fnc_removeConversation;";
		sentences[] = {
			"(Hang up.)"
		};
	};
};