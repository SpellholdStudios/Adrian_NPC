BEGIN RH#ADRP

// ** PARTING DIALOGUE ** //

IF ~Global("RH#AdrianJoined","GLOBAL",1)~ THEN BEGIN rh#AdrianKicked
 SAY @0 /* You mean to part ways? */
	++ @1 /* Actually, no. I don't. */ + rh#AdrianKicked_oops
	+ ~!Global("Chapter","GLOBAL",%bg2_chapter_5%)~ + @2 /* Only temporarily. */ + rh#AdrianKicked_wp
	+ ~Global("PlayerLooksLikeDrow","GLOBAL",1)~ + @2 /* Only temporarily. */ + rh#AdrianKicked_drow
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_5%) !Global("PlayerLooksLikeDrow","GLOBAL",1) !AreaCheck("AR2300")~ + @2 /* Only temporarily. */ + rh#AdrianKicked_underdark
	++ @3 /* Indeed. Good luck and good riddance. */ + rh#AdrianKicked_interests
END
	
IF ~~ rh#AdrianKicked_oops 
 SAY @4 /* I'm glad to hear it. */
IF ~~ DO ~JoinParty()~ EXIT	
END

IF ~~ rh#AdrianKicked_wp
 SAY @5 /* Very well. If you come to your senses, you may yet find me in Waukeen's Promenade. */
IF ~~ DO ~SetGlobal("rh#AdrianJoined","GLOBAL",0) EscapeAreaMove("AR0704",614,661,1)~ EXIT
END

IF ~~ rh#AdrianKicked_drow
 SAY @6 /* This had better be only temporary, Veldrin. I'll head to the inn, then. */
IF ~~ DO ~SetGlobal("rh#AdrianJoined","GLOBAL",0) EscapeAreaMove("AR2202",1490,944,5)~  EXIT
END

IF ~~ rh#AdrianKicked_underdark
 SAY @7 /* Abandoning me in the Underdark? Wonderful. */
IF ~~ DO ~SetGlobal("rh#AdrianJoined","GLOBAL",0) ForceSpell(Myself,WIZARD_INVISIBILITY) EscapeArea()~ EXIT
END

IF ~~ rh#AdrianKicked_interests
 SAY @8 /* In that case, "friend," I suppose I'll simply have to pursue other interests. */
IF ~~ DO ~SetGlobal("rh#AdrianJoined","GLOBAL",0) ForceSpell(Myself,WIZARD_INVISIBILITY) EscapeArea()~ EXIT
END

// ** MITHREST INN ** //

IF ~Global("RH#AdrianJoined","GLOBAL",0) AreaCheck("AR0704")~ THEN BEGIN rh#AdrianRejoin
 SAY @9 /* Ahh, just when things were becoming unbearably dull, <CHARNAME> drops by. Did you want something? */
	++ @10 /* Not particularly. Of all of the places in Athkatla, though, why would you stay here? */ + rh#AdrianRejoin_mithrest
	++ @11 /* I'd like you to join with me again. */ + rh#AdrianRejoin_return
	++ @12 /* Only to kill you. */ + rh#AdrianRejoin_kill
END

IF ~~ rh#AdrianRejoin_mithrest
 SAY @13 /* Because nobody wants me dead in this small, self-satisfied corner of Athkatla. If that was all, I'm enjoying the local gossip. Or tolerating it, at least. */
IF ~~ EXIT
END

IF ~~ rh#AdrianRejoin_return
 SAY @14 /* Would you? By the looks of your company, I can't say I'm surprised. Very well, then. */
IF ~~ DO ~SetGlobal("rh#AdrianJoined","GLOBAL",1) JoinParty()~ EXIT
END

IF ~~ rh#AdrianRejoin_kill
 SAY @15 /* I see. Pardon me for not staying around to see how that battle plays out. */
IF ~~ DO ~ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

// ** DROW INN ** /

IF ~Global("RH#AdrianJoined","GLOBAL",0) AreaCheck("AR2202")~ THEN BEGIN rh#AdrianRejoin
 SAY @16 /* Ahh, an... almost familiar face. Did you want something, Veldrin? */
	++ @17 /* Not particularly. Are you enjoying the scenery? */ + rh#AdrianRejoin_scenery
	++ @11 /* I'd like you to join with me again. */ + rh#AdrianRejoin_return
	++ @12 /* Only to kill you. */ + rh#AdrianRejoin_kill
END

IF ~~ rh#AdrianRejoin_scenery
SAY @18 /* As much as might be expected. */
IF ~~ EXIT
END
// vampire abduction (bodhinapping)

ADD_TRANS_TRIGGER BODHIAMB 5 ~OR(2)
!InParty("rh#Adrian")
!Global("rh#AdrianRomanceActive","GLOBAL",2)~ DO 0

INTERJECT BODHIAMB 5 rh#AdrBodhiAbduction1
== BODHIAMB IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)
InParty("rh#Adrian")~ THEN @19 /* You follow in the hopes of retrieving something dear to you. I say that the longer you keep this up, the more you will lose. */
END
IF ~OR(2)
!InPartyAllowDead("rh#Adrian")
Dead("rh#Adrian")~ THEN EXTERN BODHIAMB 6
IF ~InPartyAllowDead("rh#Adrian")
!Dead("rh#Adrian")~ THEN EXTERN BODHIAMB rh#AdrBodhiAbduction2

CHAIN BODHIAMB rh#AdrBodhiAbduction2
@20 /* Such as this mage. A pretty thing, isn't he? Bold when it matters, but timid in the ways of the heart. Perhaps I should tear it out for him. */
== RH#ADRJ @21 /* Your threats mean nothing, vampire. */
== BODHIAMB @22 /* And yet they mean more than yours ever have. Follow me further, <CHARNAME>, and you will lose more than you can imagine!  Starting now! */
END
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("rh#cut1")~
UNSOLVED_JOURNAL @23 /* The Final Battle with Bodhi.

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me the one person that is dearest to my heart: Adrian.  Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue I will lose even more than I thought possible.  I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of the one I love is at stake, as well! */ EXIT

//Bodhi abduction: Oghma

ADD_TRANS_TRIGGER IMNBOOK1 0
~OR(2)
!Global("RevealUmar","GLOBAL",1)
!PartyHasItem("rh#ADBDY")~

EXTEND_BOTTOM IMNBOOK1 0
IF ~PartyHasItem("rh#ADBDY")
Global("RevealUmar","GLOBAL",1)~ THEN REPLY #59383 EXTERN IMNBOOK1 4
END

EXTEND_BOTTOM DOGHMA 0 #5
	+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("rh#ADBDY")~ + @24 /* A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that. */ GOTO 10
END

EXTEND_BOTTOM DOGHMA 3 7 9 #4
	+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("rh#ADBDY")~ + @24 /* A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that. */ GOTO 10
END

EXTEND_BOTTOM SUDEMIN 2
+ ~PartyHasItem("rh#ADBDY")~ + @25 /* I lost a loved one in a battle with his sister, Bodhi.  I seek a means of curing him. */ GOTO 3
END

APPEND OGHMONK1
IF WEIGHT #-1
~Global("RevealUmar","GLOBAL",1)
PartyHasItem("rh#ADBDY")~ THEN BEGIN rh#AdrOghmaMonk
 SAY @26 /* Have you come seeking wisdom from the Binder of What is Known? The Wise God stands ready. */
	++ @27 /* No, thank you, I have no need of help at the moment. */ EXTERN OGHMONK1 5
	++ @24 /* A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that. */ EXTERN OGHMONK1 6
END
END

//Bodhi abduction: Elhan

EXTEND_BOTTOM C6ELHAN2 70
	+ ~PartyHasItem("rh#ADBDY")~ + @28 /* Elhan! I've the half vampire body of Adrian here because of you! You'll tell me now! */ + 76
END

EXTEND_BOTTOM WARSAGE 0
	+ ~!Dead("c6bodhi") Global("rh#AdrianVampire","GLOBAL",2)~ + @29 /* A loved one was taken by a vampire. What can I expect when I find him? */ + 6
END

EXTEND_BOTTOM WARSAGE 0
	+ ~PartyHasItem("rh#ADBDY")~ + @30 /* Someone I care about has fallen to a vampire. Is there any way to save him? */ + 5
END

//Bodhi abduction: final battle

// Bodhi section 2
ADD_TRANS_TRIGGER C6BODHI 21 ~!Global("rh#AdrianVampire","GLOBAL",2)~ DO 0

INTERJECT C6BODHI 21 rh#AdrianBodhiMeet_1
  == C6BODHI IF ~Global("rh#AdrianVampire","GLOBAL",2)~ THEN
  @31 /* But... no, I have already prepared much for this meeting, <CHARNAME>. I did warn you that you would suffer great loss if you continued your push towards me.  I did not lie. */
END
	+ ~Global("rh#AdrianVampire","GLOBAL",2)~ + @32 /* You have taken too much already!  You will return both Imoen's soul and Adrian! */ EXTERN C6BODHI rh#AdrVamp_taken
	+ ~Global("rh#AdrianVampire","GLOBAL",2)~ + @33 /* And you have delivered on that promise. Return Adrian and perhaps I will be merciful. */ EXTERN C6BODHI rh#AdrVamp_taken
	+ ~Global("rh#AdrianVampire","GLOBAL",2)~ + @34 /* I would have hunted you for your theft of Adrian alone. He is very important to me. */ EXTERN C6BODHI rh#AdrVamp_taken
	+ ~Global("rh#AdrianVampire","GLOBAL",2)~ + @35 /* You place too much confidence in sentiment.  The theft of Adrian will not save you. */ EXTERN C6BODHI rh#AdrVamp_sentiment

APPEND C6BODHI

IF ~~ rh#AdrVamp_sentiment
SAY @36 /* An interesting ploy, though I am sure his fate will still serve as an example -- whether you wish him back or not. */
IF ~~ + rh#AdrVamp_taken
END

IF ~~ rh#AdrVamp_taken
 SAY @37 /* This one? I doubt your fumbling could have inspired the loyalty I have taken with a bite and a gaze. He requires a strong hand to keep him in line. He is accustomed to no less. */
IF ~~ UNSOLVED_JOURNAL @38 /* The Final Battle with Bodhi.

Bodhi has turned Adrian into a vampire!  Or ... or very nearly.  The process may not have been completed in the short time Bodhi has had him. I will have lost him if something cannot be done.  Perhaps the elven war sage might know some way of restoration ... or Elhan... */
EXTERN RH#VADR RH#VampAdrian1
END

IF ~~ RH#VampAdrian2
SAY @39 /* Compliant, isn't he? I shall have to send my regards to his old masters someday. For now, however... the process is not quite complete, but he will still strike you down when I command it. */
IF ~~ EXTERN C6BODHI 28
END
END

BEGIN RH#VADR

IF ~~ RH#VampAdrian1
SAY @40 /* What...what do you require, mistress? */
IF ~~ EXTERN C6BODHI RH#VampAdrian2
END

// post-abduction

CHAIN IF WEIGHT #-1 ~OR(2) Global("rh#AdrianVampire","GLOBAL",3) Global("rh#AdrianVampire","GLOBAL",4)~ THEN RH#ADRP rh#AdrVamped
@41 /* You... saved me. <CHARNAME>... */
DO ~ChangeAIScript("rh#adr",OVERRIDE) SetGlobal("rh#AdrianVampire","GLOBAL",5)~
END
	++ @42 /* Of course I'd save you! Don't sound so surprised. */ + rh#AdrVamped_reverse
	++ @43 /* What did you expect me to do? Leave you like that for the rest of time? */ + rh#AdrVamped_reverse
	++ @44 /* You're very welcome. */ + rh#AdrVamped1
	++ @45 /* You're exceptionally lucky, I agree. */ + rh#AdrVamped1
	
APPEND RH#ADRP

IF ~~ rh#AdrVamped_reverse
 SAY @46 /* What? No, no, I just... */
IF ~~ + rh#AdrVamped1
END

IF ~~ rh#AdrVamped1
 SAY @47 /* I didn't think it was reversible. Vampirism, that is. I'm not as well versed in the necromantic arts as I perhaps should be, but... */
 = @48 /* How exactly did you do it? */
 	++ @49 /* By using the icon of the ancient sun god Amaunator. We found evidence that his touch had cured undeath in the past. */ + rh#AdrVamped_sungod
 	++ @50 /* A moment amongst the living again and he's already contemplating arcane theory! Does it really matter? */ + rh#AdrVamped_theory
 	++ @51 /* Well, at least you don't seem to be traumatized. */ + rh#AdrVamped_trauma
 	++ @52 /* With a great deal of difficulty. What was it like? */ + rh#AdrVamped_vamped
END

IF ~~ rh#AdrVamped_sungod
 SAY @53 /* I see. But for the grace of a god of light. Hmm. I'm not sure how I feel about that, but... well, it's better than the alternative. */
IF ~~ + rh#AdrVamped2
END

IF ~~ rh#AdrVamped_theory
 SAY @54 /* No, you're right... you're right, of course. I guess it's easier than actually... remembering. I was...dead. I was...beyond dead. I-- */
IF ~~ + rh#AdrVamped2
END

IF ~~ rh#AdrVamped_trauma
 SAY @55 /* I don't? Good. I guess I'm trying not to actually... remember. I was...dead. I was...beyond dead. I-- */
IF ~~ + rh#AdrVamped2
END

IF ~~ rh#AdrVamped_vamped
 SAY @56 /* It was... well, it was. I'm not sure I want to remember. I was dominated throughout it, I think. It's hard to say for certain. It was something beyond normal domination... I wasn't even myself anymore. Not really. */
= @57 /* And I was hungry. So hungry. And I hated...everything. Not that that's particularly unusual for me, but-- */
IF ~~ + rh#AdrVamped2
END

IF ~~ rh#AdrVamped2
 SAY @58 /* (sigh) Remind me to never become a lich, <CHARNAME>. */
	++ @59 /* Okay, this is just getting creepy now. */ + rh#AdrVamped_creepy
	++ @60 /* Heh. I'll do that. */ + rh#AdrVamped3
	++ @61 /* So much for that dream, I suppose. */ + rh#AdrVamped_dream
	++ @62 /* Well, at least you're yourself again. */ + rh#AdrVamped_again
END

IF ~~ rh#AdrVamped_creepy
 SAY @63 /* (smile) I try my best. */ 
IF ~~ + rh#AdrVamped3
END

IF ~~ rh#AdrVamped_dream
 SAY @64 /* (smile) You'll need to find yourself another evil sorcerer if you want that, my dear. */
IF ~~ + rh#AdrVamped3
END

IF ~~ rh#AdrVamped_again
 SAY @65 /* Don't sound so disappointed, my dear. */
IF ~~ + rh#AdrVamped3
END

IF ~~ rh#AdrVamped3
 SAY @66 /* I'm growing tired of saying it, but... thank you, <CHARNAME>. Sincerely. And I'll thank you once more after we get out of this gods forsaken crypt. */
IF ~~ DO ~SetGlobal("rh#AdrianJoined","GLOBAL",1) JoinParty()  EraseJournalEntry(@23 /* The Final Battle with Bodhi.

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me the one person that is dearest to my heart: Adrian.  Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue I will lose even more than I thought possible.  I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of the one I love is at stake, as well! */)
EraseJournalEntry(@38 /* The Final Battle with Bodhi.

Bodhi has turned Adrian into a vampire!  Or ... or very nearly.  The process may not have been completed in the short time Bodhi has had him. I will have lost him if something cannot be done.  Perhaps the elven war sage might know some way of restoration ... or Elhan... */)~
SOLVED_JOURNAL @67 /* The Final Battle with Bodhi.

While I had feared for some time that Bodhi's final revenge on me would be to take away Adrian forever, it seems that the information in the lorebook was right... Amaunator's idol has restored Adrian not only to life, but has removed the vampiric curse from him, as well. */ EXIT
END
END