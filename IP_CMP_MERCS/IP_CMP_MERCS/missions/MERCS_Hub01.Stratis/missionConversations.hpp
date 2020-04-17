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
		expression = "call IP_fnc_closeConversation; nul = [IP_Buddy, 'See ya!', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};
	class buddyOpener
	{
		responses[] = {"buddySurvive", "buddyBuddy", "buddyMercs", "buddyMaxwell", "buddyStratis", "buddyShop", "buddyExit"};
		sentences[] = {
			"Hey, can I ask you something?",
			"Feel free. What would you like to know?"
		};
	};
	class buddyBack
	{
		responses[] = {"buddySurvive", "buddyBuddy", "buddyMercs", "buddyMaxwell", "buddyStratis", "buddyShop", "buddyExit"};
		sentences[] = {
			"I'd like to know something else.",
			"Yes?"
		};
	};
	class buddySurvive
	{
		responses[] = {"buddyNikos", "buddySlaves", "buddyBack", "buddyExit"};
		sentences[] = {
			"Why am I still alive while the other refugees are dead?",
			//"They died because they tried to run - simple as that. They lost their shit over there while you stayed cool. Keep it that way and you won't have any problems here."
			"Because you were the only one of value to us and Nikos is a sleazy bastard? Sounds hard and I don't like it. But a human life isn't worth much around here."
		};
	};
	class buddyNikos
	{
		responses[] = {"buddySlaves", "buddyBack", "buddyExit"};
		sentences[] = {
			"I am going to kill Nikos.",
			"Haha! Good luck with that! We never know where he is unless he contacts us. And there usually are a lot of trigger-happy mercs around him.",
			"I don't care. Someday, I'll find him. And then I will bring him to justice.",
			"Justice! Good one! Words to the wise: Let it go. Focus on making some money to get off this rock and make yourself a good life instead of hunting a ghost.",
			"We'll see about that..."
		};
	};
	class buddySlaves
	{
		responses[] = {"buddyNikos", "buddyMcMillian", "buddyBack", "buddyExit"};
		sentences[] = {
			"Is slavery a common trait among you guys?",
			"We 'buy' people like this from time to time to make up for our losses. McMillian came up with this idea. I don't like it but we don't really get reinforcements out here. And apart from that you're not exactly a slave. You get paid for what you do here. Do some work and you're free. Do some more work and you even make a buttload of money.",
			"I'm really flattered by your courtesy..."
		};
	};
	class buddyMcMillian
	{
		responses[] = {"buddyNikos", "buddyKnights", "buddyBack", "buddyExit"};
		sentences[] = {
			"Who's this McMillian guy anyway?",
			"He's the commander of this shithole. He's a sadistic ass but he keeps the men in line and runs quite a profitable business here. That's why the organisation looks the other way some time. He used to be a Captain with the British Knights.",
		};
	};
	class buddyKnights
	{
		responses[] = {"buddyNikos", "buddyBack", "buddyExit"};
		sentences[] = {
			"British Knights?",
			"When Great Britain gave up it's sovereignty and joined the European Federation some ultra-nationalistic SAS unit deserted and formed 'The Order of the British Knights'. They're basically a group of batshit crazy, religious extremists, but well-armed and well-trained. They show up here and there from time to time, yet no one knows what they're really up to. One last advise: do not ask McMillian about the Knights. The last guy who did so was found around the outer defences. In different places."
		};
	};
	class buddyBuddy
	{
		responses[] = {"buddyTattoos", "buddyWeapon", "buddyNice", "buddyBack", "buddyExit"};
		sentences[] = {
			"Tell me something about yourself.",
			"Not much to tell actually. I was born in Croatia, in a small village on the coast. Had to pick up a rifle during the Balkan wars and been making a living as PMC since. Joined the organisation couple of months ago. Good pay, free health care and a lot of action. I can't complain."
		};
	};
	class buddyTattoos
	{
		responses[] = {"buddyWeapon", "buddyNice", "buddyBack", "buddyExit"};
		sentences[] = {
			"What's up with all the tattoos?",
			"Some are for prisons I've been in. Some are for kills - you know, good ones. Some are for things I've lost; those aren't your business. They're nobody's business. And some are because: 'Hey, why the fuck not?'"
		};
	};
	class buddyWeapon
	{
		responses[] = {"buddyTattoos", "buddyNice", "buddyBack", "buddyExit"};
		sentences[] = {
			"Why did you give me a weapon? Aren't you afraid I try to fight and run?",
			"Haha! I just gave you a pistol and there are around one hundred mercs, armed to the teeth, in this camp. How many can you take down before they get you, huh? And where do you want to go? There's nothing on this island apart from mines and death. And even if you manage to get a boat or something, you'd have no place to run to. We don't need to put you behind bars to keep you here. Apart from that, how do you want to earn some money as mercenary without a weapon? I help you to get started because we're partners now."
		};
	};
	class buddyNice
	{
		responses[] = {"buddyTattoos", "buddyWeapon", "buddyBack", "buddyExit"};
		sentences[] = {
			"Why are you so nice to me? The other guys here seem to be pretty much assholes.",
			"Because we're partners now. And partners look after each other. If we don't get along here how are we supposed to fight together out in the field? I have to rely on you as much as you have to rely on me. Oh, and don't tell the other guys that they're idiots. They do weird stuff when they get angry. Most of them haven't seen a girl in a while. Try not to become their substitute."
		};
	};
	class buddyMercs
	{
		responses[] = {"buddyClients", "buddyWork", "buddyBack", "buddyExit"};
		sentences[] = {
			"What is this 'organisation'? And what's my purpose here?",
			"The organisation is actually called 'ION Incorporated'. We're private military contractors and offer pretty much anything to anyone - as long as we get paid. Check out our website. You are now an independent contractor and will take some jobs in order to pay off your debts."
		};
	};
	class buddyClients
	{
		responses[] = {"buddySuchAs", "buddyWork", "buddyBack", "buddyExit"};
		sentences[] = {
			"Who are our clients?",
			"Anybody. Mostly corporate organisations or governments. Sometimes military, sometimes private, sometimes we don't know. If you have money, we're your best friends.",
			"Also the European Federation?",
			"Yup! Sometimes even the fucking Blueflags. It totally pisses off the AAF but then again, they can't really do much about it. They need us to do their dirty work. So we have free hands to do jobs for whoever we want to. As long as we don't cross certain borders."
		};
	};
	class buddySuchAs
	{
		responses[] = {"buddyWork", "buddyBack", "buddyExit"};
		sentences[] = {
			"Such as?",
			"Killing Greenbags, blowing up one of their camps, stealing from their supply convoys - done it all. *grin*"
		};
	};
	class buddyWork
	{
		responses[] = {"buddyClients", "buddyBack", "buddyExit"};
		sentences[] = {
			"How are our missions going to be like?",
			"Well, we take a ride to Altis, find some people, shoot some people, safe some people, gather intel, steal stuff - whatever the client is paying for. Lately hostage rescue operations are getting really popular. Shouldn't have re-opened the beaches for dumb tourists..."
		};
	};
	class buddyMaxwell
	{
		responses[] = {"buddyMines", "buddyFacilities", "buddyCapture", "buddyBack", "buddyExit"};
		sentences[] = {
			"I want to know more about this place here. Camp Maxwell, right?",
			"Yes, EUROFORCE originally built this camp as their HQ when the airport was still under construction. It was decommissioned long ago and then re-used by some survivors during the CSAT invasion two years ago. The defending EUROFORCE units were surrounded and outnumbered by CSAT but they held the line. Word says that more than 1000 men died trying to take this fucking rock. But that's just rumours I guess. Now we're using it. It's quite hard to find, has a lot of space, is easy to defend and there are not so many mines around."
		};
	};
	class buddyMines
	{
		responses[] = {"buddyFacilities", "buddyCapture", "buddyBack", "buddyExit"};
		sentences[] = {
			"Mines?!",
			"Yes, Stratis is full of those. They're a pain in the ass. Every few weeks another idiot steps on an anti-personnel mine. You can go roaming the surroundings but I would recommend to take a mine detector with you. There might be some good stuff in the old military facilities though. And beware of the bandits!"
		};
	};
	class buddyFacilities
	{
		responses[] = {"buddyMines", "buddyCapture", "buddyBack", "buddyExit"};
		sentences[] = {
			"What can I do here?",
			"Maxwell serves as our central hub and HQ. In your personal shack you can rest and pick your gear. You also have access to the shop system where you can select our next mission, pick team-mates or order new equipment. Once you've chosen a mission you have to report in with McMillian in the central briefing area to get started. Apart from that you can practice your skills at the shooting range to the south-west or check in with our pilot at the heli-pad to the east. Then there's this guy in the north-eastern part of the camp who does gambling and duels between mercs if you're looking for some extra cash. Finally, you can always sit down at the campfire and listen to all the glorious battle stories of the other guys."
		};
	};
	class buddyCapture
	{
		responses[] = {"buddyFacilities", "buddyMines", "buddyBack", "buddyExit"};
		sentences[] = {
			"Any paid work outside the camp?",
			"In fact, yes. There are many rogues, pirates and freelancing merc bands on this island. These guys are a pain in the ass. Check your map, the red marked places are locations held by rogues. McMillian put up a bounty of 500 for every cleared location and a total of 5000 if you manage to clear all locations. You can just take a team, leave the camp and start clearing these locations any time when you're on Stratis."
		};
	};
	class buddyStratis
	{
		responses[] = {"buddyIndependence", "buddyBack", "buddyExit"};
		sentences[] = {
			"What do you know about this island?",
			"It's called 'Stratis' and technically it belongs to the Republic of Altis. During the last few years it served as military island but the AAF doesn't have the capacities to actually use it so now we were allowed to establish our HQ here. Before the CSAT offensive two years ago all these facilities were maintained by EUROFORCE. But they hammered the shit out of it when they drove CSAT back into the sea and since they've got their own asses kicked last year by the independence movement there's no one left to rebuild what got destroyed. It's just death and us on this island."
		};
	};
	class buddyIndependence
	{
		responses[] = {"buddyBack", "buddyExit"};
		sentences[] = {
			"Independence Movement?",
			"A large part of the population around here always wanted independence. First from the Greek and then later form the European Federation. EUROFORCE's troops in the Aegean Sea were stretched thin after the CSAT attack so radical groups took a chance. Basically a whole army consisting of right-wing locals - the AAF - came out of nowhere and managed to take control of the islands. The Federation pulled back and now Altis is finally independent. Independent but poor and corrupt as hell. The AAF is not able to maintain stability throughout the whole country. That's where we come in. Anyway, enough of boring history."
		};
	};
	class buddyShop
	{
		arguments[] = {"(getNumber(missionConfigFile >> 'MainValues' >> 'basicRate') * 100)"};
		responses[] = {"buddyTCR", "buddyMissionControl", "buddyPersonnel", "buddyWeapons", "buddyMagazines", "buddyItems", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"Can you explain the shop system to me?",
			"Sure, it's quite easy. You're an independent contractor now which means you have to take care of weapons and equipment by yourself. The organisation just conveys missions to you and therefore keeps %1 percent of the total rewards. Among other things that is one value that contributes to your Total Cost Rate or TCR. The shop system is divided into Mission Control, Personnel, Weapons, Magazines, Items and Clothes. Of course you can also find used stuff in the field that you can take home."
		};
	};
	class buddyTCR
	{
		arguments[] = {"(getNumber(missionConfigFile >> 'MainValues' >> 'basicRate') * 100)", "(getNumber(missionConfigFile >> 'MainValues' >> 'buddyCostRate') * 100)", "(getNumber(missionConfigFile >> 'MainValues' >> 'debtPayOffRate') * 100)"};
		responses[] = {"buddyMissionControl", "buddyPersonnel", "buddyWeapons", "buddyMagazines", "buddyItems", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"What is the TCR exactly?",
			"The TCR - or Total Cost Rate - is the percentage amount of the reward you have to share with others. There are the already mentioned %1 percent that ION collects plus a share based on your rank. Then I take %2 percent for my services as advisor and partner in the field. If you choose to hire additional personnel for a mission every one of them will also get a percentage share based on his skills. Oh, and since you still owe McMillian your purchasing price he ordered to take a %3 percent extra until your debts are paid. So if you hire extra rifles your TCR increases up to a maximum of 100 percent in which case you have nothing left to take for yourself. Prior to each mission, you have to decide whether you want more manpower or more profit."
		};
	};
	class buddyMissionControl
	{
		responses[] = {"buddyTCR", "buddyPersonnel", "buddyWeapons", "buddyMagazines", "buddyItems", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"Tell me about the Mission Control.",
			"This is where you pick our next mission. You can see some basic info about the task at hand, the reward you will get once it's completed and whether you should bring some special equipment like diving gear or silencers. If you've picked a mission you have to report in with McMillian in order to get started. Don't forget to pick your gear first! Oh, and don't forget to plan your time. It takes around one hour from here to Altis, so if you have no NV-Goggles yet I'd advise against going on a mission at night."
		};
	};
	class buddyPersonnel
	{
		responses[] = {"buddyTCR", "buddyMissionControl", "buddyWeapons", "buddyMagazines", "buddyItems", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"I assume I can hire additional manpower under Personnel?",
			"Right, if you think we two can't do it alone you can hire extra staff for the mission. But they collect a percentage share of the reward based on their skills. The more specialised or competent they are the more they take. For example, I wouldn't hire a repair specialist if it's unlikely that we have to deal with vehicles during a mission. If somebody dies in combat his share goes to his family or is used to pay his funeral, so are the rules. Oh, and bear in mind that if we have arranged transport during a mission it's usually set up for five men tops."
		};
	};
	class buddyWeapons
	{
		responses[] = {"buddyTCR", "buddyMissionControl", "buddyPersonnel", "buddyMagazines", "buddyItems", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"Let me guess, I can buy rifles in the Weapons menu.",
			"Not only rifles. There are pistols, SMGs, assault rifles with or without grenade launcher, machine guns, marksman and sniper rifles as well as launchers. The price depends on quality and calibre of the weapon. They come with no attachments or ammunition, you have to buy this stuff separately. Once you made a purchase, the item will be delivered to your personal box - no returns and no refunds."
		};
	};
	class buddyMagazines
	{
		responses[] = {"buddyTCR", "buddyMissionControl", "buddyPersonnel", "buddyWeapons", "buddyItems", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"And I get ammunition under Magazines?",
			"Yes, you will get every sort of ammo as well as grenades there. Make sure to buy the right ammo for your weapon. Once you've made a purchase, the item will be delivered to your personal box - no returns and no refunds."
		};
	};
	class buddyItems
	{
		responses[] = {"buddyTCR", "buddyMissionControl", "buddyPersonnel", "buddyWeapons", "buddyMagazines", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"What can I find under Items?",
			"All the stuff that you won't see in the other categories. There you can buy vests, headgear, backpacks, attachments and misc stuff like first aid kits, mine detectors or NV-Goggles. I'd recommend to buy some protection gear first."
		};
	};
	class buddyClothes
	{
		responses[] = {"buddyTCR", "buddyMissionControl", "buddyPersonnel", "buddyWeapons", "buddyMagazines", "buddyClothes", "buddyBack", "buddyExit"};
		sentences[] = {
			"Clothes? I already have clothes.",
			"Ha, it's not like you're buying new underwear there. Proper military clothes offer protection and allow you to carry more stuff. Or do you really want to fight in sandals? Anyway, I've heard that there's also a designer leather jacket available if you want to go all fancy."
		};
	};
	
	// Commander
	class commanderExit
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_Commander, 'You better get some bloody work done!', 'DIRECT'] spawn IP_fnc_simpleSentence;";
		sentences[] = {"(Go away in silence.)"};
	};
	class commanderOpener
	{
		responses[] = {"commanderBriefing", "commanderDebtsPaid", "commanderQuestions", "commanderCapture", "commanderExit"};
		sentences[] = {
			"Hey.",
			"What do you want, Freshmeat?!"
		};
	};
	class commanderQuestions
	{
		responses[] = {"commanderBriefing", "commanderDebtsPaid", "commanderCapture", "commanderExit"};
		sentences[] = {
			"Can I ask you some questions?",
			"No!"
		};
	};
	class commanderCapture
	{
		condition = "'tCapture' call BIS_fnc_taskState != 'SUCCEEDED'";
		responses[] = {"commanderBriefing", "commanderDebtsPaid", "commanderQuestions", "commanderExit"};
		sentences[] = {
			"Can I make a buck or two around the camp?",
			"Yeah, I've put a bounty on every rogue's head on this bloody island. Clear the red marked locations on your map and I'll pay you 500 each place - minus the company's share of course. Plus a bonus of 5000 if they're all clear. Now get lost, Freshmeat!"
		};
	};
	class commanderBriefing
	{
		condition = "((player getVariable ['IP_ShopMission', '']) != '')";
		expression = "call IP_fnc_closeConversation; nul = [] execVM 'scn\briefing.sqf';";
		sentences[] = {"Reporting in for briefing. (Start mission.)"};
	};
	class commanderDebtsPaid
	{
		condition = "((player getVariable 'IP_Debts') == 0) && (isNil 'IP_Decision')";
		responses[] = {"commanderStay", "commanderLeave"};
		sentences[] = {
			"You wanted to talk to me, Sir?",
			"Yes, seems like you shithead managed to pay off all of your debts with me. I might be an asshole but I'm also a man of my word. So, you're free to go if you want. But I advise you to stay. I'm even offering you a permanent employment. There will be hell on Altis soon and we'll make lot of cash. So, what is it?"
		};
	};
	class commanderStay
	{
		expression = "call IP_fnc_closeConversation; IP_Decision = true; [IP_Commander, ""Wise choice! Now get some equip, we're going on a mission! Report in for briefing when you're ready!"", 'DIRECT'] call IP_fnc_simpleSentence; ['tCommander1', 'SUCCEEDED'] call BIS_fnc_taskSetState; player setVariable ['IP_ShopMission', 'MTrans01']; [player, 'tCommander2', ['Report in with McMillian!', 'Hereford Calling', ''], IP_Commander, true, 1, true, 'takeoff'] call BIS_fnc_taskCreate;";
		sentences[] = {"I'll stay."};
	};
	class commanderLeave
	{
		expression = "call IP_fnc_closeConversation; IP_Decision = false; [] execVM 'scn\AEnd.sqf';";
		sentences[] = {"I'm leaving, I have enough."};
	};
	
	// Shooting Range
	class shootingRangeOpener
	{
		responses[] = {"shootingRangeTargets", "exit"};
		sentences[] = {
			"Is this the shooting range?",
			"No, this is the field kitchen. Get in line behind the wooden dudes over there to retrieve a 'hot meal'. *laughes dirty* Idiot."
		};
	};	
	class shootingRangeTargets
	{
		responses[] = {"exit"};
		sentences[] = {
			"Very funny. What's the set-up here?",
			"There are small and big targets for short-, medium- and long-range drills. And we've also put up targets for sniper training at LZ Connor around one click from here. You can hit them from this position but I wouldn't recommend to actually go there to confirm your hits. There are still mines around. Besides, you don't want the other snipers to mistake you with some paper target, do you?<br/>Oh, and don't point your rifle towards Maxwell or I'll shoot you."
		};
	};
	
	// Helicopter
	class helicopterOpener
	{
		responses[] = {"helicopterProblems", "exit"};
		sentences[] = {
			"Hi there! Is this my ride?",
			"Hey man! Yep, we're the official ION taxi service. Delivering badasses with big guns to battlefields since 1982!"
		};
	};	
	class helicopterProblems
	{
		responses[] = {"helicopterSafe", "exit"};
		sentences[] = {
			"Got some technical problems?",
			"Yes, something's wrong with the fuel sensor. The machine is fuelled up and running but at some point the sensor just shows bingo fuel causing the engine to shut down. 'She' did that before but not that often. It got worse in the last few days."
		};
	};
	class helicopterSafe
	{
		responses[] = {"exit"};
		sentences[] = {
			"Great, I can see myself dying in a burning chopper wreck already.",
			"Well, that would be quite unfortunate for you I guess. Gladly the crew has some parachutes, maybe it would be smart to buy one for yourself. *laughes* Don't worry, we're working on it and have it sorted out soon."
		};
	};
	
	// Storyteller (Campfire)
	class storyOpener
	{
		responses[] = {"storyTellStory", "exit"};
		sentences[] = {
			"Hey, how's it going?",
			"Fine, fine. Just hanging out, taking a break, you know?"
		};
	};	
	class storyTellStory
	{
		expression = "call IP_fnc_closeConversation; nul = [] spawn IP_scn_campfire;";
		sentences[] = {"You must have some stories to tell..."};
	};
	
	// Gambler
	class gamblerOpener
	{
		responses[] = {"gamblerDuelRules", "gamblerDiceRules", "gamblerDuelStart", "gamblerDiceStart", "exit"};
		sentences[] = {
			"You're organising the gambles here?",
			"Yep, gambles and duels. We've got dice games and Blackjack. You want to make some cash?"
		};
	};	
	class gamblerDuelRules
	{
		arguments[] = {"getNumber(missionConfigFile >> 'DuelStake')"}; 
		responses[] = {"gamblerDiceRules", "gamblerDuelStart", "gamblerDiceStart", "exit"};
		sentences[] = {
			"What are the rules for duels?",
			"Simple, it's one-on-one. First hit wins. Once you and your opponent paid the stake of %1€ you both get transported to different spots within the area around Girna. When I give the go you start to find and shoot each other. If you leave the designated area you lose instantly. Whoever hits first wins and collects both stakes; the loser gets nothing. You have to bring your own weapons and ammo."
		};
	};
	class gamblerDiceRules
	{
		responses[] = {"gamblerDuelRules", "gamblerDuelStart", "gamblerDiceStart", "exit"};
		sentences[] = {
			"How does the dice game work?",
			"Easy, the main goal is to get as close to 20 as you can. However, if you get above 20 you lose. In every round you can pick between two sets of dice, one ranges from 1-8 and the other from 4-7. You have to put in a stake of 200€ at the beginning. Payouts are as following:<br/><br/>14 or less: 0€<br/>15: 50€<br/>16: 100€<br/>17: 200€<br/>18: 250€<br/>19: 300€<br/>20: 400€<br/>21 or more: 0€"
		};
	};
	class gamblerDuelStart
	{
		arguments[] = {"getNumber(missionConfigFile >> 'DuelStake')"}; 
		condition = "isNil 'IP_DuelGoingOn'";
		expression = "call IP_fnc_closeConversation; nul = [] spawn IP_scn_duelStart;";
		sentences[] = {"I want to fight! (Start duel and pay %1€.)"};
	};
	class gamblerDiceStart
	{
		expression = "call IP_fnc_closeConversation; if (200 call IP_fnc_purchase) then {IP_DiceValue = 0; nul = [IP_Gambler, player, 'gamblerDiceMain'] spawn IP_fnc_openConversation;} else {nul = [IP_Gambler, ""Sorry Dude, I can't let you play without coin."", ""DIRECT""] spawn IP_fnc_simpleSentence};";
		sentences[] = {"I want to roll the dice! (Start dice game and pay 200€.)"};
	};
	class gamblerDiceMain
	{
		arguments[] = {"IP_DiceValue"};
		responses[] = {"gamblerDice1to8", "gamblerDice4to7", "gamblerDiceAgain", "gamblerDiceExit"};
		sentences[] = {"Okay, you currently have: %1."};
	};
	class gamblerDice1to8
	{
		expression = "true call IP_fnc_m_rollDice";
		sentences[] = {"(Roll 1-8.)"};
	};
	class gamblerDice4to7
	{
		expression = "false call IP_fnc_m_rollDice";
		sentences[] = {"(Roll 4-7.)"};
	};
	class gamblerDiceAgain
	{
		arguments[] = {"(call IP_fnc_m_determineDiceWin)"};
		condition = "(IP_DiceValue > 14)";
		expression = "call IP_fnc_closeConversation; (call IP_fnc_m_determineDiceWin) call IP_fnc_addMoney; if (200 call IP_fnc_purchase) then {IP_DiceValue = 0; nul = [IP_Gambler, player, 'gamblerDiceMain'] spawn IP_fnc_openConversation;} else {nul = [IP_Gambler, ""Sorry Dude, I can't let you play without coin."", ""DIRECT""] spawn IP_fnc_simpleSentence};";
		sentences[] = {"I want to quit and play again. (Receive %1€, pay 200€ and start a new dice game.)"};
	};
	class gamblerDiceExit
	{
		arguments[] = {"(call IP_fnc_m_determineDiceWin)"};
		expression = "call IP_fnc_closeConversation; (call IP_fnc_m_determineDiceWin) call IP_fnc_addMoney;";
		sentences[] = {"I quit. (Receive %1€.)"};
	};
	
	// Toilet Guy
	class toiletOpener
	{
		responses[] = {"toiletHowAreYou", "toiletExit"};
		sentences[] = {
			"Whoa! Didn't know it was occupied! Sorry, but could you please lock the door next time?!",
			"Nah mate, I keep an open door policy! What's up?"
		};
	};
	class toiletHowAreYou
	{
		responses[] = {"toiletOkay", "toiletExit"};
		sentences[] = {
			"Nothing, I just wanted to... Well, how are you?",
			"Fine, fine, ate some Gyros at this place near Pyrgos. Damn, I think it wasn't good. *farts loudly* Hey buddy, can you hold this for a sec?"
		};
	};
	class toiletOkay
	{
		responses[] = {"toiletGo", "toiletExit"};
		sentences[] = {
			"Okay...",
			"Ahhh! Thank you, mate. You're a star! We should have a beer together some time. Or maybe lunch? I know a good Gyros place near Pyrgos!"
		};
	};
	class toiletGo
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_ToiletGuy, 'Sure mate! Let us talk about that Gyros later! *drops an earth shaking fart*', 'DIRECT'] spawn IP_fnc_simpleSentence; [IP_ToiletGuy, 'toiletOpener'] call IP_fnc_removeConversation;";
		sentences[] = {"Uhm, I'm gonna leave before this gets even more awkward than it is already."};
	};
	class toiletExit
	{
		expression = "call IP_fnc_closeConversation; nul = [IP_ToiletGuy, 'See you later, bro! *drops an earth shaking fart*', 'DIRECT'] spawn IP_fnc_simpleSentence; [IP_ToiletGuy, 'toiletOpener'] call IP_fnc_removeConversation;";
		sentences[] = {"(Leave in disgust.)"};
	};
};