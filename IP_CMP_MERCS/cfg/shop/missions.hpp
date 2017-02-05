class ShopMissions
{
    class Hub01
    {
		buddyEquipment[] = {"NONE", "", "", "", "", "false", "false"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class Hub02
    {
		buddyEquipment[] = {"NONE", "", "", "", "", "false", "false"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class Hub03
    {
		buddyEquipment[] = {"NONE", "", "", "", "", "false", "false"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class MIn
    {
		comingHome[] = {"", "Okay, this is our base! Welcome to Camp Maxwell! Home sweet home!", "It looks shady and run-down.", "Haha! It's a fucking shithole but it's your home now!", "", "Come on, I'll show you where you stay. You lucky bastard even got a place in a shack!"};
		buddyEquipment[] = {"RIFLEMAN", "V_I_G_resistanceLeader_F", "", "", "", "false", "true"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class M01a
    {
		briefing[] = {"Okay, this one's a standard case. One of these young, pretty and dumb tourists 'got lost' somewhere around Kavala.", "She was probably taken by pirates or human traffickers.", "There's no ransom demand yet but we're expecting it to come shortly.", "In the meantime her vastly wealthy daddy is paying for any hints on his little girl's whereabouts.", "Use your contacts on Altis to find out what happened to her."};
		buddyEquipment[] = {"RIFLEMAN", "V_I_G_resistanceLeader_F", "G_Aviator", "", "", "false", "true"}; 
		comingHome[] = {"", "That was good work. Maybe you will be actually useful after all.", "", "I suggest you put your first few bucks into some new clothes. You don't want to be running around in flip-flops all the time, right?"};
		client = "Private";
		condition = "(('MIn' in IP_MERCS_MissionsDone) && !('M01a' in IP_MERCS_MissionsDone))";
		location = "Kavala, Altis";
		reward = 2500;
		description = "A young female tourist disappeared and has probably been kidnapped. Her father is paying for any hints regarding her status.";
		requirements = "-";
		title = "Daddy's Girl";		
    };
	
	class M01b
    {
		briefing[] = {"Listen up! It's about this girl again!", "You've already gathered information about her which brought us a decent reward.", "Now the pirates have finally sent a high ransom demand.", "Her father decided to pay whatever they want to get his little girl back. Our job is to safely deliver the money and retrieve the hostage.", "While one team is directly in contact with the kidnappers I want you on overwatch to back them up.", "The deal will take place at that unfinished Stadium where we dropped you last time. Good luck and don't fuck it up."};
		buddyEquipment[] = {"MARKSMAN", "V_Chestrig_blk", "G_Tactical_Black", "H_Booniehat_dirty", "", "false", "true"}; 
		comingHome[] = {"", "Damn! That's why I hate ransom deliveries! Some good men died for nothing!", "", "There's always something going wrong! At least we've got the cash back. Well done on this one, Bro."};
		client = "Private";
		condition = "(('M01a' in IP_MERCS_MissionsDone) && !('M01b' in IP_MERCS_MissionsDone))";
		location = "Stadium, Altis";
		reward = 5000;
		description = "The pirates sent a ransom demand for the kidnapped girl. Her father is paying for the safe delivery of the money.";
		requirements = "Binoculars";
		title = "Ransom Demand";		
    };
	
	class M01c
    {
		briefing[] = {"Okay, this one is urgent.", "Since the botched ransom delivery things got silent around this missing girl.", "Her father panicked and issued an immediate rescue operation.", "The little intel we have indicates that she's been held in a known pirate compound in northern Altis.", "Since the compound is a thorn in the FIA's side you might be able to get some support from them.", "In any case, do whatever is necessary to get her out in one piece. And don't touch her or I'll touch you. I don't want Jerusalem all over again!"};
		buddyEquipment[] = {"GRENADIER", "V_TacVestIR_blk", "", "H_Watchcap_sgg", "", "true", "true"};
		comingHome[] = {"Damn, we couldn't save her.", "She was dead long before we showed up, don't worry too much.", "How can you be so cold? She was just 18 years old, still a child!", "She's another dead body in another senseless conflict. I just think of the money. That's the only way to keep me sane I'm afraid."};
		client = "Private";
		condition = "(('M01b' in IP_MERCS_MissionsDone) && !('M01c' in IP_MERCS_MissionsDone))";
		location = "Northern Airfield, Altis";
		reward = 7500;
		description = "The client lost contact to the pirates after the failed ransom delivery. He issued an immediate rescue attempt.";
		requirements = "Silencers, NVGs";
		title = "Hostage Down";
    };
	
	class M02a
    {
		briefing[] = {"Okay, this one should be child's play.", "The AAF approached us because they seem to lack the numbers to guard all their roadblocks.", "Your job is just to sit on your ass all day and check the bypassing cars.", "Make sure no smugglers or terrorists slip through your net and collect us some cash."};
		buddyEquipment[] = {"RIFLEMAN", "V_TacVest_blk_POLICE", "G_Aviator", "H_Beret_blk_POLICE", "", "false", "true"};
		comingHome[] = {"", "Crap, I knew it wasn't just eating a piece of cake. Fucking insurgents!", "You think the AAF knew that they were going to attack?", "You can bet your balls these fuckers knew. That's why they've put us there. 'Logistic Operation' my ass!"};
		client = "AltisMil";
		condition = "(('M01a' in IP_MERCS_MissionsDone) && !('M02a' in IP_MERCS_MissionsDone))";
		location = "Selakano Airfield, Altis";
		reward = 5000;
		description = "The AAF is short on staff. They have requested PMCs to man important outposts and roadblocks.";
		requirements = "Police Vest + Beret";
		title = "Checkpoint Charlie";
    };
	
	class M02b
    {
		briefing[] = {"All right, here's the situation.", "Violent riots broke out throughout the whole country.", "Protesters have taken control of strategic important roads and government buildings.", "Your job is to clear one of those roads so the AAF can move in reinforcements to one of the major flashpoints.", "Do whatever is necessary to deal with the rioting civies. But keep an eye out for the FIA. Dismiss!"};
		buddyEquipment[] = {"GRENADIER", "V_TacVest_blk_POLICE", "G_Aviator", "H_Beret_blk_POLICE", "", "false", "true"};
		comingHome[] = {"I don't know how I should feel about this.", "", "These guys have every right to be angry and to protest. And we're just beating them down.", "It's not that simple. And it's not our problem anyway."};
		client = "AltisMil";
		condition = "(('M02a' in IP_MERCS_MissionsDone) && !('M02b' in IP_MERCS_MissionsDone))";
		location = "Negades, Altis";
		reward = 7500;
		description = "Anti-government protests broke out throughout the whole country. The AAF can't handle the situation and requested help to control the riots.";
		requirements = "Police Vest + Beret, Smoke Grenades, Grenade Launcher";
		title = "Riot Control";
    };
	
	class M02c
    {
		briefing[] = {"Listen up, this is a big one.", "These FIA 'terrorists' took control of an AAF armour depot and captured several tanks.", "Since we've got violent riots all over the country Greenbacks are overwhelmed and not able to handle the situation on their own.", "Your job is to help them re-taking control of the facility. Keep your heads down!"};
		buddyEquipment[] = {"AUTORIFLEMAN", "V_PlateCarrierIA2_dgtl", "G_Combat", "H_HelmetSpecB_blk", "", "false", "true"};
		comingHome[] = {"", "McMillian will be glad to hear his former employee is operating on Altis.", "What do you think he will do?", "Nothing, I guess. Jackknife's a pain in the ass but not enough that it would make sense to send a team after him.", "Maybe not yet..."};
		client = "AltisMil";
		condition = "(('M02b' in IP_MERCS_MissionsDone) && !('M02c' in IP_MERCS_MissionsDone))";
		location = "Aggelochori, Altis";
		reward = 10000;
		description = "The FIA managed to take control of a tank depot. PMCs and AAF will launch a joined attack to re-take the facility.";
		requirements = "Good Protection Gear, AT Weapons";
		title = "Panzerfaust";
    };
	
	class M03
    {
		briefing[] = {"Listen up! One of our long time clients requested personal security for one of his associates.", "You will get your asses to the central airport, pick-up the guy in question and drive him wherever he wants to.", "Always keep and eye on him! If he gets hurt in any way or is not pleased with our services I will hurt you.", "Now move it, he will arrive shortly!"};
		buddyEquipment[] = {"RIFLEMAN", "V_TacVest_blk", "G_Aviator", "H_Cap_blk_ION", "", "false", "true"}; 
		comingHome[] = {"I've got a bad feeling about this client. We will meet him again.", "What? He was just one of these 'busy businessman' guys.", "No, no. Didn't you notices the way he moved and always checked his surroundings? He was a professional for sure.", "Yeah, whatever. Job is job and cash is cash."};
		client = "DSE";
		condition = "(('M01a' in IP_MERCS_MissionsDone) && !('M03' in IP_MERCS_MissionsDone))";
		location = "Central Airport, Altis";
		reward = 5000;
		description = "An important client wishes to be picked up from the international airport on Altis and then being ground-transported to a location of his choice.";
		requirements = "-";
		title = "Very Important Pickup";		
    };
	
	class M04a
    {
		briefing[] = {"Attention! The independence conflict last year was followed by a botched withdrawal of EUROFORCE troops and they had to leave some stuff behind.", "Now the Altian government finally agreed to let them take their equipment back.", "You will pick up some loaded trucks with equipment and take them to the northern airfield where some Blueflag brass is taking over.", "There's nothing of value for you in this cargo so keep your dirty hands on the wheel and do your job!"};
		buddyEquipment[] = {"RIFLEMAN", "V_I_G_resistanceLeader_F", "", "", "", "false", "true"}; 
		comingHome[] = {"", "McMillian will be furious when he hears about the attack.", "What do you think will happen now?", "War, I guess. Black Arrow broke the only sacred rule in this business. That means, we're gonna kick their asses."};
		client = "EFMil";
		condition = "(('M01a' in IP_MERCS_MissionsDone) && !('M04a' in IP_MERCS_MissionsDone))";
		location = "Former FOB Sauerland, Altis";
		reward = 5000;
		description = "EUROFORCE cut a deal with the AAF to ship out old but valuable equipment from the former occupation. PMCs are tasked to ensure the safe transportation.";
		requirements = "Toolkit";
		title = "Sauerland Express";
    };
	
	class M04b
    {
		briefing[] = {"This is an outrage! Black Arrow SOBs attacking our men and jeopardising our contracts?!", "And now they start stealing our clients! A long time client turned down his protection request minutes ago!", "I say we show those bastards not to piss us off! We're gonna strike back!", "I want you to attack this disloyal fuck's security detail! Take them out and scare him shitless!", "I want him to crawl back to us begging for protection!", "He's being moved around between several AAF bases. Find a way to stop his car and take out his bodyguards without killing him.", "And stay away from the AAF - they've issued a lockdown throughout the AO and will engage on sight!"};
		buddyEquipment[] = {"MARKSMAN", "V_Chestrig_rgr", "", "H_Shemag_olive_hs", "B_AssaultPack_rgr", "false", "true"}; 
		comingHome[] = {"", "Showed these fuckers! That should teach them who's got the biggest balls in this region.", "Or it will make them more aggressive and they'll come back at us even harder.", "Don't be so negative all the time."};
		client = "ION";
		condition = "(('M04a' in IP_MERCS_MissionsDone) && !('M04b' in IP_MERCS_MissionsDone))";
		location = "Sideras, Altis";
		reward = 7500;
		description = "ION reacts to the cowardly Black Arrow ambush on the Sauerland cargo trucks. Contractors are sent out to eliminate a disloyal client's security detail.";
		requirements = "UAV Terminal";
		title = "Protection Money";
    };
	
	class M04c
    {
		briefing[] = {"Seems like Black Arrow had a hard time understanding our last message.", "We've sent home three more ION contractors this morning - in bags. If Black Arrow wants war they'll get war!", "We need to strike hard, right where they live! We've located one of their operating bases on Altis.", "I want you to get your asses over there and unleash hell on them! Make a point!", "I'll give you all assets I can spare. This will end today!"};
		buddyEquipment[] = {"GRENADIER", "V_PlateCarrierGL_rgr", "G_Aviator", "H_MilCap_rucamo", "", "false", "true"}; 
		comingHome[] = {"", "Wow, I can't get these big ass explosions out of my head! It was like in those old movies! You know, Michael Bay? Where shit's blowing up all the time?", "You realise that many people died, do you?", "Come on, it was them or us. We didn't start this war."};
		client = "ION";
		condition = "(('M04b' in IP_MERCS_MissionsDone) && !('M04c' in IP_MERCS_MissionsDone))";
		location = "AAC Airfield, Altis";
		reward = 10000;
		description = "Attacks on ION contractors by Black Arrow operatives are continuing. Time to kick some ass.";
		requirements = "UAV Terminal, Explosives, Heavy Weapons";
		title = "An Eye For An Eye";
    };
	
	class M05
    {
		briefing[] = {};
		buddyEquipment[] = {"NONE", "", "G_Aviator", "H_Hat_checker", "", "false", "true"}; 
		comingHome[] = {"", "Damn, fucking FIA, can't let a man drink in peace!", "Yeah. Hey, you think I should call that girl?", "Which one? You've gotten so many numbers I stopped counting!", "The one with the dark hair!", "They all have dark hair here! But call her, Altian girls are nasty! I gotta sleep, see you later."};
		client = "Private";
		condition = "((count IP_MERCS_MissionsDone > 7) && !('M05' in IP_MERCS_MissionsDone))";
		location = "Kavala, Altis";
		reward = 0;
		description = "ION contractors take some time off for a good old bender.";
		requirements = "Party mood! And a crazy hat...";
		title = "Rest And Recuperation";
    };
	
	class M06
    {
		briefingSentences[] = {"Listen up, bothers! Ian here brought a pressing matter to our attention.", "Right. You've downed our helo and some men died. That means we left some tracks.", "Some tracks that could easily lead to ION and by that to us.", "Mr. Salih, your job is to move in on the crash site and destroy any evidence of our presence.", "Blow up the helo and bury our men. We can't let anyone get wind of our activities here.", "Be careful though. There might be looters or even worse - the AAF - around. Do your job and come back ASAP!"};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Commander", "IP_Captain"};
		client = "ION";
		condition = "(('MTrans01' in IP_MERCS_MissionsDone) && !('M06' in IP_MERCS_MissionsDone))";
		description = "ION contractors move out to destroy what's left of the company's assets at the crash site.";
		location = "Limni, Altis";
		reward = 10000;
		requirements = "Explosives";
		title = "Cleanup";
    };
	
	class M07a
    {
		briefingSentences[] = {"Attention! EUROFORCE contacted ION for recon and coordination of a planned air attack on the AAF Headquarters.", "", "If they succeed the AAF will be seriously weakened and we have to expect the FIA to push forward their offensive even quicker.", "", "We have agreed that you should take this contract in order to gain EUROFORCE's trust so we can have an influence on their future missions.", "You will insert close to the AO and should try to make your way to the ridge east of Pyrgos to get a good overview.", "", "Then start lasing targets for the Blueflag fast movers. You should be able to complete the mission without being detected.", "", "Be on your guard out there, the whole area is crowded with Greenbacks, don't get too close to their base."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Captain"};
		client = "EFMil";
		condition = "(('M06' in IP_MERCS_MissionsDone) && !('M07a' in IP_MERCS_MissionsDone))";
		description = "EUROFORCE air assets plan to engage the AAF Headquarters at Pyrgos. ION contractors are tasked to provide reconnaissance and BDA.";
		location = "Pyrgos, Altis";
		reward = 12500;
		requirements = "Laser Designator";
		title = "Badass One";
    };
	
	class M07b
    {
		briefingSentences[] = {"We have received a new contract request. CSAT requests ION's services to extract one of their covert operatives.", "He's holding out in Kavala, covered as journalist. And he carries some valuable data whose extraction is your top priority.", "", "But we have a problem. The ongoing riots in and around Kavala forced the AAF to start a ground offensive in order to retake the city from FIA rebels.", "", "Depending on your choice of insertion you will only have a small window of safe passage between the front lines.", "", "And there's a second problem. Our reports say that Blueflag paratroopers landed north of the city, fighting alongside with the FIA.", "", "And they're not doing that out of the blue. Expect them to be hostile, they're after the CSAT operative and his information for sure.", "", "But they must not get him nor the intel."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Commander", "IP_Captain"};
		client = "CSAT";
		condition = "(('M07a' in IP_MERCS_MissionsDone) && !('M07b' in IP_MERCS_MissionsDone))";
		description = "CSAT requested help with the extraction of a covert agent in the city of Kavala.";
		location = "Kavala, Altis";
		reward = 15000;
		requirements = "-";
		title = "Close Quarters Battle";
    };
	
	class M07c
    {
		briefingSentences[] = {"We have a problem. AAF and FIA agreed to a temporary cease-fire minutes ago. This could be the first step on the way to a more permanent peace. We can't allow this to happen.", "", "Fortunately, we have the opportunity to break the cease-fire in order to get both parties into fighting each other again.", "", "The European Federation is supporting the FIA with weapons and equipment. As it happens to be, a shipment consisting of two M2A1 Slammer MBTs reached the FIA base near Kore yesterday.", "", "The irony of this whole situation is that the FIA seems to lack the trained personnel, necessary to properly operate the tanks. Thus, they're inactive right now.", "Our plan is to engage the camp with mortar support from the northern high ground, get hold of the tanks and use them to engage the AAF defences around Kavala.", "", "The FIA base is only lightly guarded by a few squads of infantry and a few technicals. The AAF defences however, consist of a platoon infantry plus APCs and at least one Kuma.", "", "Greenbacks set up their HQ in what's left of the tank depot you helped to take back from the FIA a few days ago. Expect more armour there.", "Leaving the tanks as evidence for the Altian government that European-led troops broke the cease-fire should cause a decent diplomatic incident.", "", "And by that leave us the time we need to continue our main operation."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Captain"};
		client = "BritishKnights";
		condition = "(('M07b' in IP_MERCS_MissionsDone) && !('M07c' in IP_MERCS_MissionsDone))";
		description = "The British Knights move out in an attempt to further escalate the conflict between AAF and FIA.";
		location = "Factory near Kore, Altis";
		reward = 20000;
		requirements = "Toolkit, AT-Weapons";
		title = "Diplomatic Incident";
    };
	
	class MMain01
    {
		briefingSentences[] = {"Attention! We're about to commence our first step of 'Operation Crusader'.", "", "", "", "As you all know, there are two major research facilities on this island, operated by 'Deep Space Engineering' - a German company with US origins.", "Remember that contract, where you had to drive the VIP around, Freshmeat?", "", "Yes, we've passed both of them. Are we going to attack?", "No. At least not yet. Recon is your main objective this time. Find out everything about defences, personnel, backup, and if our main target is there.", "Understood. What's the plan?", "ION will insert somewhere close to the north-eastern facility, code name 'Black Mesa', find a good spot and observe the facility for at least 24 hours.", "", "", "", "My team will take care of the base within the the Green Zone. Both facilities are protected by Black Arrow mercenaries and AAF reinforcements are on stand-by.", "", "Don't get caught and try not to spill too much blood, it's a recon mission after all.", "Freshmeat, we're going together, just the two of us. Grab your gear and report in when you're ready."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Commander", "IP_Captain", "IP_Main"};
		client = "BritishKnights";
		condition = "(('M06' in IP_MERCS_MissionsDone) && !('MMain01' in IP_MERCS_MissionsDone))";
		description = "The British Knights send out ION contractors to reconnoitre one of the research facilities.";
		location = "Agios Georgios, Altis";
		reward = 15000;
		requirements = "Binoculars, Silenced Weapons";
		title = "Force Recon";
    };
	
	class MMain02
    {
		briefingSentences[] = {"Listen up! Deep Space Engineering is planning to get the device off country.", "", "We can't let that happen. We're not prepared to take it by ourselves yet so we will prevent its transportation instead. Knight Captain.", "A few hours ago a ship arrived at a small port in the Pyrgos Gulf. Half of its crew are Black Arrows.", "", "We're expecting DSE to transport the device with this ship, it's covered as regular trawler.", "The plan is simple: Infiltrate the AO by boat or on foot, take out the captain and sink the ship.", "Part of the Black Arrow crew, including the captain, are holding out in a house on the near-by scrapyard. Problematic is that an AAF maintenance base and a checkpoint are next door.", "", "And then there's the major airbase close by. Try to stay undetected as long as you can an work fast. A QRF from the airbase would be there in no time.", "Good luck, Mr. Salih."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Captain"};
		client = "BritishKnights";
		condition = "(('MMain01' in IP_MERCS_MissionsDone) && !('MMain02' in IP_MERCS_MissionsDone))";
		description = "Deep Space Engineering plans to get the device off country. ION contractors are tasked to destroy any means of transportation.";
		location = "Pyrgos Gulf, Altis";
		reward = 17500;
		requirements = "Satchel Charge, Diving Equipment, Silenced Weapons";
		title = "Surfin' R.o.A.";
    };
	
	class MMain03
    {
		briefingSentences[] = {"Gather around, this will be a quick one.", "", "Planning the coming steps of Operation Crusader it has become clear that eventually we have to deal with the AAF.", "", "It would be of great use if we were able to listen in on their comms and get access to their encrypted network.", "", "Therefore, we've hired an expert on IT-Security who will assist us in this matter. We've worked with him before.", "He's competent but also a bit paranoid.", "Precisely. Anyway, your job is simple. Meet him at the pick-up point and bring him back here.", "We don't expect you to run into any trouble. A few rogue groups and bandits are operating in the AO but there should be little to none AAF activity.", "Move out, Mr. Salih!"};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Captain"};
		client = "BritishKnights";
		condition = "(('MMain02' in IP_MERCS_MissionsDone) && !('MMain03' in IP_MERCS_MissionsDone))";
		description = "ION contractors are sent out to pick up a freelancing IT-Security specialist.";
		location = "Agios Panagiotis, Altis";
		reward = 20000;
		requirements = "-";
		title = "Schnitzeljagd";
    };
	
	class MMain04
    {
		briefingSentences[] = {"Attention please. We've come up with a plan to get access to the AAF's network.", "", "", "", "We will try to acquire Colonel Akhanteros' credentials directly.", "", "", "", "I will spare you the technical details but you should be able to copy the necessary data from the Colonel's subcutaneous implant with your smartphone.", "Simple - just get him talking and stay close enough.", "Wait, I can't follow? Are we engaging the AAF headquarters or what?", "", "No, of course not. We will copy the key without being noticed. You just need to get close to the Colonel for a few minutes.", "", "And exactly how am I supposed to do that?", "", "", "Greenbacks are running a recruitment campaign, they're getting desperate - everybody's welcome.", "Are you saying what I think you're saying?", "Yes, I've just filled out your online application. Congrats, you're now a proud member of the Altis Armed Forces Recruit Corps!", "", "Better pack your bags. I hear they're starting early.", "Oh, hell..."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Commander", "IP_Main", "IP_Hacker"};
		client = "BritishKnights";
		condition = "(('M07a' in IP_MERCS_MissionsDone) && ('MMain03' in IP_MERCS_MissionsDone) && !('MMain04' in IP_MERCS_MissionsDone))";
		description = "The task is to infiltrate the AAF and get hold of the Colonel's network credentials without him noticing.";
		location = "Central Airbase, Altis";
		reward = 22500;
		requirements = "Nothing, the AAF will provide everything.";
		title = "Uncle Kostas";
    };
	
	class MMain05
    {
		briefingSentences[] = {"Listen up! We're about to commence the final step of this operation - taking the device.", "", "But before we can do so, we need to ensure safe transportation and handling after the planned attack.", "", "Target of this last step of preparation is Dr. Joaquín Díaz, a Spanish born physicist working as project engineer and chief logistics specialist for DSE on Altis.", "", "He's currently employed at the central research facility supervising the staged draw-down of DSE material and personnel. Knight Captain.", "Yes, as the Lord Commander said, DSE is pulling back due to the conflict and tensioned situation on Altis.", "", "By destroying their ship you've thrown back their efforts for a few days, maybe weeks, but of course they're looking for other means of transportation.", "", "The HVI is a key element in this process and will prove valuable to us.", "Your task is to ensure his cooperation and transportation to this base.", "Of course he won't come by choice so you have to force him. A covert abduction is our best option.", "", "You will operate within the AAF Greenzone, means the AO is highly militarised. Of course the Greenbacks have armoured patrols and QRFs on stand-by.", "", "Good news is that the Black Arrow PMCs guarding the research facility lost their mandate, like ION. So, they're cut off from AAF help and support.", "", "Avoid direct action and stay clear of the AAF. You should be able to intercept the HVI on his way home from work around 1900 or catch him directly at his house at night.", "", "But the easiest way would be to take his two sons as hostages and force him to come to you - your choice."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Captain"};
		client = "BritishKnights";
		condition = "(('M07c' in IP_MERCS_MissionsDone) && ('MMain04' in IP_MERCS_MissionsDone) && !('MMain05' in IP_MERCS_MissionsDone))";
		description = "The British Knights require the 'assistance' of a Deep Space Engineering employee. Contractors are sent out to enforce this 'cooperation'.";
		location = "Central Research Facility, Altis";
		reward = 25000;
		requirements = "Silencers / Low Profile Equipment";
		title = "Enforced Cooperation";
    };
	
	class MMain06
    {
		briefingSentences[] = {"Attention! This is what we've been working for. All our blood, sweat and tears have led us to this point.", "", "", "", "We will enter the final phase of Operation Crusader - engaging the Black Mesa research facility and taking the device.", "", "", "", "Our plan is simple, yet effective. Knight Captain, if you'd be so kind to enlighten us.", "", "Alright. We will deploy four elements within the AO. The Infiltration Team will be dropped by helo directly into the facility.", "", "", "", "Their task is to locate and destroy the generator powering the hologram soldiers. We will try to deploy smoke and covering fire for the landing.", "", "", "", "Second element will be the Attack Team which will move in on the facility from the south and east once the holograms are disabled. They will secure Black Mesa and locate the device.", "", "", "", "And then there's the Support Team providing covering fire and sniper support for the other elements from the ridge to the north-east.", "", "", "", "Lastly, we have the Backup Team which will ensure that our escape route is clear, so we can extract the device.", "", "Speaking of the device. Dr., what's the situation?", "", "", "Based on my latest information the device is not ready for transport. It is fully assembled but disabled. There are trucks specifically designed to carry it.", "", "", "", "However, I will need around fifteen minutes to get it ready for transport and load it up on the truck.", "", "", "Enough for a counter attack from another party.", "Yes. And make sure your men don't hit or touch the reactor. It might be less dangerous than a conventional nuclear fission reactor. But a malfunction or explosion would still be lethal to us.", "Okay, prepare your gear and make sure our defence perimeter is intact. We'll get moving ASAP.", "Raif, better check the shop if you could enhance the camp's defences if you haven't done that already. It might get ugly afterwards."};
		briefingSpeakers[] = {"IP_LordTemp", "IP_Commander", "IP_Captain", "IP_Scientist"};
		client = "BritishKnights";
		condition = "(('MMain05' in IP_MERCS_MissionsDone) && !('MMain06' in IP_MERCS_MissionsDone))";
		description = "The British Knights and ION contractors launch an attack on DSE's research facility code name 'Black Mesa' in order to extract the device.";
		location = "Research Facility 'Black Mesa', Altis";
		reward = 1500000;
		requirements = "Explosives as infiltrator and the best gear you've got. ;)";
		title = "Smash And Grab";
    };
	
	class MMain07
    {
		buddyEquipment[] = {"NONE", "", "", "", "", "false", "false"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class MTrans01
    {
		buddyEquipment[] = {"RIFLEMAN", "V_I_G_resistanceLeader_F", "", "", "", "false", "false"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class MOut_Renegade
    {
		buddyEquipment[] = {"RIFLEMAN", "V_I_G_resistanceLeader_F", "", "", "", "false", "true"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class MOut_Quit
    {
		buddyEquipment[] = {"RIFLEMAN", "V_I_G_resistanceLeader_F", "G_Aviator", "", "", "false", "true"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class MOut_ION
    {
		buddyEquipment[] = {"NONE", "", "", "", "", "false", "false"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
	
	class MOut_Buddy
    {
		buddyEquipment[] = {"MARKSMAN", "V_I_G_resistanceLeader_F", "G_Aviator", "", "", "false", "true"}; // Weapons - Vest - Goggles - Headgear - Backpack - Silenced - NVG if Night
		condition = "false";
	};
};