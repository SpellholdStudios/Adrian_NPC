// QUEST DIALOGUE

// part 1

BEGIN RH#TANYA

CHAIN IF ~Global("rh#DamarovQuest","GLOBAL",1)~ THEN RH#TANYA lolzhentblackmail
@0 /* My lord Vasiliev... and still alive, I see. I hardly expected to see you this side of the Nine Hells. */
== RH#ADRJ @1 /* That must be nice for you... whoever you are, but you've mistaken me. Gods, is everyone in this city a damned fool? */
== RH#TANYA @2 /* More charming than ever, I see, but that flashy new elven name of yours doesn't hide much. */
= @3 /* I thought at first that perhaps you were working undercover again, but then I know every agent in the city, and you, my lord, are not one of them. */
= @4 /* You should have better laid low if you didn't want to be found... though I suppose you've never been overly skilled at that. */
== RH#ADRJ @5 /* What do you want, Tanya? */
== RH#TANYA @6 /* Well, to keep my head, for one. Rest assured, Vasiliev, if anything happens to me, a couple of birds will be flying straight to Darkhold-- */
= @7 /* Oh, I see. You didn't want me to say that name, did you? Didn't want your new friends knowing about the company you used to keep? Lie upon lie... though I suppose some things never change. */
END
	++ @8 /* Watch your tongue, lady. I won't have you speaking to my friends like that. */ EXTERN RH#TANYA dama2
	++ @9 /* Now what? I suppose I should have expected something sooner or later. */ EXTERN RH#TANYA dama2
	++ @10 /* What in the hells is going on here!? */ EXTERN RH#TANYA dama2
	++ @11 /* Remember me? The leader of this company? Over here. */ EXTERN RH#TANYA dama2

CHAIN RH#TANYA dama2
@12 /* <CHARNAME>, is it? Yes, we might have heard a thing or two about you... somewhat sane for a <PRO_SONDAUGHTER> of Bhaal, perhaps, but these things can't be helped. */
= @13 /* Now, about your friend here, my <PRO_LADYLORD> Bhaalspawn... we don't much care for traitors and renegades-- */
== RH#ADRJ @14 /* Traitor? Your masters at the Citadel left us to die, Tanya. The only thing I owe them is a couple of fireballs. */
== RH#TANYA @15 /* Well. He talks back now too, does he? I'm afraid we don't much care for that either. */
= @16 /* Now, I've always liked you, my lord. You were useful enough before you got messed up with that Calim harlot... whatever happened to her, by the way? */
== RH#ADRJ @17 /* I'm dangerously close to killing you right now and risking your damn birds, Tanya. */
== RH#TANYA @18 /* Still so touchy, I see. As I was saying, I always liked you, and for the moment, nobody north of Athkatla even knows about your recent adventures, so I'm prepared to cut you a deal. */
= @19 /* I'd ask you to do a few jobs for me, but I prefer to keep my dealings private. Something... monetary, I think. */
== RH#TANYA IF ~Class("rh#Adrian",SORCERER)~ THEN @20 /* 1000 gold a tenday, and I'll hold my peace. You needn't worry about Zhentarim assassins coming for your precious sorcerer. How does that sound, my <PRO_LADYLORD> Bhaalspawn? */
== RH#TANYA IF ~!Class("rh#Adrian",SORCERER)~ THEN @21 /* 1000 gold a tenday, and I'll hold my peace. You needn't worry about Zhentarim assassins coming for your precious wizard. How does that sound, my <PRO_LADYLORD> Bhaalspawn? */
== RH#ADRJ @22 /* <CHARNAME>, please. */
END
	+ ~PartyGoldGT(999)~ + @23 /* Fine. Here's your money. Don't let the door hit you on the way out. */ EXTERN RH#TANYA dama3
	+ ~PartyGoldGT(999)~ + @24 /* Fine. You can have the money this once, but don't expect me to make a habit of it. */ EXTERN RH#TANYA dama3
	+ ~PartyGoldLT(1000)~ + @25 /* I don't have that kind of money on me. */ EXTERN RH#TANYA dama4
	++ @26 /* How can I trust you not to take the money and turn on us anyway? */ EXTERN RH#TANYA dama6
	++ @27 /* I knew you were a terrible person, but a group like this? Get lost. Now. */ EXTERN RH#ADRJ dama7
	++ @28 /* You're a liability now, Adrian. You can keep him, Zhent. */ EXTERN RH#ADRJ dama7
	++ @29 /* You're not getting my money and you're not getting Adrian. */ EXTERN RH#ADRJ dama8
	++ @30 /* I think I'd rather just kill you here, Tanya. */ EXTERN RH#ADRJ dama8
	
CHAIN RH#TANYA dama3
@31 /* Well, now. That wasn't so difficult, was it? You can expect another visit next tenday, <CHARNAME>. And try not to run again, Adrian. You're not very good at it. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",2) SetGlobal("rh#DamarovReturns","GLOBAL",1) TakePartyGold(1000) SetGlobalTimer("rh#DamarovReturnsTimer","GLOBAL",TEN_DAYS) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",5) AddJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */,QUEST) ActionOverride("RH#TANYA",EscapeArea())~
EXIT

CHAIN RH#TANYA dama3b
@31 /* Well, now. That wasn't so difficult, was it? You can expect another visit next tenday, <CHARNAME>. And try not to run again, Adrian. You're not very good at it. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",2) SetGlobal("rh#DamarovReturns","GLOBAL",1) TakePartyGold(500) SetGlobalTimer("rh#DamarovReturnsTimer","GLOBAL",TEN_DAYS) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",5) AddJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */,QUEST) ActionOverride("RH#TANYA",EscapeArea())~
EXIT

CHAIN RH#TANYA dama4
@33 /* No? Master Linvail had best find himself a better golden goose. Well, given your financial situation, I'll accept 500 now and expect the rest next tenday. */
END
	++ @34 /* Linvail? What do you know about my situation with the Shadow Thieves?! */ EXTERN RH#TANYA dama10
	++ @23 /* Fine. Here's your money. Don't let the door hit you on the way out. */ EXTERN RH#TANYA dama3b
	++ @24 /* Fine. You can have the money this once, but don't expect me to make a habit of it. */ EXTERN RH#TANYA dama3b
	++ @35 /* I don't even have that much money on me. */ EXTERN RH#TANYA dama5
	++ @26 /* How can I trust you not to take the money and turn on us anyway? */ EXTERN RH#TANYA dama6
	++ @27 /* I knew you were a terrible person, but a group like this? Get lost. Now. */ EXTERN RH#ADRJ dama7
	++ @28 /* You're a liability now, Adrian. You can keep him, Zhent. */ EXTERN RH#ADRJ dama7
	++ @29 /* You're not getting my money and you're not getting Adrian. */ EXTERN RH#ADRJ dama8
	++ @30 /* I think I'd rather just kill you here, Tanya. */ EXTERN RH#ADRJ dama8

CHAIN RH#TANYA dama5
@36 /* Not a penny to <PRO_HISHER> name and you've stayed with <PRO_HIMHER> anyway, Vasiliev? I find that hard to believe. */
= @37 /* Very well. I did not expect you to prove this useless, <CHARNAME>. I suppose I shall have to simply take my pick of whatever magical items I find on your corpses. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",20) ActionOverride("RH#TANYA",Enemy())
ActionOverride("RH#TANYA",SetGlobal("rh#enemies","LOCALS",1))
AddJournalEntry(@38 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed, and one that finally caught up with him. */,QUEST_DONE)~ 
EXIT

CHAIN RH#TANYA dama6
@39 /* You're quite the innocent soul, aren't you, <CHARNAME>? Perhaps my former associate here ought to explain to you the nature of blackmail: if I turn on you, I don't get paid. As enjoyable as it might be to take the traitor's head back home, I enjoy gold even more. */
END
	+ ~PartyGoldGT(999)~ + @23 /* Fine. Here's your money. Don't let the door hit you on the way out. */ EXTERN RH#TANYA dama3
	+ ~PartyGoldGT(999)~ + @24 /* Fine. You can have the money this once, but don't expect me to make a habit of it. */ EXTERN RH#TANYA dama3
	+ ~PartyGoldLT(1000)~ + @25 /* I don't have that kind of money on me. */ EXTERN RH#TANYA dama4
	++ @26 /* How can I trust you not to take the money and turn on us anyway? */ EXTERN RH#TANYA dama6
	++ @40 /* I knew you were a terrible person, Adrian, but a group like this? Get lost. Now. */ EXTERN RH#ADRJ dama7
	++ @28 /* You're a liability now, Adrian. You can keep him, Zhent. */ EXTERN RH#ADRJ dama7
	++ @29 /* You're not getting my money and you're not getting Adrian. */ EXTERN RH#ADRJ dama8
	++ @30 /* I think I'd rather just kill you here, Tanya. */ EXTERN RH#ADRJ dama8

CHAIN RH#ADRJ dama7
@41 /* <CHARNAME>, I swear you'll regret this-- */
== RH#TANYA @42 /* It seems that you should choose your friends better, Adrian. But then, why start now? */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",22) SetGlobal("rh#AdrianJoined","GLOBAL",0) ActionOverride("rh#Adrian",LeaveParty()) StartCutSceneMode() StartCutScene("rh#cut2") AddJournalEntry(@38 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed, and one that finally caught up with him. */,QUEST_DONE)~
EXIT 

CHAIN RH#ADRJ dama8
@43 /* <CHARNAME>, please, just do what she says. We can discuss this later. */
END
	+ ~PartyGoldGT(999)~ + @23 /* Fine. Here's your money. Don't let the door hit you on the way out. */ EXTERN RH#TANYA dama3
	+ ~PartyGoldGT(999)~ + @24 /* Fine. You can have the money this once, but don't expect me to make a habit of it. */ EXTERN RH#TANYA dama3
	+ ~PartyGoldLT(1000)~ + @25 /* I don't have that kind of money on me. */ EXTERN RH#TANYA dama4
	++ @26 /* How can I trust you not to take the money and turn on us anyway? */ EXTERN RH#TANYA dama6
	++ @44 /* There's nothing to discuss. Tanya, time to die. */ EXTERN RH#TANYA dama9

CHAIN RH#TANYA dama9
@45 /* Well, isn't that a pity. I suppose I shall simply have to take my pick of whatever magical items I find on your corpses. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",20) ActionOverride("RH#TANYA",Enemy()) 
ActionOverride("RH#TANYA",SetGlobal("rh#enemies","LOCALS",1))
AddJournalEntry(@38 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed, and one that finally caught up with him. */,QUEST_DONE)~ 
EXIT

CHAIN RH#TANYA dama10
@46 /* I'm sorry, <CHARNAME>, did I give you the impression that this was a negotiation? What I know about the Shadow Thieves is my own business. You'll do as I say, Bhaalspawn, or you won't live to regret it. */
END
	++ @23 /* Fine. Here's your money. Don't let the door hit you on the way out. */ EXTERN RH#TANYA dama3b
	++ @24 /* Fine. You can have the money this once, but don't expect me to make a habit of it. */ EXTERN RH#TANYA dama3
	++ @35 /* I don't even have that much money on me. */ EXTERN RH#TANYA dama5
	++ @26 /* How can I trust you not to take the money and turn on us anyway? */ EXTERN RH#TANYA dama6
	++ @47 /* Fine. Keep him. I have no interest in protecting a man involved in a group like yours anyway. */ EXTERN RH#ADRJ dama7
	++ @28 /* You're a liability now, Adrian. You can keep him, Zhent. */ EXTERN RH#ADRJ dama7
	++ @29 /* You're not getting my money and you're not getting Adrian. */ EXTERN RH#ADRJ dama8
	++ @30 /* I think I'd rather just kill you here, Tanya. */ EXTERN RH#ADRJ dama8

// 6.
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianTalks","GLOBAL",12)~ THEN RH#ADRJ rh#talk6
@48 /* Dammit. I should be glad that she's more interested in profit than blood, but it's only a matter of time before she changes her mind. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @49 /* And now you will demand protection, no doubt. You are lucky that <CHARNAME> did not simply hand you over to the Cyricist. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @50 /* And here I always thought your kin enjoyed rescuing people from the Zhentarim. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @51 /* You are no victim, Adrian. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @52 /* Of course not. Hells, Harper. Could this please wait until later? I'm slightly more worried about Tanya right now. */
== RH#ADRJ @53 /* As I recall, she was always too organized for her own good. She tended to keep written records of her affairs -- a terrible habit, but then I've never expected much competence from a Cyricist. */
= @54 /* If we're very lucky, she may even keep notes on any associates of hers. If we can figure out where she's staying, identify and hunt down whatever contacts she has in the city, this problem should solve itself. I hope. <CHARNAME>? */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1)~
END
	++ @55 /* Explain. Now. */ + rh#talk6_explanation
 	++ @56 /* You should have told me about this earlier. */ + rh#talk6_explanation
 	++ @57 /* I hope I won't have to worry about more of your old friends dropping by. */ + rh#talk6_friends
 	++ @58 /* I may have given you a head start on your old friends, but don't mistake that for tolerance. Get lost. Now. */ + rh#talk6_getlost

APPEND RH#ADRJ

IF ~~ rh#talk6_explanation
 SAY @59 /* I... suppose that's not quite how I'd have liked for it to come out, but... well, what was I supposed to say? "By the way, <CHARNAME>, I used to work for one of the worst organizations in the Realms, and they may come after me for disappearing. May I join you?" */
IF ~~ DO ~SetGlobal("rh#AdrianZhent","GLOBAL",1)~ + rh#talk6_main1
END

IF ~~ rh#talk6_friends
 SAY @60 /* We'll deal with Tanya, and then... I don't know, <CHARNAME>. If she's kept quiet, they have no reason to even know I'm still alive, and I can't be a high priority at all right now, but... I can't promise anything. I've seen Zhentarim retaliation before. They take their reputation seriously. */
IF ~~ DO ~SetGlobal("rh#AdrianZhent","GLOBAL",1)~ + rh#talk6_main1
END

IF ~~ rh#talk6_main1
 SAY @61 /* I should probably... explain what happened. I... well, I can't say I was very much in favor even before the siege of Zhentil Keep. Though I suppose you were too busy stopping your own war to hear much about ours. */
 = @62 /* Cyric himself, so-called protector of the city... well, the Mad God crushed it completely in a fit of megalomaniacal incompetence instead. Accidentally threw an army of dragons and giants at us. Half the city slaughtered, and the rest of the world laughed. */
 = @63 /* "Decadent Zhentil Keep, birthplace of the wicked Zhentarim, finally razed to the ground." Never mind that the Zhentarim leadership was sitting up north in the Citadel of the Raven, doing nothing. */
 = @64 /* I used to be a skymage, flying mount and all, so I spent the first week or so running angry messages between the shattered Keep and the Citadel. The bastards refused to help, of course. Not much of a surprise, and I finally just... snapped and ran. Right into the arms of bandits from nearby Melvaunt. We're not the only slavers on the Moonsea, and I was far more vulnerable than I should have been. */
 = @65 /* After that... well, you know the rest. */
	++ @66 /* That's an awful lot of bloodshed and turmoil, even for someone who's used to it. */ + rh#talk6_bloodshed
	++ @67 /* I suppose that explains why you're so inexplicably angry half the time. */ + rh#talk6_angry
 	++ @68 /* I'm... sorry. I really am. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk6_sympathize
 	++ @69 /* A Zhent, sold into slavery. Give me a moment to just bask in the irony. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-5)~ + rh#talk6_irony
 	++ @70 /* And now I find that I should have left you with those duergar. Get lost. */ + rh#talk6_getlost
END

IF ~~ rh#talk6_bloodshed
 SAY @71 /* You'd be surprised. Not all of us are enamored of the use of violence. For me, it would usually have been a sign that something had gone horribly wrong. */
IF ~~ + rh#talk6_main2
END

IF ~~ rh#talk6_angry
 SAY @72 /* Inexplicably angry? Ha. I never used to be quite this obvious about it, but I guess I dropped my mask of gentility when I left Sembia. */ 
IF ~~ + rh#talk6_main2
END

IF ~~ rh#talk6_sympathize
 SAY @73 /* <CHARNAME>, <PRO_SONDAUGHTER> of Bhaal... yes, I can't deny that you've been a victim of divine meddling as well. I... thank you, I suppose. */
IF ~~ + rh#talk6_main2
END

IF ~~ rh#talk6_irony
 SAY @74 /* Laugh, if you want. You're wrong if you think I give a damn. */
IF ~~ + rh#talk6_main2
END

IF ~~ rh#talk6_main2 
 SAY @75 /* I won't pretend that everything you've likely heard is propaganda, because it's not, but what's true for the group at large isn't necessarily true for everyone who's ever worked for them. */
 = @76 /* I won't lie to you and say that I've learned my lesson and changed my ways or any such nonsense, but... I'm still not who I used to be. I haven't been for a while. I'm... not waiting for the best opportunity to stab you in the back, <CHARNAME>. */
 	++ @77 /* So you used to belong to an evil organization bent on world domination. As far as I'm concerned, that's just another reason to keep you around. */ + rh#talk6_funny
	++ @78 /* I'm not happy about this, but I don't intend to throw you out because of it. */ + rh#talk6_happy
	++ @79 /* You've been trustworthy thus far, so I'll give you the benefit of the doubt. I will, however, be watching you. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk6_watchyou
	++ @80 /* I'm not going to throw you out, Adrian. I judge people according to their present, not their past. */ + rh#talk6_naive
	++ @81 /* I can't trust you after something like this. I'm sorry. */ + rh#talk6_getlost
	+ ~InParty("Edwin")~ + @82 /* I don't harbor monsters. Get out. Now. */ + rh#talk6_edwin
	+ ~!InParty("Edwin") InParty("Viconia")~ + @82 /* I don't harbor monsters. Get out. Now. */ + rh#talk6_vicky
	+ ~!InParty("Edwin") !InParty("Viconia")~ + @82 /* I don't harbor monsters. Get out. Now. */ + rh#talk6_monster
END

IF ~~ rh#talk6_happy
 SAY @83 /* I...don't expect you to be. Still, thank you, <CHARNAME>. */
IF ~~ DO ~AddJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */,QUEST)~ EXIT
END

IF ~~ rh#talk6_watchyou
 SAY @85 /* I would expect no less. I know full well you haven't survived the past year through blind faith. Still, I... thank you, <CHARNAME>. */
IF ~~ DO ~AddJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */,QUEST)~ EXIT
END

IF ~~ rh#talk6_naive
 SAY @86 /* Such naivete is likely to get you killed one day, <CHARNAME>, but this once, I'm grateful for it. Perhaps I can even help you protect yourself from the enemies you don't want to see. */
IF ~~ DO ~AddJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */,QUEST)~ EXIT
END

IF ~~rh#talk6_funny
 SAY @87 /* I suggest you curb your taste for notoriety, <CHARNAME>. There's really nothing *funny* about this. But... thank you, all the same. */
IF ~~ DO ~AddJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */,QUEST)~ EXIT
END

IF ~~ rh#talk6_getlost
 SAY @88 /* Just like that, then? Fine. I'd normally wish you luck, but this once, I think perhaps I'll root for the dragons instead. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

AddJournalEntry(@89 /* A Game of Zhentarim Blackmail

After learning of Adrian's past connections, I decided that it would be best to part ways with the wizard. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",0) LeaveParty() ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ rh#talk6_edwin
 SAY @90 /* Tell that to the Red Wizard. Fine. I'd normally wish you luck, but this once, I think perhaps I'll root for the dragons instead. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

AddJournalEntry(@89 /* A Game of Zhentarim Blackmail

After learning of Adrian's past connections, I decided that it would be best to part ways with the wizard. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",0) LeaveParty() ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ rh#talk6_vicky
 SAY @91 /* Tell that to the dark elf. Fine. I'd normally wish you luck, but this once, I think perhaps I'll root for the dragons instead. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

AddJournalEntry(@89 /* A Game of Zhentarim Blackmail

After learning of Adrian's past connections, I decided that it would be best to part ways with the wizard. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",0) LeaveParty() ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ rh#talk6_monster
 SAY @92 /* A monster, am I? Fine. I'd normally wish you luck, but this once, I think perhaps I'll root for the dragons instead. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

AddJournalEntry(@89 /* A Game of Zhentarim Blackmail

After learning of Adrian's past connections, I decided that it would be best to part ways with the wizard. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",0) LeaveParty() ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END
END


// part 2: search the inns to figure out where she is

EXTEND_BOTTOM RIBALD 0
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#RibaldTanya
END

CHAIN RIBALD rh#RibaldTanya
@94 /* A Cyricist? Not the type of business I try to get involved in, though I may have heard of one haunting the Bridge District. She fits your description well enough. I'd say to be careful with that lot, but I think ye know that. */
EXIT

EXTEND_BOTTOM CROBAR01 0
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#CroBarTanya
END

CHAIN CROBAR01 rh#CroBarTanya
@95 /* Can't say that I have. We don't get lots of strangers around here. */
EXIT

EXTEND_BOTTOM BERNARD 22
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#BernardTanya
END

EXTEND_BOTTOM BERNARD 24
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#BernardTanya
END

CHAIN BERNARD rh#BernardTanya
@96 /* Ah, that Zhent. Aye, I been seein' her around a bit. Her type ain't welcome here... I'd be checkin' the Docks or the Bridge. An' keep in mind that whoever she's rentin' from might not be willin' to risk sellin' her out. Might want to check with the customers too. Especially them halflings, that lot knows everything. */
EXIT

EXTEND_BOTTOM BINNKEEP 0
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#DelosarTanya
END

CHAIN BINNKEEP rh#DelosarTanya
@97 /* Bah! I ain't got time to notice pretty girls, Cyricist or otherwise. Now get lost! */
EXIT

EXTEND_BOTTOM THUMB 0
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#ThumbTanya
END

EXTEND_BOTTOM THUMB 6
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#ThumbTanya
END

CHAIN THUMB rh#ThumbTanya
@98 /* Aye, the Thumb sees all types of things, but this lady of yours... Nay, I can't say that I have. I'll keep ye in mind the next time some Cyricists drop by, mate. */
EXIT

EXTEND_BOTTOM SEVBAR01 0
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#ValesTanya
END

EXTEND_BOTTOM SEVBAR01 1
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#ValesTanya
END

CHAIN SEVBAR01 rh#ValesTanya
@99 /* Yeah. I get tons of women in here, can't you see them all? I almost welcome a Cyricist as long as she were a lady. */
EXIT

EXTEND_BOTTOM WINNKEEP 0
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#MithrestTanya
END

CHAIN WINNKEEP rh#MithrestTanya
@100 /* At the Mithrest? No, <SIRMAAM>, we don't welcome Cyricists here. */
EXIT

EXTEND_BOTTOM FFBART 0
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#BartTanya
END

EXTEND_BOTTOM FFBART 8
	+ ~Global("rh#DamarovQuest","GLOBAL",2)~ + @93 /* I'm looking for a blonde woman who might be bearing the holy symbol of Cyric. Have you seen her around? */ + rh#BartTanya
END

CHAIN FFBART rh#BartTanya
@101 /* Ah, my friend, can't say that I have. Ah... no. Cyricists... Cyricists are bad news, friend. */
DO ~SetGlobal("rh#AdrianTanyaFiveFlagons","GLOBAL",1)~ 
EXIT

CHAIN IF WEIGHT #-1 ~Global("rh#DamarovQuest","GLOBAL",2) Global("rh#AdrianTanyaFiveFlagons","GLOBAL",1)~ THEN FFCUST08 ffcust08talks
@102 /* Hey! You were asking about that blonde lady, were you? A right witch, that one. She's staying here, sure as rain. First room on the left upstairs. */
DO ~SetGlobal("rh#AdrianTanyaFiveFlagons","GLOBAL",2)~
EXIT
 
// part 3, hunt down her associates

CHAIN IF WEIGHT #-1 ~Global("rh#DamarovQuest","GLOBAL",3)~ THEN RH#ADRJ rh#NoteQuest
@103 /* Good... very good. This is exactly what I was hoping to find. What did I say? Too stupid to commit anything to memory, that one. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @104 /* Perhaps you should be grateful that your organization as a rule attracts those who lack competence, Vasiliev. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @105 /* I'm grateful enough that I'll ignore that, Harper. */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID) OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @106 /* Marvelous, marvelous. I did not think I could be less impressed by your organization's competence... or lack thereof. What a pleasant surprise. */
== RH#ADRJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID) OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @107 /* Shut up, Edwin. */
== RH#ADRJ @108 /* Hmm. At least the notes themselves aren't written in the common tongue, though she didn't get particularly fancy in choosing a foreign language. Anyone halfway literate from anywhere north of the Dalelands could read this. */
= @109 /* It'll take me a couple of minutes to sift through it. I'd rather not wander off with the documents, so hopefully she won't be back in the meantime. She's likely too busy haunting the docks at this time of <DAYNIGHT>, though. */
DO ~TakePartyItem("rh#note") DestroyItem("rh#note") SetGlobal("rh#DamarovQuest","GLOBAL",4)~
END
 	++ @110 /* By all means, take your time. */ + rh#NoteQuest1
 	++ @111 /* If she does come back, it'll just be a busier night than we expected. */ + rh#NoteQuest1
	++ @112 /* I hope you're a quick reader. */ + rh#NoteQuest1
 	++ @113 /* Forget it. You've got your documents, now take care of this yourself. */ + rh#NoteQuest9
 
CHAIN RH#ADRJ rh#NoteQuest1
@114 /* Hmm. Let's see... dear Tanya really has been quite busy as of late. */
== RH#ADRJ IF ~Global("rh#Adrian_spydies","GLOBAL",2)~ THEN @115 /* Deryn is apparently staying at Delosar's Inn, Orlanna seems to be in the Copper Coronet, and Salka is over in the Sea Bounty. Ercias... well, I sent someone to kill the bastard last time we ran into him, so he won't be causing any problems anymore. It's just the other three, then. */
== RH#ADRJ IF ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias")~ THEN @116 /* Deryn is apparently staying at Delosar's Inn, Orlanna seems to be in the Copper Coronet, and Salka is over in the Sea Bounty. Ercias... well, Ercias seems to be right here in the Five Flagons as well. We might want to take care of him first. */
== RH#ADRJ IF ~Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias")~ THEN @117 /* Deryn is apparently staying at Delosar's Inn, Orlanna seems to be in the Copper Coronet, and Salka is over in the Sea Bounty. Ercias... well, he apparently disappeared soon after running into a certain Harper. No need to worry about him now. It's just the other three, then. */
== RH#ADRJ IF ~Dead("ercias") !Global("rh#Adrian_spydies","GLOBAL",2)~ THEN @118 /* Deryn is apparently staying at Delosar's Inn, Orlanna seems to be in the Copper Coronet, and Salka is over in the Sea Bounty. Ercias... well, as he's no longer living, he shouldn't be causing any problems. It's just the other three, then. */
== RH#ADRJ @119 /* Tanya's little birds. She's a damn fine cleric, but once we take care of the loose ends, we'll be able to eliminate her as well without having to worry about... unpleasant consequences. Granted, we'd best not wait too long after killing her pets before going after her. That gets dangerous. */
END
 	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @120 /* Consider it done. */ + rh#NoteQuest2
  	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias")~ + @120 /* Consider it done. */ + rh#NoteQuest3
 	++ @121 /* Right. So you want me to commit how many murders for you? */ + rh#NoteQuest4
  	++ @122 /* And if she has more associates than just these few? */ + rh#NoteQuest5
	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @123 /* Well, we've got the information now. We can deal with this when we find the time. */ + rh#NoteQuest6
	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias") ~ + @123 /* Well, we've got the information now. We can deal with this when we find the time. */ + rh#NoteQuest7
  	+ ~Global("LyrosJob","GLOBAL",3) !Global("HarperFight","GLOBAL",1)~ + @124 /* Can't we just give their names to the Harpers and let them deal with it? */ + rh#NoteQuest8
 	++ @125 /* Forget it. You have the information, now deal with this yourself. */ + rh#NoteQuest9

CHAIN RH#ADRJ rh#NoteQuest2
@126 /* I'll thank you in advance. Keep in mind, though, once we eliminate one of them, we're effectively running against the clock. */ 
DO ~AddJournalEntry(@127 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */,QUEST)~
EXIT

CHAIN RH#ADRJ rh#NoteQuest3
@128 /* Thank you, <CHARNAME>. Keep in mind, though, once we eliminate one of them, we're effectively running against the clock. */ 
DO ~AddJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */,QUEST)~ 
EXIT

CHAIN RH#ADRJ rh#NoteQuest4
@130 /* Five or six, depending on how many guards she has with her. */
= @131 /* They have a saying over in Shadowdale, <CHARNAME>: "Kill a Zhentarim on sight. He'd do the same for you." Not a sentiment I usually appreciate, but it's going to be them or me. If not now, then eventually. These aren't exactly innocent people. */
END
 	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @132 /* Fine. We'll take care of this. */ + rh#NoteQuest2
  	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias")~ + @132 /* Fine. We'll take care of this. */ + rh#NoteQuest3
  	++ @122 /* And if she has more associates than just these few? */ + rh#NoteQuest5
	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @123 /* Well, we've got the information now. We can deal with this when we find the time. */ + rh#NoteQuest6
	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias") ~ + @123 /* Well, we've got the information now. We can deal with this when we find the time. */ + rh#NoteQuest7
  	+ ~Global("LyrosJob","GLOBAL",3) !Global("HarperFight","GLOBAL",1)~ + @124 /* Can't we just give their names to the Harpers and let them deal with it? */ + rh#NoteQuest8
 	++ @133 /* And neither are you. You have the information, now deal with this yourself. */ + rh#NoteQuest9

CHAIN RH#ADRJ rh#NoteQuest5
@134 /* Then I'm likely to find myself in very, very big trouble. It's a risk we have to take, though. */
END
 	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @135 /* Then we'll take it. */ + rh#NoteQuest2
  	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias")~ + @135 /* Then we'll take it. */ + rh#NoteQuest3
 	++ @121 /* Right. So you want me to commit how many murders for you? */ + rh#NoteQuest4
	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @123 /* Well, we've got the information now. We can deal with this when we find the time. */ + rh#NoteQuest6
	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias") ~ + @123 /* Well, we've got the information now. We can deal with this when we find the time. */ + rh#NoteQuest7
  	+ ~Global("LyrosJob","GLOBAL",3) !Global("HarperFight","GLOBAL",1)~ + @124 /* Can't we just give their names to the Harpers and let them deal with it? */ + rh#NoteQuest8
 	++ @136 /* No, it's a risk *you* have to take. You have the information, now deal with this yourself. */ + rh#NoteQuest9

CHAIN RH#ADRJ rh#NoteQuest6
@137 /* Right. Of course. Still, unless you want to be paying her gold every ten days and hoping she doesn't change her mind about this... sooner would be better. But remember, once we eliminate one of them, we're effectively running against the clock. */
DO ~AddJournalEntry(@127 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */,QUEST)~ 
EXIT

CHAIN RH#ADRJ rh#NoteQuest7
@137 /* Right. Of course. Still, unless you want to be paying her gold every ten days and hoping she doesn't change her mind about this... sooner would be better. But remember, once we eliminate one of them, we're effectively running against the clock. */
DO ~AddJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */,QUEST)~ 
EXIT

CHAIN RH#ADRJ rh#NoteQuest8
@138 /* What!? As if I'd trust my life to Harper ineptitude. In any case, they'd probably want to kill me as well for good measure. */
END
 	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @135 /* Then we'll take it. */ + rh#NoteQuest2
  	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias")~ + @135 /* Then we'll take it. */ + rh#NoteQuest3
 	++ @121 /* Right. So you want me to commit how many murders for you? */ + rh#NoteQuest4
  	++ @122 /* And if she has more associates than just these few? */ + rh#NoteQuest5
	+ ~OR(3) Global("rh#ErciasDead","GLOBAL",1) Dead("ercias") Global("rh#Adrian_spydies","GLOBAL",2)~ + @139 /* Fine. We've got the information now. We can deal with this when we find the time. */ + rh#NoteQuest6
	+ ~!Global("rh#ErciasDead","GLOBAL",1) !Global("rh#Adrian_spydies","GLOBAL",2) !Dead("ercias") ~ + @140 /* Fine. We've got the information now. We can deal with this when we find the time.. */ + rh#NoteQuest7
 	++ @141 /* I can't say I blame them. You have the information, now deal with this yourself. */ + rh#NoteQuest9

CHAIN RH#ADRJ rh#NoteQuest9
@142 /* I... see. Well, don't expect to see me again, <CHARNAME>. I intend to get out of this country as soon as possible afterwards. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",22)
EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

AddJournalEntry(@143 /* A Game of Zhentarim Blackmail

While we have discovered the identities of Tanya Damarov's agents in Athkatla, I was not interested in undertaking the assassinations on Adrian's behest. He has left to handle this situation by himself. I don't expect to see him again. */,QUEST_DONE)
SetGlobal("RH#AdrianJoined","GLOBAL",0) LeaveParty() EscapeArea()~ 
EXIT
 
BEGIN RH#DERY
BEGIN RH#ORLA
BEGIN RH#SALK

CHAIN IF ~Global("rh#DerynSpeaks","GLOBAL",1) InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN RH#DERY rh#deryntalk
@144 /* By Cyric's black heart! Look, I'll cut ye a deal-- */
== RH#ADRJ @145 /* Sorry, Deryn. No deals. */
== RH#DERY @146 /* Godsdamn! Tanya shoulda just killed ye dead! */
DO ~AddJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */,QUEST)
SetGlobal("rh#DerynSpeaks","GLOBAL",2)
Enemy()~ 
EXIT

CHAIN IF ~Global("rh#DerynSpeaks","GLOBAL",1)~ THEN RH#DERY rh#deryntalk2
@146 /* Godsdamn! Tanya shoulda just killed ye dead! */
DO ~AddJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */,QUEST)
SetGlobal("rh#DerynSpeaks","GLOBAL",2)
Enemy()~ 
EXIT

CHAIN IF ~Global("rh#OrlannaSpeaks","GLOBAL",1)~ THEN RH#ORLA rh#orlannatalk
@148 /* You! Tanya's golden geese, is it? You should've taken the deal as was! */
DO ~AddJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */,QUEST)
SetGlobal("rh#OrlannaSpeaks","GLOBAL",2)
Enemy()~ 
EXIT
 
CHAIN IF ~Global("rh#SalkaSpeaks","GLOBAL",1)~ THEN RH#SALK rh#salkatalk
@150 /* What's this? Ye thought ye could outsmart us? */
DO ~AddJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */,QUEST)
SetGlobal("rh#SalkaSpeaks","GLOBAL",2)
Enemy()~
EXIT

CHAIN IF WEIGHT #-2 ~Global("rh#DamarovQuest","GLOBAL",4)~ THEN FFCUST01 rh#erciaskill
@152 /* You! Don't think I'll go easy! */
DO ~AddJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */,QUEST)
SetGlobal("rh#ErciasIsAnnoying","GLOBAL",1)
Enemy()~
EXIT

// part 4: kill Tanya

CHAIN IF WEIGHT #-1 ~Global("rh#DamarovQuest","GLOBAL",5)~ THEN RH#ADRJ rh#KillTanya
@154 /* Good. Now that that's taken care of, we'd best get back to the Five Flagons as quickly as possible and try to head her off. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",6) AddJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */,QUEST)~
EXIT

CHAIN IF ~Global("rh#DamarovQuest","GLOBAL",6)~ THEN RH#TANYA rh#TanyaFight
@156 /* I see that gracious gestures are wasted upon you, Vasiliev. */
== RH#ADRJ @157 /* I've nothing to say to you, Tanya. */
== RH#TANYA IF ~!Alignment(Player1,MASK_EVIL)~ THEN @158 /* And you, <CHARNAME>? Do you plan on risking your life for scum like this? He's no innocent bystander. */
== RH#TANYA IF ~Alignment(Player1,MASK_EVIL)~ THEN @159 /* And you, <CHARNAME>? You're no selfless crusader, no protector of the defenseless. */
== RH#TANYA @160 /* You would be smart to stay out of matters that don't concern you. */
END
	++ @161 /* I protect my friends. The rest doesn't matter. */ + rh#TanyaFight1
	++ @162 /* Your threats are empty, Tanya. This conversation is over. */ + rh#TanyaFight2
	++ @163 /* Well, I guess I've never been that smart. */ + rh#TanyaFight3
	++ @164 /* Perhaps you're right. */ + rh#TanyaFight4

CHAIN RH#TANYA rh#TanyaFight1
@165 /* Such an empty sentiment in the end. As you wish. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",7)~
EXIT

CHAIN RH#TANYA rh#TanyaFight2
@166 /* So brave, so foolish. As you wish. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",7)~
EXIT

CHAIN RH#TANYA rh#TanyaFight3
@167 /* That would explain a great deal. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",7)~
EXIT

CHAIN RH#TANYA rh#TanyaFight4
@168 /* A truth discovered far too late, <CHARNAME>. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",7)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("rh#DamarovQuest","GLOBAL",8)~ THEN RH#ADRJ rh#TanyaDead
@169 /* Hmm. And that's one less Cyricist in the world. Beautiful. I get tired of saying these two words, but... thank you, <CHARNAME>. Sincerely. */
= @170 /* With any luck, we won't have to worry about any subsequent visits. They'll probably notice the disappearance of agents in Athkatla eventually, but shall we blame it on Shadow Thieves or shall we blame it on Harpers? So many choices. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",9) AddexperienceParty(21250)~
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @171 /* You had best not be so brazen, Zhent. It is your own foolishness that led to this. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @172 /* Don't pretend you didn't enjoy it, Harper. */
= @173 /* As for the documents that the late Tanya Damarov left behind... it's a pity we don't have the sort of time to give them the attention they deserve. Smuggling, blackmail... but I'd hesitate to get involved with this city's underworld until it stabilizes a bit more. */
== RH#ADRJ IF ~!Global("WorkingForBodhi","GLOBAL",1)~ THEN @174 /* The Shadow Thieves will no doubt swallow up these operations soon enough anyway... best to help them along than hinder them. */
END
	+ ~!Global("WorkingForBodhi","GLOBAL",1)~ + @175 /* I do like the sound of potential profit. Hold onto those. */ + rh#TanyaDead1
	+ ~Global("WorkingForBodhi","GLOBAL",1)~ + @176 /* No doubt Bodhi will want those. */ + rh#TanyaDead1a
	+ ~Global("LyrosJob","GLOBAL",3) !Global("HarperFight","GLOBAL",1)~ + @177 /* I'm sure those papers will prove quite interesting to the Athkatlan Harpers. */ + rh#TanyaDead2
	++ @178 /* The magistrate will want to take a look at those papers. */ + rh#TanyaDead2
	++ @179 /* Start fooling around with former Zhentarim operations and you may very well get yourself noticed again. */ + rh#TanyaDead3
	++ @180 /* I've had enough of this. Leave those papers where you found them. */ + rh#TanyaDead4
	++ @181 /* Please tell me that there's no grand plot against Athkatla that we have to foil. */ + rh#TanyaDead5

APPEND RH#ADRJ

IF ~~ rh#TanyaDead1
 SAY @182 /* Gladly, my friend. */
IF ~~ DO ~GiveItemCreate("rh#note",Player1,1,0,0) SetGlobal("rh#DamaDocs","GLOBAL",1)~ + rh#TanyaDead6
END

IF ~~ rh#TanyaDead1a
 SAY @183 /* No doubt Bodhi already knows all about them. */
IF ~~ + rh#TanyaDead6
END

IF ~~ rh#TanyaDead2
 SAY @184 /* ...all things considered, I suppose I should have expected that. */
IF ~~ DO ~GiveItemCreate("rh#note",Player1,1,0,0) SetGlobal("rh#DamaDocs","GLOBAL",1)~ + rh#TanyaDead6
END

IF ~~ rh#TanyaDead3
 SAY @185 /* You... no, I can't really argue with that logic. We've invited enough attention as it is. */
IF ~~ + rh#TanyaDead6
END

IF ~~ rh#TanyaDead4
 SAY @186 /* Fine. I suppose we've invited enough attention as it is. */
IF ~~ + rh#TanyaDead6
END

IF ~~ rh#TanyaDead5
 SAY @187 /* Nothing quite that interesting, I'm afraid. But I think I'll pocket some of this information all the same. */
	++ @188 /* Please do so. I like the sound of potential profit. */ + rh#TanyaDead1
	++ @189 /* I think you'll hand them over to the authorities instead. */ + rh#TanyaDead2
	++ @179 /* Start fooling around with former Zhentarim operations and you may very well get yourself noticed again. */ + rh#TanyaDead3
	++ @180 /* I've had enough of this. Leave those papers where you found them. */ + rh#TanyaDead4
END

IF ~~ rh#TanyaDead6
 SAY @190 /* In any case... thank you, <CHARNAME>. Hopefully this is the last time I'll need to ask you for help. */
	++ @191 /* You're welcome. You don't honestly think I'm going to abandon you at the slightest hint of trouble, do you? */ + rh#TanyaDead7
	++ @192 /* I'll hardly complain about an opportunity to cleanse Athkatla of some of its less savory elements. */ + rh#TanyaDead8
	++ @193 /* All things considered, it was the least I could do. */ + rh#TanyaDead9
	++ @194 /* It had damn well better be. I'm not looking forward to nightly assassins. */ + rh#TanyaDead10
END

IF ~~ rh#TanyaDead7
 SAY @195 /* I... no. I suppose not. Let's just move on. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */) 

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@197 /* A Game of Zhentarim Blackmail

I have succeeded in eliminating Tanya Damarov, a priestess of Cyric and member of the Zhentarim. Adrian is reasonably confident that we will not need to deal with further pursuit. Time will only tell. */,QUEST_DONE)~ EXIT
END

IF ~~ rh#TanyaDead8
 SAY @198 /* Well, as long as I don't qualify, I won't complain. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@197 /* A Game of Zhentarim Blackmail

I have succeeded in eliminating Tanya Damarov, a priestess of Cyric and member of the Zhentarim. Adrian is reasonably confident that we will not need to deal with further pursuit. Time will only tell. */,QUEST_DONE)~ 
EXIT
END

IF ~~ rh#TanyaDead9
 SAY @199 /* I... suppose so. Let's just move on. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@197 /* A Game of Zhentarim Blackmail

I have succeeded in eliminating Tanya Damarov, a priestess of Cyric and member of the Zhentarim. Adrian is reasonably confident that we will not need to deal with further pursuit. Time will only tell. */,QUEST_DONE)~ EXIT
END

IF ~~ rh#TanyaDead10
 SAY @200 /* Hells, neither am I. */
IF ~~ DO ~EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@197 /* A Game of Zhentarim Blackmail

I have succeeded in eliminating Tanya Damarov, a priestess of Cyric and member of the Zhentarim. Adrian is reasonably confident that we will not need to deal with further pursuit. Time will only tell. */,QUEST_DONE)~ EXIT
END
END

// wrap-up

EXTEND_BOTTOM HABREGA 0
	+ ~Global("rh#DamaDocs","GLOBAL",1) PartyHasItem("rh#note")~ + @201 /* I have some information you might be interested in. */ + rh#ZhentInfoBrega
END

CHAIN HABREGA rh#ZhentInfoBrega
@202 /* I see. I was unaware that the Zhents operated within Athkatla, but it comes as no great surprise. I shall have these papers deciphered at once. My thanks, citizen. */
DO ~TakePartyItem("rh#note") DestroyItem("rh#note") GiveGoldForce(1000)~
EXIT

EXTEND_BOTTOM MERONIA 0
	+ ~Global("rh#DamaDocs","GLOBAL",1) PartyHasItem("rh#note")~ + @201 /* I have some information you might be interested in. */ + rh#ZhentInfoHarpers
END

CHAIN MERONIA rh#ZhentInfoHarpers
@203 /* Indeed... very interesting. You seem to tangle with the Black Network almost as much as we do, <CHARNAME>, but I will gladly take these documents. */
DO ~TakePartyItem("rh#note") DestroyItem("rh#note") GiveGoldForce(250)~ 
EXIT

EXTEND_BOTTOM RENAL 31
	+ ~Global("rh#DamaDocs","GLOBAL",1) PartyHasItem("rh#note")~ + @201 /* I have some information you might be interested in. */ + rh#ZhentInfoRenal
END

EXTEND_BOTTOM RENAL 33
	+ ~Global("rh#DamaDocs","GLOBAL",1) PartyHasItem("rh#note")~ + @201 /* I have some information you might be interested in. */ + rh#ZhentInfoRenal
END

EXTEND_BOTTOM RENAL 38
	+ ~Global("rh#DamaDocs","GLOBAL",1) PartyHasItem("rh#note")~ + @201 /* I have some information you might be interested in. */ + rh#ZhentInfoRenal
END

EXTEND_BOTTOM RENAL 40
	+ ~Global("rh#DamaDocs","GLOBAL",1) PartyHasItem("rh#note")~ + @204 /* I have some other information you might be interested in. */ + rh#ZhentInfoRenal
END

EXTEND_BOTTOM RENAL 109
	+ ~Global("rh#DamaDocs","GLOBAL",1) PartyHasItem("rh#note")~ + @201 /* I have some information you might be interested in. */ + rh#ZhentInfoRenal
END

CHAIN IF WEIGHT #-1 ~Global("RenalJob","GLOBAL",4) Global("rh#DamaDocs","GLOBAL",1) !Global("Chapter","GLOBAL",%bg2_chapter_6%) PartyHasItem("rh#note")~ THEN RENAL rh#ZhentInfoRenal2
@205 /* Well, if it isn't my old friend <CHARNAME>. I can always tell when someone has good news for me, you know. */
END
	++ @206 /* I don't have anything to tell you. */ + rh#ZhentInfoBegone
	++ @201 /* I have some information you might be interested in. */ + rh#ZhentInfoRenal

CHAIN RENAL rh#ZhentInfoRenal
@207 /* So you do... as if matters weren't already complicated enough. My thanks, <CHARNAME>, and have some gold for your trouble. */
DO ~TakePartyItem("rh#note") DestroyItem("rh#note") GiveGoldForce(2000)~ 
EXIT

CHAIN RENAL rh#ZhentInfoBegone
@208 /* I see. Then I trust you can find your own way out. */
EXIT

// if you betray him

CHAIN IF ~Global("rh#DamarovBetrayed","GLOBAL",1)~ THEN RH#TANYA rh#DamarovBetrayed
@209 /* Not exactly the result I had hoped for, but a pleasant one all the same. I suggest you keep out of my way in the future, <CHARNAME>. */
DO ~ActionOverride("rh#Tanya",EscapeArea())~ 
EXIT

// if broken

CHAIN IF WEIGHT #-1 ~Global("rh#DamarovQuest","GLOBAL",21)~ THEN RH#ADRJ rh#TanyaQuestBroken
@210 /* <CHARNAME>, I... hells, <PRO_MANWOMAN>, I asked you *not* to! */
= @211 /* I can't stay here. Not if her threats are true. I'm sorry. */
DO ~SetGlobal("RH#AdrianJoined","GLOBAL",0) ActionOverride("rh#Adrian",LeaveParty()) ActionOverride("rh#Adrian",EscapeArea())~
EXIT

// timer

CHAIN IF WEIGHT #-1 ~Global("rh#DamarovTimerRuns","GLOBAL",2)~ THEN RH#ADRJ rh#TanyaQuestTimer1
@212 /* I hope I don't have to remind you that we need to finish this job... and Tanya... as soon as possible? */
DO ~SetGlobal("rh#DamarovTimerRuns","GLOBAL",3)
SetGlobalTimer("rh#AdrianDamarovSpyTimer","GLOBAL",ONE_DAY)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("rh#DamarovTimerRuns","GLOBAL",4)~ THEN RH#ADRJ rh#TanyaQuestTimer2
@213 /* Dammit, <CHARNAME>, didn't I say that time was of the essence? */
= @214 /* I can't stay here. Not... after this. I'm sorry. */
DO ~SetGlobal("RH#AdrianJoined","GLOBAL",0) 
SetGlobal("rh#DamarovTimerRuns","GLOBAL",3)

EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */) 

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@215 /* A Game of Zhentarim Blackmail

It seems that I have waited too long to eliminate Adrian's old enemies. I am unlikely to see him again. */,QUEST_DONE)

ActionOverride("rh#Adrian",LeaveParty()) ActionOverride("rh#Adrian",EscapeArea())~ 
EXIT

// every ten days (chapters 2-3)

CHAIN IF ~Global("rh#DamarovQuest","GLOBAL",2) Global("rh#DamarovReturns","GLOBAL",3)~ THEN RH#TANYA rh#TanyaReturns
@216 /* Well, what a coincidence. I hope you know how this works by now, <CHARNAME>. */
END
	+ ~PartyGoldGT(999)~ + @217 /* 1000 gold and you'll leave us alone a while longer. Here. */ EXTERN RH#TANYA rh#TanyaReturns1
	+ ~PartyGoldGT(999)~ + @218 /* Fine. You can have the money again, but don't expect this to last forever. */ EXTERN RH#TANYA rh#TanyaReturns2
	+ ~PartyGoldLT(1000)~ + @219 /* I don't have the money. */ EXTERN RH#TANYA rh#TanyaReturns3
	++ @220 /* I'm not doing this again. Just take him. */ EXTERN RH#ADRJ rh#TanyaReturns4
	++ @221 /* I think I'd rather just kill you here. */ EXTERN RH#TANYA rh#TanyaReturns5

CHAIN RH#TANYA rh#TanyaReturns1
@222 /* I knew you'd be a good investment. A pleasure, as always. */
DO ~SetGlobal("rh#DamarovReturns","GLOBAL",1) TakePartyGold(1000) ActionOverride("RH#TANYA",EscapeArea()) SetGlobalTimer("rh#DamarovReturnsTimer","GLOBAL",TEN_DAYS)~
EXIT

CHAIN RH#TANYA rh#TanyaReturns2
@223 /* So you say. A pleasure, as always. */
DO ~SetGlobal("rh#DamarovReturns","GLOBAL",1) TakePartyGold(1000) ActionOverride("RH#TANYA",EscapeArea()) SetGlobalTimer("rh#DamarovReturnsTimer","GLOBAL",TEN_DAYS)~
EXIT

CHAIN RH#TANYA rh#TanyaReturns3
@224 /* You knew the terms of our agreement, <CHARNAME>. */
= @225 /* Very well. I suppose I shall have to simply take my pick of whatever magical items I find on your corpses. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",20) ActionOverride("RH#TANYA",Enemy()) 
ActionOverride("RH#TANYA",SetGlobal("rh#enemies","LOCALS",1))
EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */) 

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@226 /* A Game of Zhentarim Blackmail

I have ceased paying Adrian's old associate, Tanya Damarov. Adrian does not look particularly happy about the circumstances. */,QUEST_DONE)~ 
EXIT

CHAIN RH#ADRJ rh#TanyaReturns4
@41 /* <CHARNAME>, I swear you'll regret this-- */
== RH#TANYA @42 /* It seems that you should choose your friends better, Adrian. But then, why start now? */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",22) 
EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@227 /* A Game of Zhentarim Blackmail

I have finally surrendered Adrian to his former associates. I expect no more trouble from these people. */,QUEST_DONE)
SetGlobal("RH#AdrianJoined","GLOBAL",0) ActionOverride("rh#Adrian",LeaveParty()) StartCutSceneMode() StartCutScene("rh#cut2")~ 
EXIT 

CHAIN RH#TANYA rh#TanyaReturns5
@228 /* A pity. Very well. I suppose I shall have to simply take my pick of whatever magical items I find on your corpses. */
DO ~SetGlobal("rh#DamarovQuest","GLOBAL",20) ActionOverride("RH#TANYA",Enemy()) 
ActionOverride("RH#TANYA",SetGlobal("rh#enemies","LOCALS",1))
EraseJournalEntry(@32 /* A Game of Zhentarim Blackmail

I have had the misfortune of meeting a former associate of Adrian's, a priestess of Cyric called Tanya Damarov. It seems that as a renegade member of the notorious Zhentarim, Adrian has a colorful past indeed. Tanya has threatened to inform his former masters of his whereabouts and is now blackmailing me with this information. Hopefully a plan aside from continuing to pay her off will present itself. */)

EraseJournalEntry(@84 /* A Game of Zhentarim Blackmail

Adrian has explained that Tanya Damarov keeps extensive personal notes on her affairs: an unfortunate habit for one supposedly involved in espionage, but an easy one to turn to our advantage. I will need to check with various innkeepers to find out where she is staying; I doubt Adrian will be of much use until this matter is settled. */)

EraseJournalEntry(@196 /* A Game of Zhentarim Blackmail

After having a chance to look through Talia's documents, Adrian has identified three agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, and Salka is in the Sea Bounty. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@129 /* A Game of Zhentarim Blackmail

After having a chance to look through Tanya's documents, Adrian has identified four agents: Deryn is in Delosar's Inn, Orlanna is in the Copper Coronet, Salka is in the Sea Bounty, and Ercias is just down the hall in the Five Flagons. Once I kill one of them, I will have to eliminate the others in short order before Tanya has a chance to realize what is happening. */)

EraseJournalEntry(@147 /* A Game of Zhentarim Blackmail

I've killed Deryn, one of the Zhentarim agents. */)

EraseJournalEntry(@149 /* A Game of Zhentarim Blackmail

I've killed Orlanna, one of the Zhentarim agents. */)

EraseJournalEntry(@151 /* A Game of Zhentarim Blackmail

I've killed Salka, one of the Zhentarim agents. */)

EraseJournalEntry(@153 /* A Game of Zhentarim Blackmail

I've killed Ercias, one of the Zhentarim agents. */)

EraseJournalEntry(@155 /* A Game of Zhentarim Blackmail

Now that the spies are all dead, Adrian has suggested we return to the Five Flagons to eliminate Tanya. Hopefully she'll be around at this time of <DAYNIGHT>. */)

AddJournalEntry(@226 /* A Game of Zhentarim Blackmail

I have ceased paying Adrian's old associate, Tanya Damarov. Adrian does not look particularly happy about the circumstances. */,QUEST_DONE)~ EXIT


BEGIN RH#SGYL

// meeting: he should turn up right when you leave the High Merchant's place after finishing the Trademeet quests.

CHAIN IF ~Global("rh#SoargylEncounter","GLOBAL",1)~ THEN RH#SGYL soargyl1.1
@229 /* And here they are: the heroes of Trademeet. */
= @230 /* You seem to be on the wrong side of this altercation, Adrian. I would have expected to find you harming merchants instead. */
== RH#ADRJ @231 /* Talsar Soargyl... and so far from home. Exile becomes you, apparently. What is this, cloth of gold? */
== RH#SGYL @232 /* Naturally. Though mud-soaked adventuring garb seems to suit you more than I would have expected. */
== RH#ADRJ @233 /* As does the loot and magic that goes with it... but I'm sure you didn't approach us simply for conversation, Soargyl. What do you want? */
== RH#SGYL @234 /* I have an offer for you, if you would care to take it. I had a deal pending with a Calishite merchant before the genies took over... obviously, the particulars are not meant for public ears. */
== RH#ADRJ @235 /* I fail to see how your former deals are remotely relevant. */
== RH#SGYL @236 /* I am not entirely convinced as to my partner's... sincerity, shall we say. You know how Calishites are. */
== RH#ADRJ @237 /* I know how Sembians can be also. */
== RH#SGYL @238 /* Yes... that is, of course, where you come in. */
= @239 /* I assure you, my <PRO_LADYLORD> <CHARNAME>, the pay will be most adequate. Now, if you would follow me to my home, where we could discuss it in further detail? */
DO ~SetGlobal("rh#SoargylEncounter","GLOBAL",2)~
END
	++ @240 /* The pay had better be adequate. */ EXTERN RH#SGYL soargyl1.2
	++ @241 /* I'll at least listen to what you have to say. */ EXTERN RH#SGYL soargyl1.3
	++ @242 /* You know this man, Adrian. What do you think? */ EXTERN RH#ADRJ soargyl1.4
	++ @243 /* I want nothing to do with you or your deals. */ EXTERN RH#SGYL soargyl1.5

CHAIN RH#SGYL soargyl1.2
@244 /* I am a wealthy man, <CHARNAME>. You have nothing to worry about. */
DO ~FadeToColor([20.0],0)
            Wait(2)
            ActionOverride("RH#SGYL",LeaveAreaLUA("RH#AD1","",[939.461],8))
            ActionOverride(Player1,LeaveAreaLUA("RH#AD1","",[887.490],8))
            ActionOverride(Player2,LeaveAreaLUA("RH#AD1","",[922.399],8))
            ActionOverride(Player3,LeaveAreaLUA("RH#AD1","",[969.506],8))
            ActionOverride(Player4,LeaveAreaLUA("RH#AD1","",[874.451],8))
            ActionOverride(Player5,LeaveAreaLUA("RH#AD1","",[853.401],8))
            ActionOverride(Player6,LeaveAreaLUA("RH#AD1","",[894.512],8))~
EXIT

CHAIN RH#SGYL soargyl1.3
@245 /* I am certain you will find it very enriching. */
DO ~FadeToColor([20.0],0) 
            Wait(2)
            ActionOverride("RH#SGYL",LeaveAreaLUA("RH#AD1","",[939.461],8))
            ActionOverride(Player1,LeaveAreaLUA("RH#AD1","",[887.490],8))
            ActionOverride(Player2,LeaveAreaLUA("RH#AD1","",[922.399],8))
            ActionOverride(Player3,LeaveAreaLUA("RH#AD1","",[969.506],8))
            ActionOverride(Player4,LeaveAreaLUA("RH#AD1","",[874.451],8))
            ActionOverride(Player5,LeaveAreaLUA("RH#AD1","",[853.401],8))
            ActionOverride(Player6,LeaveAreaLUA("RH#AD1","",[894.512],8))~
EXIT

CHAIN RH#ADRJ soargyl1.4
@246 /* He's a cunning bastard, and I don't say that lightly. I'd hate to leave business unfinished, but I'll warn you to step carefully. */ 
== RH#SGYL @247 /* What do you say, <CHARNAME>? */
END
	++ @240 /* The pay had better be adequate. */ EXTERN RH#SGYL soargyl1.2
	++ @241 /* I'll at least listen to what you have to say. */ EXTERN RH#SGYL soargyl1.3
	++ @243 /* I want nothing to do with you or your deals. */ EXTERN RH#SGYL soargyl1.5

CHAIN RH#SGYL soargyl1.5
@248 /* No? A pity. If you change your mind, you may be able to find me in the tavern. */
DO ~SetGlobal("rh#SoargylReconsider","GLOBAL",1)
EscapeAreaMove("AR2010",664,629,6) AddJournalEntry(@249 /* Always Even in the End

Talsar Soargyl, a Trademeet merchant, wishes to do business with me. I turned him down, though I may find him in the tavern if I change my mind. */,QUEST)~
EXIT

// once in his home: probably just copying the Lurraxol estate would be best. Toss some guards in, since he's out for blood. I guess have the exit just lead to the front of one of the non-enterable buildings (at least, I think there are some in Trademeet).

CHAIN IF ~Global("rh#SoargylFight","GLOBAL",1)~ THEN RH#SGYL soargyl2.1
@250 /* The sweet sound of profit and you just come running, don't you? I shouldn't be surprised. */
== RH#ADRJ @251 /* That's a little bit hypocritical, wouldn't you agree? */
== RH#SGYL @252 /* Five years I've waited for this, Adrian. Five years. You used me... lured me into your nest of lies and then stabbed me in the back when you were done with me. Don't think I didn't find out exactly what went wrong. */
== RH#ADRJ @253 /* You were greedy, Soargyl. And stupid. That tends to be a tragic combination. */
== RH#SGYL @254 /* I thought at first that the Foxmantles had put you up to it... to eliminate a rival, but they knew nothing about it, did they? What game were you playing? */
== RH#ADRJ @255 /* I would tell you, but... well, you know how the cliche goes. Granted, I intend to kill you anyway. */
== RH#SGYL @256 /* Do you? And do these friends of yours intend to help? */
DO ~SetGlobal("rh#SoargylFight","GLOBAL",2)~
END
	++ @257 /* I'm not going to take on every enemy you've ever made, Adrian. You're on your own. */ EXTERN RH#ADRJ soargyl2.2
	++ @258 /* When a man lures me into a trap, I don't let him walk away. */ EXTERN RH#SGYL soargyl2.3
	++ @259 /* You'll be dead before he finishes casting his first spell. */ EXTERN RH#SGYL soargyl2.3
	++ @260 /* Whatever happened is in the past. This doesn't have to end in bloodshed. */ EXTERN RH#SGYL soargyl2.4

CHAIN RH#ADRJ soargyl2.2
@261 /* In that case, pardon me for not bothering to stay. */
DO ~EraseJournalEntry(@249 /* Always Even in the End

Talsar Soargyl, a Trademeet merchant, wishes to do business with me. I turned him down, though I may find him in the tavern if I change my mind. */)

AddJournalEntry(@262 /* Always Even in the End

One of the merchants in Trademeet was less pleased with my intervention than he might have been. Talsar Soargyl, an exiled Sembian, planned to ambush us for harboring Adrian, an old enemy of his. I had no interest in getting involved. */,QUEST_DONE)
SetGlobal("RH#AdrianJoined","GLOBAL",0) SetGlobal("rh#SoargylBetrayed","GLOBAL",1) LeaveParty()  ForceSpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN RH#SGYL soargyl2.3
@263 /* We shall see about that. */
DO ~SetGlobal("rh#SoargylFight","GLOBAL",3) EraseJournalEntry(@249 /* Always Even in the End

Talsar Soargyl, a Trademeet merchant, wishes to do business with me. I turned him down, though I may find him in the tavern if I change my mind. */)

AddJournalEntry(@264 /* Always Even in the End

One of the merchants in Trademeet was less pleased with my intervention than he might have been. Talsar Soargyl, an exiled Sembian, ambushed us for harboring Adrian, an old enemy of his. Whatever passed between them, it is in the past now. */,QUEST_DONE)~
EXIT

CHAIN RH#SGYL soargyl2.4
@265 /* I'm afraid that it does. */
DO ~SetGlobal("rh#SoargylFight","GLOBAL",3) EraseJournalEntry(@249 /* Always Even in the End

Talsar Soargyl, a Trademeet merchant, wishes to do business with me. I turned him down, though I may find him in the tavern if I change my mind. */)

AddJournalEntry(@264 /* Always Even in the End

One of the merchants in Trademeet was less pleased with my intervention than he might have been. Talsar Soargyl, an exiled Sembian, ambushed us for harboring Adrian, an old enemy of his. Whatever passed between them, it is in the past now. */,QUEST_DONE)~
EXIT

// if you betray him

CHAIN IF ~Global("rh#SoargylBetrayed","GLOBAL",2)~ THEN RH#SGYL soargyl2.5
@266 /* Cowardly to the end, I see. I have no further use for you, <CHARNAME>. I am certain you can find your own way out. */
DO ~SetGlobal("rh#SoargylBetrayed","GLOBAL",3)~
EXIT

// after battle

CHAIN IF WEIGHT #-1 ~Global("rh#SoargylAftermath","GLOBAL",1)~ THEN RH#ADRJ soargyl3.1
@267 /* I didn't remember him being quite so gifted at necromancy. Five years ago he could hardly manage parlor tricks. */
DO ~SetGlobal("rh#SoargylAftermath","GLOBAL",2)~
END
	++ @268 /* What exactly did you do to him? */ EXTERN RH#ADRJ soargyl3.2
	++ @269 /* You consider that gifted? He went down easily enough. */ EXTERN RH#ADRJ soargyl3.3
	++ @270 /* How do you intend to explain this to the High Merchant? */ EXTERN RH#ADRJ soargyl3.4
	++ @271 /* I don't appreciate having to murder everyone you've ever crossed. */ EXTERN RH#ADRJ soargyl3.5
	++ @272 /* I take it you saw that coming? */ EXTERN RH#ADRJ soargyl3.6

CHAIN RH#ADRJ soargyl3.2
@273 /* He was... a convenient victim, shall we say. Sembia is full of men like that if you know how to play them. */
= @274 /* Regardless, we probably should get out of here. If you want the details, you can ask later. */
EXIT

CHAIN RH#ADRJ soargyl3.3
@275 /* Compared to cantrips, that was impressive. I suppose that even for the hopelessly foolish, rage and vengeance are great motivators. */
= @274 /* Regardless, we probably should get out of here. If you want the details, you can ask later. */
EXIT

CHAIN RH#ADRJ soargyl3.4
@276 /* I doubt Talsar would be the first Sembian outlaw to turn up dead. They tend to be quite good at that. */
= @274 /* Regardless, we probably should get out of here. If you want the details, you can ask later. */
EXIT

CHAIN RH#ADRJ soargyl3.5
@277 /* I can't say that I'm surprised that he still held that grudge, but I honestly didn't expect to see him here, <CHARNAME>. I would have been more careful otherwise. */
= @274 /* Regardless, we probably should get out of here. If you want the details, you can ask later. */
EXIT

CHAIN RH#ADRJ soargyl3.6
@278 /* Well, I certainly didn't want to murder him in the middle of the street. */
= @274 /* Regardless, we probably should get out of here. If you want the details, you can ask later. */
EXIT

// if you return later

CHAIN IF ~Global("rh#SoargylReconsider","GLOBAL",1)~ THEN RH#SGYL soargyl4.1
@279 /* Have you reconsidered, my <PRO_LADYLORD>? */
DO ~SetGlobal("rh#SoargylReconsider","GLOBAL",0)~ 
END
	++ @280 /* I have. The pay had better be adequate. */ EXTERN RH#SGYL soargyl1.2
	++ @241 /* I'll at least listen to what you have to say. */ EXTERN RH#SGYL soargyl1.3
	++ @242 /* You know this man, Adrian. What do you think? */ EXTERN RH#ADRJ soargyl4.2
	++ @281 /* I still want nothing to do with you or your deals. */ EXTERN RH#SGYL soargyl4.3

CHAIN RH#ADRJ soargyl4.2
@246 /* He's a cunning bastard, and I don't say that lightly. I'd hate to leave business unfinished, but I'll warn you to step carefully. */ 
== RH#SGYL @247 /* What do you say, <CHARNAME>? */
END
	++ @240 /* The pay had better be adequate. */ EXTERN RH#SGYL soargyl1.2
	++ @241 /* I'll at least listen to what you have to say. */ EXTERN RH#SGYL soargyl1.3
	++ @243 /* I want nothing to do with you or your deals. */ EXTERN RH#SGYL soargyl4.3

CHAIN RH#SGYL soargyl4.3
@282 /* A pity. You know where to find me should you change your mind. */
DO ~SetGlobal("rh#SoargylReconsider","GLOBAL",1)~ EXIT