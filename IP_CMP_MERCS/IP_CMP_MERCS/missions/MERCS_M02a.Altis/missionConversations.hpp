class Conversations
{
	// Car
	class carOpener
	{
		responses[] = {"carDestination", "carMoneyExit", "carExit"};
		sentences[] = {
			"Sir, may I see your ID and driver's license please?",
			"Sure, is there a problem? (Hands over ID and license. All documents are valid and flawless. There is no active arrest warrant.)"
		};
	};
	class carExit
	{
		expression = "call IP_fnc_closeConversation";
		sentences[] = {"One moment, Sir. (Step away from the vehicle.)"};
	};
	class carDestination
	{
		arguments[] = {"['I need to get to Selakano. I have an important delivery.', 'I have a house on the coast. See my ID? I live there.', 'I want to visit my aunt in Selakano.', ""A wind turbine broke down south of here. I'm assigned to fix it."", 'I want to go fishing. I have a boat in Mazi.'] call BIS_fnc_selectRandom"};
		responses[] = {"carMoneyExit", "carExit"};
		sentences[] = {
			"Where are you going to?",
			"%1"
		};
	};
	class carMoneyExit
	{
		expression = "call IP_fnc_closeConversation; (round(random 50)) call IP_fnc_addMoney; nul = _this spawn {[_this select 1, ""Yes, okay, here you go. That's all I have, please don't hurt me."", 'DIRECT'] call IP_fnc_simpleSentence; [IP_Buddy, ""You are a fucking greedy pig, now aren't you?"", 'DIRECT'] call IP_fnc_simpleSentence;}; [_this select 1, 'carOpener'] call IP_fnc_removeConversation;";
		sentences[] = {
			"If you want to pass through here you have to pay me a toll. (Intimidate.)"
		};
	};
};