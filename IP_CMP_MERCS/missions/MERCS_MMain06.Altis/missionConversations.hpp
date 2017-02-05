class Conversations
{
	class deviceOpener
	{
		responses[] = {"devicePushButtons", "deviceExit"};
		sentences[] = {
			"(Investigate device.)",
			"Beep-Beep-Du-Du. (Fancy lights flashing up in a random order.)"
		};
	};
	class devicePushButtons
	{
		responses[] = {"deviceRedButton", "deviceExit"};
		sentences[] = {
			"(Push random buttons.)",
			"Beep-Beep-Du-Du. Beep-Beep-Du-Du. Beep-Beep-Du-Du. Beeeeeep. Ring. (A big red button lights up.)"
		};
	};
	class deviceRedButton
	{
		expression = "call IP_fnc_closeConversation; IP_DeviceActivated = true;";
		sentences[] = {
			"(Push the big red button.)"
		};
	};
	class deviceExit
	{
		expression = "call IP_fnc_closeConversation;";
		sentences[] = {
			"(Step away from the device.)"
		};
	};
};