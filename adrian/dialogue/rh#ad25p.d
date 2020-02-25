BEGIN RH#AD25P

IF ~Global("RH#AdrianJoined","GLOBAL",1)~ THEN BEGIN rh#KickedTOB
 SAY @0 /* You mean to part ways? */
	++ @1 /* Actually, no. I don't. */ + rh#KickedTOB_oops
	+ ~AreaCheck("AR4500")~ + @2 /* Only temporarily. */ + rh#KickedTOBpp
	+ ~!AreaCheck("AR4500") GlobalLT("chapter","GLOBAL",%bg2_chapter_9%)~ + @2 /* Only temporarily. */ + rh#KickedTOBsara
	+ ~!AreaCheck("AR4500") GlobalGT("chapter","GLOBAL",%bg2_chapter_8%)~ + @2 /* Only temporarily. */ + rh#KickedTOBamth
	+ ~!AreaCheck("AR4500")~ + @3 /* Indeed. Good luck and good riddance. */ + rh#KickedTOBbye
END

IF ~~ rh#KickedTOB_oops
 SAY @4 /* I'm glad to hear it. */
IF ~~ DO ~JoinParty() SetGlobal("RH#AdrianJoined","GLOBAL",1)~ EXIT	
END

IF ~~ rh#KickedTOBpp
 SAY @5 /* And in this delightful place, no less. Wonderful. */
IF ~~ DO ~SetGlobal("RH#AdrianJoined","GLOBAL",0)~ EXIT
END

IF ~~ rh#KickedTOBsara
 SAY @6 /* Very well. If you come to your senses, you may yet find me in whatever tavern is still standing. */
IF ~~ DO ~SetGlobal("RH#AdrianJoined","GLOBAL",0) EscapeAreaMove("AR5003",870,550,3)~  EXIT
END

IF ~~ rh#KickedTOBamth
 SAY @7 /* Very well. I'm sure I can find someplace interesting to stay. */
IF ~~ DO ~SetGlobal("RH#AdrianJoined","GLOBAL",0) EscapeAreaMove("AR5501",650,248,9)~ EXIT
END

IF ~~ rh#KickedTOBbye
 SAY @8 /* In that case, "friend," I suppose I'll simply have to pursue other interests. */
IF ~~ DO ~SetGlobal("RH#AdrianJoined","GLOBAL",0) ForceSpell(Myself,WIZARD_INVISIBILITY) EscapeArea()~ EXIT
END

// rejoin

IF ~Global("RH#AdrianJoined","GLOBAL",0) !AreaCheck("AR4500")~ THEN BEGIN rh#AdrianRejoinTOB1
 SAY @9 /* Ahh, just when things were becoming unbearably dull, <CHARNAME> drops by. Did you want something? */
	++ @10 /* Not particularly. Are you enjoying the scenery? */ + rh#AdrianRejoinTOB1.1
	++ @11 /* I'd like you to join with me again. */ + rh#AdrianRejoinTOB1.2
	++ @12 /* Only to kill you. */ + rh#AdrianRejoinTOB1.3
END

IF ~~ rh#AdrianRejoinTOB1.1
 SAY @13 /* As much as might be expected. */
IF ~~ EXIT
END

IF ~~ rh#AdrianRejoinTOB1.2
 SAY @14 /* Would you? All things considered, I can't say I'm surprised. Very well, then. */
IF ~~ DO ~JoinParty() SetGlobal("RH#AdrianJoined","GLOBAL",1)~ EXIT
END

IF ~~ rh#AdrianRejoinTOB1.3
 SAY @15 /* I see. Pardon me for not staying around to see how that battle plays out. */
IF ~~ DO ~ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~Global("RH#AdrianJoined","GLOBAL",0) AreaCheck("AR4500")~ THEN BEGIN rh#AdrianRejoinTOB2
 SAY @16 /* As much as I'm enjoying torturing your pet imp, dare I hope you finally have a slightly more interesting task? */
 	++ @17 /* Significantly more interesting, I hope. Join up. */ + rh#AdrianRejoinTOB2.1
 	++ @18 /* Not yet, I'm afraid. */ + rh#AdrianRejoinTOB2.2
END

IF ~~ rh#AdrianRejoinTOB2.1
 SAY @19 /* Well, we can only hope for the best. */
IF ~~ DO ~JoinParty() SetGlobal("rh#AdrianJoined","GLOBAL",1)~ EXIT
END

IF ~~ rh#AdrianRejoinTOB2.2
 SAY @20 /* If your infernal butler ends up dead, you've only yourself to blame. */
IF ~~ EXIT
END