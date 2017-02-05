class Conversations
{
	class exit
	{
		expression = "call IP_fnc_closeConversation;";
		sentences[] = {"Good bye!"};
	};
	
	// Buddy
	class buddyExit
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_Buddy, 'Go, kick some ass!', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"I gotta go!"};
	};
	class buddyOpener
	{
		responses[] = {"buddyWound", "buddySituation", "buddyOperation", "buddyExit"};
		sentences[] = {
			"Hey, how are you?",
			"Fine, I guess. Mind you, can't feel my legs. The doc gave me morphine so, you know, I'm on a pretty good trip."
		};
	};
	class buddyBack
	{
		responses[] = {"buddyWound", "buddySituation", "buddyOperation", "buddyExit"};
		sentences[] = {
			"Something else.",
			"What?"
		};
	};
	class buddyWound
	{
		condition = "((typeName IP_MERCS_BuddyDiedWeapon) == 'STRING')";
		expression = "IP_PlayerBox addWeaponCargo [IP_MERCS_BuddyDiedWeapon, 1]; IP_PlayerBox addItemCargo ['optic_Nightstalker', 1]; IP_MERCS_BuddyDiedWeapon = true; saveVar 'IP_MERCS_BuddyDiedWeapon';";
		responses[] = {"buddyBack", "buddyExit"};
		sentences[] = {
			"At least you're still alive.",
			"That's a matter of opinion – but yeah, I am. Thanks to you. Better call it even for all those times I saved your sorry ass. No, just kidding, I'm really grateful you know how to apply a med-kit.",
			"Any time.",
			"Hey, since I'm not exactly combat effective here I took the freedom of adding my rifle to your box. Use it well. And don't fucking sell it!" 
		};
	};
	class buddySituation
	{
		responses[] = {"buddyBack", "buddyExit"};
		sentences[] = {
			"What do you think of the situation?",
			"Messed up. Like usual. You don't seem to have much choice here. Well, at least I gotta stay here for sure..."
		};
	};
	class buddyOperation
	{
		responses[] = {"buddyKnights", "buddyMcMillian", "buddyBack", "buddyExit"};
		sentences[] = {
			"You know anything about all this top secret, cloak and dagger crap? Is it connected to our work with McMillian?",
			"Nope, ništa. We were both there when McMillian wanted to brief us, remember? And then those British shitheads took us down, breaking my fucking bones! Anyway, it must be something big. I've been with McMillian for some years now, and he's rarely gone on an operation by himself."
		};
	};
	class buddyKnights
	{
		responses[] = {"buddyMcMillian", "buddyBack", "buddyExit"};
		sentences[] = {
			"What else can you tell me about the Knights?",
			"I've already told you everything I know. Never met these guys in person 'till now. Must say though, got a real bad feeling about this. If you want my advice, stay extra fucking sharp out there. The Order are sure to terminate you and your contract as soon as you become superfluous to their needs. Fanatics like them don't make good business partners – so don't fool yourself, we're both prisoners here."
		};
	};
	class buddyMcMillian
	{
		responses[] = {"buddyKnights", "buddyBack", "buddyExit"};
		sentences[] = {
			"McMillian was with them some time ago.",
			"Yeah, and they seem to want him for something now. Probably ION itself. It's not a good sign in any case. He's never conceded to such demands before – and some clients have tried to make him, believe me. No. McMillian's afraid... Better sleep with a gun under your pillow, I'm doing the same."
		};
	};
	
	// Captain
	class captainOpener
	{
		responses[] = {"captainSituation", "captainOperation", "captainStrategy", "captainHelo", "captainCamp", "captainSupport", "exit"};
		sentences[] = {
			"Hey.",
			"I'm busy, make it quick."
		};
	};
	class captainBack
	{
		responses[] = {"captainSituation", "captainOperation", "captainStrategy", "captainHelo", "captainCamp", "captainSupport", "exit"};
		sentences[] = {
			"I have some more questions.",
			"Yes?"
		};
	};
	class captainSituation
	{
		responses[] = {"captainBack", "exit"};
		sentences[] = {
			"What's the situation on Altis?",
			"Seems its all kicked off around Kavala. The Altian government have announced a 'War on Terror' against the pro-European FIA, in retaliation for a widescale offensive in the south. There's fighting all over the island. A no-fly-zone's in effect and ION's mandate has been frozen. Last I heard, EUROFORCE dispatched their 5th Fleet to the Aegean. No doubt, at some point, they'll show their hand and provide material assistance in support of the insurgency. Of course, the European Federation has a geostrategic interest in this island. As does CSAT, whose forces in Izmir are mobilising. They may well be arriving soon."
		};
	};
	class captainOperation
	{
		responses[] = {"captainBack", "exit"};
		sentences[] = {
			"And what about this operation? Why are you here?",
			"Let's not get ahead of ourselves. You know the score, it's strictly 'need-to-know'. Do your job, follow orders, and make your money. All will be revealed in time, I assure you."
		};
	};
	class captainStrategy
	{
		responses[] = {"captainBack", "exit"};
		sentences[] = {
			"What's our strategy?",
			"Our objective is success - and to reach that, we must remain undetected for as long as possible. To begin with, we will avoid direct action. If a contract can help us to antagonise the warring parties however, we will allow you to take it. Our main concern is securing an equilibrium - we have to sustain and exploit the conflict between the FIA and AAF, creating a necessary window of opportunity."
		};
	};
	class captainHelo
	{
		responses[] = {"captainHeloHow", "captainBack", "exit"};
		sentences[] = {
			"And what about our chopper? Couldn't you just call or something?",
			"I'm afraid we had to make a point. McMillian has ignored our attempts to contact him - we had no choice but to make sure he could not compromise our operation...",
			"...which is totally secret.",
			"Precisely."
		};
	};
	class captainHeloHow
	{
		responses[] = {"captainBack", "exit"};
		sentences[] = {
			"How did you do it? Looked as though it just went haywire?",
			"Electronic warfare. It's a standard EMP device. We can knock out a vehicle's systems from a fair old distance. Pretty handy in some cases.",
			"I see, can I buy that somewhere?",
			"Not like that, you can't."
		};
	};
	class captainCamp
	{
		responses[] = {"captainBack", "exit"};
		sentences[] = {
			"Can I ask, why the hell did you pick this place for a camp? It's not exactly close to the action.",
			"Precisely. We don't have the manpower or equipment for an open fight. This is a suitable hiding place, far away from any important strategic sites. As well, we have access to the nearby roads and running water - plus, it's fairly defendable.",
			"Defendable? Are we expecting an attack?",
			"Indeed. Any minute. Eventually, either the FIA or AAF will find us. That's why we need to construct defences. Our worst fear is an AAF airstrike - we must keep them occupied in the south."
		};
	};
	class captainSupport
	{
		responses[] = {"captainBack", "exit"};
		sentences[] = {
			"Do you guys support me in any way?",
			"We plan to accompany you on missions when possible. But most of the time we will keep ourselves in the background, providing intel and recon for you. Apart from that, the Lord Commander ordered me to give you a small team. I've picked four of our best Brothers, you can select them for a mission with your shop system. They won't charge you but if they die, there's no replacement. So be careful out there."
		};
	};
	
	// Commander
	class commanderExit
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_Commander, 'Stay alive, Freshmeat!', 'DIRECT'] spawn IP_fnc_simpleSentence;";
		sentences[] = {"I'm going."};
	};
	class commanderOpener
	{
		responses[] = {"commanderInsertion", "commanderBriefing", "commanderWhat", "commanderHow", "commanderShop", "commanderBuddyAlive", "commanderBuddyDead", "commanderExit"};
		sentences[] = {
			"Hey.",
			"What is it?"
		};
	};
	class commanderBack
	{
		responses[] = {"commanderInsertion", "commanderBriefing", "commanderWhat", "commanderHow", "commanderShop", "commanderBuddyAlive", "commanderBuddyDead", "commanderExit"};
		sentences[] = {
			"I've got something else on my mind.",
			"Good for you. Spare me the details."
		};
	};
	class commanderInsertion
	{
		condition = "(((player getVariable ['IP_Mission', '']) in ['MMain01']) && (!isNil 'IP_BriefingDone'))";
		expression = "call IP_fnc_closeConversation; [(player getVariable 'IP_Mission'), true, 5] call IP_fnc_endMission;";
		sentences[] = {"I'm ready! (Start mission.)"};
	};
	class commanderBriefing
	{
		condition = "(((player getVariable ['IP_Mission', '']) != '') && (isNil 'IP_BriefingDone'))";
		expression = "call IP_fnc_closeConversation; [] spawn IP_scn_briefing;";
		sentences[] = {"Reporting in for briefing. (Start briefing.)"};
	};
	class commanderWhat
	{
		responses[] = {"commanderBack", "commanderExit"};
		sentences[] = {
			"What now? Are we staying here?",
			"Affirmative. I need to stay with the Knights, and since you're my subordinate, you'll need to stay here too. We also have a common goal.",
			"Let me guess: It has something to do with our original mission? You wanted to brief us on the chopper...",
			"No, not just now. I was forced to change my strategy. We'll discuss that soon enough."
		};
	};	
	class commanderHow
	{
		responses[] = {"commanderLeft", "commanderBK", "commanderBack", "commanderExit"};
		sentences[] = {
			"Just refresh my memory, a moment. How the hell did we get here?",
			"Lord Commander Titus' men took down our helo and brought us here. Do as they command, make a tonne of money, and keep your bloody mouth shut. You're in the best position here, trust me."
		};
	};	
	class commanderLeft
	{
		responses[] = {"commanderAnd", "commanderBK", "commanderBack", "commanderExit"};
		sentences[] = {
			"How so? Because you somehow betrayed these 'British Knights'?",
			"I didn't betray them. I left them."
		};
	};
	class commanderBK
	{
		responses[] = {"commanderAnd", "commanderLeft", "commanderBack", "commanderExit"};
		sentences[] = {
			"What can you tell me about this Titus and the British Knights?",
			"Ex-SAS. Straight British. Officers all have links with the aristocracy - they're blue blooded nationalists, through and through. Don't get in their way. I know Titus from my time with them."
		};
	};
	class commanderAnd
	{
		responses[] = {"commanderBack", "commanderExit"};
		sentences[] = {
			"And?",
			"And that's none of your damn business."
		};
	};
	class commanderShop
	{
		responses[] = {"commanderCampEnhancements", "commanderCampVehicles", "commanderBack", "commanderExit"};
		sentences[] = {
			"Since I'm really employed now, is there anything I should know?",
			"You earn more, for starters. And I've granted you some advanced privileges for our accoutrement system. As you're aware, we're on the verge of a particularly destructive flashpoint. This base could use proper defences, and since we're cut off from our HQ on Stratis, we will have to setup our own logistics. Hence, you can purchase camp enhancements and vehicles now. As you'd expect, we'll split the bill - we all want to survive and make the best of our situation, right?"
		};
	};
	class commanderCampEnhancements
	{
		responses[] = {"commanderCampVehicles", "commanderBack", "commanderExit"};
		sentences[] = {
			"Camp enhancements?",
			"Yes, anything we can use to secure this shithole or gains us a tactical advantage. Static weaponry, sandbags, mines, tents - for more contractors, a helipad - you follow? The Knight Captain outlined a rough plan. I've already uploaded it to our network. You're able to buy those 'compositions' piece by piece. Though keep in mind that deployment takes a few hours. Think before you procure something when expecting an imminent attack."
		};
	};	
	class commanderCampVehicles
	{
		responses[] = {"commanderCampEnhancements", "commanderBack", "commanderExit"};
		sentences[] = {
			"I have to buy my own vehicles now?",
			"Like I said - we're cut off from Stratis and we've lost our ride. We need to order new assets - but it takes time and money. As it stands, we can get hold of a few cars, a boat, and a dated helo. Each of those offers you another method of instertion or support when going on a mission, and, unless you want to walk every time, I'd recommend you take the lot. Each vehicle offers a unique and practical advantage. But bear in mind, some of them require camp enhancements. For example, a heli should obviously have a helipad."
		};
	};
	class commanderBuddyAlive
	{
		
		condition = "!IP_BuddyDied";
		responses[] = {"commanderBack", "commanderExit"};
		sentences[] = {
			"What about Dražen?",
			"Victus thinks he fucked his spine when he fell from the helo - my second-in-command is pretty much useless to me right now. Unless he's on his feet in the next few days, I'll have a position for you, to take his place. That is, of course, if you yourself are still alive."
		};
	};
	class commanderBuddyDead
	{
		
		condition = "IP_BuddyDied";
		responses[] = {"commanderBack", "commanderExit"};
		sentences[] = {
			"What about Dražen?",
			"What about him? He died at the crash site, along with the others. We didn't help him. Lucky for you, I guess, I'll still need a second-in-command. A few days in battle and you're already ascending the ranks. Don't get any delusions of grandeur though - this is my business. Pull any shit with me and I'll be quick to separate your head from your neck."
		};
	};
	
	// Hacker
	class hackerExit
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_Hacker, 'Dont let them get you!', 'DIRECT'] spawn IP_fnc_simpleSentence;";
		sentences[] = {"I've got work to do."};
	};
	class hackerOpener
	{
		arguments[] = {"profileName"};
		responses[] = {"hackerDoing", "hackerName", "hackerContractor", "hackerShirt", "hackerExit"};
		sentences[] = {
			"Hi, '%1'?",
			"Hey there, big, black, scary guy! Please don't shoot me, ahhhhh - just kidding. What can I do you for?"
		};
	};
	class hackerDoing
	{
		responses[] = {"hackerName", "hackerContractor", "hackerShirt", "hackerExit"};
		sentences[] = {
			"What are you doing?",
			"Trying to find an exploit in the latest Lightning Player plugin for Waterdog 42.",
			"Uhm, okay. Why?",
			"Because zero day exploits bring a buttload of cash. If I find it first I can sell it for around 50000; double if the Blueflag intel service is interested. These nutjobs are literally buying everything. You'd think they could afford to employ their own expert with the money they spend on buying information from me."
		};
	};
	class hackerName
	{
		arguments[] = {"profileName"};
		responses[] = {"hackerDoing", "hackerContractor", "hackerShirt", "hackerExit"};
		sentences[] = {
			"What is your real name?",
			"You don't really expect an answer to this question, do you?",
			"Not from a guy who calls himself '%1'. What's that for a stupid name anyway?",
			"It's as good as any other pseudonym. It's not like 'Raif' is the most beautiful name I've ever heard - and that's your real one."
		};
	};
	class hackerContractor
	{
		responses[] = {"hackerDoing", "hackerName", "hackerShirt", "hackerExit"};
		sentences[] = {
			"How can you be a military contractor?",
			"What, because I don't wave around big guns and look scary I can't kill people for money? I'll tell you something: If we want to compare our dicks here, go ahead, but I'm gonna win. You see, we're in the 21st century, it's not like we've just discovered electricity. Wars are not fought on battlefields with armies any more. They're fought in server rooms and offices, with spying software and gallons of coffee. I can bring down a whole country with a push of a button - what can you do with your little rifle, huh?"
		};
	};
	class hackerShirt
	{
		responses[] = {"hackerDoing", "hackerName", "hackerContractor", "hackerExit"};
		sentences[] = {
			"What's 'Bohemia Interactive'? It's on your shirt.",
			"Oh dear, I'm only working with idiots and retards. This is THE computer game company of the post-millennium years! Hell, have you even played retro classics like 'ARMA 3' or 'Take On Garbage Disposal - Operation Trashpoint'?! Such sweet games! Especially with the robotic radio-protocol DLC for the 'Terminator' expansion: 'Enemy! CONTAINER! Way! To! Our! Front! Close! EXTERMINATE!' Best 10 bucks I've ever spent! Sadly, they got shut down by the government when they started experimenting with that Czech military AI - nasty stuff, this BudWISEr."
		};
	};
	
	// Lord
	class lordExit
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_Lord, 'Britain first, Brother!', 'DIRECT'] spawn IP_fnc_simpleSentence;";
		sentences[] = {"I'm going."};
	};
	class lordOpener
	{
		responses[] = {"lordKnights", "lordExit"};
		sentences[] = {
			"Commander?",
			"It's 'Lord Commander'!",
			"Right, yeah, sorry.",
			"Your ignorance may be forgiven. What can I do for you?"
		};
	};
	class lordBack
	{
		responses[] = {"lordKnights", "lordExit"};
		sentences[] = {
			"I wanted to ask something else.",
			"And that is?"
		};
	};
	class lordKnightsBack
	{
		responses[] = {"lordFrom", "lordGoals", "lordMedieval", "lordMany", "lordBack", "lordExit"};
		sentences[] = {
			"I wanted to ask something else.",
			"And that is?"
		};
	};
	class lordKnights
	{
		responses[] = {"lordFrom", "lordGoals", "lordMedieval", "lordMany", "lordBack", "lordExit"};
		sentences[] = {
			"I'd like to learn a little more about your order.",
			"I suppose you've earned the right to get better acquainted, sure. It's a right however, that only few are granted. Ask your questions."
		};
	};
	class lordFrom
	{
		responses[] = {"lordFounded", "lordKnightsBack", "lordExit"};
		sentences[] = {
			"Tell me about the Knights' origins.",
			"The 'Order of the British Knights' was founded in 2023, after the grand betrayal of the British government.",
			"Please remind me, what betrayal?",
			"Yes, when our nation's traitors oversaw the total abandonment of our empire and heritage, to join the European Federation as a subservient state. They sacrificed our power, our sacred blood, our glorious history - and for what?"
		};
	};
	class lordFounded
	{
		responses[] = {"lordKnightsBack", "lordExit"};
		sentences[] = {
			"Okay... I think I'm missing the major part here?",
			"My men and I have dedicated our lives to serving our crown and country; we are true patriots - brothers in arms, revered operatives in the SAS, always on the forth front, serving the British people. The traitors severed us from our ideals, our identity - so, we had no option. We began a new movement, underground."
		};
	};
	class lordGoals
	{
		responses[] = {"lordAltis", "lordKnightsBack", "lordExit"};
		sentences[] = {
			"And what's your agenda? Precisely what are you trying to achieve?",
			"Restoration - we seek to liberate ourselves from our overlords in Brussels - we want to take back our country and return it to its former glory, to make Great Britain great again."
		};
	};
	class lordAltis
	{
		responses[] = {"lordKnightsBack", "lordExit"};
		sentences[] = {
			"I think I'm lost again. Then what are you doing on Altis?",
			"That, I cannot dispose. Be assured your services will be rewarded in a most profitable manner."
		};
	};
	class lordMedieval
	{
		responses[] = {"lordReligion", "lordRacist", "lordKnightsBack", "lordExit"};
		sentences[] = {
			"Alright, why all the medieval titles?",
			"Our island nation has a long tradition of knighthood. Old and honoured orders have existed for many hundreds of years. Most of this culture was swept aside when we were inaugurated into the federation - we want to safeguard our traditions in this modern age. And with the godless European Federation and the predominantly Islamic CSAT forces, threatening what little we have left, we will need a new crusade, a crusade for a new Jerusalem."
		};
	};
	class lordReligion
	{
		responses[] = {"lordRacist", "lordKnightsBack", "lordExit"};
		sentences[] = {
			"Is the order some sort of religious order then?",
			"Many of our brothers have a strong faith in God. I for my part, do not subscribe to such things - the point is, we are willing to lay down our lives for a cause. And that's what make a true Knight."
		};
	};
	class lordRacist
	{
		responses[] = {"lordReligion", "lordKnightsBack", "lordExit"};
		sentences[] = {
			"No offence, but does the order have some sort of superiority complex?",
			"No, we are not racists, if that's what you're implying. Some call us fanatics, extremists, ultra-nationalists - but we show them how wrong they are. Believe me, one day, they will see the light."
		};
	};
	class lordMany
	{
		responses[] = {"lordKnight", "lordKnightsBack", "lordExit"};
		sentences[] = {
			"How many Knights are there?",
			"Sadly, our numbers of fighting brothers are short. But we're well-trained, well-equipped and have the element of surprise to our advantage. And we have many supporters and financiers in the Kingdom. That's why we have to rely on you sell-swords in this operation."
		};
	};
	class lordKnight
	{
		responses[] = {"lordKnightsBack", "lordExit"};
		sentences[] = {
			"What if I want to become a Knight?",
			"Unfortunately, you're not British. You cannot become a Knight. That said, if you prove to be valuable to our cause, you may become an associate."
		};
	};
	
	// Medic
	class medicOpener
	{
		responses[] = {"medicBuddy", "medicBuddyDied", "medicName", "exit"};
		sentences[] = {
			"Hey there, you the medic?",
			"I am. The name's Knight Lieutenant Victus. How can I help you, brother?"
		};
	};
	class medicBack
	{
		responses[] = {"medicBuddy", "medicBuddyDied", "medicName", "exit"};
		sentences[] = {
			"Back to my other questions.",
			"Yes?"
		};
	};
	class medicBuddyDied
	{
		
		condition = "IP_BuddyDied";
		responses[] = {"medicBack", "exit"};
		sentences[] = {
			"You can tell me why you let Dražen die?",
			"He was gravely wounded - no way he would have made it. And even if he had, what would we do with him? I let him leave the world in peace. You, if I remember correctly, did exactly the same..."
		};
	};
	class medicBuddy
	{
		
		condition = "!IP_BuddyDied";
		responses[] = {"medicWhy", "medicRecover", "medicBack", "exit"};
		sentences[] = {
			"How's Dražen?",
			"The fall from the helo caused major damage to his vertebral column. Several vertebrae are shattered and are affecting his nervous system - he's paralysed from the waist down. What's more, some shrapnel pierced his vest and entered his stomach. His organs however, didn't take any damage and you prevented any major blood loss. Basically, you saved his life."
		};
	};
	class medicWhy
	{
		
		responses[] = {"medicRecover", "medicBack", "exit"};
		sentences[] = {
			"Right, yeah - no thanks to you. Why didn't you help him?",
			"Because, should he recover, he's no good to us. Helping him now is an act of kindness. Be grateful."
		};
	};
	class medicRecover
	{
		responses[] = {"medicWhy", "medicBack", "exit"};
		sentences[] = {
			"Do you think he will recover?",
			"Well. He's stable and should survive. His wound will heal with time - but I don't know if he'll ever walk again. He needs the prognosis of a neurologist, and it's not like we have one here, on standby."
		};
	};
	class medicName
	{
		responses[] = {"medicBack", "exit"};
		sentences[] = {
			"Your name, Victus - that's not your real name, right?",
			"No - when one becomes a high-ranking Knight, they choose a combat name. A name that gives us strength and represents our role within the Order. It's usually, but not limited to, a Latin one."
		};
	};
};