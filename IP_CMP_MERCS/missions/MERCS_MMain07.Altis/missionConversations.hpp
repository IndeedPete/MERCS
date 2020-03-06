class Conversations
{
	class buddyOpener
	{
		responses[] = {"buddyWhy", "buddyExitNo"};
		sentences[] = {
			"Hey, you're sitting upright! Feeling better?",
			"Yes, I've managed to move my great toe last night and kept training all day until I was able to stand upright again. I think I can walk - well, slowly at least. Listen, we gotta leave, now."
		};
	};
	class buddyWhy
	{
		responses[] = {"buddyWhat", "buddyExitNo"};
		sentences[] = {
			"Why? We've got Greenbacks inbound! I can't leave now!",
			"You can! I mean, we can! We have to! Those Brits are sleazy bastards! Even if you'd make it today against the whole fucking AAF and whoever else is coming to the party - they won't let you walk out of here alive!",
			"They offered me one and a half million - and they paid their bills so far!",
			"That's only because they needed you! After today, they won't need your services any more! Jeez, I told you, those fanatics are crazy! They! Will! Fuck! You!"
		};
	};
	class buddyWhat
	{
		responses[] = {"buddyPlan", "buddyExitNo"};
		sentences[] = {
			"Assuming you're right. What should we do? We're surrounded by Greenbacks.",
			"Hey, we just need to catch a ride from the garage or a boat. I saw from the window that there's at least one quad. Two men can make it. We just have to get out of the base and into the woods. I have a backup plan for this case."
		};
	};
	class buddyPlan
	{
		responses[] = {"buddyExitOkay", "buddyExitNo"};
		sentences[] = {
			"You have a plan?",
			"I always have a plan. *grin* Just get us out of here. By car, by boat, on foot - I don't care but keep in mind that I'm really slow."
		};
	};
	class buddyExitOkay
	{
		expression = "call IP_fnc_closeConversation; IP_ChoseBuddy = true;";
		sentences[] = {
			"Okay, maybe you're right. Let's go!"
		};
	};
	class buddyExitNo
	{
		expression = "call IP_fnc_closeConversation; IP_ChoseBuddy = false;";
		sentences[] = {
			"Sorry, I can't do that. (Leave him.)"
		};
	};
};