private "_story";

if (isNil "IP_StoriesTold") then {IP_StoriesTold = []};
_stories = [
	["This is the story of a lonely adventurer.", "I used to be an adventurer like you once but I then took an arrow to the knee.", "First I loved her, then I hated her. Any finally I took her life, since then I did not have a wife!", "Damn! I should really work on those rimes, they're horrible!"],
	["Listen to this, fellow brothers in arms!", "Killing a civilian is not nice.", "But there was this bitch once. We were out to collect some poor fool's debts.", "No one was at home so we took what we could carry.", "Our pockets were full when she showed up. She was his wife and started hitting, biting and spitting at my men.", "So I took my pistol and shot her dead.", "Long story short: What's the first thing you feel when you shoot a civilian?", "The recoil! Pahahaha! *laughes dirty*"],
	["There's this rumour I just can't get out of my head.", "Once, there was this guy. He was a very poor farmer but got quite famous for what he did.", "It's said that one day he took a water pistol from his small son and painted it all black.", "Then he walked into a bank, threatened the cashier with his 'weapon' and took all the money they had.", "Somehow, he escaped the police and made it to a small airfield where he forced a pilot to take him off country - all with his black plastic gun.", "They made it off the island but were shot down by the military soon.", "Parts of the plain rained down around the coast of Stratis.", "Point is, the silver briefcase he had with him - with at least one million bucks in it - was never found.", "It might be still lying around on the bottom of the sea somewhere near the coast of Stratis..."]
];

if (count IP_StoriesTold == count _stories) exitWith {[IP_Storyteller, "I think you've heard all of my stories.", "DIRECT"] call IP_fnc_simpleSentence};
_story = [];
while {(count _story == 0) OR (_story in IP_StoriesTold)} do {
	_story = _stories call BIS_fnc_selectRandom;
};
IP_StoriesTold = IP_StoriesTold + [_story];

["IP_BlackScreen", false] call BIS_fnc_blackOut;
sleep 0.5;

IP_Main setPos (getMarkerPos "mCampfirePlayer");
_dir = [IP_Main, IP_Storyteller] call BIS_fnc_dirTo;
IP_Main setDir _dir;

_animation = ["Acts_A_M01_briefing", "Acts_A_M02_briefing", "Acts_A_M03_briefing", "Acts_A_M04_briefing"] call BIS_fnc_selectRandom;
IP_Storyteller switchMove _animation;

sleep 0.5;
["IP_BlackScreen"] call BIS_fnc_blackIn;
[0] call BIS_fnc_cinemaBorder;

player action ["SITDOWN", player]; 

sleep 3;

{[IP_Storyteller, _x, "DIRECT"] call IP_fnc_simpleSentence} forEach _story;

["IP_BlackScreen", false] call BIS_fnc_blackOut;
sleep 0.5;

IP_Storyteller switchMove "";

sleep 0.5;
["IP_BlackScreen"] call BIS_fnc_blackIn;
[1] call BIS_fnc_cinemaBorder;