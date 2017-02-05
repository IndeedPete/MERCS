class Conversations
{
	// Phone
	class phoneOpener
	{
		expression = "IP_PhoneAnswered = true;";
		responses[] = {"phoneOkay", "phonePiratesDeadExit"};
		sentences[] = {
			"Yes?",
			"Hey, we heard gunfire. Is everything okay down there?"
		};
	};
	class phoneOkay
	{
		responses[] = {"phoneYes", "phoneNo"};
		sentences[] = {
			"Yes, we just had a minor problem with our guest.",
			"I told you to deal with him quietly, dammit! Is it done? Do you have it?"
		};
	};
	class phonePiratesDeadExit
	{
		expression = "call IP_fnc_closeConversation; IP_PhoneCallDone = false;";
		sentences[] = {"Fuck off, your men are dead! (Hang up.)"};
	};
	class phoneYes
	{
		responses[] = {"phoneUnderstood", "phoneGirl"};
		sentences[] = {
			"Yes, boss.",
			"Good, then wrap it up and come back to the factory ASAP!"
		};
	};
	class phoneNo
	{
		expression = "call IP_fnc_closeConversation; removeAllActions IP_Phone; IP_PhoneCallDone = false;";
		sentences[] = {
			"No, fuck you! (Hang up.)"
		};
	};
	class phoneUnderstood
	{
		expression = "call IP_fnc_closeConversation; removeAllActions IP_Phone; IP_PhoneCallDone = true;";
		sentences[] = {
			"Understood. (Hang up.)"
		};
	};
	class phoneGirl
	{
		responses[] = {"phoneHangUp"};
		sentences[] = {
			"Will do. Is the girl still there?",
			"Yes, but we will move her soon. Wait, why do you bother?! Who is this?!"
		};
	};
	class phoneHangUp
	{
		expression = "call IP_fnc_closeConversation; removeAllActions IP_Phone; IP_PhoneCallDone = true; IP_HintFound = true;";
		sentences[] = {
			"(Hang up.)"
		};
	};
	
	// Survivor
	class survivorOpener
	{
		responses[] = {"survivorHeal", "survivorHurt", "survivorExit"};
		sentences[] = {
			"Hey! We're looking for this girl! Do you have her?!",
			"Ugh... M- Maybe... If you would... Help me, I... Ah!"
		};
	};
	class survivorExit
	{
		expression = "call IP_fnc_closeConversation;";
		sentences[] = {
			"(Leave him.)"
		};
	};
	class survivorHeal
	{
		condition = "'FirstAidKit' in (items player)";
		expression = "IP_HintFound = true; [IP_Survivor, 'survivorOpener'] call IP_fnc_removeConversation; player removeItem 'FirstAidKit';";
		responses[] = {"survivorExit"};
		sentences[] = {
			"Okay, hold tight. This might hurt a little. (Spend First Aid Kit.)",
			"Ahhh! T- Thank you.",
			"Good, now tell me: Do you know anything about the missing girl?",
			"Yes, w- we have her. Sh- She was here minutes ago. B- But they've trans- transf- moved her.",
			"Where to?",
			"D- Don't know. Ugh..."
		};
	};
	class survivorHurt
	{
		expression = "IP_HintFound = true; [IP_Survivor, 'survivorOpener'] call IP_fnc_removeConversation;";
		responses[] = {"survivorExit"};
		sentences[] = {
			"Fuck you. (Pierce his wounds with your weapon.)",
			"AHHHHH! ARGHHH! AHH! I'm telling! I'm telling! Please!",
			"I'm listening.",
			"Yes, w- we have her. Sh- She was here minutes ago. B- But they've trans- transf- moved her.",
			"Where to?",
			"D- Don't know. Ugh..."
		};
	};
};