class Conversations
{
	// Contact
	class contactOpener
	{
		arguments[] = {"(getNumber(missionConfigFile >> 'carPrice'))", "(getNumber(missionConfigFile >> 'FIAPrice'))"};
		responses[] = {"contactCar", "contactFIA", "contactExit"};
		sentences[] = {
			"What else are you offering?",
			"There's an armed car in that garage. I let you use it for just %1€. And I have some boys west of the compound. They could move in and cause some trouble on your call if you support our cause with nothing less than %2€."
		};
	};
	class contactExit
	{
		expression = "call IP_fnc_closeConversation";
		sentences[] = {"Good bye."};
	};
	class contactCar
	{
		arguments[] = {"(getNumber(missionConfigFile >> 'carPrice'))"};
		condition = "(locked IP_Car == 2)";
		expression = "if (((getNumber(missionConfigFile >> 'carPrice')) call IP_fnc_purchase)) then {IP_Car lock 0} else {call IP_fnc_closeConversation; [IP_Contact, 'First cash, then deal.', 'DIRECT'] call IP_fnc_simpleSentence;};";
		responses[] = {"contactFIA", "contactExit"};
		sentences[] = {
			"I'll take the car. (Pay %1€.)",
			"Here you go. (Hands over keys.)"
		};
	};
	class contactFIA
	{
		arguments[] = {"(getNumber(missionConfigFile >> 'FIAPrice'))"};
		condition = "!IP_FIASupport";
		expression = "if (((getNumber(missionConfigFile >> 'FIAPrice')) call IP_fnc_purchase)) then {IP_FIASupport = true; [IP_Main, 'callFIA'] call BIS_fnc_addCommMenuItem; {_x setMarkerAlpha 1} forEach ['mFIA', 'mArr'];} else {call IP_fnc_closeConversation; [IP_Contact, 'First cash, then deal.', 'DIRECT'] call IP_fnc_simpleSentence;};";
		responses[] = {"contactCar", "contactExit"};
		sentences[] = {
			"I want your support. (Pay %1€.)",
			"My guys are on stand-by. Give me a shout when you want them to move in."
		};
	};
	
	// Hostage
	class hostageOpener
	{
		responses[] = {"hostageComeFree", "hostageMoney", "hostageExit"};
		expression = "IP_KnowsAboutGirl = true";
		sentences[] = {
			"I could ask you the same.",
			"I'm a surfer! I was kidnapped weeks ago! You don't look like one of the pirates!",
			"Because I am none of them. Listen, this girl, where is she?",
			"Over there. (Points at human skull near the wall.) They- They killed her days ago. Didn't you see the grave outside? I had to dig it. But she is better of dead, believe me. What they did to her all the time. You can't imagine. Like animals they - I'm lucky to be a man and not a young girl in these days. Listen, can you get me out of here? Please, I can't take this one more day."
		};
	};
	class hostageExit
	{
		expression = "call IP_fnc_closeConversation";
		sentences[] = {
			"(Leave him.)"
		};
	};
	class hostageMoney
	{
		arguments[] = {"(getNumber(missionConfigFile >> 'hostageMoney'))"};
		expression = "IP_KnowsAboutMoney = true";
		responses[] = {"hostageComePay", "hostageComeFree", "hostageExit"};
		sentences[] = {
			"Depends. Do you have something for me in return?",
			"Yes, yes! I have money! %1€! Take it! (Pulls a dirty plastic bag with some money from that part of his body where the sun never shines.)",
		};
	};
	class hostageComePay
	{
		arguments[] = {"(getNumber(missionConfigFile >> 'hostageMoney'))"};
		expression = "call IP_fnc_closeConversation; [IP_Hostage, 'hostageOpener'] call IP_fnc_removeConversation; IP_MoneyReceived = true; IP_Hostage stop false; [IP_Hostage, IP_Main] spawn IP_fnc_follow; (getNumber(missionConfigFile >> 'hostageMoney')) call IP_fnc_addMoney;";
		sentences[] = {
			"Okay, hand me the cash, shut up and follow me. (Receive %1€)"
		};
	};
	class hostageComeFree
	{
		expression = "call IP_fnc_closeConversation; IP_Hostage stop false; [IP_Hostage, 'hostageOpener'] call IP_fnc_removeConversation; [IP_Hostage, IP_Main] spawn IP_fnc_follow;";
		sentences[] = {
			"Okay, just come with me and stay low."
		};
	};
};