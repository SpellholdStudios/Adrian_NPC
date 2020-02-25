BEGIN RH#AD25

IF ~NumTimesTalkedTo(0)~ rh#join1
 SAY @2 /* By the gods, <CHARNAME>, what have you been doing? Conquering the Nine Hells? */
 	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3 /* Enjoying the scenery, are you? */ + rh#join1.1
 	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @4 /* I assure you, that's next on my agenda. */ + rh#join1.2
 	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @5 /* It's nice to see you too. */ + rh#join1.2
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3 /* Enjoying the scenery, are you? */ + rh#join1.6
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @4 /* I assure you, that's next on my agenda. */ + rh#join1.7
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @5 /* It's nice to see you too. */ + rh#join1.8
END
 
IF ~~ rh#join1.1
 SAY @6 /* Quite. */
IF ~~ + rh#join1.2
END

IF ~~ rh#join1.2
 SAY @7 /* Fascinating though this is... I assume you didn't summon me here because you enjoy the smalltalk. */
	++ @8 /* You're a powerful mage. I could use your help. */ + rh#join1.3
	++ @9 /* I'd appreciate your company once more. */ + rh#join1.4
	++ @10 /* I might need you later. Stay here. */ + rh#join1.5
END

IF ~~ rh#join1.3
 SAY @11 /* I'm sure you could. */
IF ~~ DO ~JoinParty() SetGlobal("rh#AdrianJoined","GLOBAL",1)~ EXIT
END

IF ~~ rh#join1.4
 SAY @12 /* I'm sure you would. */
IF ~~ DO ~JoinParty() SetGlobal("rh#AdrianJoined","GLOBAL",1)~ EXIT
END

IF ~~ rh#join1.5
 SAY @13 /* Charming. */
IF ~~ EXIT
END

IF ~~ rh#join1.6
 SAY @14 /* Not particularly. The only attraction would be... well, yourself. */
IF ~~ + rh#join1.9
END

IF ~~ rh#join1.7
 SAY @15 /* Ahh, you always were ambitious. */
IF ~~ + rh#join1.9
END

IF ~~ rh#join1.8
 SAY @16 /* (smile) I'd think that goes without saying. */
IF ~~ + rh#join1.9
END

IF ~~ rh#join1.9
 SAY @17 /* As much as I'd love to sit around and catch up, though, shall I assume that there's a reason you summoned me? */
	++ @18 /* Only for your company, my dear. */ + rh#join1.10
	++ @19 /* I think I could use use your help right now. */ + rh#join1.10
	++ @10 /* I might need you later. Stay here. */ + rh#join1.5
END

IF ~~ rh#join1.10
 SAY @20 /* Then you'll have it. */
IF ~~ DO ~JoinParty() SetGlobal("rh#AdrianJoined","GLOBAL",1)~ EXIT
END

IF ~NumTimesTalkedToGT(0)~ rh#join2
 SAY @21 /* As much as I'm enjoying torturing your pet imp, dare I hope you finally have a slightly more interesting task? */
 	++ @22 /* Significantly more interesting, I hope. Join up. */ + rh#join2.1
 	++ @23 /* Not yet, I'm afraid. */ + rh#join2.2
END

IF ~~ rh#join2.1
 SAY @24 /* Well, we can only hope for the best. */
IF ~~ DO ~JoinParty() SetGlobal("rh#AdrianJoined","GLOBAL",1)~ EXIT
END

IF ~~ rh#join2.2
 SAY @25 /* If your infernal butler ends up dead, you've only yourself to blame. */
IF ~~ EXIT
END