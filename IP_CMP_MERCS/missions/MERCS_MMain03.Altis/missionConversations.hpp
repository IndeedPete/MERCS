class Conversations
{
	// Crazy Farmer
	class farmerExit
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_Farmer, 'Hell yeah, son! Show these turban-wearing-terrorist-shitheads what happens when you mess around with Uncle Sam!', 'DIRECT'] spawn IP_fnc_simpleSentence;";
		sentences[] = {
			"Uh, well thank you, but I got to go..."
		};
	};
	class farmerOpener
	{
		responses[] = {"farmerUSA", "farmerAmerican", "farmerHacker", "farmerNuts", "farmerExit"};
		sentences[] = {
			"Hey, is this your farm, Sir?",
			"Darn tootin' is this my farm! Welcome to 'Little Omaha' how we call it, the 51st state of the proudest nation on this damn planet - the US of A! I'm Farmer Pete!"
		};
	};
	class farmerUSA
	{
		responses[] = {"farmerAmerican", "farmerHacker", "farmerNuts", "farmerExit"};
		sentences[] = {
			"Uhm, this is not the US. We're on an island called 'Altis'.",
			"That's what I'm saying, son! Just like in the beautiful state of Nebraska. Where the corn is golden and the cows fat! Hahaha! You know, my great-grandfather built this farm with his bare hands.",
			"Yeah, sure, amazing..."
		};
	};
	class farmerAmerican
	{
		responses[] = {"farmerUSA", "farmerHacker", "farmerNuts", "farmerExit"};
		sentences[] = {
			"Are you sure you're from America? You look and sound Greek to me...",
			"Hell yes, I'm from the 51st American state! We're the strongest and the proudest this country has to offer! I'm telling you, here in Little-O my great grandfather's father used to be...",
			"Sorry, but we have to postpone the story time, I'm in a hurry."
		};
	};
	class farmerHacker
	{
		arguments[] = {"profileName"};
		expression = "['Farmer Pete', 'Find the shack at 065131. Beware of the redskins! ;)'] call IP_m_fnc_createNote;";
		responses[] = {"farmerUSA", "farmerAmerican", "farmerNuts", "farmerExit"};
		sentences[] = {
			"I'm looking for a guy that goes by the name of '%1'. Any idea where I can find him?",
			"Ha! Yes, I recall that guy coming through! Me and the boys where just tipping some cows - man, I tell you, totally rootin' tootin'!",
			"And?!",
			"Oh yeah. He said I should give you this note. Well, as I said, the cows were so...",
			"Thanks, I'm sure cow tipping is total fun and stuff but I'm on a bit of a tight schedule here."
		};
	};
	class farmerNuts
	{
		responses[] = {"farmerUSA", "farmerAmerican", "farmerHacker", "farmerExit"};
		sentences[] = {
			"Sir, you are plain nuts!",
			"No no, son! We're only raising corn and cattle here! No nuts here!",
			"There is no fucking cattle!",
			"Ha, you must be blind! Don't you see them?! Right behind me!",
			"Those are goats.",
			"Ha, exactly! That's what I'm saying!",
			"*sigh*"
		};
	};
	
	// Phone
	class phoneOpener
	{
		expression = "IP_PhoneAnswered = true;";
		responses[] = {"phoneNumber", "phoneNo"};
		sentences[] = {
			"Yes?",
			"Hi there!",
			"Who is this?!",
			"'The droid you're looking for!' Hahaha! Hey, listen, you've managed to follow my hints so far so you're not as dumb as the usual merc. But I'm still unsure if you're not part of the AAF..."
		};
	};
	class phoneNumber
	{
		responses[] = {"phoneNo"};
		sentences[] = {
			"How did you get this number?",
			"I get paid to acquire certain information, remember? Oh, and change your mail password. 'ihateethiopia' is not what leading experts would call 'secure'."
		};
	};
	class phoneNo
	{
		responses[] = {"phoneHangUp"};
		sentences[] = {
			"I am most certainly not a Greenback.",
			"Hm, hm, interesting. But how can I be sure? I mean, I know everything about you. But what if I've missed something? I tell you what: There's an AAF checkpoint at Edessa. Would you be so kind to clear it for me? I'm going to watch so I expect a nice show! See 'ya! Or maybe not! *Hangs Up*"
		};
	};
	class phoneHangUp
	{
		expression = "call IP_fnc_closeConversation; IP_PhoneAnswered = nil; IP_PhoneCallDone = true; [IP_Hacker, 'phoneOpener'] call IP_fnc_removeConversation; 'mCheckpoint' setMarkerAlpha 1; [player, 'tCheckpoint', ['Engage and clear the <marker name=''mCheckpoint''>AAF Checkpoint at Edessa</marker>!', 'Clear AAF Checkpoint', 'AAF Checkpoint'], 'mCheckpoint', true, 1] call BIS_fnc_taskCreate;";
		sentences[] = {
			"(Hang up.)"
		};
	};
	class phoneOpenerCheckpoint
	{
		expression = "IP_PhoneAnswered = true;";
		responses[] = {"phoneHangUpCheckpoint"};
		sentences[] = {
			"Yes?",
			"Hey again! Nice job, Bro!",
			"So, what now? Did I pass all of your tests?",
			"You did, you did! Anyway, I'll give you the 'E' you need: 651269. *Hangs Up*"
		};
	};
	class phoneHangUpCheckpoint
	{
		expression = "call IP_fnc_closeConversation; IP_PhoneAnswered = nil; [IP_Hacker, 'phoneOpenerCheckpoint'] call IP_fnc_removeConversation; ['tCheckpoint', 'SUCCEEDED'] call BIS_fnc_taskSetState; ['Phone Call', 'His encrypted position (E) is at 651269.'] call IP_m_fnc_createNote;";
		sentences[] = {
			"(Hang up.)"
		};
	};
};