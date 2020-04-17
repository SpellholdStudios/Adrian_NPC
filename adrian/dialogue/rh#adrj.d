// J FILE

// 1. Tracked dialogue
// 2. Plot related dialogue
// 3. Romance conflicts
// 4. Flirts
// 5. Interjections
// 6. Player initiated dialogue

BEGIN RH#ADRJ

// TRACKED DIALOGUE

// 1. (first rest)
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",2)~ THEN RH#ADRJ rh#talk1
@0 /* Hells, I haven't had a decent glass of wine in months. Or any glass of wine, for that matter. I was lucky when those duergar, may they rot in the Abyss, were willing to give me water. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
= @1 /* I'm grabbing a table in the back corner over there. You're welcome to join me, if you'd like. */
END
	++ @2 /* I did intend to celebrate our escape, and this is as good a way as any. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk1_celebrate
	++ @3 /* The back corner? Can't you at least choose a table with a bit more light and a few less rats? */ + rh#talk1_rats
	++ @4 /* By the looks of this place, I think you won't be getting your decent glass of wine just yet. Nor am I taking you to every tavern in the city. */ + rh#talk1_inn
	++ @5 /* I'm way ahead of you. I've already bought every vintage in the inn. Calishite, Tethyrian, Chessentan... there's this local Amnish ale if you'd like something more bitter. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk1_bitter
	++ @6 /* You're not going to get drunk and accidentally turn us all into mice or something, are you? */ + rh#talk1_mice
	++ @7 /* We don't have time for this nonsense, Adrian. We need to find Imoen and Irenicus. */ + rh#talk1_oneday

APPEND RH#ADRJ

IF ~~ rh#talk1_celebrate
 SAY @8 /* I'd prefer dancing on Irenicus' grave, but I doubt we're going to get to do that anytime soon. */
IF ~~ + rh#talk1_main1
END

IF ~~ rh#talk1_rats
 SAY @9 /* Yes, let's take a table in the middle of the room with potential cutthroats all around. A brilliant plan, <CHARNAME>. */
IF ~~ + rh#talk1_main1
END

IF ~~ rh#talk1_inn
 SAY @10 /* I don't see why not. It's one of the better ways of acquiring information, especially in situations such as this. */
IF ~~ + rh#talk1_main1
END

IF ~~ rh#talk1_bitter
 SAY @11 /* Keep it. I've had enough of bitter for the moment. */
IF ~~ + rh#talk1_main1
END

IF ~~ rh#talk1_mice
 SAY @12 /* What? No. I've always been more of an enchanter and a pyromaniac than a transmuter anyway. */
 = @13 /* Relax, <CHARNAME>. I'm not going to burn the tavern down... as much as I might want to. */
IF ~~ + rh#talk1_main1
END

IF ~~ rh#talk1_oneday
 SAY @14 /* One <DAYNIGHT> is hardly going to make a difference. With any luck, they'll still be in the Cowled Wizard's hands. Are you coming? */
	++ @15 /* Oh, alright. */ + rh#talk1_main1
	++ @16 /* Not a chance. */ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk1_main1
 SAY @17 /* Hmm. This Tethyrian vintage is better than I remembered. And... mmm. Perhaps a bit stronger. The setting may leave quite a bit to be desired, but we might as well do this properly. */
 = @18 /* A toast, my <PRO_LADYLORD>? To vengeance. Vengeance fitting enough to make the lady Loviatar smile. */
 	++ @19 /* I'll drink to that. We've certainly paid in advance. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk1_paid
 	++ @20 /* I'd rather not draw the attention of any *more* dark gods, Adrian. */ + rh#talk1_darkgods
 	++ @21 /* I'd rather raise a glass for justice, and ask for Tyr's blessing instead. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk1_darkgods
	++ @22 /* And to freedom; may we cling to it better this time than we did before. */ + rh#talk1_free
	++ @23 /* And to the fallen: friends who are lost but never forgotten. */ + rh#talk1_free
	++ @24 /* That's quite enough wine for you. I'm out of here. */ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk1_paid
 SAY @25 /* True enough. Well, we'll find the bastard. And your girl. Speaking of which... */
IF ~~ + rh#talk1_main2
END

IF ~~ rh#talk1_darkgods
 SAY @26 /* Hmm. Suit yourself. I still want him dead. As for that girl of yours... */
IF ~~ + rh#talk1_main2
END

IF ~~ rh#talk1_free
 SAY @27 /* We'll find your girl too. Speaking of which... */
IF ~~ + rh#talk1_main2
END

IF ~~ rh#talk1_main2
 SAY @28 /* You and she seemed very, ah... */
	++ @29 /* Close? She's my oldest friend and has been with me through this whole mess. Losing her now... */ + rh#talk1_close
	++ @30 /* Close? She was like a sister to me. If I have to tear the Realms apart to find her again, I will. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk1_tearapart
	++ @31 /* We grew up together, and I've tried to keep her out of trouble so far. Why stop now? */ + rh#talk1_supposeso
	++ @32 /* Dysfunctional? She may be aggravating as can be, but family is still family, and I ought to bail her out. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk1_family
	++ @33 /* Dysfunctional? You don't know the half of it. I'd happily leave the idiotic girl to rot, but I will find Irenicus. */ + rh#talk1_findirenicus
END

IF ~~ rh#talk1_close
 SAY @34 /* And on the brink of freedom, no less. */
IF ~~ + rh#talk1_main3
END

IF ~~ rh#talk1_tearapart
 SAY @35 /* And I can just imagine the songs the bards would sing: love and destruction, painted in black and white. */
IF ~~ + rh#talk1_main3
END

IF ~~ rh#talk1_family
 SAY @36 /* That's admirable, I suppose. When your family is worth the trouble. */
IF ~~ + rh#talk1_main3
END

IF ~~ rh#talk1_findirenicus
 SAY @37 /* And where one is, the other shall be as well. */
IF ~~ + rh#talk1_main3
END

IF ~~ rh#talk1_supposeso
 SAY @38 /* That's fair enough, I suppose. */
IF ~~ + rh#talk1_main3
END

IF ~~ rh#talk1_main3
 SAY @39 /* I... should thank you, <CHARNAME>. Properly. There are only so many times I can say it before wanting to choke on my own tongue, but... you saved my life. I won't forget that. */
	++ @40 /* Don't worry about it. */ + rh#talk1_regardless
	++ @41 /* It's not a big deal. Sometimes people simply need help. */ + rh#talk1_damsel
	++ @42 /* You needn't thank me at all. It's what anyone would have done. */ + rh#talk1_damsel
	++ @43 /* I expect you to make it up to me. */ + rh#talk1_payback
	++ @44 /* I don't care for your gratitude one way or the other. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk1_lolevil
	++ @45 /* I'm sure I could think of several ways you could repay the favor. */ + rh#talk1_ohgodwat
END

IF ~~ rh#talk1_regardless
 SAY @46 /* Regardless, I fully intend to repay the debt. You have my services, at least until the mage and your friend are recovered. */
IF ~~ + rh#talk1_enough
END

IF ~~ rh#talk1_payback
 SAY @47 /* I fully intend to. You have my services, at least until the mage and your friend are recovered. */
IF ~~ + rh#talk1_enough
END

IF ~~ rh#talk1_lolevil
 SAY @48 /* ...indeed. Regardless, a promise is a promise. You have my services, at least until the mage and your friend are recovered. */
IF ~~ + rh#talk1_enough
END

IF ~~ rh#talk1_ohgodwat
 SAY @49 /* I'm... sure you could. Regardless, you have my services, at least until the mage and your friend are recovered. */
IF ~~ + rh#talk1_enough
END

IF ~~ rh#talk1_enough
 SAY @50 /* Enough wine for now, I think. If you'll excuse me, I'd like to look into this wretched place's bathing facilities anyway. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk1_damsel
 SAY @51 /* Right. Well, if you intend to get distracted by every damsel in distress, I do hope you remember that Irenicus and Imoen are still out there. */
 = @52 /* You can go back to chasing your windmills and whatever else it is that you do after this mess is resolved. */
	++ @53 /* I can already tell that you're going to be a delight to have around. */ + rh#talk1_delight
	++ @54 /* Hey! There's never been a better season for windmill tilting! */ + rh#talk1_tilting
	++ @55 /* A damsel in distress, are we now? Well, you look the part, I suppose, but I think next time I'll let the evil wizard keep you. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk1_distress
	++ @56 /* I don't see why I can't do both at the same time. */ + rh#talk1_both
	++ @57 /* I came here to share a drink with you, not get insulted for saving your life. I expect at least a modicum of respect. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk1_respect
END

IF ~~ rh#talk1_delight
 SAY @58 /* I do work at it. If you'll excuse me, I'd like to look into this wretched place's bathing facilities. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk1_tilting
 SAY @59 /* Ha! Fine. Tilt away, my <PRO_LADYLORD>. If you'll excuse me, I'd like to look into this wretched place's bathing facilities. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk1_distress
 SAY @60 /* Ha! Heavens know, I've never quite had a knight in shining armor before, my <PRO_LADYLORD>, but at least I managed to land one with some wit. */
 = @61 /* If you'll excuse me, I think I'd like to look into washing the grime out of my...long black locks, as you put it. Then we can get back to saving all the damsels you want. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk1_both
 SAY @62 /* Wonderful. If you'll excuse me, I'd like to look into this wretched place's bathing facilities. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk1_respect
 SAY @63 /* You have my gratitude, <CHARNAME>. More than that... well, I suppose we'll have to see. */
 = @64 /* If you'll excuse me, I think I'd like to look into washing off the grime of several months of imprisonment. Then you can save all the damsels you want. */
IF ~~ DO ~RestParty()~ EXIT
END
END

// 2.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",4)~ THEN RH#ADRJ rh#talk2
@65 /* You seem to make a habit of attracting powerful attention, <CHARNAME>. Dangerous attention. First Irenicus, now Gaelan Bayle and his shadowy organization. It's quite the talent. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @66 /* Does this amuse you? */ + rh#talk2_intrigue1
	++ @67 /* What do you think of Gaelan Bayle? */ + rh#talk2_gaelan1
	++ @68 /* Any idea who he's working for? */ + rh#talk2_amateurs
	+ ~OR(2) CheckStatGT(Player1,14,INT) CheckStatGT(Player1,14,WIS)~ + @69 /* His shadowy organization... I assume you're thinking what I'm thinking. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk2_totallynotpsychic
	++ @70 /* Stick to the magic, Adrian. I'm capable of handling the rest. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk2_damnwell

APPEND RH#ADRJ

IF ~~ rh#talk2_damnwell
 SAY @71 /* For all of our sakes, and little Imoen's as well, you damn well better be. */
IF ~~ EXIT
END

IF ~~ rh#talk2_intrigue1
 SAY @72 /* I enjoy a good intrigue. Heavens know, I was raised on the stuff. I haven't much else going for me at the moment, so I'll take what I can get. As for our dear friend Master Bayle... */
IF ~~ + rh#talk2_shadowthief
END

IF ~~ rh#talk2_amateurs
 SAY @73 /* It's pretty obvious, I should think. */
IF ~~ + rh#talk2_gaelan2
END

IF ~~ rh#talk2_totallynotpsychic
 SAY @74 /* Most likely. */
IF ~~ + rh#talk2_gaelan2
END

IF ~~ rh#talk2_gaelan1
 SAY @75 /* He's a complete idiot. */
IF ~~ + rh#talk2_gaelan2
END

IF ~~ rh#talk2_gaelan2
 SAY @76 /* There's nothing quite like an incompetent attempt at subterfuge to give yourself away, and nothing screams Shadow Thief like a mindless obsession with secrecy. */
 = @77 /* Everyone knows who rules the Amnish underground. His masters, I assume, are considerably more interesting than he himself, but then masters usually are. */ 
 = @78 /* That they would so quickly take an interest in you, <CHARNAME>... that's intriguing. */
	++ @79 /* What is this, a game to you? */ + rh#talk2_intrigue2
	++ @80 /* They want money. 20,000 gold pieces of it, to be specific. */ + rh#talk2_gold
	++ @81 /* I'm glad you're happy. This whole thing just frightens me. */ + rh#talk2_smart
	++ @82 /* It is kind of fun, isn't it? */ + rh#talk2_fun
	++ @83 /* I do hope you can stay focused in the face of such entertainment. */ + rh#talk2_ruffledfeathers
END

IF ~~ rh#talk2_shadowthief
 SAY @84 /* He's a complete idiot. There's nothing quite like an incompetent attempt at subterfuge to give yourself away, and nothing screams Shadow Thief like a mindless obsession with secrecy. */
 = @77 /* Everyone knows who rules the Amnish underground. His masters, I assume, are considerably more interesting than he himself, but then masters usually are. */ 
 = @78 /* That they would so quickly take an interest in you, <CHARNAME>... that's intriguing. */
	++ @80 /* They want money. 20,000 gold pieces of it, to be specific. */ + rh#talk2_gold
	++ @81 /* I'm glad you're happy. This whole thing just frightens me. */ + rh#talk2_smart
	++ @82 /* It is kind of fun, isn't it? */ + rh#talk2_fun
	++ @83 /* I do hope you can stay focused in the face of such entertainment. */ + rh#talk2_ruffledfeathers
END

IF ~~ rh#talk2_intrigue2
 SAY @85 /* I enjoy a good intrigue. Heavens know, I was raised on the stuff. I haven't much else going for me at the moment, so I'll take what I can get.  */ 
	++ @86 /* They want money. 20,000 gold pieces of it, to be specific. That's not interesting. */ + rh#talk2_gold
	++ @81 /* I'm glad you're happy. This whole thing just frightens me. */ + rh#talk2_smart
	++ @82 /* It is kind of fun, isn't it? */ + rh#talk2_fun
	++ @83 /* I do hope you can stay focused in the face of such entertainment. */ + rh#talk2_ruffledfeathers
END

IF ~~ rh#talk2_smart
 SAY @87 /* Good. That caution might keep you alive longer. They may be offering you aid, <CHARNAME>, but never forget that they're not your friends. */
	++ @88 /* You don't need to patronize me, Adrian. I'm not a child. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk2_sincere
	++ @89 /* They're certainly charging me enough for it. */ + rh#talk2_gold
	++ @90 /* I'll keep that in mind. */ + rh#talk2_sincere
END

IF ~~ rh#talk2_gold
 SAY @91 /* It's hardly about the money. If you had gone to them for help, their price would have probably been twice as high, but nobody in their right mind seeks out penniless adventurers to extort if they need gold in a rush. */
 = @92 /* The money is incidental; it's you that they're interested in, <CHARNAME>. */
	++ @93 /* That actually makes a lot of sense. */ + rh#talk2_sincere
	++ @90 /* I'll keep that in mind. */ + rh#talk2_sincere
	++ @88 /* You don't need to patronize me, Adrian. I'm not a child. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk2_sincere
	++ @94 /* Are you done yet? */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk2_done
END

IF ~~ rh#talk2_sincere
 SAY @95 /* Good. Step carefully and keep your eyes open, don't underestimate or misjudge them, and get used to being used, if you're not already. */
 = @96 /* But that's enough of a warning, I think. They've set the music; I suppose it's time to dance. */
 IF ~~ EXIT
END

IF ~~ rh#talk2_fun
 SAY @97 /* As long as you don't lose sight of the fact that it's also deadly dangerous. Step carefully and keep your eyes open, don't underestimate or misjudge them, and get used to being used, if you're not already. */
 = @96 /* But that's enough of a warning, I think. They've set the music; I suppose it's time to dance. */
IF ~~ EXIT
END

IF ~~ rh#talk2_ruffledfeathers
 SAY @98 /* You needn't worry. I do know what I'm doing, <CHARNAME>. I'm only hoping that you do too. Step carefully and keep your eyes open, don't underestimate or misjudge them, and get used to being used, if you're not already. */
 = @96 /* But that's enough of a warning, I think. They've set the music; I suppose it's time to dance. */
IF ~~ EXIT
END

IF ~~ rh#talk2_done
 SAY @99 /* If you're not interested in accepting advice, I damn well hope you're capable of handling this on your own. */
IF ~~ EXIT
END
END

// 3.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",6)~ THEN RH#ADRJ rh#talk3
@100 /* Hells, I never realized how irritating it would be simply to be forced to wander around looking for work like this. Can't we simply... I don't know, blackmail wealthy Amnish noblemen instead? */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @101 /* I take it you don't normally work? */ + rh#talk3_work
 	++ @102 /* I'm sure the Shadow Thieves would love that. */ + rh#talk3_thieves
	++ @103 /* That's disgusting. */ + rh#talk3_disgusting
 	++ @104 /* I'm not interested in listening to you complain. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk3_complain

APPEND RH#ADRJ

IF ~~ rh#talk3_complain
 SAY @105 /* Fine. Listen to the sound of your own plodding footsteps then, my <PRO_LADYLORD>. */
IF ~~ EXIT
END

IF ~~ rh#talk3_work
 SAY @106 /* I don't normally *look* for work. Heavens know, I'm more accustomed to simply being told what to do. */
	++ @107 /* And somehow that's preferable? */ + rh#talk3_work1
	++ @108 /* Yes, the horror of being forced to think for oneself. */ + rh#talk3_work2
	++ @109 /* Technically, you're still being told what to do. By me. */ + rh#talk3_work3
END

IF ~~ rh#talk3_work1
 SAY @110 /* It depended upon the assignment. Sometimes it was, sometimes it wasn't... but it was seldom anything like this. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_work2
 SAY @111 /* Oh, I assure you, the two aren't mutually exclusive if the work in question is interesting enough.  This hardly qualifies. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_work3
 SAY @112 /* Yes... and I'm afraid it loses some of the mystique when I still get to watch you wander around aimlessly. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_thieves
 SAY @113 /* You're right. If we have to perform for them as it is, I suppose it's best to play things as straight as possible. I would rather not look like a liability. */
 	++ @114 /* Play things too straight, and they might just grow bored with us. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk3_thieves1
 	++ @115 /* We're going to be "playing things straight" because that's simply the way I prefer to work. */ + rh#talk3_thieves2
 	++ @116 /* Yes, I'm sure you'd rather wait until it's too late to get rid of you to show just how much of a liability you are. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk3_thieves3
END

IF ~~ rh#talk3_thieves1
 SAY @117 /* Mmm, I'm likely to grow bored myself long before they are. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_thieves2
 SAY @118 /* Indeed. You needn't worry, I'll behave. I won't promise to be happy about it, though. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_thieves3
 SAY @119 /* How very clever, <CHARNAME>. No, I have no intention of wandering off and doing something stupid.  Well, stupider than being involved in this in the first place. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_disgusting
 SAY @120 /* Is it? You might want to rethink this potential alliance with the Shadow Thieves, then. Or quite possibly give up entirely and run off to Silverymoon or Cormyr instead. They might almost be noble enough for you. */
	++ @121 /* I may accept help wherever I can find it, but that doesn't mean I have to sink to their level. */ + rh#talk3_disgusting1
	++ @122 /* What's wrong with Silverymoon and Cormyr? They seem like lovely places. */ + rh#talk3_disgusting2
	++ @123 /* That certainly sounds better than enduring your continued company. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk3_disgusting2
END

IF ~~ rh#talk3_disgusting1
 SAY @124 /* Guilt by association doesn't count, does it? I'll have to remember that. */
 = @125 /* Listen to me... I didn't mean to start fighting with you, <CHARNAME>, but this... well. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_disgusting2
 SAY @126 /* Indeed. There are plenty of dragons left to slay there. Especially in Cormyr. Though I doubt you would be as interested in the purple variety. */
 = @125 /* Listen to me... I didn't mean to start fighting with you, <CHARNAME>, but this... well. */
IF ~~ + rh#talk3_main1
END

IF ~~ rh#talk3_main1
 SAY @127 /* I can't say that I've ever really understood it. "Adventuring." Who coined that term anyway, I wonder? It almost sounds like something out of a children's book... which could explain why so many so-called adventurers are so young in oh, so very many ways. */
 	++ @128 /* I happen to be an adventurer, I hope you realize. */ + rh#talk3_adventurer
 	++ @129 /* Using the word "so" that many times has to be illegal in some countries. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk3_so
 	++ @130 /* The lure of the road and the promise of freedom and glory... it can be very appealing. */ + rh#talk3_glory
 	++ @131 /* Is it conspiracy theory time? Some evil organization long ago came up with the term "adventurer" in an attempt to lure as many of the Realms' youth as possible to an untimely death? */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk3_conspiracy
END

IF ~~ rh#talk3_adventurer
 SAY @132 /* You may be adventuring, but I'm not altogether sure I'd consider you an adventurer, per se. You're a bit less... wide-eyed and idiotic than I would expect. At least, I hope you are. */
IF ~~ + rh#talk3_main2
END

IF ~~ rh#talk3_so
 SAY @133 /* Some parts of Thay, perhaps. I don't doubt there's some Red Wizard somewhere who changes the rules in his small corner of the world daily simply as a social experiment to see how the poor, terrified commoners react. A sight to see if a visit to Thay weren't largely suicidal. */
 = @134 /* Though with any luck, our journeys won't lead us quite that far afield. Amn is unpleasant enough, though under any other circumstances... hmm.  You seem rather comfortable with it, though. */
IF ~~ + rh#talk3_main2
END

IF ~~ rh#talk3_glory
 SAY @135 /* The illusion of freedom, a moment's glory, and then a forgotten grave in the middle of some monster's lair. At least it's a shining example of the weak and stupid weeding themselves out of society. More for the rest of us to fight over. */
 = @136 /* You seem rather comfortable with the concept, though, the circumstances notwithstanding. */
IF ~~ + rh#talk3_main2
END

IF ~~ rh#talk3_conspiracy
 SAY @137 /* Mmm, it makes slightly more sense than world conquest through dracolichs, doesn't it? Still, if there is a conspiracy going on, it's more likely some vapid do-gooders deciding that manipulating children into doing their work for them is in everyone's best interests. */
 = @136 /* You seem rather comfortable with the concept, though, the circumstances notwithstanding. */
IF ~~ + rh#talk3_main2
END

IF ~~ rh#talk3_main2
 SAY @138 /* I really do hope this wasn't your first career choice, <CHARNAME>. It certainly leaves a lot to be desired. */
 	++ @139 /* Hardly. I'd hoped to use my treasure to buy a dukedom up north. After this, perhaps I still will. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk3_dukedom
 	++ @140 /* I don't care about adventuring. It's the promise of violence that draws me to this path. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk3_bhaaaal
 	++ @141 /* What's wrong with it? I've always wanted to see as much as the world as possible. */ + rh#talk3_wanderlust
 	++ @142 /* I really would rather spend my life doing something worthwhile, as silly as that might seem to you. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk3_silly
 	++ @143 /* I'd have happily settled down in Baldur's Gate if not for Irenicus. */ + rh#talk3_baldursgate
END

IF ~~ rh#talk3_dukedom
 SAY @144 /* Your past adventures must have been quite lucrative. I know for a fact that titles tend to be quite expensive... though I won't fault you the ambition. */
IF ~~ + rh#talk3_end
END

IF ~~ rh#talk3_bhaaaal
 SAY @145 /* How delightfully crass of you. I honestly don't know why I even bother sometimes. */
IF ~~ EXIT
END

IF ~~ rh#talk3_wanderlust
 SAY @146 /* It isn't as interesting as you think it is. Eventually you'll come to find that the places in between aren't as different or exciting as you'd hoped they'd be. */
IF ~~ + rh#talk3_end
END

IF ~~ rh#talk3_silly
 SAY @147 /* Silly, suicidal... take your pick. We'll see how many of the people you saved will even remember your name afterwards. */
IF ~~ + rh#talk3_end
END

IF ~~ rh#talk3_baldursgate
 SAY @148 /* Hmm. I've never been there before, or any of the major cities along the Sword Coast, for that matter. I'd always hoped to get to Waterdeep, though it never happened and probably never will. */
IF ~~ + rh#talk3_end
END

IF ~~ rh#talk3_end
 SAY @149 /* But I've taken up enough time complaining. We'd best get back to... whatever it is that we're supposed to be doing. */
IF ~~ EXIT
END
END

// 4.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",8)~ THEN RH#ADRJ rh#talk4
@150 /* Hero of the Sword Coast... hmm. You're not really what I expected, though I suppose such people tend to be somewhat... difficult to predict. */
= @151 /* I'd picked up a bit about the Iron Crisis -- it's hard not to while running caravans -- though not nearly as much as I'd have liked. */
= @152 /* I keep on hearing whispers about the Iron Throne and about Bhaal, though... two things that don't normally go together, as far as I'm aware. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianSpawnTimer","GLOBAL",2700)~
END
	++ @153 /* Running caravans, is it? You didn't really strike me as the merchant type. */ + rh#talk4_caravans
	++ @154 /* You're familiar with the Iron Throne? Aren't they supposed to be a secret organization? */ + rh#talk4_ironthrone
	++ @155 /* What were you expecting me to look like? */ + rh#talk4_metallicdragon
	++ @156 /* You have terrible timing, Adrian. Could we talk about this later? */ + rh#talk_delay

APPEND RH#ADRJ

IF ~~ rh#talk4_caravans
 SAY @157 /* It's a long and unpleasant story, and not one I'm interested in sharing. Suffice to say, it was as tedious as it sounds. */
IF ~~ + rh#talk4_main1
END

IF ~~ rh#talk4_ironthrone
 SAY @158 /* Familiar... no, not quite. I spent some of my time in Sembia trying to learn more about them some five years back, but I can't say I have much to show for it. Despite my best efforts. */
IF ~~ + rh#talk4_main1
END

IF ~~ rh#talk4_metallicdragon
 SAY @159 /* A bit more... draconic, perhaps. Twenty feet tall, breathing fire. Perhaps one of those annoying metallic ones. Stopping wars, slaying despots... they tend to enjoy that sort of thing. */
IF ~~ + rh#talk4_main1
END

IF ~~ rh#talk4_main1
 SAY @160 /* But you haven't answered the... well, I suppose I didn't quite phrase it as a question. What exactly was going on up north? */
	++ @161 /* Sarevok, Rieltar's foster son, was a child of Bhaal. He hijacked his father's war against Amn and tried to ascend to godhood. Obviously he failed. */ + rh#talk4_main2
	++ @162 /* I killed the leaders of the Iron Throne and then I killed Sarevok, a son of Bhaal who was trying to become a god. */ + rh#talk4_main2
	++ @163 /* Sarevok, a son of Bhaal, murdered the leaders of the Iron Throne before trying to slaughter the rest of the Sword Coast. He was trying to achieve godhood, and I had to stop him. */ + rh#talk4_main2
	++ @164 /* I haven't answered the question, nor do I intend to. */ + rh#talk4_break
END

IF ~~ rh#talk4_main2
 SAY @165 /* Ahh. That's... not quite what I was expecting. It seems like everyone wants to rule the heavens this year. */
 = @166 /* Shall I assume, then, that the other rumor is true as well? That you're a <PRO_SONDAUGHTER> of Bhaal yourself? */
	++ @167 /* That was more forward than I'm used to. */ + rh#talk4_forward
	++ @168 /* And if I am? Does that bother you? */ + rh#talk4_bother
	+ ~CheckStatGT(Player1,15,CHR)~ + @169 /* It isn't. */ + rh#talk4_lie1
	+ ~CheckStatLT(Player1,16,CHR)~ + @169 /* It isn't. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk4_lie2
	++ @170 /* Where in the hells did you hear that? */ + rh#talk4_hear
	++ @171 /* It really isn't any of your business. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk4_business
END

IF ~~ rh#talk4_hear
 SAY @172 /* I keep my ears open, <CHARNAME>. I always have. */
IF ~!Race(Player1,ELF)~ + rh#talk4_main3a
IF ~Race(Player1,ELF)~ + rh#talk4_main3b
END

IF ~~ rh#talk4_forward
 SAY @173 /* There's a fine line sometimes between subtlety and diffidence, <CHARNAME>. I... try not to cross it. */
IF ~!Race(Player1,ELF)~ + rh#talk4_main3a
IF ~Race(Player1,ELF)~ + rh#talk4_main3b
END

IF ~~ rh#talk4_bother
 SAY @174 /* I... haven't really decided yet. */
IF ~!Race(Player1,ELF)~ + rh#talk4_main3a
IF ~Race(Player1,ELF)~ + rh#talk4_main3b
END

IF ~~ rh#talk4_business
 SAY @175 /* No? If you hope to keep a secret like that from the people who travel with you, you're more of a fool than I thought. */
IF ~!Race(Player1,ELF)~ + rh#talk4_main3a
IF ~Race(Player1,ELF)~ + rh#talk4_main3b
END

IF ~~ rh#talk4_lie1
 SAY @176 /* You lie beautifully, <CHARNAME>, but I wouldn't have brought it up if I weren't already convinced it was true. */
IF ~!Race(Player1,ELF)~ + rh#talk4_main3a
IF ~Race(Player1,ELF)~ + rh#talk4_main3b
END

IF ~~ rh#talk4_lie2
 SAY @177 /* Really? Try that in front of a mirror a few times and you might start to sound convincing. */
IF ~!Race(Player1,ELF)~ + rh#talk4_main3a
IF ~Race(Player1,ELF)~ + rh#talk4_main3b
END

IF ~~ rh#talk4_main3a
 SAY @178 /* A child of Bhaal. That's... quite the legacy, though I'm sure I don't need to tell you that. How long have you known? */
 	++ @179 /* Why would you assume that I haven't always known? */ + rh#talk4_bornknow
 	++ @180 /* I think I always guessed that something was different about me. */ + rh#talk4_different
 	++ @181 /* I only found out recently. Within the past year. */ + rh#talk4_year
 	++ @182 /* If Sarevok hadn't tried to kill me last year, I probably still wouldn't know. */ + rh#talk4_year
 	++ @183 /* This conversation is over. I'm not talking about Bhaal. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk4_over
END

IF ~~ rh#talk4_main3b
 SAY @184 /* A child of Bhaal. I suppose that explains why you don't seem quite so... hopelessly elven. How long have you known? */
 	++ @185 /* Hopelessly elven? Don't think you're getting away with that. */ + rh#talk4_hopelessly
 	++ @179 /* Why would you assume that I haven't always known? */ + rh#talk4_bornknow
 	++ @180 /* I think I always guessed that something was different about me. */ + rh#talk4_different
 	++ @181 /* I only found out recently. Within the past year. */ + rh#talk4_year
 	++ @182 /* If Sarevok hadn't tried to kill me last year, I probably still wouldn't know. */ + rh#talk4_year
 	++ @183 /* This conversation is over. I'm not talking about Bhaal. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk4_over
END

IF ~~ rh#talk4_hopelessly
 SAY @186 /* Oh? I dare say that's the more interesting half of your heritage speaking now, my <PRO_LADYLORD>. */
IF ~~ + rh#talk4_main4
END 

IF ~~ rh#talk4_bornknow
 SAY @187 /* I doubt even the <PRO_SONDAUGHTER> of a god is born with the full knowledge of <PRO_HISHER> paternity. */
IF ~~ + rh#talk4_main4
END 

IF ~~ rh#talk4_different
 SAY @188 /* I'd have settled for a far lesser distinction than that, my <PRO_LADYLORD>. In fact, I did. */
IF ~~ + rh#talk4_main4
END 

IF ~~ rh#talk4_year
 SAY @189 /* That's... unfortunate. A year hardly seems like enough time to process something of that magnitude. */
IF ~~ + rh#talk4_main4
END 
 
IF ~~ rh#talk4_over
 SAY @190 /* Indeed. */
IF ~~ EXIT
END
 
IF ~~ rh#talk4_main4
 SAY @191 /* Still, the cards are what they are, I suppose. */
 	++ @192 /* Tell me about it. I'm getting tired of all of the death and chaos that constantly follows me. */ + rh#talk4_tired
 	++ @193 /* At least I'll never be bored. */ + rh#talk4_bored
 	++ @194 /* I have the blood of a god in me. One day I may still get the chance to throw these cards back in the dealer's face. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk4_deicide
	++ @195 /* And as much as I may not care for the hand I've been dealt, I intend to win with it all the same. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk4_win
	++ @196 /* Are they? My destiny is my own, and to the hells with the rest of it. */ + rh#talk4_sweetchaos
END

IF ~~ rh#talk4_tired
 SAY @197 /* Well, I don't think you can expect it to go away anytime soon, all things considered. But enough of this... Irenicus certainly won't chase himself. */
IF ~~ EXIT
END

IF ~~ rh#talk4_bored
 SAY @198 /* I suppose that's something. But enough of this... Irenicus certainly can't be expected to chase himself. */
IF ~~ EXIT
END

IF ~~ rh#talk4_deicide
 SAY @199 /* Mighty <CHARNAME>, running <PRO_HISHER> sword through the heart of mad Cyric himself. Mmm, what a sight that would be. */
IF ~~ EXIT
END

IF ~~ rh#talk4_win
 SAY @200 /* A sentiment to live by, even if following them can prove more difficult than saying them. But enough of this... Irenicus certainly can't be expected to chase himself. */
IF ~~ EXIT
END

IF ~~ rh#talk4_sweetchaos
 SAY @201 /* You're either brilliant or mad, <CHARNAME>. I guess time will tell which. */
IF ~~ EXIT
END

IF ~~ rh#talk4_break
 SAY @202 /* I see. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3) SetGlobal("rh#AdrianTalk","GLOBAL",11)
RealSetGlobalTimer("rh#DamarovTimer","GLOBAL",2700)~ EXIT
END
END

// 5.

BEGIN RH#ORPH

CHAIN IF ~Global("rh#OrphanSpawn","GLOBAL",1)~ THEN RH#ORPH rh#orphantalk
@203 /* C-could you spare a c-couple of coins? */
== RH#ADRJ @204 /* Here. Five gold. Buy yourself a dagger and go teach yourself how to cut purses if you hope to survive the year. And stop stuttering. */
== RH#ORPH @205 /* Y-yes, sir! Thank you, sir. */
DO ~TakePartyGold(5) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",5) SetGlobal("rh#OrphanSpawn","GLOBAL",2) ActionOverride("rh#orph",EscapeArea())~
EXIT

CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",10)~ THEN RH#ADRJ rh#talk5
@206 /* What? It was just five gold. I'll never miss it. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianDamarovTimer","GLOBAL",2700)~
END
 	++ @207 /* I hope you remember that later tonight when you start looking for wine. */ + rh#talk5_wine
 	++ @208 /* I'm not complaining. But...why? */ + rh#talk5_why

APPEND RH#ADRJ

IF ~~ rh#talk5_wine
 SAY @209 /* Fine. I'll charm it out of some drunken fool. Honestly, <CHARNAME>, am I not allowed to give a damn every once in a while? */
IF ~~ + rh#talk5_why
END

IF ~~ rh#talk5_why
 SAY @210 /* Her father was likely some self-impressed elven wanderer who couldn't be bothered to stay around, and her idiot mother probably drank herself to death rather than deal with the consequences. Scum, but it isn't the girl's fault. */ 
	++ @211 /* Is that what happened to you? */ + rh#talk5_noo
	++ @212 /* Soft spot for half-elves? I'll have to take note of that. */ + rh#talk5_halfelf
END

IF ~~ rh#talk5_noo
 SAY @213 /* No. It isn't. But I did spend about a week on the street myself as a child. In a far worse city than Athkatla. */
IF ~~ + rh#talk5_main1
END

IF ~~ rh#talk5_halfelf
 SAY @214 /* Only the young ones. I once spent about a week on the street myself as a child. In a far worse city than Athkatla. */
IF ~~ + rh#talk5_main1
END

IF ~~ rh#talk5_main1
 SAY @215 /* I had run away from home once for some slight or another. I knew to stay away from the orphanages... they tend to be slaving fronts back home, but I ended up getting picked up by slavers all the same. It was... memorable, at least. */
	++ @216 /* That was unbelievably stupid of you. */ + rh#talk5_sostupid
	++ @217 /* How did you get away? */ + rh#talk5_sortout
	++ @218 /* Memorable? That sounds horrible. */ + rh#talk5_sortout
	++ @219 /* Slaving fronts? Where in the hells do you come from? Thay? */ + rh#talk5_zk
END

IF ~~ rh#talk5_sostupid
 SAY @220 /* Yes, it was. */
 IF ~~ + rh#talk5_main2
END

IF ~~ rh#talk5_sortout
 SAY @221 /* Well, my family sorted it out in the end. */
IF ~~ + rh#talk5_main2
END

IF ~~ rh#talk5_zk
 SAY @222 /* Close enough. */
IF ~~ + rh#talk5_main2
END

IF ~~ rh#talk5_main2
 SAY @223 /* But your background must be significantly more interesting than my own, <CHARNAME>. I imagine it's safe to assume that Bhaal didn't raise you. You lack the certain... sociopathic edge that one would expect. */
	++ @224 /* Heavens forbid! No, I was raised in Candlekeep. */ + rh#talk5_exceedinglydull
	++ @225 /* As interesting as that would have been, I actually come from Candlekeep. */ + rh#talk5_exceedinglydull
	++ @226 /* I'd rather not speak of it. */ + rh#talk5_nospeak
	++ @227 /* Why ever would you assume that? I've inherited my dear father's strength, his bloodlust, not to mention his absolutely charming way with people. Why, just the other day someone pointed out how uncanny the resemblance was. Right before I killed him in a ritualistic sacrifice, that is. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk5_wit
END

IF ~~ rh#talk5_wit
 SAY @228 /* Ha! Well, you've obviously picked up your sharp wit from another source. */
	++ @229 /* I meant every word I said. */ + rh#talk5_darkgodcharname
	++ @230 /* Though where exactly, we'll never know. I actually come from Candlekeep. */ + rh#talk5_exceedinglydull
	++ @231 /* The monks in Candelkeep, no doubt. Or perhaps Imoen. */ + rh#talk5_exceedinglydull
END

IF ~~ rh#talk5_darkgodcharname
 SAY @232 /* Well, then. Forget I said anything at all. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk5_nospeak
 SAY @233 /* You're a <PRO_SONDAUGHTER> of Bhaal, <CHARNAME>. I doubt your background could get any darker. If it did, I assure you, I'd be more impressed than horrified. */ 
	++ @234 /* Oh, fine. I was actually raised in Candlekeep. */ + rh#talk5_exceedinglydull
	++ @235 /* Darker? Sometimes people don't want to talk about things because they're too painful, not because the truth is shady. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk5_painful
	++ @236 /* I just said I don't want to talk. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ EXIT
END

IF ~~ rh#talk5_painful
 SAY @237 /* Painful? What are you, some whimpering child? If you can't face your past, I look forward to seeing how you plan on facing your future. */
	+ ~CheckStatGT(Player1,14,CHR)~ + @238 /* I don't remember asking you for your opinion, Adrian, and I never said I couldn't face it. If you must know, I was raised in Candlekeep. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk5_exceedinglydull
	+ ~CheckStatLT(Player1,15,CHR)~ + @238 /* I don't remember asking you for your opinion, Adrian, and I never said I couldn't face it. If you must know, I was raised in Candlekeep. */ + rh#talk5_exceedinglydull
	++ @239 /* That's rich, coming from you. If it means that much to you, I come from Candlekeep. */ + rh#talk5_exceedinglydull
	++ @240 /* Good job. Now I'm even less interested in talking. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ EXIT
END

IF ~~ rh#talk5_exceedinglydull
 SAY @241 /* Candlekeep? The dusty old library over the Sea of Swords? That must have been exceedingly dull. */
	++ @242 /* Dull is one way to put it. Unbearable would be a better one. Gorion... */ + rh#talk5_gorion
	++ @243 /* It seemed dull at the time, and nondescript now, but Gorion taught me well. Childhood is about preparation, not excitement, and mine could have been much worse. Especially given my heritage. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk5_gorion
	++ @244 /* And how! Nothing but books, all around. I left as soon as I could. */ + rh#talk5_librarians
	++ @245 /* Dull? I wouldn't say so. If anything, I miss the peace of it. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk5_librarians
	++ @246 /* If only. The trouble Imoen could get up to... */ + rh#talk5_librarians
	++ @247 /* Oh, I found many ways to liven it up. Much to the dismay of my guardian, Gorion... */ + rh#talk5_gorion
END

IF ~~ rh#talk5_librarians
 SAY @248 /* Did the moldering books raise you, then? */
	++ @249 /* Not funny. No, a sage called Gorion fostered me. */ + rh#talk5_gorion
	++ @250 /* Close enough. A sage called Gorion fostered me. */ + rh#talk5_gorion
	++ @251 /* I'd rather not talk about it. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ EXIT
END

IF ~~ rh#talk5_gorion
 SAY @252 /* Gorion? The Harper? */
	++ @253 /* Yes. Did you know him? */ + rh#talk5_reputation
	++ @254 /* The very same. */ + rh#talk5_harpson
END

IF ~~ rh#talk5_reputation
 SAY @255 /* Only by reputation. */
IF ~~ + rh#talk5_harpson
END

IF ~~ rh#talk5_harpson
 SAY @256 /* I can only imagine what was it like to be raised by One Who Harps... on and on and on. */
 = @257 /* I presume it was full of constant moralizing, suspect ideology, and a stress on freedom remarkably at odds with your own lack thereof. */
	++ @258 /* Your sarcasm is unwarranted. Gorion was a good man, if a bit overbearing. He meant well, and he deserved better than what happened to him. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk5_loyal
	++ @259 /* I will not have you speak of him thus! I might not have understood it at the time, but every lesson he imparted upon me was done so that I would be better equipped to fight Bhaal's legacy. He was a great man, and you will give him the respect he deserves. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",1)~ + rh#talk5_loyal
	++ @260 /* That's a horrible thing to say! I would prefer to live in a world where people cared enough to fight for what was right, rather than in one drowning in endless cynicism. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk5_cynic
	++ @261 /* Wow, you really hate Harpers, don't you? */ + rh#talk5_harperaugh
	+ ~Alignment(Player1,MASK_GOOD)~ + @262 /* By the gods, you have no idea. Not that the lessons took very well. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk5_powerultimatepowerwat
	+ ~Alignment(Player1,MASK_GENEUTRAL)~ + @262 /* By the gods, you have no idea. Not that the lessons took very well. */ + rh#talk5_powerultimatepowerwat
	+ ~Alignment(Player1,MASK_EVIL)~ + @262 /* By the gods, you have no idea. Not that the lessons took very well. */ + rh#talk5_powerultimatepower
	++ @263 /* I suppose. I was too busy playing tricks on the librarians to pay attention. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk5_unimpressed
	++ @264 /* It's all a bit of a haze, really. A very, very boring haze. */ DO ~IncrementGlobal("rh#AdrianLikesPC","GLOBAL",-1)~ + rh#talk5_unimpressed
END

IF ~~ rh#talk5_loyal
 SAY @265 /* Dare I ask what became of him? */
	++ @266 /* Sarevok killed him. */ + rh#talk5_sarevok
	++ @267 /* I don't want to talk about it. */ + rh#talk5_notalk
	++ @268 /* Why, so you can laugh? */ + rh#talk5_laugh
END 

IF ~~ rh#talk5_harperaugh
 SAY @269 /* I'm surprised that you don't. They've apparently been meddling in your life for... how old did you say you were? Twenty-one? */
 = @270 /* No matter. What became of the old fool? */
	++ @266 /* Sarevok killed him. */ + rh#talk5_sarevok
	++ @267 /* I don't want to talk about it. */ + rh#talk5_notalk
	++ @271 /* What, so you can laugh? */ + rh#talk5_laugh
END 

IF ~~ rh#talk5_cynic
 SAY @272 /* At least the cynic lives for himself, rather than dying for all those who couldn't be bothered to fight for themselves... but I can see that your Harper keepers have been feeding you as much of their inane nonsense as they could. */
 = @270 /* No matter. What became of the old fool? */
	++ @266 /* Sarevok killed him. */ + rh#talk5_sarevok
	++ @267 /* I don't want to talk about it. */ + rh#talk5_notalk
	++ @271 /* What, so you can laugh? */ + rh#talk5_laugh
END 

IF ~~ rh#talk5_powerultimatepowerwat
 SAY @273 /* They took better than you think, I'd say. */
 = @270 /* No matter. What became of the old fool? */
	++ @266 /* Sarevok killed him. */ + rh#talk5_sarevok
	++ @267 /* I don't want to talk about it. */ + rh#talk5_notalk
	++ @271 /* What, so you can laugh? */ + rh#talk5_laugh
END 

IF ~~ rh#talk5_powerultimatepower
 SAY @274 /* So I've noticed. What became of the old fool? */
	++ @266 /* Sarevok killed him. */ + rh#talk5_sarevok
	++ @267 /* I don't want to talk about it. */ + rh#talk5_notalk
	++ @271 /* What, so you can laugh? */ + rh#talk5_laugh
END 

IF ~~ rh#talk5_unimpressed
 SAY @275 /* I suspect you had more interesting things to focus on, though in a place that small, I can't imagine what. */
 = @270 /* No matter. What became of the old fool? */
	++ @266 /* Sarevok killed him. */ + rh#talk5_sarevok
	++ @267 /* I don't want to talk about it. */ + rh#talk5_notalk
	++ @271 /* What, so you can laugh? */ + rh#talk5_laugh
END 

IF ~~ rh#talk5_laugh
 SAY @276 /* I... promise I won't. */
	++ @266 /* Sarevok killed him. */ + rh#talk5_sarevok
	++ @267 /* I don't want to talk about it. */ + rh#talk5_notalk
END

IF ~~ rh#talk5_notalk
 SAY @277 /* Hmm. Fair enough. I really can't say I blame you. */
IF ~~ EXIT
END

IF ~~ rh#talk5_sarevok
 SAY @278 /* Ahh. I see. You...had your vengeance, at least. That's... something to hold onto. */
IF ~~ EXIT
END
END

// 7.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",14) Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN RH#ADRJ rh#talk7a
@279 /* I normally don't give a damn what people think of me, but... */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ 
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @280 /* <CHARNAME> has no interest in either you or your silver-tongued lies, Zhent. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @281 /* Aren't your people supposed to be in favor of love and tolerance, Harper? No, don't answer that. I really don't care. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @282 /* Hmm, maybe we should take this conversation somewhere we won't have to worry about unwanted commentary. Despite what your Harper thinks of things, I... I don't know, <CHARNAME>. I guess I just don't want to leave you thinking the worst. */
== RH#ADRJ IF ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @283 /* I don't know, <CHARNAME>. I suppose I just don't want to leave you thinking the worst. */
END
 	++ @284 /* I already don't think the worst. */ + rh#talk7_worst
 	++ @285 /* You've only lied to me so far. Why change things now? */ + rh#talk7_change
 	++ @286 /* I haven't heard anything I haven't liked so far. */ + rh#talk7_evil
 	++ @287 /* I'd love to hear anything you want to share. */ + rh#talk7_story
 	++ @288 /* Finally willing to let me in, are we? */ + rh#talk7_willing
  	++ @289 /* Now's not the best time. */ + rh#talk_delay
 	++ @290 /* I'm not interested in any excuses you might give. */ + rh#talk7_excuses

CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",14) Global("rh#AdrianFriendshipActive","GLOBAL",1)~ THEN RH#ADRJ rh#talk7b
@291 /* You've put up with me so far, <CHARNAME>, you probably deserve a bit more information than what little I've already given. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @292 /* Probably? */ + rh#talk7_iknow
 	++ @293 /* Then talk. */ + rh#talk7_story
 	++ @285 /* You've only lied to me so far. Why change things now? */ + rh#talk7_change
 	++ @294 /* It's your story. If you're willing to share it, I'm willing to listen. */ + rh#talk7_story
  	++ @289 /* Now's not the best time. */ + rh#talk_delay
 	++ @295 /* I've already heard more than enough. I'm not interested in your excuses. */ + rh#talk7_excuses

APPEND RH#ADRJ

IF ~~ rh#talk7_worst
 SAY @296 /* Maybe not, but blind faith? I'd rather give you a chance to base your opinions on something more substantial than that. */
IF ~~ + rh#talk7_main1
END

IF ~~ rh#talk7_change
 SAY @297 /* What would be the point now? */
IF ~~ + rh#talk7_main1
END

IF ~~ rh#talk7_evil
 SAY @298 /* Maybe not, but whatever picture you've painted for yourself is probably still fairly far from the truth. That's not very promising, even if you like it. Especially if you like it. */
IF ~~ + rh#talk7_main1
END

IF ~~ rh#talk7_story
 SAY @299 /* Good. */
IF ~~ + rh#talk7_main1
END

IF ~~ rh#talk7_willing
 SAY @300 /* Will wonders never cease. */
IF ~~ + rh#talk7_main1
END

IF ~~ rh#talk7_iknow
 SAY @301 /* I know. */
IF ~~ + rh#talk7_main1
END

IF ~~ rh#talk7_excuses
 SAY @302 /* My <PRO_LADYLORD>, you don't know me half as well as you think you do if you believe I intend to make any excuse at all. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk7_main1
 SAY @303 /* I've never been very comfortable with sharing, you know. When you build your life on lies and illusions, it's a hard habit to break, but something closer to the truth... hmm. */
 	++ @304 /* Closer to the truth? Do you only plan on feeding me more half lies, then? */ + rh#talk7_lies
 	++ @305 /* Just tell me whatever you're comfortable sharing. */ + rh#talk7_stalling
 	++ @306 /* You're not about to get sentimental on me, are you? */ + rh#talk7_mushy
 	++ @307 /* Oh, I don't even care if you feed me lies. I'm sure they'll be marvelous. */ + rh#talk7_marvelous
 	++ @308 /* You know what? I'm not interested in your excuses after all. */ + rh#talk7_excuses
END

IF ~~ rh#talk7_mushy
 SAY @309 /* Sentimental? I certainly hope not. Anyway, there's nothing particularly sentimental about Sembia. Golden Sembia... named so because they don't give a damn there about anything but gold. I never did ask, have you ever been there yourself? */
	++ @310 /* I was never even allowed beyond the gates of Candlekeep before we had to flee. */ + rh#talk7_gates
	++ @311 /* The land of cutthroat mercantilism? I wouldn't even want to visit. */ + rh#talk7_visit
	++ @312 /* Not yet. I hope to change that someday. */ + rh#talk7_someday
	++ @313 /* Oh, of course! It's an interesting country, isn't it? */ + rh#talk7_interesting
END

IF ~~ rh#talk7_marvelous
 SAY @314 /* My life has been...colorful enough that embellishment would be somewhat superfluous. But don't think I'll forget that you've given me permission. */
 = @315 /* My story starts in Sembia, I think. This part of it, at least. Golden Sembia... named so because they don't give a damn there about anything but gold. I never did ask, have you ever been there yourself? */
	++ @310 /* I was never even allowed beyond the gates of Candlekeep before we had to flee. */ + rh#talk7_gates
	++ @311 /* The land of cutthroat mercantilism? I wouldn't even want to visit. */ + rh#talk7_visit
	++ @312 /* Not yet. I hope to change that someday. */ + rh#talk7_someday
	++ @313 /* Oh, of course! It's an interesting country, isn't it? */ + rh#talk7_interesting
END

IF ~~ rh#talk7_lies
 SAY @316 /* I couldn't tell you everything there is to know if I had a lifetime with which to do it. Without that, all you're ever going to know is a shadow of the truth. */
 = @315 /* My story starts in Sembia, I think. This part of it, at least. Golden Sembia... named so because they don't give a damn there about anything but gold. I never did ask, have you ever been there yourself? */
	++ @310 /* I was never even allowed beyond the gates of Candlekeep before we had to flee. */ + rh#talk7_gates
	++ @311 /* The land of cutthroat mercantilism? I wouldn't even want to visit. */ + rh#talk7_visit
	++ @312 /* Not yet. I hope to change that someday. */ + rh#talk7_someday
	++ @313 /* Oh, of course! It's an interesting country, isn't it? */ + rh#talk7_interesting
END

IF ~~ rh#talk7_stalling
 SAY @317 /* Right. Hmm. My story starts in Sembia, I think. This part of it, at least. Golden Sembia... named so because they don't give a damn there about anything but gold. I never did ask, have you ever been there yourself? */
	++ @310 /* I was never even allowed beyond the gates of Candlekeep before we had to flee. */ + rh#talk7_gates
	++ @311 /* The land of cutthroat mercantilism? I wouldn't even want to visit. */ + rh#talk7_visit
	++ @312 /* Not yet. I hope to change that someday. */ + rh#talk7_someday
	++ @313 /* Oh, of course! It's an interesting country, isn't it? */ + rh#talk7_interesting
END

IF ~~ rh#talk7_gates
 SAY @318 /* Ah, yes. Your Harper prison. I suppose that's one thing I've never had to endure. Still, the first time I walked through the gates of Selgaunt... to be fair, I was terrified. */
IF ~~ + rh#talk7_main2
END

IF ~~ rh#talk7_visit
 SAY @319 /* It isn't really much worse than Amn, <CHARNAME>. More concerned with wealth than class, certainly, though I suppose I have to admit that the first time I walked through the gates of Selgaunt, I was terrified. */
IF ~~ + rh#talk7_main2
END

IF ~~ rh#talk7_someday
 SAY @320 /* Well, I'm afraid I'm no longer welcome anywhere in the country. A wonderful end to a wonderful adventure. The first time I walked through the gates of Selgaunt... to be fair, I was terrified. */
IF ~~ + rh#talk7_main2
END

IF ~~ rh#talk7_interesting
 SAY @321 /* Interesting...? I suppose it is. Myself, the first time I walked through the gates of Selgaunt... to be fair, I was terrified. */
IF ~~ + rh#talk7_main2
END

IF ~~ rh#talk7_main2
 SAY @322 /* I was... twenty-three? Twenty-four? Something like that. The Sembians had gone on a killing spree about five years prior, butchering every Zhent mage they could get their hands on, and the memory of that nightmare was always on my mind. Delightful. */
 = @323 /* This was right after the Time of Troubles. Honestly, after that mess, I guess I even preferred being in the heart of enemy territory to being back home. */
 	++ @324 /* Dare I ask what you were doing in Sembia? */ + rh#talk7_horrific
 	++ @325 /* What was going on back home? */ + rh#talk7_lolcyric
 	++ @326 /* Come now. What's life without danger? The heart of enemy territory sounds like the best place to be. */ + rh#talk7_bestplace
 	++ @327 /* The Time of Troubles in Zhentil Keep. I can imagine. Didn't your god of tyranny drop by for a visit? */ + rh#talk7_lolbane
END

IF ~~ rh#talk7_horrific
 SAY @328 /* Nothing too horrific. */
IF ~~ + rh#talk7_main3
END

IF ~~ rh#talk7_lolcyric
 SAY @329 /* Holy war. Religious oppression. Ten bloody years of it. My refusal to worship Cyric would...not have gone over very well. Fortunately, that was one complication I mostly avoided. Quite possibly the only one. In any case... Sembia. */ 
IF ~~ + rh#talk7_main3
END

IF ~~ rh#talk7_bestplace
 SAY @330 /* <CHARNAME>, sometimes I think you're completely mad. In any case... Sembia. */
IF ~~ + rh#talk7_main3
END

IF ~~ rh#talk7_lolbane
 SAY @331 /* He did. It's...not something I like to think about, <CHARNAME>. In any case... Sembia. */
IF ~~ + rh#talk7_main3
END

IF ~~ rh#talk7_main3
 SAY @332 /* I wasn't a saboteur or dockside bandit or anything of the sort. Grandson of a lord myself, I was ordered to get close to one of the major merchant families, to win their favor and what passed for trust in Sembia, and then to simply... wait. */
 = @333 /* Fortunately, Sembia is a nice land for a wizard. A very nice land. Spying and divination go hand in hand, and merchant lords in particular enjoy their kept mages. It's a pity Amn isn't as forward thinking about such things. */
 = @334 /* I found myself a wealthy patron quickly enough. Eldan Foxmantle: fantastically rich, none too intelligent, and eager for more. He set me up in a seaside villa, surrounded by his own loyal guards. */
 = @335 /* His security measures were more charming than effective in the end, but I suppose I should give him some credit for at least making the effort. */
  	++ @336 /* Leeching off of rich merchants. I suppose it's easier than adventuring. */ + rh#talk7_easier
  	++ @337 /* Dare I ask how this story ends? */ + rh#talk7_ruin
  	++ @338 /* Tell me, did you charm the guards or replace them? */ + rh#talk7_charm
  	++ @339 /* And you wonder why Amn hates mages so much! */ + rh#talk7_amn
  	+ ~!Alignment(Player1,MASK_EVIL) OR(2) Class(Player1,BARD_ALL) Class(Player1,MAGE_ALL)~ + @340 /* You know, it's people like you who give the Art a bad name. */ + rh#talk7_art
  	++ @341 /* That's nice. I've had enough of this story now. */ + rh#talk7_enough
END

IF ~~ rh#talk7_easier
 SAY @342 /* Easier? Probably not. More comfortable, though...certainly. Of course, Foxmantle betrayed me in the end. */
IF ~~ + rh#talk7_main4
END

IF ~~ rh#talk7_ruin
 SAY @343 /* In bloody ruin, naturally. The bastard betrayed me in the end. */
IF ~~ + rh#talk7_main4
END

IF ~~ rh#talk7_charm
 SAY @344 /* A little bit of both, I suppose. Though it didn't keep Foxmantle from betraying me in the end. */
IF ~~ + rh#talk7_main4
END

IF ~~ rh#talk7_amn
 SAY @345 /* Whatever their reasons are, I'm sure they're more complicated than the simple fact that we're a dangerous lot. But I don't particularly care about the history of this blighted country. */
 = @346 /* Now, where was I? Ah, yes. Foxmantle. He betrayed me in the end, of course. */
IF ~~ + rh#talk7_main4
END

IF ~~ rh#talk7_art
 SAY @347 /* If you insist. Now... where was I? */
 = @348 /* Ah, yes. Foxmantle. He betrayed me in the end, of course. */
IF ~~ + rh#talk7_main4
END

IF ~~ rh#talk7_enough
 SAY @349 /* Suit yourself. */
IF ~~ EXIT
END
END
 
CHAIN RH#ADRJ rh#talk7_main4
@350 /* It was... somewhat more complicated than that, I suppose, but the specifics hardly matter now. I fled the country afterwards, back to the Keep. */
= @351 /* It was... well, it was exactly as I had remembered it, but I suppose I had changed over the years. Plenty of merchants back home like to retire to gentler Sembia, and I can hardly blame them for that. */
= @352 /* Some people can shift between faces, becoming whomever they need to be at a moment's notice and then discarding the personality afterwards. I... never could. Not for years on end, at least. */
= @353 /* Some Zhentarim spy, hmm? I'd gone native in Sembia. I couldn't compete anymore. A paladin might not recognize the distinction, but that doesn't make it less real. */
= @354 /* My life in Zhentil Keep was over anyway. My superiors were not pleased with me for my failures in Selgaunt, and any hopes I might have once had for advancement were shattered. Harpers were writing mocking songs about me, and that's not the sort of thing that goes over very well back home. */
== RH#ADRJ IF ~Class("rh#Adrian",SORCERER)~ THEN @355 /* I'd probably have been killed outright, but sorcerers are too valuable to throw away. */
== RH#ADRJ IF ~!Class("rh#Adrian",SORCERER)~ THEN @356 /* I'd probably have been killed outright, but was too valuable to simply throw away. */
END
	+ ~Class("rh#Adrian",SORCERER)~ + @357 /* I've noticed. It really is your only redeeming feature. */ + rh#talk7_redeeming
	+ ~!Class("rh#Adrian",SORCERER)~ + @358 /* I've noticed. Your magic really is your only redeeming feature. */ + rh#talk7_redeeming
	++ @359 /* Mocking songs? */ + rh#talk7_harperharp
	++ @360 /* What *did* they do to you? */ + rh#talk7_retaliationsucks
	++ @361 /* My heart bleeds for you. */ + rh#talk7_bleed
	++ @362 /* Go on. */ + rh#talk7_main6
  	++ @363 /* That's something, at least. I've had enough of this story now. */ + rh#talk7_enough

APPEND RH#ADRJ

IF ~~ rh#talk7_harperharp
 SAY @364 /* I'd rather you didn't ask. And after that... */
IF ~~ + rh#talk7_main6
END

IF ~~ rh#talk7_retaliationsucks
 SAY @365 /* Nothing pleasant. And after that... */
IF ~~ + rh#talk7_main6
END

IF ~~ rh#talk7_bleed
 SAY @366 /* Aren't you simply a delight to<DAYNIGHT>? In any case... */
IF ~~ + rh#talk7_main6
END

IF ~~ rh#talk7_redeeming
 SAY @367 /* Aren't you simply a delight to<DAYNIGHT>, <CHARNAME>? Fine. I'll leave you alone, if that's what you'd prefer. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk7_main6
 SAY @368 /* Two years worth of running caravans in the area, and it... wasn't exactly pleasant. The opposite, really. I was quite the bitter thing back then. Needless to say, the caravan guards didn't care for my company. Not that there was a damn thing they could have done about it. */
 = @369 /* It would have been nice to simply run, and I won't say the thought never occurred to me, but there was nowhere to go. It's hard to turn your back on your whole life, and I wasn't stupid enough to set foot in Sembia or Cormyr anyway. */
 	++ @370 /* You're still a bitter thing, you know. */ + rh#talk7_bitter
 	++ @371 /* You were afraid of retaliation, you mean. */ + rh#talk7_retaliation
 	++ @372 /* Didn't care for Zhent caravans, did you? Do I detect a burgeoning conscience? */ + rh#talk7_conscience
 	++ @373 /* Fresh starts can be frightening, but sometimes there's nothing more rewarding than a new life. */ + rh#talk7_start
 	++ @374 /* Running caravans... I'd hoped for something a bit more... romantic. */ + rh#talk7_roman
 	++ @375 /* You really did go soft, didn't you? I suppose we all can't be children of Bhaal. */ + rh#talk7_soft
 	++ @376 /* If you're aiming for sympathy, you're not getting anywhere. */ + rh#talk7_sympathy
END

IF ~~ rh#talk7_bitter
 SAY @377 /* Heh. I suppose I am. */
 = @378 /* Enough of this, <CHARNAME>. You have your story now, we'll... talk again later, I suppose. */
IF ~~ EXIT
END

IF ~~ rh#talk7_retaliation
 SAY @379 /* There's no point in denying it. They-- */
 = @380 /* Enough, <CHARNAME>. You have your story now, we'll... talk again later, I suppose. */
IF ~~ EXIT
END

IF ~~ rh#talk7_conscience
 SAY @381 /* How... quaint, <CHARNAME>. If that's what you need to believe in order to be comfortable around me, though, I won't stop you. */
IF ~~ EXIT
END

IF ~~ rh#talk7_start
 SAY @382 /* Is it, then? Well, maybe it's even true. I suppose we'll find out. */
IF ~~ EXIT
END

IF ~~ rh#talk7_sympathy
 SAY @383 /* No, I wanted... well, it doesn't really matter now, does it? If you expect me to cast myself as the villain of my own story, however, you're more a fool than those damned Harpers. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk7_roman
 SAY @384 /* I... see. */
 = @385 /* Enough, <CHARNAME>. You have your story now, we'll...talk again later, I suppose. */
IF ~~ EXIT
END

IF ~~ rh#talk7_soft
 SAY @386 /* I suppose everyone is painted in grey next to you, <CHARNAME>. Bloodlust may not run through my veins as it does yours, but I'm far from weak, and further yet from gentle. */
 = @387 /* Enough of this nonsense. If you don't much mind, I think I'll wander off and see if I can't find you some villages to conquer. */
IF ~~ EXIT
END

IF ~~ rh#talk_delay
 SAY @388 /* Fine. Whenever you're ready. */
IF ~~ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",-2) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",600)~ EXIT
END
END

// 8.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",16)~ THEN RH#ADRJ rh#talk8
@389 /* <CHARNAME>, you might want to try this. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @390 /* What is this? */ + rh#talk8_this
 	++ @391 /* Not right now, Adrian. */ + rh#talk_delay

APPEND RH#ADRJ

IF ~~ rh#talk8_this
 SAY @392 /* It's a... mostly naturally occurring remedy for sleepless nights. It began life as an answer to hangovers and... similar afflictions, before a priestess of Talona decided to experiment with it. */
 = @393 /* Without telling anyone. She poisoned several people before we killed her, but one of the experiments was actually salvageable. And I suppose that was more than you wanted to know. */
 	++ @394 /* Yeah... thanks, but a potion created by a cleric of the Mistress of Disease is not my idea of a smart move. Not that I didn't enjoy the story. */ + rh#talk8_talona
 	++ @395 /* That's... colorful, but if it's safe, I suppose I'll give it a try. */ + rh#talk8_try1
 	++ @396 /* Darling, I'd like to know quite a bit more than that. */ + rh#talk8_know
 	++ @397 /* Most people, when they tell crazy stories, talk about glorious past exploits, not... whatever that was. */ + rh#talk8_glory
 	++ @398 /* My nights are fine, thank you very much. Not that I didn't appreciate the story. */ + rh#talk8_nights
END

IF ~~ rh#talk8_talona
 SAY @399 /* Understandable, though I assure you, this one is perfectly safe. As far as stories go, I've shared enough of my own for the moment. Yours, however... */
IF ~~ + rh#talk8_main1
END

IF ~~ rh#talk8_try1
 SAY @400 /* Not extremely colorful. But I've shared enough of my own stories for the moment. Yours, however... */
IF ~~ + rh#talk8_main1
END

IF ~~ rh#talk8_know
 SAY @401 /* I don't doubt it, though I've shared enough of my own stories for the moment. Yours, however... */
IF ~~ + rh#talk8_main1
END

IF ~~ rh#talk8_glory
 SAY @402 /* Glorious past exploits? I tend to consider it bad policy to boast in public about deeds that would get me hanged for treason, conspiracy, and a number of other crimes up north. Your past exploits, however... */
IF ~~ + rh#talk8_main1
END

IF ~~ rh#talk8_nights
 SAY @403 /* As you like. If we're discussing stories, though, I think I've shared enough of my own for the moment. Yours, however... */
IF ~~ + rh#talk8_main1
END

IF ~~ rh#talk8_main1
 SAY @404 /* You know, I never quite got to Baldur's Gate. I always meant to, but the closest I've ever managed is apparently... well, here. How did you like it? */
 	++ @405 /* Better than Athkatla, at least. Despite the Iron Crisis, it was easier to know who to trust. Athkatla's government is just one shade of grey. */ + rh#talk8_grey 
 	++ @406 /* It seemed so big when I was there, but Athkatla has to be at least twice as large. Perhaps even Baldur's Gate would seem provincial if I went back. */ + rh#talk8_provincial
 	++ @407 /* The power games in a place like that are a bit... addicting, I found. */ + rh#talk8_addicting
 	++ @408 /* It was amazing. I was probably too caught up in my own adventure to tell you much about the city itself, though. */ + rh#talk8_candlekeep
 	++ @409 /* I've never really cared for cities in general. I prefer wandering the countryside. */ + rh#talk8_country
 	++ @410 /* I was a bit busy trying not to get killed to be interested in sight-seeing. I don't think I'd even want to go back... too many bad memories. */ + rh#talk8_memories
END

IF ~~ rh#talk8_grey
 SAY @411 /* At least it keeps you thinking, <CHARNAME>. Nobility and villainy and nothing in between... visions like that are the sign of a small mind, and small minds are of very limited value. */
 = @412 /* But you... it's funny to think of you living secluded behind the walls of the tiny library, your destiny clawing at the gates. */
IF ~~ + rh#talk8_main2
END

IF ~~ rh#talk8_provincial
 SAY @413 /* Someone like you, <CHARNAME>... I don't doubt that someday Waterdeep itself might not be large enough for you. */
 = @414 /* But it's funny to think of you living secluded behind the walls of the tiny library, isn't it? Your destiny clawing at the gates. */
IF ~~ + rh#talk8_main2
END

IF ~~ rh#talk8_addicting
 SAY @415 /* Yes, I know the feeling. Heh. It's funny to think of you living secluded behind the walls of the tiny library, isn't it? Your destiny clawing at the gates. */
IF ~~ + rh#talk8_main2
END
 
IF ~~ rh#talk8_candlekeep
 SAY @416 /* I guess that's probably pretty common. We all view the world through the lens of our own private melodramas... some are just larger than others. Yours, my <PRO_LADYLORD>, I suspect are as large as it gets. */
 = @417 /* Still, it's funny to think of you living secluded behind the walls of the tiny library, your destiny clawing at the gates. */
IF ~~ + rh#talk8_main2
END

IF ~~ rh#talk8_country
 SAY @418 /* Even the countryside was probably better there than in Amn. Not that I'd care to compare them... I think a couple of excursions into the Anauroch cured me of any great lingering affection for the natural world. */
 = @419 /* But the city-hating hero upon whom the fates of many rest... it's funny to think of you living secluded behind the walls of the tiny library, your destiny clawing at the gates. */
IF ~~ + rh#talk8_main2
END

IF ~~ rh#talk8_memories
 SAY @420 /* No place to go but forward, is it? You know, it's funny to think of you living secluded behind the walls of the tiny library, your destiny clawing at the gates. */
IF ~~ + rh#talk8_main2
END

IF ~~ rh#talk8_main2
 SAY @421 /* The Hero of the Sword Coast... did they raise a statue in your honor, I wonder? They damn well better have. I can't imagine what it would be like, with a reputation like that. To be a hero... */
	++ @422 /* I do hope your mother warned you that your face could freeze like that. */ + rh#talk8_mother
	++ @423 /* I've honestly never really thought about it. */ + rh#talk8_never
	+ ~ReputationGT(Player1,14)~ + @424 /* Get used to it. It's a reputation you now share in, vicariously or otherwise. */ + rh#talk8_try
	++ @425 /* Being welcome everywhere, adored... I grew up wanting wealth and excitement, and I suppose I have it now. */ + rh#talk8_neutral
	+ ~!Alignment(Player1,MASK_EVIL)~ + @426 /* You do what you have to do to be able to sleep at night. Doubly so when your blood is as corrupted as mine. */ + rh#talk8_lawful
	+ ~Alignment(Player1,MASK_GOOD)~ + @427 /* It's rewarding. There are children all across the Sword Coast who will grow up with parents, because of me. That's powerful. */ + rh#talk8_good
	+ ~!Alignment(Player1,MASK_GOOD)~ + @428 /* Save a few villages, kill a handful of bandits, march through Baldur's Gate shining like the sun, and you can get the whole world eating out of your hand. */ + rh#talk8_genresavvy
	+ ~Alignment(Player1,MASK_EVIL)~ + @429 /* My reputation was horrible. The nastier stories may not have reached Amn yet, but if I rescued the Sword Coast, it was only because I wasn't going to let my mad brother beat me. */ + rh#talk8_evil
END

IF ~~ rh#talk8_mother
 SAY @430 /* My mother never warned me about much of anything at all, and I doubt she'd have minded my sneers. Still... */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk8_END1
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk8_END2
END

IF ~~ rh#talk8_never
 SAY @431 /* I credited you with more imagination than that, <CHARNAME>, but if you don't want to talk, then I see no point in forcing you. Still... */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk8_END1
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk8_END2
END

IF ~~ rh#talk8_try
 SAY @432 /* Not vicariously enough, to be sure. Still... */
IF ~~ + rh#talk8_END1
END

IF ~~ rh#talk8_neutral
 SAY @433 /* Ha! <CHARNAME>... such a glory hound, sometimes. Well, as long as you won't be handing our money off to every charity in Amn, I won't complain. */
	++ @434 /* I've earned every piece of gold. If I'm going to risk my life saving people, I expect some rewards. */ + rh#talk8_neutral1
	++ @435 /* No more than I can afford, of course. Adventuring is so lucrative, I hardly need all of it. */ + rh#talk8_neutral2
	++ @436 /* Call me a glory hound, if you want, but I really do like helping people. */ + rh#talk8_neutral3
	++ @437 /* Good, because I won't listen if you do. */ + rh#talk8_neutral4
END

IF ~~ rh#talk8_neutral1
 SAY @438 /* Indeed. Endless gratitude only goes so far. */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk8_END1
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk8_END2
END

IF ~~ rh#talk8_neutral2
 SAY @439 /* If you don't want to invest your money wisely, I suppose that's your problem. Still, aside from that... */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk8_END1
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk8_END2
END

IF ~~ rh#talk8_neutral3
 SAY @440 /* Whatever makes you happy, I suppose. Still, aside from that... */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk8_END1
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk8_END2
END

IF ~~ rh#talk8_neutral4
 SAY @441 /* Ha! My <PRO_LADYLORD>, you wound me! */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk8_END1
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk8_END2
END

IF ~~ rh#talk8_lawful
 SAY @442 /* Your blood is hardly your fault, <CHARNAME>. Certainly nothing to need to atone for. */
	++ @443 /* That's not it. The things I feel sometimes because of it... if I wavered in my convictions, I think Bhaal's taint would destroy me. */ + rh#talk8_lawful1
	++ @444 /* I draw much of my power from a source that is evil. Unquestionably evil. I can't help but feel like I bear some responsibility for it. */ + rh#talk8_lawful2
	++ @445 /* Do you know how many people have died for me? Have been killed because Sarevok came after me? The list starts with Gorion... no, it may well have started with my mother. */ + rh#talk8_lawful3
	++ @446 /* You don't have the slightest idea what you're talking about, Adrian. */ + rh#talk8_lawful4
END

IF ~~ rh#talk8_lawful1
 SAY @447 /* Oh. That... makes a horrible sort of sense. Well, whatever you need to do to keep that in check, I have no quarrel with it. */
IF ~~ + rh#talk8_END1
END

IF ~~ rh#talk8_lawful2
 SAY @448 /* Don't be ridiculous, <CHARNAME>. You might as well blacken every mirror if you're that afraid of yourself. */
IF ~~ EXIT
END

IF ~~ rh#talk8_lawful3
 SAY @449 /* Still, you never lifted a sword or cast a spell in those situations... you really shouldn't blame yourself for them. */
IF ~~ + rh#talk8_END1
END

IF ~~ rh#talk8_lawful4
 SAY @450 /* No? I know a good deal more than you do if this is how you react to it. */
IF ~~ EXIT
END

IF ~~ rh#talk8_good
 SAY @451 /* And there are children in Cormyr who will grow up as orphans because of me. That's rather powerful too. */
 = @452 /* Oh, don't give me that look, <CHARNAME>. You walked into that one. In any case, I've done precious little pillaging in my time, so you needn't start getting righteous on me. */
	++ @453 /* I'm sure you felt like you had to do whatever you did. */ + rh#talk8_good1
	++ @454 /* Were you always this insubordinate or am I just lucky? */ + rh#talk8_good2
	++ @455 /* You don't need to be so bitter about everything. */ + rh#talk8_good3
	+ ~CheckStatGT(Player1,14,WIS)~ + @456 /* I know how viciously defensive you get whenever your bizarre mindset is challenged. As long as you don't wander off and start plotting to conquer Athkatla, I can handle it. */ + rh#talk8_good4
	++ @457 /* You asked the question. You only have yourself to blame if you don't like the answer. */ + rh#talk8_good5
END

IF ~~ rh#talk8_good1
 SAY @458 /* Righteous as a paladin and as patronizing as a Harper, are we? Don't think I stick around because of your glorious virtue, <CHARNAME>. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk8_good2
 SAY @459 /* You're less likely to murder me for it than my old employers. But my insubordination aside... */
IF ~~ + rh#talk8_END1
END

IF ~~ rh#talk8_good3
 SAY @460 /* About everything? I wouldn't go that far. But my bitterness aside... */
IF ~~ + rh#talk8_END1
END

IF ~~ rh#talk8_good4
 SAY @461 /* Well, I suppose I should cross that off of my list of goals, then. */
IF ~~ + rh#talk8_END1
END

IF ~~ rh#talk8_good5
 SAY @462 /* I suppose I keep on hoping that one day I'll wake up to find that you've magically become sensible. But my wishes aside... */
IF ~~ + rh#talk8_END1
END

IF ~~ rh#talk8_genresavvy
 SAY @463 /* Conquer the world through kindness, is it, my <PRO_LADYLORD>? As good a scheme as any, I suppose, and no more dangerous than wandering around setting villages on fire like a deranged madman. Probably less. */
	++ @464 /* Negotiate with some monsters to attack a wealthy merchant or village and then rush in to the rescue? If the monsters weren't already doing it without my help, it might be worthwhile. */ + rh#talk8_genresavvy1
	++ @465 /* Honestly, it even feels good too. Look at me: I'm doing good things, everyone loves me, and now I'm rich. Everyone's happy, especially me. */ + rh#talk8_genresavvy2
	++ @466 /* Conquer the world? That was the ultimate scheme, but I got grabbed by Irenicus before I could charm my way far enough into the government in Baldur's Gate. */ + rh#talk8_genresavvy3
	++ @467 /* I thought you'd like that answer. You're really predictable sometimes, darling. */ + rh#talk8_genresavvy4
END

IF ~~ rh#talk8_genresavvy1
 SAY @468 /* Oh, we play games like that back home. Honestly, it's better to stick with the naturally occurring threats. Safer. Also, funnier when the Realms' most self-impressed start trying to question you. */
IF ~~ + rh#talk8_END2
END

IF ~~ rh#talk8_genresavvy2
 SAY @469 /* Ha! As long as you're enjoying yourself, I suppose it's for the best. */
IF ~~ + rh#talk8_END2
END

IF ~~ rh#talk8_genresavvy3
 SAY @470 /* Unpleasant, isn't it? To have everything one moment, and then the next... */
 = @471 /* Listen to me, getting morose. */
IF ~~ + rh#talk8_END2
END

IF ~~ rh#talk8_genresavvy4
 SAY @472 /* And you apparently like to wrap yourself up in enigma as much as I do. */
IF ~~ + rh#talk8_END2
END

IF ~~ rh#talk8_evil
 SAY @473 /* Good. Hells, I won't claim that the Sword Coast didn't need to be saved... by all accounts, it did, but at least you're not some hapless idiot wandering around, too engrossed in everyone else's problems to notice your own. */
	++ @474 /* Honestly, I'd have happily let the entire Sword Coast burn if it wouldn't have meant my death also. I'd have enjoyed the show. */ + rh#talk8_evil1
	++ @475 /* I suppose some of the problems were probably legitimate, but people thinking it was reasonable to demand strangers to risk their lives to recover gaudy personal effects for them... I think not. */ + rh#talk8_evil2
	++ @476 /* There are enough hapless idiots wandering around. Faerun doesn't need another one. */ + rh#talk8_evil3
	++ @477 /* I thought you'd like that answer. You're really predictable sometimes. */ + rh#talk8_genresavvy4
END

IF ~~ rh#talk8_evil1
 SAY @478 /* Happily? You've never even known anything but the Sword Coast, have you? */
 = @479 /* Is that's Bhaal's influence, I wonder, crying out for bloodshed? */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk8_evil2
 SAY @480 /* And I'm sure you were a worthless evil monster if you refused. Ha. */
IF ~~ + rh#talk8_END2
END

IF ~~ rh#talk8_evil3
 SAY @481 /* True enough. */
IF ~~ + rh#talk8_END2
END

IF ~~ rh#talk8_END1
 SAY @482 /* I have to give it to you, my <PRO_LADYLORD>. At least you're not like so many of the Realms' supposedly goodly folk... too afraid of their own shadows to step off the righteous path, only good because they lacked the stomach or courage to be anything else. The so-called virtue of the timid and powerless. Disgusting. */
 	++ @483 /* Thank you for the compliment. I think. */ + rh#talk8_END2e
	++ @484 /* That's uncharitable. */ + rh#talk8_END1a
	++ @485 /* Are you saying I could be darker? */ + rh#talk8_END1b
	++ @486 /* I take it that's not the sort of strength you're used to. */ + rh#talk8_END1c
	++ @487 /* Your flattery, for lack of a better term, doesn't interest me. Nor do you. */ + rh#talk8_END2d
END

IF ~~ rh#talk8_END1a
 SAY @488 /* I'm not a very charitable person, <CHARNAME>. */
 = @489 /* Enough of this. Let's continue on. But do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END1b
 SAY @490 /* You're a <PRO_SONDAUGHTER> of Bhaal, <CHARNAME>. You could be as dark as you want to be. */
 = @491 /* Ah, no matter. Let's continue on. But do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END1c
 SAY @492 /* No, it really isn't. */
 = @491 /* Ah, no matter. Let's continue on. But do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END2
 SAY @493 /* I like you, my <PRO_LADYLORD>. I wasn't sure I would, especially given your unfortunate Harper plagued upbringing, but you've impressed me more than once. Not many people do that. */
 	++ @494 /* I'm glad to hear it. */ + rh#talk8_END2e
	++ @495 /* I'm a <PRO_SONDAUGHTER> of Bhaal, Adrian. I'm not 'many people'. */ + rh#talk8_END2a
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @496 /* I take it, then, that you agree with me that I would make a stunning dark queen for this country? */ + rh#talk8_END2b
	++ @497 /* Rest assured, I'm nothing like a Harper. */ + rh#talk8_END2g
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @498 /* Well, I took you along for your pretty face, but apparently you have a clever tongue as well. Perhaps we'll find out what else it can do. */ + rh#talk8_END2c
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @499 /* Well, I took you along for your pretty face, but apparently you have a clever tongue as well. */ + rh#talk8_END2f
	++ @487 /* Your flattery, for lack of a better term, doesn't interest me. Nor do you. */ + rh#talk8_END2d
END

IF ~~ rh#talk8_END2a
 SAY @500 /* I think that depends upon how... virile your delightful father was. */
 = @501 /* But enough of this. Let's continue on. And do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END2b
 SAY @502 /* Getting a bit ahead of ourselves, are we? Not that I don't agree. */
 = @501 /* But enough of this. Let's continue on. And do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END2c
 SAY @503 /* Ah, my lady. You are incorrigible. */
 = @504 /* But do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END2d
 SAY @505 /* Fine. Rest assured, I won't bother again. */ 
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk8_END2e
 SAY @506 /* Hmm. Enough of this. Let's continue on. But do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END2f
 SAY @507 /* Hmm. I see. */
 = @508 /* In any case, do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END

IF ~~ rh#talk8_END2g
 SAY @494 /* I'm glad to hear it. */
 = @508 /* In any case, do try the remedy. I know you're having trouble sleeping. */ 
IF ~~ EXIT
END
END

// 9.
CHAIN IF ~OR(7) AreaCheck("AR0020") AreaCheck("AR0300") AreaCheck("AR0400") AreaCheck("AR0500") AreaCheck("AR0700") AreaCheck("AR0900") AreaCheck("AR1000") Global("rh#AdrianTalks","GLOBAL",18)~ THEN RH#ADRJ rh#talk9a
@509 /* Damn this blasted city and its nonsensical ban on magic. It reminds me of Mulmaster, and it smells like it too. Who would have even thought that possible? */
= @510 /* If you ever come into your dear father's power, <CHARNAME>, do me a favor and wipe Amn off of the face of Faerun. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN @511 /* My lady, must we endure this mage's genocidal tirades? */
== RH#ADRJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN
@512 /* Well, you certainly don't have to, Helmite. You're welcome to return to your precious Order. */
END
 	++ @513 /* I see you're in a pleasant mood to<DAYNIGHT>. */ + rh#talk9_pleasant
 	++ @514 /* One future massacre, coming up. Anything for you. */ + rh#talk9_genocide1
 	++ @515 /* Mulmaster? */ + rh#talk9_mulmaster
 	++ @516 /* Adrian, you might like Athkatla if you gave yourself half a chance. */ + rh#talk9_sincerely
 	++ @517 /* Do you work at being this annoying, or does it just come naturally? */ + rh#talk9_naturally
 	++ @518 /* Oh, shut up. I'm tired of your nonsense. */ + rh#talk9_end

CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",18)~ THEN RH#ADRJ rh#talk9b
@519 /* Damn this blasted country and its nonsensical fear of magic. */
= @510 /* If you ever come into your dear father's power, <CHARNAME>, do me a favor and wipe Amn off of the face of Faerun. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN @511 /* My lady, must we endure this mage's genocidal tirades? */
== RH#ADRJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN @512 /* Well, you certainly don't have to, Helmite. You're welcome to return to your precious Order. */
END
 	++ @513 /* I see you're in a pleasant mood to<DAYNIGHT>. */ + rh#talk9_pleasant
 	++ @514 /* One future massacre, coming up. Anything for you. */ + rh#talk9_genocide1
 	++ @520 /* Adrian, you might like Amn if you gave yourself half a chance. */ + rh#talk9_sincerely
 	++ @517 /* Do you work at being this annoying, or does it just come naturally? */ + rh#talk9_naturally
 	++ @518 /* Oh, shut up. I'm tired of your nonsense. */ + rh#talk9_end

APPEND RH#ADRJ

IF ~~ rh#talk9_pleasant
 SAY @521 /* I'm always in a pleasant mood, my <PRO_LADYLORD>. But I take it that's a refusal? A pity. */
IF ~~ + rh#talk9_main1
END

IF ~~ rh#talk9_mulmaster
 SAY @522 /* A delightful little city back home that has the same sort of rules concerning magic that Athkatla does. Pity Cyric didn't send his dragons against them instead. */
IF ~~ + rh#talk9_main1
END

IF ~~ rh#talk9_genocide1
 SAY @523 /* You do know how to make a man feel appreciated, my lady. Still, I suppose there's no point in dwelling upon possibilities like that. */
IF ~~ + rh#talk9_main1
END

IF ~~ rh#talk9_genocide2
 SAY @524 /* You do know how to make someone feel appreciated, my <PRO_LADYLORD>. Still, I suppose there's no point in dwelling upon possibilities like that. */
IF ~~ + rh#talk9_main1
END

IF ~~ rh#talk9_sincerely
 SAY @525 /* I sincerely doubt that. But I take it that's a refusal? A pity. */
IF ~~ + rh#talk9_main1
END

IF ~~ rh#talk9_naturally
 SAY @526 /* A bit of both, I suppose. But I take it that's a refusal? A pity. */
IF ~~ + rh#talk9_main1
END

IF ~~ rh#talk9_end
 SAY @527 /* ...the feeling is very much mutual, <CHARNAME>. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk9_main1
 SAY @528 /* I don't *like* this. Heavens know, I'm used to oppression, but this idiotic Amnish terror of the Art? You'd think that the Mother of All Magic wasn't the queen of sanctimonious fools these days. */
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1) Class(Player1,MAGE_ALL)~ + @529 /* You don't need to tell me about it. I'm not thrilled with the looks I keep getting either. */ + rh#talk9_mage1
  	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",1) Class(Player1,MAGE_ALL)~ + @529 /* You don't need to tell me about it. I'm not thrilled with the looks I keep getting either. */ + rh#talk9_mage2
 	+ ~!Class("rh#Adrian",CLERIC_MAGE)~ + @530 /* I take it you're not a member of the church of Mystra. */ + rh#talk9_mystra
 	+ ~Class("rh#Adrian",CLERIC_MAGE)~ + @531 /* I take it you're not a priest of Mystra. */ + rh#talk9_mystra
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @532 /* It is a bit much, isn't it? */ + rh#talk9_much1
  	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @532 /* It is a bit much, isn't it? */ + rh#talk9_much2
 	++ @533 /* I don't care for the hypocrisy myself, given how powerful the Cowled Wizards are. */ + rh#talk9_cowl
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @534 /* Are you professionally offended by this or am I imagining things? */ + rh#talk9_blood1
  	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @534 /* Are you professionally offended by this or am I imagining things? */ + rh#talk9_blood2
 	++ @535 /* The more I keep you around, the more I understand why people hate mages. */ + rh#talk9_hate
 	++ @536 /* I'm used to being feared. It doesn't really matter why. */ + rh#talk9_fear
END
  
IF ~~ rh#talk9_mage1
 SAY @537 /* Mmm. Not all those looks are *bad*, my dear. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_mage2
 SAY @532 /* It is a bit much, isn't it? */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_mystra
 SAY @538 /* What a thought... no. Azuth. A more reasonable deity by far. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_much1
 SAY @539 /* You do have a talent for understatement, my dear. One of many. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_much2
 SAY @540 /* You do have a talent for understatement, <CHARNAME>. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_cowl
 SAY @541 /* Mmm. I wonder if they've filled a void or created it in the first place. Not that it particularly matters now. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_blood1
 SAY @542 /* Given your blood, quite possibly both. */
 = @543 /* Oh, don't scowl at me like that, <CHARNAME>. It doesn't become you. No, you're right. Professionally offended indeed. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_blood2
 SAY @542 /* Given your blood, quite possibly both. */
 = @544 /* Oh, don't scowl at me like that, <CHARNAME>. No, you're right. Professionally offended indeed. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_fear
 SAY @545 /* Still, I prefer it when the reasons are legitimate. */
IF ~~ + rh#talk9_main2
END

IF ~~ rh#talk9_hate
 SAY @546 /* And I dare say I'm beginning to understand why they hunt Bhaalspawn. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk9_main2
 SAY @547 /* Ah, well. It's a pointless thing to dwell on. I suppose there are worse places to be a mage, though I wouldn't be able to think of any offhand. */
	++ @548 /* I'd have thought that you'd appreciate the Cowled Wizards' stranglehold on magic. */ + rh#talk9_stranglehold
	++ @549 /* At least the country is rich in spells and enchantments, even if the people fear it. */ + rh#talk9_enchantments
	++ @550 /* That shows quite the lack of imagination on your part. */ + rh#talk9_imagination
	++ @551 /* Get out some of that wine you've hidden away and you'll stop dwelling upon it. */ + rh#talk9_getoutwine
	++ @552 /* I don't want to hear it. */ + rh#talk9_donthear
END

IF ~~ rh#talk9_stranglehold
 SAY @553 /* I'd appreciate it more if it didn't apply to me as well. I should stop complaining, I know. As miserable as Amn may be... well. */
IF ~~ + rh#talk9_main3
END

IF ~~ rh#talk9_enchantments
 SAY @554 /* There is that. I should stop complaining, I know. As miserable as Amn may be... well. */ 
IF ~~ + rh#talk9_main3
END

IF ~~ rh#talk9_imagination
 SAY @555 /* Well, forgive me the hyperbole. I should stop complaining, I know. As miserable as Amn may be... well. */
IF ~~ + rh#talk9_main3
END

IF ~~ rh#talk9_getoutwine
 SAY @556 /* You are just full of good ideas today, my <PRO_LADYLORD>. I should stop complaining, I know. As miserable as Amn may be... well. */
IF ~~ + rh#talk9_main3
END

IF ~~ rh#talk9_donthear
 SAY @557 /* Then you certainly don't have to. */
IF ~~ EXIT
END

IF ~~ rh#talk9_main3
 SAY @558 /* Truth be told, you're a decent companion, <CHARNAME>. Certainly better than what I'm accustomed to. Granted, I suppose that's not saying much. */
 	++ @559 /* I hope you won't be sneering about me like that once we're no longer traveling together. */ + rh#talk9_sneer
 	++ @560 /* A lich would be better company than what you're used to. */ + rh#talk9_lich
 	++ @561 /* Thank you for the compliment, even if it was slightly backhanded. */ + rh#talk9_compliment
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @562 /* You're not nearly as bad a companion as I would have expected myself. */ + rh#talk9_companion1
 	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + @562 /* You're not nearly as bad a companion as I would have expected myself. */ + rh#talk9_companion2
 	++ @563 /* I wish I could say that the feeling were mutual. */ + rh#talk9_mutual
END

IF ~~ rh#talk9_sneer
 SAY @564 /* Sneering? I didn't notice. But no... no. You've given me precious little reason to sneer. Hopefully... hopefully that won't change. */
IF ~~ EXIT
END

IF ~~ rh#talk9_lich
 SAY @565 /* That's...really not quite fair. Ah, no matter. Let's continue on. */
IF ~~ EXIT
END

IF ~~ rh#talk9_compliment
 SAY @566 /* You're quite welcome. */
IF ~~ EXIT
END

IF ~~ rh#talk9_companion1
 SAY @567 /* I... hmm. I'm glad to hear it. I think. */
IF ~~ EXIT
END

IF ~~ rh#talk9_companion2
 SAY @568 /* Heh. I'm glad to hear it. I think. */
IF ~~ EXIT
END

IF ~~ rh#talk9_mutual
 SAY @569 /* Hmm. A pity, indeed. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END
END

// 10.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",20)~ THEN RH#ADRJ rh#talk10
@570 /* If I had to wander aimlessly around Amn, I suppose I could be doing it in worse company than yours, <CHARNAME>. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
IF ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#talk10a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#ft10

APPEND RH#ADRJ

IF ~~ rh#talk10a
 SAY @571 /* Still, had someone told me a year ago that I would be enjoying the company of a Harper's ward, I would have laughed in his face. Or behind his back, more likely. What mad irony this is. */
	++ @572 /* I think I have you beaten in terms of mad irony ten times over, Adrian. */ + rh#talk10_beaten
	+ ~InParty("Jaheira")~ + @573 /* It could be worse. At least I'm not a Harper myself. */ + rh#talk10_harperjae
	+ ~!InParty("Jaheira")~ + @573 /* It could be worse. At least I'm not a Harper myself. */ + rh#talk10_harper
	++ @574 /* Most people obsess over my real father, not my adoptive one. This is almost refreshing. */ + rh#talk10_refreshing
	++ @575 /* Could you please just forget about Gorion? */ + rh#talk10_forget
	++ @576 /* We are an odd pair, aren't we? */ + rh#talk10_oddpair
	++ @577 /* Not half as mad as the fact that I'm still putting up with your backhanded nonsense. */ + rh#talk10_nonsense
	++ @578 /* Can we discuss this later? */ + rh#talk_delay
END

IF ~~ rh#ft10
 SAY @579 /* Still, had someone told me a year ago that I'd be keeping the company of a Harper's ward, I would have laughed in his face. Or behind his back, more likely. What mad irony this is. */
	++ @572 /* I think I have you beaten in terms of mad irony ten times over, Adrian. */ + rh#ft10_beaten
	+ ~InParty("Jaheira")~ + @573 /* It could be worse. At least I'm not a Harper myself. */ + rh#ft10_harperjae
	+ ~!InParty("Jaheira")~ + @573 /* It could be worse. At least I'm not a Harper myself. */ + rh#ft10_harper
	++ @574 /* Most people obsess over my real father, not my adoptive one. This is almost refreshing. */ + rh#ft10_refreshing
	++ @575 /* Could you please just forget about Gorion? */ + rh#ft10_forget
	++ @577 /* Not half as mad as the fact that I'm still putting up with your backhanded nonsense. */ + rh#ft10_nonsense
	++ @578 /* Can we discuss this later? */ + rh#talk_delay
END

IF ~~ rh#talk10_beaten
 SAY @580 /* After that mess with Sarevok... no, I won't deny that. Still, I can't help but wonder how he would have reacted if you had dragged me home with you. Gorion, not Sarevok. */
IF ~~ + rh#talk10_main1
END

IF ~~ rh#talk10_harperjae
 SAY @581 /* Jaheira is more than enough. Thank the gods for small miracles, I suppose. Still, I can't help but wonder how your Gorion would have reacted had you dragged me home with you. */
IF ~~ + rh#talk10_main1
END

IF ~~ rh#talk10_harper
 SAY @582 /* Heavens forfend! Thank the gods for small miracles, I suppose. Still, I can't help but wonder how your Gorion would have reacted had you dragged me home with you. */
IF ~~ + rh#talk10_main1
END

IF ~~ rh#talk10_refreshing
 SAY @583 /* I'm quite capable of doing both, you know. I doubt Bhaal would have approved, but I can't help but wonder how Gorion would have reacted had you dragged me home with you. */
IF ~~ + rh#talk10_main1
END

IF ~~ rh#talk10_forget
 SAY @584 /* I suppose I'll have to try, but I'll admit, I can't help but wonder how he would have reacted had you dragged me home with you. */
IF ~~ + rh#talk10_main1
END

IF ~~ rh#talk10_oddpair
 SAY @585 /* Indeed. I keep on finding myself wondering how your Gorion would have reacted had you dragged me home with you. */
IF ~~ + rh#talk10_main1
END

IF ~~ rh#talk10_nonsense
 SAY @586 /* Is that so? Well, I suppose it's back to aimless wandering then. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#ft10_beaten
 SAY @587 /* After that mess with Sarevok... no, I won't deny that. */
IF ~~ + rh#ft10_main1
END

IF ~~ rh#ft10_harperjae
 SAY @588 /* Jaheira is more than enough. Thank the gods for small miracles, I suppose. */
IF ~~ + rh#ft10_main1
END

IF ~~ rh#ft10_harper
 SAY @589 /* Heavens forfend! Thank the gods for small miracles, I suppose. */
IF ~~ + rh#ft10_main1
END

IF ~~ rh#ft10_refreshing
 SAY @590 /* I'm quite capable of doing both. */
IF ~~ + rh#ft10_main1
END

IF ~~ rh#ft10_forget
 SAY @591 /* Unlikely, at best. */
IF ~~ + rh#ft10_main1
END

IF ~~ rh#ft10_nonsense
 SAY @586 /* Is that so? Well, I suppose it's back to aimless wandering then. */
IF ~~ DO ~SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk10_main1
 SAY @592 /* Not particularly well, I imagine. */
 	+ ~Alignment(Player1,MASK_EVIL) !Alignment(Player1,CHAOTIC_EVIL)~ + @593 /* He never did approve of me anyway. */ + rh#talk10_approve1
  	+ ~Alignment(Player1,MASK_CHAOTIC)~ + @593 /* He never did approve of me anyway. */ + rh#talk10_approve2
   	+ ~!Alignment(Player1,MASK_EVIL) !Alignment(Player1,MASK_CHAOTIC)~ + @593 /* He never did approve of me anyway. */ + rh#talk10_approve3
 	++ @594 /* He'd have been completely horrified. */ + rh#talk10_horrified
 	++ @595 /* He wasn't quite as judgemental as you seem to believe. He did take in a child of Bhaal. */ + rh#talk10_bhaal
 	++ @596 /* Had I dragged you home with me? That's quite forward of you, darling. */ + rh#talk10_lovers
 	++ @597 /* Candlekeep is a lifetime away. I'd rather not dwell upon it. */ + rh#talk10_dwell
END

IF ~~ rh#ft10_main1
 SAY @598 /* Gorion's ward... you're more tolerable than I would have expected, so perhaps his influence wasn't as great as it might have been. */
 	++ @599 /* Or perhaps the last year has hardened me somewhat. */ + rh#ft10_hardened
 	+ ~Alignment(Player1,MASK_EVIL) !Alignment(Player1,CHAOTIC_EVIL)~ + @600 /* You find me tolerable, do you? Gorion didn't approve of me at all. */ + rh#talk10_approve1
  	+ ~Alignment(Player1,MASK_CHAOTIC)~ + @600 /* You find me tolerable, do you? Gorion didn't approve of me at all. */ + rh#talk10_approve2
   	+ ~!Alignment(Player1,MASK_EVIL) !Alignment(Player1,MASK_CHAOTIC)~ + @600 /* You find me tolerable, do you? Gorion didn't approve of me at all. */ + rh#ft10_approve3	
 	++ @601 /* Tolerable? Keep this up and I may very well just hand you over to your enemies. */ + rh#ft10_tolerable
 	++ @602 /* You should show him some respect. He was too busy keeping me safe to try to indoctrinate me. */ + rh#talk10_bhaal
 	++ @597 /* Candlekeep is a lifetime away. I'd rather not dwell upon it. */ + rh#talk10_dwell
END

IF ~~ rh#ft10_hardened
 SAY @603 /* It's made you more pragmatic, at least. You're fortunate to have broken free of his expectations. */
 = @604 /* A decade ago... well. I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#talk10_approve1
 SAY @605 /* No, you do seem a bit more... pragmatic than he probably would have liked. That's for the best, I think. You'd probably have been murdered ten feet out of Candlekeep had it been otherwise. */
 = @606 /* You're fortunate to have broken free of his expectations, though. A decade ago... well. I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#talk10_approve2
 SAY @607 /* No, you do seem a bit more... willful than he probably would have liked. I think you could try anyone's patience sometimes... though I know I have little enough room to speak there. */
 = @608 /* You're fortunate to have broken free of his expectations. A decade ago... well. I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#talk10_approve3
 SAY @609 /* Really? I can't imagine what he might have found fault with, though I'm hardly the person to consult when it comes to deciphering Harper sensibilities. The whole lot of them are mad. */
 = @608 /* You're fortunate to have broken free of his expectations. A decade ago... well. I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#ft10_approve3
 SAY @610 /* Really? You may not be infuriating, but I still can't imagine what he might have found fault with. I'm hardly the person to consult when it comes to deciphering Harper sensibilities, though. The whole lot of them are mad. */
 = @608 /* You're fortunate to have broken free of his expectations. A decade ago... well. I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#talk10_horrified
 SAY @611 /* That sounds about right. A pity I'll never see it... there's nothing quite so entertaining as self-righteous outrage. */
 = @612 /* But perhaps his approval isn't one of your priorities. That shouldn't be such a surprise, but... well. Myself, a decade ago... I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#ft10_tolerable
 SAY @613 /* Apparently I misspoke. */
IF ~~ DO ~SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END
 
IF ~~ rh#talk10_bhaal
 SAY @614 /* For his own incomprehensible ends, no doubt. Or perhaps because the alternatives were worse. I'm hardly the person to consult when it comes to deciphering Harper sensibilities, though. The whole lot of them are mad. */
 = @615 /* But I take it his approval still matters to you? No surprise, that. Myself... a decade ago... well. I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#talk10_lovers
 SAY @616 /* That's... hardly what I meant. Forgive me for the figure of speech. But I take it his approval isn't one of your priorities? That shouldn't be such a surprise, but... well. */
 = @617 /*  Myself, a decade ago... I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#talk10_dwell
 SAY @618 /* I take it his approval still matters to you? No surprise, that. Myself... a decade ago... well. I'd have done just about anything to keep my own grandfather pleased with me, and he was quick enough to use that to his advantage. */
IF ~~ + rh#talk10_main2
END

IF ~~ rh#talk10_main2
 SAY @619 /* I'd expect that he was probably more calculating than your guardian, but I know how Harpers can be. */
	++ @620 /* Gorion only wanted what was best for me. Whatever cunning was there, I never saw it. */ + rh#talk10_neversaw
	++ @621 /* He lied to me about everything. That's as manipulative as it gets. */ + rh#talk10_manipulative
	++ @622 /* He might have tried to push me in very specific directions, but I think I'm the better for his guidance. */ + rh#talk10_betterfor
	++ @623 /* Gorion was a transparent fool. He would have liked to have used me, but I never let him. */ + rh#talk10_transparent
	++ @624 /* You know nothing about Gorion. Don't pretend otherwise. */ + rh#talk10_knownothing
END

IF ~~ rh#talk10_neversaw
 SAY @625 /* Well, truth be told, you're not supposed to see it. */
IF ~~ + rh#talk10_main3b
END

IF ~~ rh#talk10_manipulative
 SAY @626 /* I'll never understand the way Heartlands folk try to protect their children from the world by leaving them utterly unprepared for it. */
IF ~~ + rh#talk10_main3a
END

IF ~~ rh#talk10_betterfor
 SAY @627 /* It certainly isn't his guidance that has kept you alive so far. */
IF ~~ + rh#talk10_main3b
END

IF ~~ rh#talk10_knownothing
 SAY @628 /* Loyal to the last, I see. */
IF ~~ + rh#talk10_main3b
END

IF ~~ rh#talk10_transparent
 SAY @629 /* Defiant to the last, <CHARNAME>? I do enjoy that. */
IF ~~ + rh#talk10_main3a
END

IF ~~ rh#talk10_main3a
 SAY @630 /* His approval really means nothing to you, then? */
	++ @631 /* My path isn't his, and I don't think he would have expected it to be. */ + rh#talk10_path
	++ @632 /* I may dislike him, but I wouldn't do anything that I thought would disgrace his memory. */ + rh#talk10_disgrace
	++ @633 /* It means less than nothing. I'd go out of my way to make him roll over in his grave. */ + rh#talk10_grave
	++ @634 /* I've never been interested in anyone else's approval. */ + rh#talk10_approval
	++ @635 /* Less than it means to you, apparently. */ + rh#talk10_meanstoyou
END

IF ~~ rh#talk10_main3b
 SAY @636 /* Does his approval still mean everything to you, then? It certainly seems like it once did. */
	++ @631 /* My path isn't his, and I don't think he would have expected it to be. */ + rh#talk10_path
	++ @637 /* I wouldn't do anything that I thought would disgrace his memory. */ + rh#talk10_disgrace
	++ @638 /* I'm grateful for what he did for me, but I've never sought anyone's approval. */ + rh#talk10_approval
	++ @639 /* I may have loved him, but his standards were arbitrary and insane. */ + rh#talk10_arbitrary
	++ @640 /* It means less than it does to you, apparently. */ + rh#talk10_meanstoyou
END

IF ~~ rh#talk10_path
 SAY @641 /* That's very... sensible of you, I think. Perhaps we'll survive this after all. */
IF ~~ EXIT
END

IF ~~ rh#talk10_disgrace
 SAY @642 /* That's... admirable, I suppose, though I can't help but fear for our longevity. */
IF ~~ EXIT
END

IF ~~ rh#ft10_disgrace
 SAY @643 /* No? I can't help but fear for our longevity. */
IF ~~ EXIT
END

IF ~~ rh#talk10_grave
 SAY @644 /* Mmm, I've noticed, my <PRO_LADYLORD>. I dare say you're off to a very good start. Perhaps we'll survive this after all. */
IF ~~ EXIT
END

IF ~~ rh#talk10_approval
 SAY @645 /* Mmm, I've noticed, my <PRO_LADYLORD>. That's very... sensible of you, I think. Perhaps we'll survive this after all. */
IF ~~ EXIT
END

IF ~~ rh#talk10_arbitrary
 SAY @646 /* Ha! Insane, I don't doubt. Arbitrary... well, I can guess at what they might have been easily enough, but if you don't care... */
 = @647 /* That's very sensible of you, I think. Perhaps we'll survive this after all. */
IF ~~ EXIT
END

IF ~~ rh#talk10_meanstoyou
 SAY @648 /* It means... very little to me at all, <CHARNAME>. */
IF ~~ EXIT
END
END

// 11.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",22) Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN RH#ADRJ rh#talk11a
@649 /* <CHARNAME>, you said the old Harper raised you, and I obviously know who your father was, but you haven't mentioned your mother. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @650 /* <CHARNAME>'s mother is none of your concern, Zhent. One would think your own history troubling enough that you would not see the need to prod at others' lives. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @651 /* That's almost comically hypocritical, Harper, wouldn't you agree? */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @652 /* Stay away from her, Vasiliev. You may be attracted to the promise of power, but nothing good can come of this. You have already proven as much. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @653 /* You know *nothing* of me, Harper. Nothing but tales told so often that whatever truth once lay behind them is long since gone. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @654 /* <CHARNAME>, if my question hasn't offended you also... your mother, who was she? */
END
	++ @655 /* There's nothing to say. I never knew her. */ + rh#talk11_main1
	++ @656 /* She died when I was born. I never knew her. */ + rh#talk11_ack
	++ @267 /* I don't want to talk about it. */ + rh#talk11_main1
	++ @657 /* I keep you around for your magic, not your company. Keep quiet. */ + rh#talk11_gloriousleader
	++ @658 /* Ask me again sometime. */ + rh#talk_delay

CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",22) Global("rh#AdrianFriendshipActive","GLOBAL",1)~ THEN RH#ADRJ rh#talk11b
@649 /* <CHARNAME>, you said the old Harper raised you, and I obviously know who your father was, but you haven't mentioned your mother. */
DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @655 /* There's nothing to say. I never knew her. */ + rh#talk11_main1
	++ @656 /* She died when I was born. I never knew her. */ + rh#talk11_ack
	++ @267 /* I don't want to talk about it. */ + rh#talk11_main1
	++ @657 /* I keep you around for your magic, not your company. Keep quiet. */ + rh#talk11_gloriousleader
	++ @658 /* Ask me again sometime. */ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",23)~ + rh#talk_delay

APPEND RH#ADRJ

IF ~~ rh#talk11_gloriousleader
 SAY @659 /* Fine. Don't choke on your own venom. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk11_ack
 SAY @660 /* I'm sorry to hear it. */
IF ~~ + rh#talk11_main1
END

IF ~~ rh#talk11_main1
 SAY @661 /* I can't help but wonder what she must have been like, though, to catch... well, to catch your father's attention. */
 	++ @662 /* I wish I knew more about her than I do. She was apparently a friend of Gorion's, though he never spoke about her. */ + rh#talk11_gorion
 	++ @663 /* My past is so dark as it is, I'd rather just avoid any more revelations. */ + rh#talk11_revelations
 	++ @664 /* Sometimes I think his only criteria was "breathing." */ + rh#talk11_talkabout
 	++ @665 /* I'm a child of Bhaal. When it comes to family history, that's the only thing that matters in the end. */ + rh#talk11_bhaal
END

IF ~~ rh#talk11_gorion
 SAY @666 /* I can't really blame him for that, considering what must have happened. */
IF ~~ + rh#talk11_main2
END

IF ~~ rh#talk11_revelations
 SAY @667 /* True enough. I can't really blame you for that. */
IF ~~ + rh#talk11_main2
END

IF ~~ rh#talk11_talkabout
 SAY @668 /* Sometimes I'm not even sure of that much. */
IF ~~ + rh#talk11_main2
END

IF ~~ rh#talk11_bhaal
 SAY @669 /* It's certainly the most important, yes, but the only key factor? I doubt that. */
IF ~~ + rh#talk11_main2
END

IF ~~ rh#talk11_main2
 SAY @670 /* It's a strange place to end up, though, isn't it? Candlekeep. A <PRO_SONDAUGHTER> of Bhaal, sequestered by Harpers, hidden away from every danger but <PRO_HISHER> own cursed blood. */
 = @671 /* I used to believe that simplistic upbringings bred weak fools, but maybe destiny does always win out in the end. */
 	++ @672 /* Candlekeep may not have been a nightmare, but a childhood spent in preparation for an uncertain future is hardly simplistic. */ + rh#talk11_preparation
 	++ @673 /* Destiny? I don't think so. If not for Candlekeep, I might have become as much a monster as Sarevok was. Who can really say? */ + rh#talk11_monster
 	++ @674 /* With destinies like mine, I don't think upbringing makes a difference one way or the other. The legacy demands greatness: grab it or die in the wake of those who did. */ + rh#talk11_legacy
 	++ @675 /* I don't know. It's funny, when you think about it: one small, seemingly irrelevant change and everything about me might have been different. */ + rh#talk11_change
 	++ @676 /* It is what it is. There's no point making such a deal about it. */ + rh#talk11_deal
END
 
IF ~~ rh#talk11_preparation
 SAY @677 /* Fair enough, I suppose. Still, if not for that preparation, who can say what you would have become? I suppose sometimes I can't help indulging in the "what ifs" of life. */ 
 = @678 /* People like you... like me... one small change and everything might have been different. Me, I was actually born in the Dalelands. The sickeningly sweet, "holier than thou" Dalelands. */
IF ~~ + rh#talk11_main3
END
 
IF ~~ rh#talk11_monster
 SAY @679 /* Funny, isn't it? Here I am, wondering what if. You said that your brother was raised by a leader of the Iron Throne, right? Who knows where the man originally came from. */
 = @680 /* Me, I may be from one of the most ruthless cities in Faerun, but I was actually born in the Dalelands. The sickeningly sweet, "holier than thou" Dalelands. */
IF ~~ + rh#talk11_main3
END

IF ~~ rh#talk11_legacy
 SAY @681 /* Fair enough, I suppose. You win or die, but... sometimes I can't help in indulging in the "what ifs." One small change, and everything might have been different. */
 = @680 /* Me, I may be from one of the most ruthless cities in Faerun, but I was actually born in the Dalelands. The sickeningly sweet, "holier than thou" Dalelands. */
IF ~~ + rh#talk11_main3
END

IF ~~ rh#talk11_change
 SAY @682 /* I don't know how much you think about things like this, <CHARNAME>. Me... I never used to, but I suppose after wrecking myself in Sembia, the "what ifs" crept in, whether I wanted them or not. One small change, as you put it. */
 = @683 /* Me, I was actually born in the Dalelands. The sickeningly sweet, "holier than thou" Dalelands. */
IF ~~ + rh#talk11_main3
END

IF ~~ rh#talk11_deal
 SAY @684 /* No, I don't believe there is. But I suppose sometimes I can't help indulging in the "what ifs" of life, and people like you... like me... one small change and everything might have been different. */
 = @683 /* Me, I was actually born in the Dalelands. The sickeningly sweet, "holier than thou" Dalelands. */
IF ~~ + rh#talk11_main3
END

IF ~~ rh#talk11_main3
 SAY @685 /* I didn't actually grow up there, thank all the gods, but in another lifetime, I might have been your typical half-elven bard. Wandering the Realms, singing pretty songs of goodness and justice and other things that don't mean a damn thing in the end. */
	++ @686 /* And you might have been happier for it. What went wrong? */ + rh#talk11_wrong
	++ @687 /* So tell me, how did you escape that dire fate? */ + rh#talk11_direfate
	++ @688 /* That's a horrible, if slightly amusing, mental image. How did you end up in Zhentil Keep? */ + rh#talk11_walked
	++ @689 /* I have enough to worry about in the present without indulging in sentimentality. */ + rh#talk11_sentiment
END

IF ~~ rh#talk11_sentiment
 SAY @690 /* You're no doubt right. Well, perhaps we'll talk again later. If you can spare the time, that is. */
IF ~~ EXIT
END

IF ~~ rh#talk11_wrong
 SAY @691 /* What went wrong? Well, I suppose my father was too busy drifting around the Dalelands saving people from Zhents to realize that he was sleeping with one. */
IF ~!Class(Player1,RANGER_ALL) !Race(Player1,ELF)~ + rh#talk11_wrong1
IF ~Class(Player1,RANGER_ALL) !Race(Player1,ELF)~ + rh#talk11_wrong2
IF ~Race(Player1,ELF)~ + rh#talk11_wrong3
END

IF ~~ rh#talk11_direfate
 SAY @692 /* Laugh, if you want. My mother was a Zhentarim agent. My father... well, I suppose he was too busy drifting around the Dalelands saving people from Zhents to realize that he was sleeping with one. */
IF ~!Class(Player1,RANGER_ALL) !Race(Player1,ELF)~ + rh#talk11_wrong1
IF ~Class(Player1,RANGER_ALL) !Race(Player1,ELF)~ + rh#talk11_wrong2
IF ~Race(Player1,ELF)~ + rh#talk11_wrong3
END

IF ~~ rh#talk11_walked
 SAY @693 /* My mother was a Zhentarim agent. My father... well, I suppose he was too busy drifting around the Dalelands saving people from Zhents to realize that he was sleeping with one. */
IF ~!Class(Player1,RANGER_ALL) !Race(Player1,ELF)~ + rh#talk11_wrong1
IF ~Class(Player1,RANGER_ALL) !Race(Player1,ELF)~ + rh#talk11_wrong2
IF ~Race(Player1,ELF)~ + rh#talk11_wrong3
END

IF ~~ rh#talk11_wrong1
 SAY @694 /* Typical elven ranger: too impressed by his own perfection to pay attention to the people around him. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#talk11_main4a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#talk11_main4b
END

IF ~~ rh#talk11_wrong2
 SAY @695 /* Typical elven ranger: too impressed by his own perfection to pay attention to the people around him. No offense to yourself, <CHARNAME>. You may be a ranger, but at least you're not an idiot. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#talk11_main4a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#talk11_main4b
END

IF ~~ rh#talk11_wrong3
 SAY @696 /* Typical elven ranger: too impressed by his own perfection to pay attention to the people around him. No offense to yourself, <CHARNAME>. You may be an elf, but at least you're not an idiot. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#talk11_main4a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",1)~ + rh#talk11_main4b
END

IF ~~ rh#talk11_main4a
 SAY @697 /* This was Shadowdale, about thirty-five years ago. The Dale may be famous these days as the home of Elminster and his merry band of Harper fools, but back then, a man named Jyordhan had taken over. */
 = @698 /* You've probably read about him. I know you had access to every book in Candlekeep. */
 	++ @699 /* A Zhent puppet, wasn't he? Made the Dale interesting for a few years before he went and got himself killed by Khelben Blackstaff. */ + rh#talk11_main5
 	++ @700 /* Another petty Zhentarim tyrant who briefly terrorized the Dale before being eliminated by the Blackstaff, if I recall. */ + rh#talk11_main5
END

IF ~~ rh#talk11_main4b
 SAY @701 /* This was Shadowdale, about thirty-five years ago. A little bit outside of your neck of the woods, probably, but I assure you, you haven't missed anything. */
 	++ @702 /* You can't stop the story there. What happened? */ + rh#talk11_whathappened
 	++ @703 /* And here I'd heard nothing but good about the Dales. */ + rh#talk11_nothinggood
 	++ @704 /* I take it that you don't miss it either. */ + rh#talk11_remember
 	++ @705 /* Well, I'd take that over Candlekeep any day. */ + rh#talk11_anyday
END

IF ~~ rh#talk11_whathappened
 SAY @706 /* Can't I? She was a saboteur; he was a fool. It ended about as you might expect. */
IF ~~ EXIT
END

IF ~~ rh#talk11_nothinggood
 SAY @707 /* Given your likely source, I'm not at all surprised. */
IF ~~ EXIT
END

IF ~~ rh#talk11_remember
 SAY @708 /* I don't remember it well enough to miss it, but perhaps that's for the best. */
IF ~~ EXIT
END

IF ~~ rh#talk11_anyday
 SAY @709 /* So would I, truth be told. Perhaps there's something to be grateful for in this after all. */
IF ~~ EXIT
END

IF ~~ rh#talk11_main5
 SAY @710 /* Mmm, more or less. In any case, my mother... she'd been sent to Shadowdale about five years before Jyordhan's reign as a saboteur. */
 = @711 /* I can't say why she got involved with an elven ranger of all things... to strengthen her own cover, most likely, though the subtle power game was probably too irresistible to pass up. */
 = @712 /* Hells, perhaps it was even love. Stranger things have happened. */
	++ @713 /* You have quite the romantic streak sometimes, don't you? */ + rh#talk11_romantic
	++ @714 /* Mm, love between bitter enemies? Fairy tales are made of such stuff. */ + rh#talk11_love
	++ @715 /* I'm guessing it couldn't have lasted, even if it was real. */ + rh#talk11_lasted
	++ @716 /* You have to be a fool if you think anything remotely resembling love was involved. */ + rh#talk11_fool
END 

IF ~~ rh#talk11_romantic
 SAY @717 /* I... guess I've had reason to wonder about things like that in the years since. */
IF ~~ + rh#talk11_main6
END
 
IF ~~ rh#talk11_love
 SAY @718 /* Tragedies are made of such stuff, <CHARNAME>. But I guess fairy tales really are just tragedies that haven't fully played out yet. */
IF ~~ + rh#talk11_main6
END

IF ~~ rh#talk11_lasted
 SAY @719 /* No, and it didn't. It never does. */
IF ~~ + rh#talk11_main6
END

IF ~~ rh#talk11_fool
 SAY @720 /* I've been a fool before. But no, you're right. */
IF ~~ + rh#talk11_main6
END

IF ~~ rh#talk11_main6
 SAY @721 /* In any case, mother and I... we left when I was about three. Her job there was finished, and they wanted her back home again. */
 = @722 /* I don't remember that much of Shadowdale, and I can't say I've ever been suicidal enough to drop by for a visit. I'm sure I could only take about five minutes of the place before wanting to burn the whole damn village down anyway. */
 = @723 /* And once home... well. */
	++ @724 /* It would have been kinder of her to just leave you in Shadowdale. */ + rh#talk11_kinder
	+ ~Class("rh#Adrian",SORCERER)~ + @725 /* But you came into power. That's all that matters in the end. */ + rh#talk11_power1
	+ ~!Class("rh#Adrian",SORCERER)~ + @725 /* But you came into power. That's all that matters in the end. */ + rh#talk11_power2
	++ @726 /* I suppose everyone is born innocent. Well, aside from people like me, that is. */ + rh#talk11_bhaalspawn
	++ @727 /* Funny, how fate works, isn't it? */ + rh#talk11_fate
END

IF ~~ rh#talk11_kinder
 SAY @728 /* Kinder? Yes. Better? I don't think so. Everyone can be born somewhere different... or someone different, in your case, but... hells, <CHARNAME>. */
 = @729 /* Can you imagine what you would be if not for Bhaal's legacy and the struggles it has brought you? Some small <PRO_MANWOMAN> in a small world, utterly forgettable. */
 = @730 /* I... never wanted that. And I can't imagine being someone who did. */
IF ~~ + rh#talk11_main7
END

IF ~~ rh#talk11_power1
 SAY @731 /* My sorcery, you mean? That would have happened regardless, I think. But with a rustic, soft upbringing in Shadowdale... no, I'm not sure I would have been able to get everything I have out of the magic. */
IF ~~ + rh#talk11_main7
END

IF ~~ rh#talk11_power2
 SAY @732 /* True. With a rustic, soft upbringing in Shadowdale... no, I'm not sure I would have been able to get everything I have out of the magic. */
IF ~~ + rh#talk11_main7
END

IF ~~ rh#talk11_bhaalspawn
 SAY @733 /* Innocent? You're not missing anything. The only people who retain their innocence are the ones too feeble to face reality as it is. Me... */
IF ~~ + rh#talk11_main7
END

IF ~~ rh#talk11_fate
 SAY @734 /* Still, if you don't like where you are better than where you might have been... */
IF ~~ + rh#talk11_main7
END

IF ~~ rh#talk11_main7
 SAY @735 /* I was never meant to be a Dalesman, <CHARNAME>, anymore than you were meant to waste away behind the walls of Candlekeep. */
	++ @736 /* There are plenty of people raised in decent environments who come out of it perfectly capable of handling the world. */ + rh#talk11_decent
	++ @737 /* I suppose there are worse ways of handling bad situations than embracing them for the lessons they teach. */ + rh#talk11_teach
	++ @738 /* Well put. Let's leave the peasant existence to those incapable of pursuing anything more. */ + rh#talk11_peasant
	++ @739 /* You're a fool to use your past as a reason to excuse your actions. People with far worse backgrounds than you have made better choices in the end. */ + rh#talk11_excuse
END	

IF ~~ rh#talk11_decent
 SAY @740 /* Maybe. I've met precious few of them, and you don't quite count, <CHARNAME>. Not with your heritage. */
 = @741 /* But I'm tired of talking about past troubles today... let's just move on for now, shall we? */
IF ~~ EXIT
END

IF ~~ rh#talk11_teach
 SAY @742 /* Many worse ways. But I'm tired of talking about past troubles today... let's just move on for now, shall we? */
IF ~~ EXIT
END

IF ~~ rh#talk11_peasant
 SAY @743 /* Gladly, my <PRO_LADYLORD>. But I'm tired of talking about past troubles today... let's just move on for now, shall we? */
IF ~~ EXIT
END

IF ~~ rh#talk11_excuse
 SAY @744 /* I was telling you a story, <CHARNAME>, not making excuses. If you don't care to see the difference... well, I suppose I shouldn't be that surprised. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END
END

// 12.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",24)~ THEN RH#ADRJ rh#talk12
@745 /* Lovely as the dawn and sharp as a dagger's blade... if I didn't already know what your flaw was, <CHARNAME>, I would be wondering. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @746 /* My flaw? */ + rh#talk12_flaw
	++ @747 /* Is that supposed to be an insult or a compliment? */ + rh#talk12_insult
	++ @748 /* 'Lovely as the dawn?' Could I ask for some poetry next, my dear? */ + rh#talk12_poetry
	++ @749 /* Mmm. I would say it's my weakness for dangerous men. */ + rh#talk12_weakness
	++ @750 /* Well, I can list yours, if you'd like. */ + rh#talk12_list
	++ @751 /* I'm not playing a game of Zhentarim seduction. Get lost. */ + rh#talk12_getlost

APPEND RH#ADRJ

IF ~~ rh#talk12_flaw
 SAY @752 /* Your evil, evil blood, my dear. What else? */
IF ~~ + rh#talk12_main1
END

IF ~~ rh#talk12_insult
 SAY @753 /* A compliment, I think. Your evil, evil blood... */
IF ~~ + rh#talk12_main1
END

IF ~~ rh#talk12_poetry
 SAY @754 /* Poetry is for fools who can't write music, and I never had the inclination to learn an instrument. Your evil, evil blood, however... */
IF ~~ + rh#talk12_main1
END

IF ~~ rh#talk12_weakness
 SAY @755 /* I won't say that's a flaw I've never exploited in the past. Your evil, evil blood, however... */
IF ~~ + rh#talk12_main1
END

IF ~~ rh#talk12_list
 SAY @756 /* Ha! I'm not quite sure we have the time for that. Your evil, evil blood, however... */
IF ~~ + rh#talk12_main1
END

IF ~~ rh#talk12_getlost
 SAY @757 /* ...neither was I. Fine. I... won't bother you again. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk12_main1
 SAY @758 /* It's always something, isn't it? Granted, as flaws go, I'm not altogether sure that even that isn't a feature. You're something... new, at least. */
 = @759 /* Hells, I... that was completely inappropriate. */
 	++ @760 /* You're right. It was. But I've long since given up expecting much of anything from you. */ + rh#talk12_givenup
 	++ @761 /* By your standards, it wasn't that horrible. */ + rh#talk12_standards
 	++ @762 /* Dare I even ask how drunk you are? */ + rh#talk12_drunk
 	++ @40 /* Don't worry about it. */ + rh#talk12_main2
 	++ @763 /* If I wanted appropriate, I would grab a knight from Silverymoon. */ + rh#talk12_silverymoon
END

IF ~~ rh#talk12_givenup
 SAY @764 /* Well, I won't disappoint you, at least. */
IF ~~ DO ~IncrementGlobal("rh#PID.Marriage","GLOBAL",1)~ + rh#talk12_main2
END

IF ~~ rh#talk12_standards
 SAY @765 /* No, I suppose not. */
IF ~~ DO ~IncrementGlobal("rh#PID.Marriage","GLOBAL",1)~ + rh#talk12_main2
END

IF ~~ rh#talk12_drunk
 SAY @766 /* Not as much as I'm going to be in ten minutes. */
IF ~~ DO ~IncrementGlobal("rh#PID.Marriage","GLOBAL",1)~ + rh#talk12_main2
END

IF ~~ rh#talk12_silverymoon
 SAY @767 /* Nine Hells, what a thought! */
IF ~~ DO ~IncrementGlobal("rh#PID.Marriage","GLOBAL",1)~ + rh#talk12_main2
END

IF ~~ rh#talk12_main2
 SAY @768 /* You're not... I mean, I don't care about your heritage. Not really. I'm not-- */
 = @769 /* I suppose my history with women just leaves... something to be desired. To put it mildly. When the high point was a shortlived political marriage... */
 	++ @770 /* Shortlived? What happened? */ + rh#talk12_shortlived
 	++ @771 /* Perhaps you should be more interested in the future rather than the past. */ + rh#talk12_future
 	++ @772 /* Your history in general leaves something to be desired. */ + rh#talk12_desired
 	++ @773 /* You have a history, do you? Care to share? */ + rh#talk12_lowlights
 	++ @774 /* I'm not really comfortable with this conversation, Adrian. */ + rh#talk12_comfort
END
 
IF ~~ rh#talk12_shortlived
 SAY @775 /* The Time of Troubles happened. It was a long time ago now, and... as I said. Politics. */
IF ~~ + rh#talk12_main3
END

IF ~~ rh#talk12_future
 SAY @776 /* I... hmm. I think I'll just step away for a few minutes. */
IF ~~ EXIT
END

IF ~~ rh#talk12_desired
 SAY @777 /* Very funny. */
IF ~~ + rh#talk12_main3
END

IF ~~ rh#talk12_lowlights
 SAY @778 /* I'd really rather not. */
IF ~~ + rh#talk12_main3
END

IF ~~ rh#talk12_comfort
 SAY @779 /* Truth be told, neither am I. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1)~ + rh#talk12_main3
END

IF ~~ rh#talk12_main3
 SAY @780 /*  I... think I'll just step away for a few minutes. */
IF ~~ EXIT
END
END

// 13. (outside)
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",26)~ THEN RH#ADRJ rh#talk13
@781 /* Of all the-- Careful with that, halfwit! You'd best watch where you're going while you still have eyes. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
== RH#ADRJ IF ~OR(8) AreaCheck("AR0020") AreaCheck("AR0300") AreaCheck("AR0400") AreaCheck("AR0500") AreaCheck("AR0700") AreaCheck("AR0900") AreaCheck("AR1000") AreaCheck("AR2000")~ THEN @782 /* If there's anything more obnoxious than the Amnish peasantry, I've yet to see it, though-- */
== RH#ADRJ IF ~!AreaCheck("AR0020") !AreaCheck("AR0300") !AreaCheck("AR0400") !AreaCheck("AR0500") !AreaCheck("AR0700") !AreaCheck("AR0900") !AreaCheck("AR1000") !AreaCheck("AR2000")~ THEN @783 /* The whole wretched path in front of you, and you walk into me-- */
== RH#ADRJ @784 /* Ow! Godsdamned blasted rock! */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @785 /* (chuckle) Had you watched where *you* were going, you would have noticed it, Zhent. But kick it a second time. Perhaps that will teach it a lesson. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @786 /* Harper, I swear-- */
END
	+ ~OR(7) AreaCheck("AR0020") AreaCheck("AR0300") AreaCheck("AR0400") AreaCheck("AR0500") AreaCheck("AR0700") AreaCheck("AR0900") AreaCheck("AR1000")~ + @787 /* Calm down! You've been acting crazy all <DAYNIGHT>, Adrian, picking fights with every street vender in Athkatla. Are you okay? */ + rh#talk13_fine
	+ ~AreaCheck("AR2000")~ + @788 /* Calm down! You've been acting crazy all <DAYNIGHT>, Adrian, picking fights with every merchant in Trademeet. Are you okay? */ + rh#talk13_fine
	+ ~!AreaCheck("AR0020") !AreaCheck("AR0300") !AreaCheck("AR0400") !AreaCheck("AR0500") !AreaCheck("AR0700") !AreaCheck("AR0900") !AreaCheck("AR1000") !AreaCheck("AR2000")~ + @789 /* Calm down! You've been acting crazy all <DAYNIGHT>, Adrian. Are you okay? */ + rh#talk13_fine
	++ @790 /* What the hells is wrong with you to<DAYNIGHT>? */ + rh#talk13_fine
	++ @791 /* Brilliant tactical decision, kicking that rock after already tripping over it. You didn't break your foot, I hope. */ + rh#talk13_fine
	
CHAIN RH#ADRJ rh#talk13_fine
@792 /* I'm *fine*, <CHARNAME>. Just... go back to whatever petty adventure has caught your attention this time and stay the hells away from me. */
== ANOMENJ IF ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1) ~ THEN @793 /* Hold you tongue, warlock! I will not have you spitting your venom at the lady! */
== RH#ADRJ IF ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1)~ THEN @794 /* Get out of my face, you pompous fool. Go bleat elsewhere, if you must. */
== ANOMENJ IF ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1)~ THEN @795 /* I do not *bleat*, Sianodel. Be glad I do not cut you down where you stand for the insult. */
== RH#ADRJ IF ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1)~ THEN @796 /* As if you even could! */
END
 	++ @797 /* Adrian, what in the Realms is the matter with you to<DAYNIGHT>?! */ EXTERN RH#ADRJ rh#talk13_wrong
	++ @798 /* Enough of this. I won't have you behaving like a child. */ EXTERN RH#ADRJ rh#talk13_child
	++ @799 /* You sound far from fine! Let me help you. */ EXTERN RH#ADRJ rh#talk13_help
	++ @800 /* Listen to yourself. You're no good to anyone like this. */ EXTERN RH#ADRJ rh#talk13_nogood
	+ ~OR(4) !InParty("Anomen") !InMyArea("Anomen") StateCheck("Anomen",CD_STATE_NOTVALID) !Global("AnomenRomanceActive","GLOBAL",1)~ + @801 /* Fine. To the hells with you too. */ EXIT
	+ ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenRomanceActive","GLOBAL",1)~ + @802 /* To the hells with you too, sorcerer. Anomen, stay away from him. He's not worth a fight. */ EXTERN ANOMENJ rh#AdAno13 

CHAIN ANOMENJ rh#AdAno13
@803 /* As you wish, my lady. */
EXIT

APPEND RH#ADRJ

IF ~~ rh#talk13_wrong
 SAY @804 /* Nothing. Why does something always have to be wrong with me? */
IF ~~ + rh#talk13_main1
END

IF ~~ rh#talk13_child
 SAY @805 /* A child, am I? */
IF ~~ + rh#talk13_main1
END

IF ~~ rh#talk13_help
 SAY @806 /* Help me? What do I look like, a pet project? */
IF ~~ + rh#talk13_main1
END

IF ~~ rh#talk13_nogood
 SAY @807 /* Well, I suppose my utility is all that matters in the end. That's nothing new. */
IF ~~ + rh#talk13_main1
END

IF ~~ rh#talk13_main1
 SAY @808 /* Dammit, <CHARNAME>, I can't *think* straight like this.  Certainly not straight enough to keep from doing something completely idiotic. */
 = @809 /* I just... just go away. You no doubt have more pressing concerns anyway. */
	++ @810 /* Something idiotic?  What are you talking about? */ + rh#talk13_what
	++ @811 /* Where is this coming from? Am I not allowed to be nice to you? */ + rh#talk13_nice
	++ @812 /* I care about you, Adrian, violent moodswings and all. Whatever's going on in your head, just tell me. */ + rh#talk13_tell
	++ @801 /* Fine. To the hells with you too. */ EXIT
END

IF ~~ rh#talk13_what
 SAY @813 /* Nothing. Just... let me be. */
IF ~~ EXIT
END
 
IF ~~ rh#talk13_nice
 SAY @814 /* Nice? You're lucky I haven't taken advantage of your... dubious kindness and bled you dry. Just... let me be, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ rh#talk13_tell
 SAY @815 /* Just... let me be, <CHARNAME>. */
IF ~~ EXIT
END
END

// 14.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",28)~ THEN RH#ADRJ rh#talk14
@816 /* Could I speak with you for a moment, <CHARNAME>? Away from the others? */
= @817 /* I... wanted to apologize. I treated you terribly earlier and you didn't deserve it. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @818 /* An apology? From you? Hold on, is the world ending? */ + rh#talk14_apology
	++ @819 /* Apology accepted. Could you tell me what was going on? */ + rh#talk14_whathappened
	++ @820 /* You treat everyone terribly. Why should I be any different? */ + rh#talk14_terrible
 	++ @821 /* I don't think I've ever heard you apologize. For anything. You can't even do it publicly, can you? */ + rh#talk14_apology
 	++ @822 /* A half-hearted apology isn't good enough. */ + rh#talk14_notenough

APPEND RH#ADRJ

IF ~~ rh#talk14_apology
 SAY @823 /* I only apologize when I'm truly sorry. That doesn't happen very often, but... well, you shouldn't be so surprised. */
IF ~~ + rh#talk14_main1
END

IF ~~ rh#talk14_whathappened
 SAY @824 /* I'd really rather not think about it. */
IF ~~ + rh#talk14_main1
END

IF ~~ rh#talk14_terrible
 SAY @825 /* It's not quite the same thing... usually I do it intentionally. */
IF ~~ + rh#talk14_main1
END

IF ~~ rh#talk14_notenough
 SAY @826 /* What do you want me to do? Get on my knees and beg you for forgiveness? */
 	++ @827 /* As much as that would be a sight... no. Just tell me what was going on in your head the other day. */ + rh#talk14_whathappened
 	++ @828 /* No. I want you to promise that you won't attack me again with no reason or explanation. */ + rh#talk14_attack
 	++ @829 /* I want you to act like an apology isn't something to be ashamed of. If you're sorry, you can say it in front of the others also. */ + rh#talk14_others
 	++ @830 /* It would be a start. */ + rh#talk14_beg
END

IF ~~ rh#talk14_attack
 SAY @831 /* I'll... try. More than that... I don't make promises I can't keep. Not real ones, at least. */
IF ~~ + rh#talk14_main1
END

IF ~~ rh#talk14_others
 SAY @832 /* What? You can't be serious! */
 	++ @833 /* Oh, the look on your face. That's all the apology I wanted. */ + rh#talk14_cruel
 	++ @834 /* If you're going to be this impossible, never mind. You're forgiven. */ + rh#talk14_impossible
 	++ @835 /* You heard me. */ + rh#talk14_beg
END

IF ~~ rh#talk14_cruel
 SAY @836 /* Ha! You're a cruel woman sometimes, <CHARNAME>. I think that's one of the things I like most about you. */
 = @837 /* But you're right. */
IF ~~ + rh#talk14_main1
END

IF ~~ rh#talk14_impossible
 SAY @838 /* I... thank you, <CHARNAME>. But you're right. */
IF ~~ + rh#talk14_main1
END

IF ~~ rh#talk14_beg
 SAY @839 /* There's quite a bit I would do for you, <CHARNAME>, but this? I don't think so. If you don't want to accept my apology, fine. Rest assured, you won't be getting another. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk14_main1
 SAY @840 /* An outburst like that... it shouldn't have happened. Five years ago, it would never have, but... I don't know. I'm sorry. */
	++ @841 /* Stop worrying about it. It isn't a problem. */ + rh#talk14_problem
	++ @842 /* I do care about you, Adrian. If you want to talk about things that bother you instead of throwing temper tantrums over them, I think we would both be happier. */ + rh#talk14_happy
	++ @843 /* So you're not always in perfect control of yourself. That's nothing to be ashamed of. */ + rh#talk14_problem
	++ @844 /* Two apologies for the price of one, is it? I could get used to this. */ + rh#talk14_apologies
	++ @845 /* I agree. It shouldn't have happened, and I would appreciate if it didn't happen again. */ + rh#talk14_appreciate
END

IF ~~ rh#talk14_problem
 SAY @846 /* Isn't it? I just... sometimes I wonder. I'd like to think I didn't go mad at some point without noticing, but with that damn siege back home... */
IF ~~ + rh#talk14_main2
END

IF ~~ rh#talk14_happy
 SAY @847 /* Thank you, I think. I just... sometimes I wonder. I'd like to think I didn't go mad at some point without noticing, but with that damn siege back home... */
IF ~~ + rh#talk14_main2
END

IF ~~ rh#talk14_apologies
 SAY @848 /* Clever, <CHARNAME>. I just... sometimes I wonder. I'd like to think I didn't go mad at some point without noticing, but with that damn siege back home... */
IF ~~ + rh#talk14_main2
END

IF ~~ rh#talk14_appreciate
 SAY @849 /* I hope to avoid it myself. I just... sometimes I wonder. I'd like to think I didn't go mad at some point without noticing, but with that damn siege back home... */
IF ~~ + rh#talk14_main2
END

IF ~~ rh#talk14_main2
 SAY @850 /* All things considered, perhaps I should simply be glad I'm not a raving lunatic. Not everyone was so lucky. */
 	++ @851 /* At least I would know where I stood with a raving lunatic. */ + rh#talk14_lunatic
 	++ @852 /* You're not mad. Terrible things happen, and we cope however we can. I know what it's like to feel overwhelmed. */ + rh#talk14_overwhelm
 	++ @853 /* Darling, you may not be a raving lunatic, but I'm still not quite sure that you're sane. */ + rh#talk14_lunatic
 	++ @854 /* That's one positive to take from the whole situation, I suppose. */ + rh#talk14_overwhelm
 	++ @855 /* I'm not interested in excuses or justification. Just accept responsibility for acting like a child and try not to do it again. */ + rh#talk14_behave
END

IF ~~ rh#talk14_lunatic
 SAY @856 /* Very funny. Well, I've said what I wanted. If you'd like a third apology as well, I'm afraid I'll have to disappoint you. */
IF ~~ EXIT
END

IF ~~ rh#talk14_overwhelm
 SAY @857 /* True enough. Thank you, <CHARNAME>, but... well, I think I've said as much on the topic as I wanted to. */
IF ~~ EXIT
END

IF ~~ rh#talk14_behave
 SAY @858 /* Fine. In any case, I've said what I wanted. If you'd like a third apology as well, I'm afraid I'll have to disappoint you. */
IF ~~ EXIT
END
END

// 15.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",30)~ THEN RH#ADRJ rh#talk15
@859 /* You didn't have to keep me around, you know. After Tanya... that was quite a bit of trouble to go to. You didn't need to do it. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @860 /* Yes, I did. */ + rh#talk15_main1
 	++ @861 /* That was quite some time ago. Why are you bringing it up now? */ + rh#talk15_main1
 	++ @862 /* I didn't want to lose you. */ + rh#talk15_main1
 	++ @863 /* Humility doesn't become you, Adrian. */ + rh#talk15_main1
 	+ ~Class("rh#Adrian",SORCERER)~ + @864 /* And deprive myself of the service of a skilled sorcerer? */ + rh#talk15_deprive
 	+ ~!Class("rh#Adrian",SORCERER)~ + @865 /* And deprive myself of the service of a skilled mage? */ + rh#talk15_deprive
 	++ @866 /* Every time you open your mouth, I can't help but remember that. */ + rh#talk15_end

APPEND RH#ADRJ

IF ~~ rh#talk15_deprive
 SAY @867 /* Ah. Of course. */
	++ @868 /* Don't look away like that. You know full well I didn't want to lose you. */ + rh#talk15_main1
	++ @869 /* Granted, your company has grown on me in the time since. */ + rh#talk15_grown
	++ @870 /* I hope you weren't naive enough to think it was anything more. */ + rh#talk15_nope
	++ @871 /* (say nothing) */ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk15_end
 SAY @872 /* Fine. You can be sure, I won't do it again. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk15_nope
 SAY @873 /* Hardly. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk15_main1
 SAY @874 /* I honestly don't understand it, <CHARNAME>. You hardly even knew me. */
 	++ @875 /* I'm a good judge of character. */ + rh#talk15_character
 	++ @876 /* I knew you better than I knew your old friend. */ + rh#talk15_better
 	++ @877 /* Well, if I sold out every good looking stranger, where would I be? */ + rh#talk15_stranger
 	++ @878 /* I knew enough to know I cared about you. */ + rh#talk15_cared
 	++ @879 /* I don't like being challenged by people like that. */ + rh#talk15_challenge
END 

IF ~~ rh#talk15_character
 SAY @880 /* Heh. That's certainly an interesting theory, if rather lacking in evidence. But perhaps it isn't much of a problem for you... trust, love, and every other foolish Harper concept. */
IF ~~ + rh#talk15_main2
END  

IF ~~ rh#talk15_better
 SAY @881 /* That shouldn't matter. But perhaps it isn't much of a problem for you... trust, love, and every other foolish Harper concept. */
IF ~~ + rh#talk15_main2
END  

IF ~~ rh#talk15_stranger
 SAY @882 /* Less likely to get yourself into pointless trouble, I should think. But perhaps it isn't much of a problem for you... trust, love, and every other foolish Harper concept. */
IF ~~ + rh#talk15_main2
END  

IF ~~ rh#talk15_cared
 SAY @883 /* That's... insane, <CHARNAME>. Insane. But perhaps it isn't much of a problem for you... trust, love, and every other foolish Harper concept. */
IF ~~ + rh#talk15_main2
END  

IF ~~ rh#talk15_challenge
 SAY @884 /* You don't like being challenged at all, <CHARNAME>. But regardless, perhaps it isn't much of a problem for you... trust, love, and every other foolish Harper concept. */
IF ~~ + rh#talk15_main2
END  
 
IF ~~ rh#talk15_grown
 SAY @885 /* Has it? Hmm. Perhaps it isn't much of a problem for you... trust, love, and every other foolish Harper concept. */
IF ~~ + rh#talk15_main2
END  

IF ~~ rh#talk15_main2
 SAY @886 /* Your Gorion must have fed it to you alongside the rest of his lies. */
 	++ @887 /* My, aren't we vicious to<DAYNIGHT>? */ + rh#talk15_heart
 	++ @888 /* They're not foolish concepts, Adrian. Life is meaningless without them. */ + rh#talk15_foolish
 	++ @889 /* You've never trusted or loved before? */ + rh#talk15_before
 	++ @890 /* He tried, but he didn't get very far. I've never trusted anyone in my life. I'd probably be dead if I had. */ + rh#talk15_never
 	++ @891 /* For the last time, don't talk about him that way. */ + rh#talk15_heart
END  
 
IF ~~ rh#talk15_heart
 SAY @892 /* I... no. If anything, perhaps I'm a bit jealous. I... never quite had the opportunity at all. */
IF ~~ + rh#talk15_main3
END
 
IF ~~ rh#talk15_foolish
 SAY @893 /* And often over all too quickly with them, I've noticed. But maybe I haven't the experience to judge. I... never quite had the opportunity at all. */
IF ~~ + rh#talk15_main3
END
 
IF ~~ rh#talk15_before
 SAY @894 /* Seldom wisely. I... never quite had the opportunity. */
IF ~~ + rh#talk15_main3
END
 
IF ~~ rh#talk15_never
 SAY @895 /* Given your situation, quite possibly. Myself, I never quite had the opportunity at all. */
IF ~~ + rh#talk15_main3
END
 
IF ~~ rh#talk15_main3
 SAY @896 /* No childhood spent with a girl like Imoen... my foster siblings were my cousins, and they hated me. I had the occasional close friend before I moved to Sembia, but after that... */
 = @897 /* I've never thought of it as lonely before, but I suppose it was. To a degree, at least. */
 	+ ~!CheckStatGT(Player1,13,WIS)~ + @898 /* Lonely? How so? */ + rh#talk15_lonely
 	++ @899 /* If you want lonely, try growing up in a place as tiny as Candlekeep. */ + rh#talk15_tiny
 	++ @900 /* You had friends? I thought you people were always tripping over yourselves to kill each other. */ + rh#talk15_friends
 	++ @901 /* Yes, your life of luxury must have been dreadful. */ + rh#talk15_dreadful
 	+ ~CheckStatGT(Player1,13,WIS)~ + @902 /* A hostile nation can't be very fertile soil for friendships. */ + rh#talk15_spy
END

IF ~~ rh#talk15_lonely
 SAY @903 /* I was a spy in a hostile nation, <CHARNAME>. Getting particularly close to anyone would likely have gotten me killed. */
IF ~~ + rh#talk15_main4
END

IF ~~ rh#talk15_tiny
 SAY @904 /* I'd suspect that was boring rather than lonely. In my experience, small towns normally are. */ 
IF ~~ + rh#talk15_main4
END

IF ~~ rh#talk15_friends
 SAY @905 /* I did say "occasional," <CHARNAME>. I was certainly very careful about it. That probably served me well. */
IF ~~ + rh#talk15_main4
END

IF ~~ rh#talk15_dreadful
 SAY @906 /* (smile) Indeed. Horribly so. */ 
IF ~~ + rh#talk15_main4
END

IF ~~ rh#talk15_spy
 SAY @907 /* You've figured that out, have you? */
IF ~~ + rh#talk15_main4
END

IF ~~ rh#talk15_main4
 SAY @908 /* I won't pretend that I didn't enjoy Sembia. The intrigue of it all was intoxicating, but... perhaps there's more to be said for this lifestyle than I would have expected. */
 	++ @909 /* And here I thought you were convinced by the gold and magic we find everywhere. */ + rh#talk15_gold
 	++ @910 /* Does this mean you'll finally stop complaining whenever we camp outdoors? */ + rh#talk15_complain
 	++ @911 /* I for one intend to retire as soon as I get the chance. */ + rh#talk15_retire
 	++ @912 /* It does foster a certain closeness, doesn't it? */ + rh#talk15_closeness
END

IF ~~ rh#talk15_gold
 SAY @913 /* That certainly plays a part as well, though less of one than you might think. */
IF ~~ + rh#talk15_main5
END

IF ~~ rh#talk15_complain
 SAY @914 /* Ahh, let's not ask for miracles just yet. One is enough for now. */
IF ~~ + rh#talk15_main5
END

IF ~~ rh#talk15_retire
 SAY @915 /* And I'd gladly do the same, but... well. Be that as it may. */
IF ~~ + rh#talk15_main5
END

IF ~~ rh#talk15_closeness
 SAY @916 /* I wouldn't have thought as much, but... well. Be that as it may. */
IF ~~ + rh#talk15_main5
END

IF ~~ rh#talk15_main5
 SAY @917 /*  I... know I'm hardly the most honest man in Faerun, but I'm not going to betray you, <CHARNAME>. Strange as it is to put it into words. You do realize that, I hope. */ 
 	++ @918 /* I didn't think you were. */ + rh#talk15_trust
 	++ @919 /* Forever is a long time. */ + rh#talk15_forever
 	++ @920 /* I trusted you more before you said that. */ + rh#talk15_trustmore
 	++ @921 /* Sincerity looks very good on you. */ + rh#talk15_sincerity
 	++ @922 /* It would be suicidally stupid of you if you did. */ + rh#talk15_hard
END

IF ~~ rh#talk15_trust
 SAY @923 /* I never really intended to. Even if you were a complete fool, I'd still have owed you too much. I don't trust that many people. I never have, but you... */
IF ~~ + rh#talk15_main6
END

IF ~~ rh#talk15_forever
 SAY @924 /* I know. And I keep my promises... the few I actually make. I don't trust that many people. I never have, but you... */
IF ~~ + rh#talk15_main6
END

IF ~~ rh#talk15_trustmore
 SAY @925 /* Heh. Had I been insincere, I probably wouldn't have fumbled through that quite so badly. I don't trust that many people. I never have, but you... */
IF ~~ + rh#talk15_main6
END

IF ~~ rh#talk15_sincerity
 SAY @926 /* I try not to make a habit of it. I don't trust that many people. I never have, but you... */
IF ~~ + rh#talk15_main6
END

IF ~~ rh#talk15_hard
 SAY @927 /* Sometimes it can be exceptionally hard to talk to you, <CHARNAME>. Funny, that I find myself trusting you anyway. */
IF ~~ + rh#talk15_main6
END

IF ~~ rh#talk15_main6
 SAY @928 /* I don't know. Hopefully this isn't just another terrible mistake. Heavens know, I've made enough of those. */
IF ~~ EXIT
END
END

// 16. (upon rest)
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",32)~ THEN RH#ADRJ rh#talk16
@929 /* ...<CHARNAME>? Ah, it is you. */
= @930 /* I take it there's no such thing as privacy, even at rest. Well, I guess I should be used to that by now. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1)~
END
	++ @931 /* I'm sorry to interrupt, but you looked thoughtful. */ + rh#talk16_thoughtful
	++ @932 /* Staring absently into a copse of trees like this... you're not about to go elven on me, are you? */ + rh#talk16_elven
	++ @933 /* Given the bottle of mead lying in the grass, you should be glad for that. Any number of monsters might find you too tasty a treat to ignore. */ + rh#talk16_monsters 

APPEND RH#ADRJ 

IF ~~ rh#talk16_thoughtful
 SAY @934 /* Hmm? Oh, I suppose I do. I was thinking... */
IF ~~ + rh#talk16_main1
END

IF ~~ rh#talk16_elven
 SAY @935 /* No. I suppose that this is as close as I get. I was thinking... */
IF ~~ + rh#talk16_main1
END

IF ~~ rh#talk16_monsters
 SAY @936 /* I'm not too drunk to cast invisibility, <CHARNAME>. I was thinking... */
IF ~~ + rh#talk16_main1
END

IF ~~ rh#talk16_main1
 SAY @937 /* Well, it's not that great a secret, if you want to hear it. */
	++ @938 /* Please. */ + rh#talk16_father
	++ @939 /* I'll listen. */ + rh#talk16_father
	++ @940 /* I'm not interested. */ + rh#talk16_notinterested
END

IF ~~ rh#talk16_notinterested
 SAY @941 /* Fair enough. I'll meet you back at camp, I suppose. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ rh#talk16_whatever
 SAY @942 /* Fine. I'll meet you there, I suppose. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ rh#talk16_father
 SAY @943 /* I've... only a single memory of my father. He was... seldom present. Too busy off rescuing lost kittens and whatever other nonsense was more important, but there was a grove somewhere near our home that he'd occasionally take me to when he was around. */
 = @944 /* It looked a bit like this... at least, I think it did. Strange, isn't it? The things we remember even decades later. I half recall him naming off the different types plants for me, but I was, ah... too busy trying to bite off his pointed ear to pay much attention. */
 	+ ~OR(4) Class(Player1,RANGER_ALL) Class(Player1,CLERIC_RANGER) Class(Player1,DRUID_ALL) Class(Player1,FIGHTER_DRUID)~ + @945 /* Well, there's some cinnamon fern over there, and that tree... */ + rh#talk16_ranger
 	++ @946 /* It wasn't his fault, you know. That she took you. If he had been around that day, then she would have just waited for a better chance. */ + rh#talk16_blame
 	++ @947 /* Stop daydreaming, Adrian. Sentimental excursions aren't going to get you anywhere, and I don't want you falling apart on me. */ + rh#talk16_sentimentality
	++ @948 /* You sound like you miss him. */ + rh#talk16_misshim
	+ ~OR(2) Race(Player1,ELF) Race(Player1,HALF_ELF)~ + @949 /* Biting his pointed ear? I'm suddenly afraid to let you close! */ + rh#talk16_pointedear
	++ @950 /* This nostalgia is making me sick. I'm going back to camp. */ + rh#talk16_whatever
END

IF ~~ rh#talk16_ranger
 SAY @951 /* Hells, <CHARNAME>! I'd rather not associate you with my father. For a variety of different reasons. */
IF ~~ + rh#talk16_main2
END

IF ~~ rh#talk16_blame
 SAY @952 /* If he'd been around at all, he might have noticed. But it's a stupid thing to dwell upon now, I suppose. */
IF ~~ + rh#talk16_main2
END

IF ~~ rh#talk16_sentimentality
 SAY @953 /* I'm hardly falling apart, <CHARNAME>, I just... */
 = @954 /* You're right. He was a fool. An easily manipulated fool, and he doesn't deserve my reminiscence. I just... */
IF ~~ + rh#talk16_main2
END

IF ~~ rh#talk16_misshim
 SAY @955 /* Miss him? I... no. What would be the point? I sometimes wish I'd had a chance to know him, at least a bit, but... hells, what a violent meeting that would be. */
IF ~~ + rh#talk16_main2
END

IF ~~ rh#talk16_pointedear
 SAY @956 /* Heh. I was only three, <CHARNAME>. */
IF ~~ + rh#talk16_main2
END

IF ~~ rh#talk16_main2
 SAY @957 /* I never used to think about things like this, but now... I suppose there's nothing like dismal failure to make you start obsessing over the might have beens. */
 	++ @958 /* Oh, stop it. You're not a dismal failure. */ + rh#talk16_failure
 	++ @959 /* Well, you'd never have met me. That's not something I'd want to take back. */ + rh#talk16_meeting
 	++ @960 /* Would you really want to erase thirty years of your life just because the last two haven't been very much to your liking? */ + rh#talk16_thirty
 	++ @961 /* By all the gods, Adrian. I thought you were able to hold your liquor better than this. */ + rh#talk16_liquor
 	++ @962 /* Okay, that's more than enough of this nonsense for me. I'm going back to camp. */ + rh#talk16_whatever
END

IF ~~ rh#talk16_failure
 SAY @963 /* No? I suppose getting yourself sold into slavery is the epitome of success. */
 = @964 /* Oh, enough of this. */
IF ~~ + rh#talk16_main3
END

IF ~~ rh#talk16_meeting
 SAY @965 /* I suppose that's something positive to take away from the whole mess. */
IF ~~ + rh#talk16_main3
END

IF ~~ rh#talk16_thirty
 SAY @966 /* No... no. You're right. Even parts of the last two years. Like now, for instance... */
IF ~~ + rh#talk16_main3
END

IF ~~ rh#talk16_liquor
 SAY @967 /* I... gods, you're right. Enough of this. */
IF ~~ + rh#talk16_main3
END
 
IF ~~ rh#talk16_main3 
 SAY @968 /* Here, I've half finished this bottle of mead, but there's plenty left if you'd like to share. */
 	++ @969 /* That sounds lovely. */ + rh#talk16_verywelcome
 	++ @970 /* Not a <DAYNIGHT> goes by that I don't find myself drinking with you nowadays. */ + rh#talk16_verywelcome
 	++ @971 /* Enjoy it. I think I'd rather one of us be sober enough to keep from getting attacked by bandits or wild animals on the way back to camp. */ + rh#talk16_typicalzhentdebauchery
 	++ @972 /* You've had more than enough as it is. Come on, let's go. */ + rh#talk16_whatever
END

IF ~~ rh#talk16_verywelcome
 SAY @973 /* You're very welcome. */
IF ~~ + rh#talk16_main4
END

IF ~~ rh#talk16_typicalzhentdebauchery
 SAY @974 /* Bandits and wild animals? I'm a Zhent, <CHARNAME>, or at least fractionally so. Drunken debauchery is our thing. I know what I'm doing. */
IF ~~ + rh#talk16_main4
END

IF ~~ rh#talk16_main4
 SAY @975 /* I like this. You and me... without any of your mad friends in sight. */
 = @976 /* You don't need to sit so far away, you know. I don't bite. Not exactly. */
	++ @977 /* I'm already sitting right next to you. */ + rh#talk16_nextto
	++ @978 /* I... um... */ + rh#talk16_main5
	++ @979 /* I wouldn't mind it if you did. (smile) */ + rh#talk16_bite
	++ @980 /* Apparently I need to get you drunk and sentimental more often. */ + rh#talk16_bad
	++ @981 /* I'm beginning to think this was a bad idea. I'm going back to camp. Good night. */ + rh#talk16_nokiss
END

IF ~~ rh#talk16_nextto
 SAY @982 /* ...not closely enough. */ 
IF ~~ + rh#talk16_main5
END

IF ~~ rh#talk16_bite
 SAY @983 /* ...I'll have to remember that. */ 
IF ~~ + rh#talk16_main5
END

IF ~~ rh#talk16_bad
 SAY @984 /* I'm not sure I like the sound of that, but... */
IF ~~ + rh#talk16_main5
END

IF ~~ rh#talk16_main5
 SAY @985 /* Hmm. As intoxicating as this mead is, you... <CHARNAME>... */
 = @986 /* (He raises his hand slowly to your face, trailing the back of his fingers lightly across the line of your jaw. His eyes are slightly bright, with both drink and desire.) */
	++ @987 /* Oh... */ + rh#talk16_main5a
	++ @988 /* And suddenly so coy. */ + rh#talk16_main5a
	++ @989 /* (let him continue) */ + rh#talk16_main5a
	++ @990 /* (drag him closer and kiss him) */ + rh#talk16_main5b
	++ @991 /* I don't like where this is headed. I'm going back to camp. Good night. */ + rh#talk16_nokiss
END

IF ~~ rh#talk16_main5a
 SAY @992 /* (His light grasp becomes suddenly firm, and he tilts your chin up, his lips finding yours.) */
 = @993 /* (The kiss is demanding, though far from brutal, and you can feel his fingers brushing across the contours of your body before settling on your hip.) */
= @994 /* (With some reluctance, he finally pulls away, letting you up.) */
IF ~~ + rh#talk16_main6
END

IF ~~ rh#talk16_main5b
 SAY @995 /* (Unbalanced, he barely keeps from collapsing on top of you as you draw him close.) */
 = @996 /* (Despite that, he seems rather comfortable with this turn of events, and you can feel his fingers brushing across the contours of your body before settling on your hip.) */
 = @997 /* (He finally pulls away after a long moment, a strange expression on his face.) */
IF ~~ + rh#talk16_main6
END

IF ~~ rh#talk16_main6
 SAY @998 /* That was... I... */
 = @999 /* Hells, <CHARNAME>, I'm sorry. That was... utterly inappropriate. Too much mead, I think. */
 	++ @1000 /* I can't think like this either. Let's call it a night. */ + rh#talk16_night
 	++ @1001 /* The only thing you should be apologizing for is the fact that you stopped. */ + rh#talk16_mead
 	++ @1002 /* Too much mead? Not enough, apparently. */ + rh#talk16_mead
  	++ @1003 /* Right. Let's pretend this never happened. */ + rh#talk16_nokiss
END

IF ~~ rh#talk16_night
 SAY @1004 /* Agreed. Let's... talk about this later. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk16_mead
 SAY @1005 /* I... let's talk about this later. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk16_nokiss
 SAY @1006 /* I'm... sorry, <CHARNAME>. It won't happen again. Let's... let's get back to the others. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700) RestParty()~ EXIT
END
END

// 17. (morning)
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",34)~ THEN RH#ADRJ rh#talk17
@1007 /* <CHARNAME>? Ah, good, you're awake. We need to talk. I went ahead and made breakfast, and there's an extra potion here for hangovers if you need it, but... */ = @1008 /* Right. We need to talk. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @1009 /* Oh, this looks good! Thank you. */ + rh#talk17_thanks
	++ @1010 /* What's wrong? You don't look too happy. */ + rh#talk17_happy
	++ @1011 /* What is this? You never get up early. And you can't cook! */ + rh#talk17_earlybird
	++ @1012 /* You're right, we do. */ + rh#talk17_lastnight
	++ @1013 /* About what happened last night... I don't think it should happen again. */ + rh#talk17_endromance

APPEND RH#ADRJ

IF ~~ rh#talk17_endromance
 SAY @1014 /* I see. That's... probably for the best, then. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ EXIT
END
	
IF ~~ rh#talk17_thanks
 SAY @1015 /* Enjoy it. Last night-- */
IF ~~ + rh#talk17_main1
END

IF ~~ rh#talk17_happy
 SAY @1016 /* I... About last night-- */
IF ~~ + rh#talk17_main1
END

IF ~~ rh#talk17_earlybird
 SAY @1017 /* Your praise brings tears to my eyes, <CHARNAME>. I... guess I just couldn't sleep very well. Last night-- */
IF ~~ + rh#talk17_main1
END

IF ~~ rh#talk17_lastnight
 SAY @1018 /* You're right. We do. Last night-- */
IF ~~ + rh#talk17_main1
END

IF ~~ rh#talk17_nervous
 SAY @1019 /* Because, last night-- */
IF ~~ + rh#talk17_main1
END

IF ~~ rh#talk17_main1
 SAY @1020 /* Gods, this is an awkward conversation if ever there was one. Tell me, last night... did it mean anything to you? */
 	++ @1021 /* Don't be ridiculous! Of course it did. */ + rh#talk17_isee
 	++ @1022 /* I'm not sure yet, but I think I'd like it to. */ + rh#talk17_isee
 	++ @1023 /* Don't tell me that it meant nothing to you. */ + rh#talk17_nothing
 	++ @1024 /* I won't say I didn't like it, but... no. Not particularly. */ + rh#talk17_endromance
 	++ @1025 /* Well, it made me question my sanity, if that counts. */ + rh#talk17_endromance
END
 
IF ~~ rh#talk17_isee
 SAY @1026 /* I see. That's... I don't know, I'm not sure what to say, <CHARNAME>. */
IF ~~ + rh#talk17_main2
END

IF ~~ rh#talk17_nothing
 SAY @1027 /* No, that's not what I meant, but... I'm not sure what to say, <CHARNAME>. */
IF ~~ + rh#talk17_main2
END

IF ~~ rh#talk17_main2
 SAY @1028 /* I have a weakness for wine and beautiful women. I always have. Precious little good has ever come of it, and you-- */
 	++ @1029 /* And I deserve better, is that what you mean to say? */ + rh#talk17_better
 	++ @1030 /* Stop calling me beautiful. I'm really not. */ + rh#talk17_beautiful
 	++ @1031 /* You've been blowing hot and cold for a while now. Are you interested or not? */ + rh#talk17_cold
 	++ @1032 /* What are you so afraid of? */ + rh#talk17_fear
 	++ @1033 /* You've got a hell of a lot of hang-ups, don't you? Don't worry, I'm not interested anymore. */ + rh#talk17_endromance
END

IF ~~ rh#talk17_better
 SAY @1034 /* What? No. I doubt you'd be able to find much better in a place like this, but I-- */ 
IF ~~ + rh#talk17_main3
END

IF ~~ rh#talk17_beautiful
 SAY @1035 /* Stop changing the subject, <CHARNAME>. You're one of the most magnificent women I've ever known, but I-- */ 
IF ~~ + rh#talk17_main3
END

IF ~~ rh#talk17_cold
 SAY @1036 /* I... am. I won't deny that. <CHARNAME>, you're one of the most magnificent women I've ever known, but I-- */
IF ~~ + rh#talk17_main3
END

IF ~~ rh#talk17_fear
 SAY @1037 /* Afraid? I'm afraid of making the sort of mistake that will get us both killed. I-- */
IF ~~ + rh#talk17_main3
END

IF ~~ rh#talk17_main3
 SAY @1038 /* I might have said I made mistakes in Sembia. Terrible mistakes. I... never said exactly what they were. */
 	++ @1039 /* I can guess well enough. */ + rh#talk17_main4
 	++ @1040 /* Out with it. Now. */ + rh#talk17_main4
 	++ @1041 /* You know I don't care about your past. */ + rh#talk17_past
 	++ @1042 /* I'm getting sick of the way you hide away whatever pieces of information are the most important. Just stay away. */ + rh#talk17_endromance
END

IF ~~ rh#talk17_past
 SAY @1043 /* Well, I can't exactly run away from it, can I? */
IF ~~ + rh#talk17_main4
END

IF ~~ rh#talk17_main4
 SAY @1044 /* Seven years can be a long time, especially in an environment like that. I'd grown... careless. Too confident, perhaps. Or maybe I was just tired of the endless charade and looking for any excuse to self-destruct. I couldn't really say. */
 = @1045 /* I usually worked alone. For the most part it was safer that way, but every so often my masters would have... unrelated interests in the city, and I'd find myself with some unwanted company. Towards the end... her name was Sadi'a. Sadi'a al-Shadir. */
 = @1046 /*  An exiled Calishite noblewoman, if her stories were true. It was always hard to tell with her... she existed as much on fantasy as reality. She'd claimed to have fled the country after murdering an unwanted suitor, and that much I can believe. Calishites. */
 = @1047 /* She'd turned her little hobby into a career and been recruited as an assassin, and... it was stupid, I admit. It was unbelievably stupid, but I didn't care. I'd grown bored, I think, and she was... exhilarating, if nothing else. */
 	++ @1048 /* What happened? */ + rh#talk17_main5
 	++ @1049 /* I take it she betrayed you? */ + rh#talk17_betray
 	++ @1050 /* I really don't want to hear this. */ + rh#talk17_enough
END

IF ~~ rh#talk17_enough
 SAY @1051 /* Fine. If you're not interested, I certainly don't need to share it. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk17_betray
 SAY @1052 /* Not exactly. */
IF ~~ + rh#talk17_main5
END

IF ~~ rh#talk17_main5
 SAY @1053 /* Too much wine one evening and I found myself in her bed in the morning, with precious little memory of what had happened in between. That's why last night... I didn't want that mad mess again, <CHARNAME>. The first time very nearly got me killed. */
 = @1054 /* Sadi'a and I... we never quite got along. Maybe too much abuse at the hands of Calishite men had left her hating the whole lot of us. I don't know. Our relationship -- if you could call it that -- was more an extended power game than anything else. */
 = @1055 /* It was obsessive, and it burnt out quickly, but... hells, I'm not even sure I would take it back. When we weren't hurting each other, it was... almost worth it. */
	++ @1056 /* Almost worth it? It certainly doesn't sound like it. */ + rh#talk17_worth
	++ @1057 /* I think I can see where this is going. */ + rh#talk17_seegoing
	++ @1058 /* I think I've heard enough. */ + rh#talk17_enough
END

IF ~~ rh#talk17_worth
 SAY @1059 /* You'd be surprised. I lived on mind-games back then, and that-- well, it was one of the best. In the end, I suppose that was our undoing. */
IF ~~ + rh#talk17_main6
END

IF ~~ rh#talk17_seegoing
 SAY @1060 /* It's fairly obvious, I should think. I lived on mind-games back then, and that-- well, it was one of the best. In the end, I suppose that was our undoing. */
IF ~~ + rh#talk17_main6
END
END

CHAIN RH#ADRJ rh#talk17_main6 
@1061 /* We got sloppy, and Selgaunt isn't exactly a city that rewards recklessness. Suddenly neither of us was quite as out of sight as we would have liked to be. Seven years of caution undone in a matter of weeks. Ridiculous, I know, but trying to clean up the mess only made it that much worse. */
= @1062 /* Then Sadi'a botched an assassination... a relative of my own master who had been asking the wrong questions, and Foxmantle started fitting the pieces together. Started speaking to Harpers. I slit his throat as soon as I realized how bad things were getting, but it was too late by then. Far too late. */
= @1063 /* I fled after that. Crawled back home, too panicked to recognize that for a serious mistake. Failures and setbacks are understandable, but fiascos like that... I was lucky I wasn't executed. */
== RH#ADRJ IF ~Class("rh#Adrian",SORCERER)~ THEN @1064 /* Sadi'a... Sadi'a knew better. She just ran. She didn't get far, though. They gave me her head after they caught her. "Sorcerers may be harder to replace, but make another foolish mistake, and you can be a matching pair." */
== RH#ADRJ IF ~!Class("rh#Adrian",SORCERER)~ THEN @1065 /* Sadi'a... Sadi'a knew better. She just ran. She didn't get far, though. They gave me her head after they caught her. "You may be harder to replace, but make another foolish mistake, and you can be a matching pair." */
== RH#ADRJ @1066 /* I... gods, <CHARNAME>, I never lived that down. */
END
 	++ @1067 /* And you didn't think that it might have been a good idea to tell me about this before? */ + rh#talk17_goodidea
 	++ @1068 /* That's horrible! I'm so sorry. */ + rh#talk17_horrible
 	++ @1069 /* But you're away from them now. You don't need to worry about something like that happening again. */ + rh#talk17_away
  	++ @1070 /* You... murdered a man. And now you're so self-absorbed that all you can think of is your own problems? */ + rh#talk17_victim
 	++ @1071 /* That's more of an insight into your old world than I was ready for. You're right, this is a terrible idea. */ + rh#talk17_insight

APPEND RH#ADRJ

IF ~~ rh#talk17_goodidea
 SAY @1072 /* I suppose I should have, but... it's not a very easy story to share. */
IF ~~ + rh#talk17_main7 
END

IF ~~ rh#talk17_horrible
 SAY @1073 /* Horrible? That's Zhentil Keep, <CHARNAME>. If I could hunt down the lot of them, I would, but I haven't the power for that. */
IF ~~ + rh#talk17_main7
END

IF ~~ rh#talk17_away
 SAY @1074 /* I *know* that, <CHARNAME>. I just... */
IF ~~ + rh#talk17_main7
END

IF ~~ rh#talk17_victim
 SAY @1075 /* He betrayed me to my enemies. What should I have done instead? Kissed him? A funny time to be having moral qualms, my lady. */
IF ~~ + rh#talk17_main7
END

IF ~~ rh#talk17_insight
 SAY @1076 /* You knew what I was, <CHARNAME>. But if you're not comfortable anymore... Well, we can forget this ever happened. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ EXIT
END

IF ~~ rh#talk17_main7
 SAY @1077 /* I haven't actually been involved with anyone since. I can't say I've even wanted to be, and to change that now... */
 = @1078 /* Well, I suppose I've probably scared you away with this anyway. */
 	++ @1079 /* It is a bit much. */ + rh#talk17_insight
 	++ @1080 /* You have some demons. Who doesn't? If I was going to be frightened away so easily, I'd have run from myself long ago. */ + rh#talk17_demons
 	++ @1081 /* I've heard worse. In fact, I've lived through worse. */ + rh#talk17_demons
 	++ @1082 /* Honestly, I think the whole thing is just irresistibly romantic. */ + rh#talk17_romantic
 	++ @1083 /* Scared? No. You have my sympathy, but you won't chase me away that easily. */ + rh#talk17_scared
END

IF ~~ rh#talk17_demons
 SAY @1084 /* <CHARNAME>, daughter of Bhaal... I suppose that's true. You never do make things easy, do you? */
 = @1085 /* I... enough of this. We'll talk later. Just enjoy breakfast. Assuming it's edible. */
IF ~~ EXIT
END

IF ~~ rh#talk17_scared
 SAY @1086 /* No, I suppose not. You never do make things easy, do you? */
 = @1085 /* I... enough of this. We'll talk later. Just enjoy breakfast. Assuming it's edible. */
IF ~~ EXIT
END

IF ~~ rh#talk17_romantic
 SAY @1087 /* Do you? That's probably the most frightening thing *I've* heard all <DAYNIGHT>. */
 = @1088 /* Enough of this. Just enjoy breakfast. Assuming it's edible. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ EXIT
END
END

// 18.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",36)~ THEN RH#ADRJ rh#talk18
@1089 /* I've been avoiding you, haven't I? Some wondrous display of courage that is. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @1090 /* You need time. I understand that. You have a lot to work through. */ + rh#talk18_time
 	++ @1091 /* You're right, it is cowardly. We need to talk about this. */ + rh#talk18_coward
 	++ @1092 /* Finally come to apologize, have you? */ + rh#talk18_apologize
 	++ @1093 /* You're working yourself up over nothing, though I suppose that's nothing new. I'm not interested anymore. */ + rh#talk18_notinterested

APPEND RH#ADRJ
 
IF ~~ rh#talk18_time
 SAY @1094 /* Still, I'm sorry. It's hardly your fault. */
IF ~~ + rh#talk18_main1
END

IF ~~ rh#talk18_coward
 SAY @1095 /* Talk? What's left to say? I... I'm sorry, <CHARNAME>. I really am. */
IF ~~ + rh#talk18_main1
END

IF ~~ rh#talk18_apologize
 SAY @1096 /* I have. I'm sorry, <CHARNAME>. I really am. */
IF ~~ + rh#talk18_main1
END

IF ~~ rh#talk18_notinterested
 SAY @1097 /* I see. Perhaps... perhaps that's for the best. */
IF ~~ DO ~SetGlobal("rh#AdrianTalks","GLOBAL",39) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ EXIT
END

IF ~~ rh#talk18_main1
 SAY @1098 /* I just do everything backwards, don't I? Sack my city, sell me into slavery... that I can handle, but something as simple as this... */
 = @1099 /* What a joke. */
 	++ @1100 /* I honestly don't think you're doing a very good job of handling any of it. */ + rh#talk18_handle
 	++ @1101 /* You've never really survived by letting anybody close before. */ + rh#talk18_close 
 	++ @1102 /* If you stopped thinking about it so much and just let it happen, you'd feel better. */ + rh#talk18_better
 	++ @1103 /* Love is never so simple. If it were, the poets would have significantly less material for their tragedies. */ + rh#talk18_love
 	++ @1104 /* I really don't want to hear it. */ + rh#talk18_break
END

IF ~~ rh#talk18_handle
 SAY @1105 /* I've seen people do a good deal worse, <CHARNAME>. I can assure you of that much. */
IF ~~ + rh#talk18_main2
END

IF ~~ rh#talk18_close
 SAY @1106 /* Not with a great deal of success, at least. */
IF ~~ + rh#talk18_main2
END

IF ~~ rh#talk18_better
 SAY @1107 /* Would I? I don't know. */
IF ~~ + rh#talk18_main2
END

IF ~~ rh#talk18_love
 SAY @1108 /* I dare say I've given the damn bards enough to work with as it is. */
IF ~~ + rh#talk18_main2
END

IF ~~ rh#talk18_break
 SAY @1109 /* I see. Then I won't bother burdening you with it. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk18_main2
 SAY @1110 /* It's such a foolish thing to get worked up over, I know. Still... I guess I've just always been so reckless in the past. Even before Sadi'a and her games. */
 = @1111 /* I'll admit I've survived so long as much through luck as skill, but... hells, <CHARNAME>. I'm getting too old to take such stupid risks. */
	++ @1112 /* There's a difference between learning from your mistakes and giving up entirely, you know. */ + rh#talk18_mistakes
	++ @1113 /* Do you really think we'll fly out of control that easily? Have more faith in yourself. And in me. */ + rh#talk18_faith
	++ @1114 /* I'm not asking you to play games. If you've always played mind-games in the past, it's no wonder you got so burned. */ + rh#talk18_burn
	++ @1115 /* You'll regret this far more if you run from it. */ + rh#talk18_regret
	++ @1116 /* If you're trying to sabotage yourself, you're certainly succeeding. */ + rh#talk18_sabotage
END

IF ~~ rh#talk18_mistakes
 SAY @1117 /* My mistakes... as much as I'd like to pretend I've never actually made any... I don't know. You may be right. */
IF ~~ + rh#talk18_main3
END

IF ~~ rh#talk18_faith
 SAY @1118 /* Faith... you'd think that it would come more easily to me than it actually does. But... I don't know. You may be right. */
IF ~~ + rh#talk18_main3
END

IF ~~ rh#talk18_burn
 SAY @1119 /* Always? No, not always, but... I don't know. You may be right. */
IF ~~ + rh#talk18_main3
END

IF ~~ rh#talk18_regret
 SAY @1120 /* Will I? I... I don't know. You may be right. */
IF ~~ + rh#talk18_main3
END

IF ~~ rh#talk18_sabotage
 SAY @1121 /* I suppose I've more than enough experience with that. But... I don't know. */
IF ~~ + rh#talk18_main3
END

IF ~~ rh#talk18_main3
 SAY @1122 /* Does this really mean so much to you? */
 	++ @1123 /* Despite everything, it does. How could it not? */ + rh#talk18_main4
 	++ @1124 /* I care about you. A lot. And I don't like seeing you like this. */ + rh#talk18_main4
 	++ @1125 /* If you can get your head together again, it would. */ + rh#talk18_main4
 	++ @1126 /* Nothing's worth this much. */ + rh#talk18_notinterested
END

IF ~~ rh#talk18_main4
 SAY @1127 /* I see. And despite everything, I suppose... I suppose I'm actually relieved. Just give me some more time to think, <CHARNAME>. Please. */
IF ~~ EXIT
END
END

// 19.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",38)~ THEN RH#ADRJ rh#talk19
@1128 /* Could I have a word, <CHARNAME>? Away from the others? */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @1129 /* Yes, of course. */ + rh#talk19_thankyou
 	++ @1130 /* This is a bad time. Perhaps later. */ + rh#talk_delay
 	++ @1131 /* I'm not interested in anything you might say. */ + rh#talk19_endromance

APPEND RH#ADRJ

IF ~~ rh#talk19_thankyou
 SAY @1132 /* Thank you. */
 	++ @1133 /* Are you feeling any better about things? */ + rh#talk19_better
 	++ @1134 /* I do hope you're finally over your melodrama. */ + rh#talk19_melodrama
 	++ @1135 /* So what delightful little secret do I get to learn to<DAYNIGHT>? */ + rh#talk19_melodrama
 	++ @1136 /* You did plan on saying something, I hope. */ + rh#talk19_talk
END

IF ~~ rh#talk19_melodrama
 SAY @1137 /* I don't appreciate that, <CHARNAME>. */
	++ @1138 /* I'm sorry. That was uncalled for. */ + rh#talk19_apology
	++ @1139 /* Fine! I apologize. */ + rh#talk19_apology
	++ @1140 /* Too damn bad. */ + rh#talk19_bad
END

IF ~~ rh#talk19_endromance
 SAY @1141 /* No? Very well, then. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk19_bad
 SAY @1142 /* Then I suppose we have nothing further to say. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk19_better
 SAY @1143 /* I think so. I'm no longer panicking, at least, though when I think about it... */
IF ~~ + rh#talk19_main1 
END

IF ~~ rh#talk19_apology
 SAY @1144 /* Thank you. And yes, I am feeling better, though when I think about it... */
IF ~~ + rh#talk19_main1 
END

IF ~~ rh#talk19_talk
 SAY @1145 /* Yes, I did. I was just thinking about us. I suppose that's not particularly surprising, but... */
IF ~~ + rh#talk19_main1 
END

IF ~~ rh#talk19_main1
 SAY @1146 /* What a strange picture we would make. I can't really say that I even understand it. */
IF ~Alignment(Player1,MASK_EVIL)~ + rh#talk19_evil
IF ~!Alignment(Player1,MASK_EVIL)~ + rh#talk19_nonevil
END
 
IF ~~ rh#talk19_nonevil
 SAY @1147 /* You know full well that I don't give a damn about righteousness and glory and whatever other nonsense the Realms' heroes excite themselves over. I've done things even I'm not comfortable with, and I'm comfortable with just about everything. */
 = @1148 /* I honestly didn't expect you to let me stay at all, but this? Hells, <CHARNAME>, I'm surprised you can even look at me and see anything but a potential enemy. */
	++ @1149 /* I don't hold people's pasts against them. You've been trustworthy in the time I've known you. */ + rh#talk19_past
	++ @1150 /* I believe in second chances. In any case, everybody knows that love conquers everything. */ + rh#talk19_conquer
	++ @1151 /* I'm a daughter of Bhaal, Adrian. I know more about darkness than you think I do. If I can bear my own demons, I think I can handle yours also. */ + rh#talk19_demons
	++ @1152 /* Stop painting the world in black and white. You're not a monster and you're not my enemy. */ + rh#talk19_neutral
	++ @1153 /* I don't care about self-righteousness and glory nearly as much as you think I do. */ + rh#talk19_glory
	++ @1154 /* You're right. When you put it like that, it isn't very appealing. */ + rh#talk19_bad
END

IF ~~ rh#talk19_evil
 SAY @1155 /* I might have been a nice catch for a lady such as yourself several years ago, but look at me now... a fallen lord from a fallen city, sunken so low as to have fallen into slavery. Renegade. Hunted. Not nice things to have to admit to, but nothing you don't already know. */
 = @1156 /* There's precious little I have to offer anymore, <CHARNAME>. No money, no power, not even a title at this point. I'm sure you realize that. */
	++ @1157 /* And none of that matters to me. I have money and power to spare anyway. */ + rh#talk19_regardless
	++ @1158 /* Nothing to offer? You're still awfully good looking, you know. */ + rh#talk19_offer
	++ @1159 /* All of that is redressable. You'll get on your feet again, even if I have to drag you off the ground. */ + rh#talk19_redress
	++ @1160 /* I'm a daughter of Bhaal, Adrian. Political unions are for lesser people. */ + rh#talk19_less
	++ @1161 /* You're right. There is nothing I want here. */ + rh#talk19_bad
END

IF ~~ rh#talk19_past
 SAY @1162 /* That's... generous. And you've held true to it thus far, so I ought to trust you, and I suppose I do. */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1a
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1b
END

IF ~~ rh#talk19_conquer
 SAY @1163 /* I can't quite tell whether you're being naive or flippant. Regardless... */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1a
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1b
END

IF ~~ rh#talk19_demons
 SAY @1164 /* Hmm. That may well be so. */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1a
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1b
END

IF ~~ rh#talk19_neutral
 SAY @1165 /* No, I'm not. */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1a
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1b
END

IF ~~ rh#talk19_glory
 SAY @1166 /* Ahh... you missed the point. */
IF ~Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1a
IF ~!Alignment(Player1,MASK_GOOD)~ + rh#talk19_main1b
END

IF ~~ rh#talk19_regardless
 SAY @1167 /* You'd be better off thinking with your head, <CHARNAME>. */
IF ~~ + rh#talk19_main1c
END

IF ~~ rh#talk19_offer
 SAY @1168 /* Hells, <CHARNAME>. This isn't a joke. */
IF ~~ + rh#talk19_main1c
END

IF ~~ rh#talk19_redress
 SAY @1169 /* Hells! And you would too, wouldn't you? */
IF ~~ + rh#talk19_main1c
END

IF ~~ rh#talk19_less
 SAY @1170 /* A lesser person, am I? */
IF ~~ + rh#talk19_main1c
END

IF ~~ rh#talk19_main1a
 SAY @1171 /* You know, I've actually come to respect you. Despite everything, despite how much disdain I've always felt for the so-called forces of good, you... hells, <CHARNAME>, you pull it off well. You make it almost attractive. */
 = @1172 /* Don't think I want to join you in your idealistic bliss, but I can actually respect your convictions, even if the reverse is probably not true. */
IF ~~ + rh#talk19_main1d
END

IF ~~ rh#talk19_main1b
 SAY @1173 /* Well, you're hardly the type to start spouting sanctimonious drivel anyway, and thank all the gods for that, but... */
IF ~~ + rh#talk19_main1d
END

IF ~~ rh#talk19_main1d
 SAY @1174 /* I'm not going to wake up one morning and decide to go crusading or whatever other nonsense. I may not care so much for villainy these days, but I don't give a damn about atonement or guilt or whatever else you might think I should feel. */
 = @1175 /* And I honestly can't help but wonder where the line is, at what point you'll wake up and decide that you ought to hate me instead. And that... <CHARNAME>, that terrifies me. */
 	++ @1176 /* I'm not so naive that I don't already understand what you've been involved in. I don't hate you because of it, and that isn't going to change. */ + rh#talk19_understand
 	++ @1177 /* I won't tell you how you should feel, but I expect the same in return. As long as your past deeds stay in the past, I won't care about them. */ + rh#talk19_understand
 	++ @1178 /* If I ever feel troubled by anything, I will let you know. It's possible to end things without spiraling into madness. */ + rh#talk19_spiral
 	++ @1179 /* I don't hate you, Adrian. You're moody, vicious, and intolerant, but I can take the bad with the good. */ + rh#talk19_faithful
 	++ @1180 /* You're not half as bad as you seem to think you are. I see nothing worthy of hatred. */ + rh#talk19_naive
END

IF ~~ rh#talk19_main1c
 SAY @1181 /* Look at you: a veritable demigoddess. My lady, you are transcendant, and me... as I said, a fallen lordling from a shattered keep. To be a consort to one such as yourself... I'll admit that the thought is thrilling, but thrilling has earned me nothing but trouble in the past. */
 = @1182 /* I've played games before, romances built around manipulation and power games. It's not like it wasn't my life for the better part of a decade. Funny, a man like me asking for something different, but... I can't do it again. And I don't want to. */
 	++ @1183 /* Rest assured, neither do I. I have enough of the world out to get me, I'd prefer a lover I can trust. */ + rh#talk19_trust
 	++ @1184 /* Do you really think so poorly of me? When have I ever mistreated those closest to me? */ + rh#talk19_mistreat
 	++ @1185 /* You're going to bore me to death now, aren't you? */ + rh#talk19_bore
 	++ @1186 /* Do I look like a drow matron mother? A flattering comparison, to be sure, but I treat my males with a bit more kindness than that. (smile) */ + rh#talk19_drow
 	++ @1187 /* I don't want this to blow up in my face either. I've waited this long, and I'll respect whatever lines you want to draw. */ + rh#talk19_lines
 	++ @1188 /* I'm sorry, what were you saying? You lost me at "demigoddess" and "transcendant." My, but you know how to flatter a woman. */ + rh#talk19_narcissa
END

IF ~~ rh#talk19_understand
 SAY @1189 /* I suppose that's really all I can hope for. */
IF ~~ + rh#talk19_main2
END

IF ~~ rh#talk19_spiral
 SAY @1190 /* Good. That's... reassuring. Thank you. */
IF ~~ + rh#talk19_main2
END

IF ~~ rh#talk19_faithful
 SAY @1191 /* You do have a way with words. Still, that's reassuring. Thank you. */
IF ~~ + rh#talk19_main2
END

IF ~~ rh#talk19_naive
 SAY @1192 /* Are you really so naive, <CHARNAME>? I... */
 = @1193 /* Never mind. Let's just drop this entirely. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1)~ EXIT
END

IF ~~ rh#talk19_drow
 SAY @1194 /* Hells, <CHARNAME>. Can you please at least try to take this seriously? */
	++ @1195 /* I am taking it seriously. I don't mistreat the people I care for. You should know that by now. */ + rh#talk19_mistreat
	++ @1196 /* I know, I know. You needn't worry. I've waited this long; I'll respect whatever lines you want to draw. */ + rh#talk19_lines
	++ @1197 /* If you're going to get sickeningly sentimental about things, I don't see what alternative I have. */ + rh#talk19_sentiment
	++ @1198 /* You're not allowed to talk to me like that, male. */ + rh#talk19_male
END

IF ~~ rh#talk19_trust
 SAY @1199 /* Good. And you can, <CHARNAME>. I promise you that much. */
IF ~~ + rh#talk19_main2
END

IF ~~ rh#talk19_mistreat
 SAY @1200 /* No, you're right. I guess I just needed to hear it. */
IF ~~ + rh#talk19_main2
END

IF ~~ rh#talk19_bore
 SAY @1201 /* Hmm. So it would seem. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk19_lines
 SAY @1202 /* Good. That's what I needed to hear. */
IF ~~ + rh#talk19_main2
END

IF ~~ rh#talk19_narcissa
 SAY @1203 /* Nothing. I wasn't saying anything at all. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk19_sentiment
 SAY @1204 /* I see. I suppose that answers my question for me. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk19_male
 SAY @1205 /* No? Then we have nothing further to say. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk19_main2
 SAY @1206 /* That was my one real concern. The only rational one, at least. If I thought we were destined for failure and bloody disaster, I would never have shared this much, but... I do trust you, <CHARNAME>. As hard as that may be to believe right now. */
 = @1207 /* It sounds so simple when put into words, but if it's poetry you want, you'd best look elsewhere. Still, if you'd like to try this after everything... */
  	++ @1208 /* I do. I'm sure we can make it work. */ + rh#talk19_work
 	++ @1209 /* Do you need to make it sound so much like a marriage proposal? */ + rh#talk19_propose
 	++ @1210 /* I don't think so. */ + rh#talk19_endall
END

IF ~~ rh#talk19_work
 SAY @1211 /* Oddly enough, I think we can too. */
 = @1212 /* No chaos, no madness, no confusion. (smile) At least for now. I hope you don't mind taking things slowly for a while. */
 	++ @1213 /* I think I'd like that. */ + rh#talk19_like
 	++ @1214 /* As long as I still get to kiss you again. */ + rh#talk19_kiss
 	++ @1215 /* Do you really need to be so skittish about this? */  + rh#talk19_skittish
 	++ @1216 /* I'm really not interested in this much work. */ + rh#talk19_endall
END 

IF ~~ rh#talk19_propose
 SAY @1217 /* Hmm? Oh. (smile) I suppose in my experience, marriage proposals are highly contractualized and signed in blood. */
 = @1218 /* No, I'm hardly asking for that. I'd much rather take things slowly, honestly. */
 	++ @1213 /* I think I'd like that. */ + rh#talk19_like
 	++ @1214 /* As long as I still get to kiss you again. */ + rh#talk19_kiss
 	++ @1215 /* Do you really need to be so skittish about this? */  + rh#talk19_skittish
 	++ @1216 /* I'm really not interested in this much work. */ + rh#talk19_endall
END 

IF ~~ rh#talk19_endall
 SAY @1219 /* And you tell me this now? Fine. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk19_like
 SAY @494 /* I'm glad to hear it. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ rh#talk19_kiss
 SAY @1220 /* Mmm, I think we can make allowances for that. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ rh#talk19_skittish
 SAY @1221 /* Skittish? No. I'm not going to turn and run, <CHARNAME>, I just want to be more careful this time. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",2)~ EXIT
END
END

// 20. (upon rest)
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",40) Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN RH#ADRJ rh#talk20
@1222 /* I'd be lost in this country if I didn't know how to play the black market. Of all things to be all but illegal... books. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @1223 /* What horrors are you reading about to<DAYNIGHT>? Planning on raising an undead army? */ + rh#talk20_horrors
	++ @1224 /* Could you please stop picking and choosing which laws you feel like following? */ + rh#talk20_laws
	++ @1225 /* I can't believe it either. The pursuit of knowledge should never be illegal. */ + rh#talk20_knowledge
	+ ~OR(6) Class(Player1,MAGE_ALL) Class(Player1,7) Class(Player1,10) Class(Player1,13) Class(Player1,14) Class(Player1,17)~ + @1226 /* Careful there that you don't spill wine all over my spellbooks. Could you put that drink away? */ + rh#talk20_spillwine
	+ ~!Class(Player1,MAGE_ALL) !Class(Player1,7) !Class(Player1,10) !Class(Player1,13) !Class(Player1,14) !Class(Player1,17)~ + @1227 /* If you stopped spilling wine all over them, you wouldn't need to constantly buy new copies. Could you put that drink away? */ + rh#talk20_spillwine
	++ @1228 /* So he finally pulls his nose out of his books! And here I thought you had forgotten about me completely. */ + rh#talk20_companions

CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",40) Global("rh#AdrianFriendshipActive","GLOBAL",1)~ THEN RH#ADRJ rh#ft12
@1229 /* I'd be lost in this country if I didn't know how to play the black market. Hells, of all things to be all but illegal... books. */
DO ~SetGlobal("rh#AdrianTalks","GLOBAL",43) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @1223 /* What horrors are you reading about to<DAYNIGHT>? Planning on raising an undead army? */ + rh#talk20_horrors
	++ @1224 /* Could you please stop picking and choosing which laws you feel like following? */ + rh#talk20_laws
	++ @1225 /* I can't believe it either. The pursuit of knowledge should never be illegal. */ + rh#talk20_knowledge
	+ ~OR(6) Class(Player1,MAGE_ALL) Class(Player1,7) Class(Player1,10) Class(Player1,13) Class(Player1,14) Class(Player1,17)~ + @1226 /* Careful there that you don't spill wine all over my spellbooks. Could you put that drink away? */ + rh#talk20_spillwine
	+ ~!Class(Player1,MAGE_ALL) !Class(Player1,7) !Class(Player1,10) !Class(Player1,13) !Class(Player1,14) !Class(Player1,17)~ + @1227 /* If you stopped spilling wine all over them, you wouldn't need to constantly buy new copies. Could you put that drink away? */ + rh#talk20_spillwine
	++ @1230 /* Ah! He finally pulls his nose out of his books and notices that he has companions! */ + rh#ft12_companions

APPEND RH#ADRJ

IF ~~ rh#talk20_horrors
 SAY @1231 /* Nothing so crass. It's a treatise on enchantment, actually. Why control the dead when you can control the living, my <PRO_LADYLORD>? */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main1a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main1a
END

IF ~~ rh#talk20_laws
 SAY @1232 /* Laws as stupid as this one don't count, as far as I'm concerned. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main1a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main1a
END

IF ~~ rh#talk20_knowledge
 SAY @1233 /* Hmm. I'm not sure how much I'd care to see the secrets of the Art in the hands of any pathetic fool, but... well, for once I sympathize with the sentiment. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main1a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main1a
END

IF ~~ rh#talk20_spillwine
 SAY @1234 /* I haven't spilled wine on anything, <CHARNAME>. I'm not quite that drunk yet. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main1a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main1a
END

IF ~~ rh#ft12_companions
 SAY @1235 /* Very funny, <CHARNAME>. But you're right. I probably should put the damn thing away for now. Maybe I'll find something more interesting the next time I look. */
IF ~~ + rh#talk20_main1
END

IF ~~ rh#talk20_companions
 SAY @1236 /* Never, <CHARNAME>. But you're right. I probably should put the damn thing away for now. I don't want to seem entirely unsocial to<DAYNIGHT>. */
IF ~~ + rh#talk20_main1
END

IF ~~ rh#ft12_main1a
 SAY @1237 /* That's enough reading for one <DAYNIGHT>, though. Maybe I'll find something more interesting the next time I look. */ 
IF ~~ + rh#talk20_main1
END

IF ~~ rh#talk20_main1a
 SAY @1238 /* That's enough reading for now, though. I don't want to seem entirely unsocial to<DAYNIGHT>. */ 
IF ~~ + rh#talk20_main1
END

IF ~~ rh#talk20_main1
 SAY @1239 /* Could you hand me that bottle over there? The Evereskan one? Whatever else can be said about the elves, they do make a fine wine. */
	++ @1240 /* It is pretty good, isn't it? You probably should have asked for it before I finished it. */ + rh#talk20_finished
	++ @1241 /* So you've finally discovered something good about the elves! */ + rh#talk20_elves
	++ @1242 /* You actually like this elven stuff? You can keep it. I prefer something a bit heavier myself. */ + rh#talk20_heavier
	++ @1243 /* I suppose I should just be glad you're not into anything worse than wine. */ + rh#talk20_worse
	++ @1244 /* If you manage to get yourself killed in the morning because you're too hung over, don't expect me to have you raised again. */ + rh#talk20_hungover
END

IF ~~ rh#talk20_finished
 SAY @1245 /* You... oh, I didn't even notice. I'll have to grab a different vintage, then. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main2
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main2
END

IF ~~ rh#talk20_elves
 SAY @1246 /* Don't expect me to make a habit of it. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main2
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main2
END

IF ~~ rh#talk20_heavier
 SAY @1247 /* Dwarven grog, is it? Well, there's more than enough of that as well. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main2
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main2
END

IF ~~ rh#talk20_worse
 SAY @1248 /* No... not anymore, at least. It caused more problems than it solved. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main2
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main2
END

IF ~~ rh#talk20_hungover
 SAY @1249 /* You needn't worry about that... potions can be wonderful things. One early morning ambush while hungover a year or so back was more than enough to never risk it again. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk20_main2
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#ft12_main2
END

// romance branch
IF ~~ rh#talk20_main2
 SAY @1250 /* At the risk of sounding trite... you know, I'd actually forgotten how good this felt. Though I suppose that it's equally possible that I'd never really known. */
	++ @1251 /* Well, I'm glad you're happy. */ + rh#talk20_urhappy
	++ @1252 /* I take it you're not talking about the wine anymore. */ + rh#talk20_notwine
	++ @1253 /* Don't congratulate yourself too much. You're the one who almost refused. */ + rh#talk20_refused
	++ @1254 /* I'd certainly hope it feels good. Your hands are roaming freely enough. */ + rh#talk20_roamfree
END
 
IF ~~ rh#talk20_urhappy 
 SAY @1255 /* And I am... perhaps I'd forgotten how that felt as well. */
IF ~~ + rh#talk20_main3
END

IF ~~ rh#talk20_notwine
 SAY @1256 /* Very perceptive of you, my dear. */
IF ~~ + rh#talk20_main3
END

IF ~~ rh#talk20_refused 
 SAY @1257 /* And you'll never let me forget that, will you? */
IF ~~ + rh#talk20_main3
END

IF ~~ rh#talk20_roamfree
 SAY @1258 /* So they are... if you don't like it, just slap me away. */
IF ~~ + rh#talk20_main3
END

IF ~~ rh#talk20_main3
 SAY @1259 /* Hmm. It's surprisingly easy to forget how young you are, <CHARNAME>. That's no wonder, as you've accomplished more in your twenty odd years than most people do in a lifetime, but... well. */
 = @1260 /* I've been meaning to ask you... have you ever done this before? */
	++ @1261 /* I don't read minds, Adrian. */ + rh#talk20_readminds
	++ @1262 /* You're more drunk than you realize if you think that's a coherent question. */ + rh#talk20_coherent
 	+ ~Class("rh#Adrian",SORCERER)~ + @1263 /* Done what? Curled up next to the fire with a mad sorcerer? */ + rh#talk20_madsorcerer
  	+ ~!Class("rh#Adrian",SORCERER)~ + @1264 /* Done what? Curled up next to the fire with a mad wizard? */ + rh#talk20_madsorcerer
  	++ @1265 /* Adventuring? You know full well that I've been doing this for more than a year now. */ + rh#talk20_year1	
 	+ ~CheckStatGT(Player1,14,WIS)~ + @1266 /* Taken a lover, you mean? */ + rh#talk20_main3
END

IF ~~ rh#talk20_readminds
 SAY @1267 /* And thank the gods for that. You're dangerous enough as it is. No, I meant... this. Taken a lover. */
IF ~~ + rh#talk20_main4
END

IF ~~ rh#talk20_coherent
 SAY @1268 /* Heh. I'm surprised you still expect coherence from me at all. No, I meant... this. Taken a lover. */
IF ~~ + rh#talk20_main4
END

IF ~~ rh#talk20_madsorcerer
 SAY @1269 /* Mmm, I hope you don't make a habit of it, my dear. Most aren't as tame as I am. But I meant... this. Taken a lover. */
IF ~~ + rh#talk20_main4
END

IF ~~ rh#talk20_year1
 SAY @1270 /* No, no. Not that. I meant... this. Taken a lover. */
IF ~~ + rh#talk20_main4
END

IF ~~ rh#talk20_main4
 SAY @1271 /* I can't imagine the opportunity ever presented itself much at Candlekeep, unless you had a taste for self-righteous hermits and old men... if that's the case, I'm glad to have cured you of it. */
 = @1272 /* But I know you've done little but run in the time since, and on the long road, the chances for... love, as it were, are few and far between. */
	++ @1273 /* You're definitely not my first. I hope that doesn't bother you. */ + rh#talk20_jealous
	+ ~!Alignment(Player1,MASK_EVIL)~ + @1274 /* Self-righteous hermits? Why have someone around to congratulate me on good deeds when I can keep a lover who complains about them instead? */ + rh#talk20_complain
 	++ @1275 /* People can get close on the road. You must have noticed that by now. (smile) */ + rh#talk20_callthis	
 	++ @1276 /* Until now, I'd agree with that sentiment. The opportunity never much presented itself before. */ + rh#talk20_virgin	
  	++ @1277 /* And yet I'm sure you've seen me flirting with half the eligible men in Amn. */ + rh#talk20_flirt  	
 	++ @1278 /* Stop being melodramatic about it. What do I look like, a Sunite? */ + rh#talk20_sunite
END

IF ~~ rh#talk20_jealous
 SAY @1279 /* After my history? No. If anything, it's reassuring. I'd prefer to think that at least one of us actually knows what we're doing. */
IF ~~ + rh#talk20_main5
END

IF ~~ rh#talk20_complain
 SAY @1280 /* Oh, do be fair. I haven't complained in quite some time. I try not to annoy you too much, <CHARNAME>. */
IF ~~ + rh#talk20_main5
END

IF ~~ rh#talk20_callthis
 SAY @1281 /* So it would seem. I had never really believed it possible before... though that may well have said more about the company I was keeping than anything else. */
IF ~~ + rh#talk20_main5
END

IF ~~ rh#talk20_virgin
 SAY @1282 /* Then I should consider myself very, very lucky. You could have very easily been snatched up several years ago, <CHARNAME>. */
IF ~~ + rh#talk20_main5
END

IF ~~ rh#talk20_flirt
 SAY @1283 /* Yes... and I would really rather you stopped doing that now, my dear. I would hate to have to kill someone over you. */
 = @1284 /* (smile) Actually, I might not mind that at all. */
IF ~~ + rh#talk20_main5
END

IF ~~ rh#talk20_sunite
 SAY @1285 /* From this angle, my dear, you could be the lady Firehair herself. */
 = @1286 /* ...oh, just listen to me. Too much wine to<DAYNIGHT>. Again. You're right. I *am* being melodramatic. */
IF ~~ + rh#talk20_main5
END

IF ~~ rh#talk20_main5
 SAY @1287 /* Sometimes I think it a pity that this damn quest of yours commands so much of our attention. Realistically, I'd probably grow bored without it, but on evenings like this... */
 = @1288 /* I'd almost rather forget this task completely and never rise from this spot again. A silly fantasy, yes, but I won't pretend I haven't thought it. */
 	++ @1289 /* I've felt exactly like that for much of the last year. */ + rh#talk20_year
 	++ @1290 /* Don't be ridiculous. We do have responsibilities. */ + rh#talk20_could
 	++ @1291 /* Darling, you're not doing a very good job of pretending not to be romantic. */ + rh#talk20_romantic
 	++ @1292 /* Shall we head south to Chult and disappear into its jungles to get away from everything? */ + rh#talk20_chult
 	++ @1293 /* Oddly enough, this is the first time in quite a while that I *haven't* felt like running away from everything. */ + rh#talk20_runaway
END

IF ~~ rh#talk20_year
 SAY @1294 /* I can believe it. */
IF ~~ + rh#talk20_main6
END 

IF ~~ rh#talk20_could
 SAY @1295 /* I know, I know. */
IF ~~ + rh#talk20_main6
END 

IF ~~ rh#talk20_romantic
 SAY @1296 /* No, I suppose not. I'll have to work on that, then. */
IF ~~ + rh#talk20_main6
END 

IF ~~ rh#talk20_chult
 SAY @1297 /* I can't decide if the climate or the lack of civilization would kill me first. I suppose we shouldn't forget the savages and the wild animals. */
IF ~~ + rh#talk20_main6
END 

IF ~~ rh#talk20_runaway
 SAY @1298 /* Is it? Well, I'm glad to hear that. */
IF ~~ + rh#talk20_main6
END 

IF ~~ rh#talk20_main6
 SAY @1299 /* Hmm. As much as I'd enjoy simply sitting here until morning... I should probably get some rest. */
 = @1300 /* You're welcome to join me, <CHARNAME>. I'll even keep my hands to myself. */
 	++ @969 /* That sounds lovely. */ + rh#talk20_lovely
 	++ @1301 /* You're incapable of keeping your hands to yourself. */ + rh#talk20_handsself
 	++ @1302 /* I'd rather you didn't even try. */ + rh#talk20_rather
 	++ @1303 /* I'll be with you in a bit. */ + rh#talk20_inabit
 	++ @1304 /* I'd really rather sleep by myself. */ + rh#talk20_fine
END

IF ~~ rh#talk20_lovely
 SAY @1305 /* Wonderful. Come on, my dear. Let's go. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk20_handsself
 SAY @1306 /* Relatively speaking. Come on, my dear. Let's go. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk20_rather
 SAY @1307 /* No need to rush things, my dear. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk20_inabit
 SAY @1308 /* Alright. Good night. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk20_fine
 SAY @1309 /* I'll see you tomorrow, then. */
IF ~~ DO ~RestParty()~ EXIT
END

// friendship branch
IF ~~ rh#ft12_main2
 SAY @1310 /* Hmm. I've been meaning to ask you something. I suppose this is as good a time as any. */
	+ ~OR(7) Class(Player1,BARD_ALL) Class(Player1,MAGE_ALL) Class(Player1,CLERIC_ALL) Class(Player1,8) Class(Player1,7) Class(Player1,14) Class(Player1,17)~ + @1311 /* What is it? */ + rh#ft12_sage
	+ ~OR(5) Class(Player1,THIEF_ALL) Class(Player1,9) Class(Player1,10) Class(Player1,13) Class(Player1,15)~ + @1311 /* What is it? */ + rh#ft12_thief
	+ ~OR(4) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Class(Player1,18) Class(Player1,16)~ + @1311 /* What is it? */ + rh#ft12_woodsman 
	+ ~OR(2) Class(Player1,FIGHTER_ALL) Class(Player1,PALADIN_ALL)~ + @1311 /* What is it? */ + rh#ft12_warrior
	++ @1312 /* That sounds somewhat ominous. */ + rh#ft12_ominous
	++ @1313 /* It's a terrible time, actually. */ + rh#ft12_terrible
END

IF ~~ rh#ft12_ominous
 SAY @1314 /* Nothing of the sort. Were it ominous, it wouldn't keep on slipping my mind. */
IF ~OR(7) Class(Player1,BARD_ALL) Class(Player1,MAGE_ALL) Class(Player1,CLERIC_ALL) Class(Player1,8) Class(Player1,7) Class(Player1,14) Class(Player1,17)~ + rh#ft12_sage
IF ~OR(5) Class(Player1,THIEF_ALL) Class(Player1,9) Class(Player1,10) Class(Player1,13) Class(Player1,15)~ + rh#ft12_thief
IF ~OR(4) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Class(Player1,18) Class(Player1,16)~ + rh#ft12_woodsman
IF ~OR(2) Class(Player1,FIGHTER_ALL) Class(Player1,PALADIN_ALL)~ + rh#ft12_warrior
END

IF ~~ rh#ft12_terrible
 SAY @1315 /* So intent on being prepared for tomorrow's trials, are you? Well, I'd certainly hate to interfere. */
IF ~~ EXIT
END

IF ~~ rh#ft12_sage
 SAY @1316 /* The library of Candlekeep... you're a spellcaster yourself, so I would hope that you'd have some idea of what was hidden amidst those dusty shelves. */
IF ~~ + rh#ft12_main3
END

IF ~~ rh#ft12_thief
 SAY @1317 /* The library of Candlekeep... given your talent for getting behind locked doors, I would hope that you'd have some idea of what was hidden amidst those dusty shelves. */
IF ~~ + rh#ft12_main3
END
 
IF ~~ rh#ft12_woodsman
 SAY @1318 /* The library of Candlekeep... I know you're a good deal more interested in the outdoors than old books, but even you must have some idea of what was hidden amidst those dusty shelves. */
IF ~~ + rh#ft12_main3
END
 
IF ~~ rh#ft12_warrior
 SAY @1319 /* The library of Candlekeep... I know you were probably more interested in training than old books, but even you must have some idea of what was hidden amidst those dusty shelves. */
IF ~~ + rh#ft12_main3
END

IF ~~ rh#ft12_main3
 SAY @1320 /* It's doubtful that the monks would have held onto anything of... particular interest, but I've always wondered what secrets you people were keeping. */
	++ @1321 /* I did once catch a glance at a book about phylacteries, but it was gone when I went back to find it again. */ + rh#ft12_phylactery
	++ @1322 /* If you think there were shelves full of dark magic, you're sadly mistaken. */ + rh#ft12_darkmagic
	++ @1323 /* Gorion knew well enough to keep me away from the library... I'd probably have accidentally burnt the whole thing to the ground. */ + rh#ft12_accident
	++ @1324 /* Some of the old prophecies were fairly interesting. One in particular comes to mind. */ + rh#ft12_prophecy
	++ @1325 /* I never really bothered to look through the library at all. */ + rh#ft12_bother
END

IF ~~ rh#ft12_phylactery
 SAY @1326 /* Those aren't quite as rare as you would think. */
IF ~~ + rh#ft12_main4a
END

IF ~~ rh#ft12_darkmagic
 SAY @1327 /* Not necessarily dark. I'd happily settle for anything arcane. */
IF ~~ + rh#ft12_main4b
END

IF ~~ rh#ft12_accident
 SAY @1328 /* Ha! And what a sight that would be... no, I shouldn't laugh. I don't think you're quite clumsy enough to have managed it anyway. */
IF ~~ + rh#ft12_main4b
END

IF ~~ rh#ft12_prophecy
 SAY @1329 /* Yes... I suppose we shouldn't forget that. */
IF ~~ + rh#ft12_main4a
END

IF ~~ rh#ft12_bother
 SAY @1330 /* No? I shouldn't be surprised by now. */
IF ~~ + rh#ft12_main4b
END

IF ~~ rh#ft12_main4a
 SAY @1331 /* And even had there been anything else of note in those archives, I'm sure Gorion would have kept you away from it simply on principle. */
	+ ~!CheckStatGT(Player1,12,INT) !CheckStatGT(Player1,12,WIS)~ + @1332 /* What is that supposed to mean? */ + rh#ft12_mean
	++ @1333 /* He would never have been that calculating. */ + rh#ft12_calculate
	++ @1334 /* It isn't as if I was ever interested in anything he had to show me anyway. */ + rh#ft12_mysterious
	++ @1335 /* He did like to be as mysterious as possible. */ + rh#ft12_mysterious
	+ ~OR(2) CheckStatGT(Player1,12,INT) CheckStatGT(Player1,12,WIS)~ + @1336 /* He had good reason. With a heritage like mine, certain knowledge can corrupt. */ + rh#ft12_ignorance
	++ @1337 /* Considering all the things he refused tell me, it's a wonder I'm still alive at all. */ + rh#ft12_wonder
END

IF ~~ rh#ft12_main4b
 SAY @1338 /* Had there been anything of note in those archives, I'm sure Gorion would have kept you away from it simply on principle. */
	+ ~!CheckStatGT(Player1,12,INT) !CheckStatGT(Player1,12,WIS)~ + @1332 /* What is that supposed to mean? */ + rh#ft12_mean
	++ @1333 /* He would never have been that calculating. */ + rh#ft12_calculate
	++ @1334 /* It isn't as if I was ever interested in anything he had to show me anyway. */ + rh#ft12_mysterious
	++ @1335 /* He did like to be as mysterious as possible. */ + rh#ft12_mysterious
	+ ~OR(2) CheckStatGT(Player1,12,INT) CheckStatGT(Player1,12,WIS)~ + @1336 /* He had good reason. With a heritage like mine, certain knowledge can corrupt. */ + rh#ft12_ignorance
	++ @1337 /* Considering all the things he refused tell me, it's a wonder I'm still alive at all. */ + rh#ft12_wonder
END

IF ~~ rh#ft12_mean
 SAY @1339 /* Your blood, <CHARNAME>. Must I really spell it out for you? */
 = @1340 /* And here I'd hoped for a pleasant evening. Well, if we want to survive tomorrow, we should probably get some rest anyway. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#ft12_calculate
 SAY @1341 /* I'm surprised you can even say that with a straight face. */
 = @1340 /* And here I'd hoped for a pleasant evening. Well, if we want to survive tomorrow, we should probably get some rest anyway. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#ft12_mysterious
 SAY @1342 /* I don't find that exceptionally hard to believe. */
  = @1343 /* But enough of this. If we want to survive tomorrow, we should probably get some rest now anyway. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#ft12_ignorance
 SAY @1344 /* And ignorance, in contrast, simply kills. */
 = @1340 /* And here I'd hoped for a pleasant evening. Well, if we want to survive tomorrow, we should probably get some rest anyway. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#ft12_wonder
 SAY @1345 /* I can't deny that. In any case, if we want to survive tomorrow as well, we should probably get some rest. */
IF ~~ DO ~RestParty()~ EXIT
END
END

// 21.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",42)~ THEN RH#ADRJ rh#talk21
@1346 /* A daughter of Bhaal... hmm. Even after this much time, I still can't say I'm entirely comfortable with it, but it does give a person quite a bit to think about, doesn't it? */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @1347 /* *You're* not comfortable with *me*? At least I fight my darker urges. */ + rh#talk21_urges
 	++ @1348 /* What do you have to be uncomfortable with? Don't they worship gods just as dark back home? */ + rh#talk21_bane
 	++ @1349 /* Honestly, love, are you not used to not being the darkest thing around? */ + rh#talk21_darkest
 	++ @1350 /* Dare I even ask what dark thoughts plague you to<DAYNIGHT>? */ + rh#talk21_dareiask
 	++ @1351 /* I'm hardly comfortable with it either, you know. */ + rh#talk21_main1
 	++ @1352 /* Can we about this later? */ + rh#talk_delay

APPEND RH#ADRJ
 
IF ~~ rh#talk21_urges
 SAY @1353 /* Hmm? No, no. That isn't what I meant. I think it should be clear by now that I am very, very comfortable with you, my dear. */
 = @1354 /* Still, I'm glad to hear that you do. Whatever urges the blood of a dead god is giving you, they're unlikely to be conducive to your continued welfare. */
IF ~~ + rh#talk21_main1
END

IF ~~ rh#talk21_bane
 SAY @1355 /* Yes... I spent two years under the heel of the priests of the new Lord of Murder. Frankly, I liked them better when they were still Banites. Back then... well, things were better in general back then. For me, at least. */
IF ~~ + rh#talk21_main1
END

IF ~~ rh#talk21_darkest
 SAY @1356 /* Not at all. I'm far from the cruelest person I've ever known. Darkness and evil and wickedness and so forth and so on... paladin's words, my dear. In any case, you know damn well that you're far from too dark for me. */
IF ~~ + rh#talk21_main1
END

IF ~~ rh#talk21_dareiask
 SAY @1357 /* I wouldn't have commented if the answer were "no," my dear. */
IF ~~ + rh#talk21_main1
END

IF ~~ rh#talk21_main1
 SAY @1358 /* Uncomfortable was probably the wrong word. It's not the fact that you're the daughter of Bhaal that troubles me. I... suppose if anything, it's much too close to home. My own family-- */
 = @1359 /* Hmm. Bhaal's daughter or not, you might not be able to understand. Not with... well, I suppose I shouldn't assume that your Harper was a soft fool, even if I really can't imagine anything else. */
  	++ @1360 /* What does Gorion have to do with anything? */ + rh#talk21_wtfnonsequitur
  	++ @1361 /* Gorion wasn't soft at all. If anything, he was cold. Distant. Unwilling to connect. */ + rh#talk21_executor
  	++ @1362 /* I wouldn't consider Gorion soft. He was kind, yes, but also somewhat stern. He cared deeply for me, up until the very end. That hardly makes him weak. */ + rh#talk21_caring
  	++ @1363 /* He was an idiot and now he's dead. What does it matter? */ + rh#talk21_matter
  	++ @1364 /* You'd better stop insulting him, Adrian. It's getting tiresome. */ + rh#talk21_tiresome
END

IF ~~ rh#talk21_matter
 SAY @1365 /* I was just thinking of my own grandfather. My mother's father, obviously. He was a distant figure when I was a child. */
 = @1366 /* Cold, demanding, terrifying. A priest of Bane. Bhaal's old master, the late and unlamented god of tyranny. */
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2a
END

IF ~~ rh#talk21_wtfnonsequitur
 SAY @1367 /* Not much, I suppose. I was just thinking of my own grandfather. My mother's father, obviously. He was a distant figure when I was a child. */
 = @1366 /* Cold, demanding, terrifying. A priest of Bane. Bhaal's old master, the late and unlamented god of tyranny. */
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2a
END

IF ~~ rh#talk21_executor
 SAY @1368 /* Prepared to play the role of judge and executioner, no doubt. Then I suppose you'll understand more than I had thought. */
 = @1369 /* My grandfather was like that too, you see... cold, demanding, terrifying. A priest of Bane. Bhaal's old master, the late and unlamented god of tyranny. */
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2a
END

IF ~~ rh#talk21_caring
 SAY @1370 /* I...never said it did. If Gorion was at all stern, though, maybe you'll understand. My own grandfather... he was cold, demanding, terrifying. A priest of Bane. Bhaal's old master, the late and unlamented god of tyranny. */
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2a
END

IF ~~ rh#talk21_tiresome
 SAY @1371 /* My apologies. I was just thinking of my own grandfather. My mother's father, obviously. He was a distant figure when I was a child. */
 = @1366 /* Cold, demanding, terrifying. A priest of Bane. Bhaal's old master, the late and unlamented god of tyranny. */
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk21_main2a
END

IF ~~ rh#talk21_main2a
 SAY @1372 /* A strange way for me to put it, I suppose, since I was once his cleric also, but... well, I wasn't talking about myself. */
IF ~~ + rh#talk21_main2
END

IF ~~ rh#talk21_main2 
 SAY @1373 /* Grandfather had clawed his way out of middle class and into the aristocracy several decades earlier, so we had money to burn. The best education available, for what it was worth. The sort of privilege I wouldn't see again, even if it was conditional upon living up to his demands. */
 = @1374 /* I was devout back then, mindlessly so, perhaps, but... the Time of Troubles changed everything. For all of Faerun, yes, but... for myself as well. Once you've seen your gods in the flesh, it's... difficult to simply go back again. */
 	++ @1375 /* I can imagine. */ + rh#talk21_difficult
 	++ @1376 /* Difficult how? */ + rh#talk21_difficult
 	++ @1377 /* Of course it's difficult to go back to worshipping a god who got himself killed. */ + rh#talk21_killed
 	++ @1378 /* I wish I remembered more of the Time of Troubles myself, all things considered. */ + rh#talk21_remember
 	+ ~!Class("rh#Adrian",CLERIC_MAGE)~ + @1379 /* So you just forgot to tell me that you were raised by the priesthood of Bane? */ + rh#talk21_priesthood1
  	+ ~Class("rh#Adrian",CLERIC_MAGE)~ + @1379 /* So you just forgot to tell me that you were raised by the priesthood of Bane? */ + rh#talk21_priesthood2
 	++ @1380 /* I'm really not comfortable with this topic. */ + rh#talk21_topic
END

IF ~~ rh#talk21_difficult
 SAY @1381 /* When your god falls to the earth in your own city... hells, how to explain it? */
IF ~~ + rh#talk21_main3
END

IF ~~ rh#talk21_killed
 SAY @1382 /* That... wasn't how it happened, <CHARNAME>. At least, not for me. When your god falls to the earth in your own city... hells, how to explain it? */
IF ~~ + rh#talk21_main3
END

IF ~~ rh#talk21_remember
 SAY @1383 /* I honestly wish I remembered less. When your god falls to the earth in your own city... hells, how to explain it? */
IF ~~ + rh#talk21_main3
END

IF ~~ rh#talk21_priesthood1
 SAY @1384 /* I... well, it wasn't exactly the priesthood, <CHARNAME>. But those memories... they're not particularly pleasant. */
 = @1385 /* I try not to think about the Church of Bane at all these days. When your god falls to the earth in your own city... hells, how to explain it? */
IF ~~ + rh#talk21_main3
END

IF ~~ rh#talk21_priesthood2
 SAY @1386 /* More than simply raised, <CHARNAME>. But those memories... they're not particularly pleasant. */
 = @1385 /* I try not to think about the Church of Bane at all these days. When your god falls to the earth in your own city... hells, how to explain it? */
IF ~~ + rh#talk21_main3
END
END

CHAIN RH#ADRJ rh#talk21_main3
@1387 /* I... suppose I'd never thought about it before. Tyranny is a fact of life, and you can only hope that your own tyrants will be easier to deal with than the ones next door: the Mulmasterites on the other side of the Moonsea, their Thayvian friends. You survive and thrive or you collapse in defeat: that's the natural order of things, but... */
== RH#ADRJ IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @1388 /* I saw him. Bane. Before he wandered off and got himself killed by Torm. The whole damned city knelt in front of him, and... well. */
== RH#ADRJ IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @1389 /* I'd have expected euphoria, to be so close to such power, in the presence of my own god, but... no. Nothing of the sort. I... I just felt so cold. */
== RH#ADRJ IF ~!Class("rh#Adrian",CLERIC_MAGE)~ THEN @1390 /* I saw him. Bane. Before he wandered off and got himself killed by Torm. The whole damned city knelt in front of him, and... hells, <CHARNAME>, I... I just felt so cold. */
END
 	++ @1391 /* Cold? How so? */ + rh#talk21_cold
 	++ @1392 /* Adrian, if this is going to upset you, you don't need to talk about it. */ + rh#talk21_talkabout
 	++ @1393 /* I honestly feel cold just thinking about it. */ + rh#talk21_thinkabout
 	++ @1394 /* That much power... I would have stood in awe, I think. Or have been green with envy. */ + rh#talk21_greenenvy
 	++ @1395 /* I'm...really not very comfortable with this topic, Adrian. */ + rh#talk21_topic

APPEND RH#ADRJ

IF ~~ rh#talk21_cold
 SAY @1396 /* I... can't really say. Heavens know, it was a while before I understood it at all. As much as I had been taught to revere him and believe in his doctrine, the sudden reality of it... */
IF ~~ + rh#talk21_main4
END

IF ~~ rh#talk21_talkabout
 SAY @1397 /* You hardly need to tell me that, <CHARNAME>. I just... you know, it took a while before I understood it at all. As much as I had been taught to revere him and believe in his doctrine, the sudden reality of it... */
IF ~~ + rh#talk21_main4
END

IF ~~ rh#talk21_thinkabout
 SAY @1398 /* I...do too, truth be told. I don't know how to explain it. Heavens know, it was a while before I understood it at all. As much as I had been taught to revere him and believe in his doctrine, the sudden reality of it... */
IF ~~ + rh#talk21_main4
END

IF ~~ rh#talk21_greenenvy
 SAY @1399 /* There was awe at first, <CHARNAME>. There was always awe, but mixed in with that... I honestly can't say. Heavens know, it was a while before I understood it at all. As much as I had been taught to revere him and believe in his doctrine, the sudden reality of it... */
IF ~~ + rh#talk21_main4
END

IF ~~ rh#talk21_topic
 SAY @1400 /* No? I... guess I should have expected that. Let's... just move on. */
IF ~~ EXIT
END
END

CHAIN RH#ADRJ rh#talk21_main4
@1401 /* It was just too much. This... this was it. I'd somehow never thought about that before, never realized exactly what it meant. */
== RH#ADRJ IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @1402 /* Strange, perhaps, to worship something without truly understanding it, but we don't always know exactly where our spells come from. */
== RH#ADRJ @1403 /* I won't say I never realized what tyranny actually was before -- ha, how could I not? -- but the absolute form of it... */
= @1404 /* This was forever, the rest of eternity, spent on my knees in front of this...thing. The enormity of that... hells, <CHARNAME>, have you ever thought of forever? */
END
 	++ @1405 /* Not in those terms, no. And I'd happily never do so again. */ + rh#talk21_termsno
 	++ @1406 /* Who hasn't? Granted, that's quite the torture scenario you've got going there. */ + rh#talk21_torturescenario
 	++ @1407 /* I'm honestly lucky if I can make myself think about tomorrow. */ + rh#talk21_lucky
 	++ @1408 /* It's hard not to. I've had to spend a great deal of time thinking about my own divine heritage. */ + rh#talk21_heritage
 	++ @1409 /* I've always thought that forever was only a topic of conversation for those not capable of handling today. */ + rh#talk21_today
 	++ @1410 /* Really, Adrian, I'm not comfortable with this topic anymore. */ + rh#talk21_topic

APPEND RH#ADRJ

IF ~~ rh#talk21_termsno
 SAY @1411 /* I don't feel any differently. It was... probably the most profound moment of my life. Profoundly horrific, but still profound. I suppose there are reasons gods aren't supposed to walk the earth. */
IF ~~ + rh#talk21_main5
END

IF ~~ rh#talk21_torturescenario
 SAY @1412 /* Isn't it just? It was... probably the most profound moment of my life. Profoundly horrific, but still profound. I suppose there are reasons gods aren't supposed to walk the earth. */
IF ~~ + rh#talk21_main5
END

IF ~~ rh#talk21_lucky
 SAY @1413 /* (smile) My dear, sometimes I think you have the attention span of a fish. */
 = @1414 /* But I guess it was just... probably the most profound moment of my life. Profoundly horrific, but still profound. I suppose there are reasons gods aren't supposed to walk the earth. */
IF ~~ + rh#talk21_main5
END

IF ~~ rh#talk21_heritage
 SAY @1415 /* I don't blame you for that at all. Myself... it was probably the most profound moment of my life. Profoundly horrific, but still profound. I suppose there are reasons gods aren't supposed to walk the earth. */
IF ~~ + rh#talk21_main5
END

IF ~~ rh#talk21_today
 SAY @1416 /* Funny, my dear. I've always thought the reverse. Myself... it was probably the most profound moment of my life. Profoundly horrific, but still profound. I suppose there are reasons gods aren't supposed to walk the earth. */
IF ~~ + rh#talk21_main5
END

IF ~~ rh#talk21_main5
 SAY @1417 /* I lost faith that day, shockingly enough. My awe just replaced by... revulsion. I avoided my grandfather as well as I could after that, as if he'd be able to just look at me and know. */
 = @1418 /* And Bane's death... it was almost a relief. Heretical but true. */
	++ @1419 /* You're practically shaking! If this is going to upset you this much, you shouldn't talk about it. */ + rh#talk21_comfortable
	++ @1420 /* And being with me makes you remember things like this? */ + rh#talk21_remember2
 	++ @1421 /* That's what I've never understood about the dark faiths. Power, yes. Wealth and prestige, yes, but to willingly surrender yourself for all of eternity? I would never. */ + rh#talk21_no
  	++ @1422 /* I think that's the only sane reaction to actually seeing a dark god in the flesh. */ + rh#talk21_sane
 	++ @1380 /* I'm really not comfortable with this topic. */ + rh#talk21_topic
END

IF ~~ rh#talk21_comfortable
 SAY @1423 /* Am I? I... suppose that's not much of a surprise. Hmm. */
IF ~~ + rh#talk21_main6
END

IF ~~ rh#talk21_remember2
 SAY @1424 /* No, <CHARNAME>. It's honestly not the sort of thing I'd forget in the first place. Hmm. */
IF ~~ + rh#talk21_main6
END

IF ~~ rh#talk21_no
 SAY @1425 /* Well put, my lady. I suppose your own tainted blood taught you what the last ten years have taught me. Hmm. */
IF ~~ + rh#talk21_main6
END

IF ~~ rh#talk21_sane
 SAY @1426 /* I suppose that's one point in favor of my continued grasp on sanity. Hmm. */
IF ~~ + rh#talk21_main6
END

IF ~~ rh#talk21_main6
 SAY @1427 /* Very few people back home would have appreciated that story, but you... well, I guess it's something you at least have the experience to understand. */
 = @1428 /* That's egocentric even for me, isn't it? And I do know it's not quite the same thing. I imagine it would be as hard for you to put into words as it was for me, but... */
 = @1429 /* What is it *like*, the legacy of Bhaal? Is it a source of strength, something that can be drawn upon? Is it a madness that must be held at bay? Or do you even feel it at all? Is it just a matter of parentage like anything else? */
	++ @1430 /* Oh, you know how it is. A yawning abyss of madness, the voice of my psychopathic father, various other colorful metaphors to scare the children away. What about you? Are you planning on running yet? I hope not. */ + rh#talk21_sword
	++ @1431 /* A source of strength, I'd say. Dangerous, possibly, but I've always been able to tame it in the past and I'm not going to run from it now. */ + rh#talk21_adversity
	++ @1432 /* A madness, a quiet bloodlust I can't quite silence, even if I keep myself from acting upon it. There's no strength there. */ + rh#talk21_nostrength
	++ @1433 /* It's really not as much of an issue as people tend to make of it. At least, it hasn't been so far. */ + rh#talk21_noissue
	++ @1434 /* That isn't an acceptable topic of conversation, Adrian. Even with you. */ + rh#talk21_presumption
END

IF ~~ rh#talk21_sword
 SAY @1435 /* No, I'm not. You wield your wit like a sword and shield, <CHARNAME>. But I suppose that still tells me enough. */
 = @1436 /* And I'm glad for it... you deserve better than to be destroyed by the machinations of a dead god. */
IF ~~ EXIT
END 
 
IF ~~ rh#talk21_adversity
 SAY @1437 /* Born to bloodshed and tempered by adversity, is it? Just be careful, <CHARNAME>. Please. You're playing with fire, and you deserve better than to be destroyed by the machinations of a dead god. */
IF ~~ EXIT
END

IF ~~ rh#talk21_nostrength
 SAY @1438 /* I wouldn't be so sure. The walls you've built against it serve you against other problems as well. */
 = @1439 /* Perhaps that's even more noteworthy than if you were drawing strength from the god's power itself. The power you're using is yours alone. Honestly, <CHARNAME>, that only impresses me more. */
IF ~~ EXIT
END

IF ~~ rh#talk21_noissue
 SAY @1440 /* That's lucky, if a bit surprising. Hopefully it continues to hold true. You deserve better than to be destroyed by the machinations of a dead god. */
IF ~~ EXIT
END
 
IF ~~ rh#talk21_presumption
 SAY @1441 /* No, I can understand that. Forgive me the presumption, <CHARNAME>. */
IF ~~ EXIT
END
END

// 22.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",44) Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN RH#ADRJ rh#talk22 
@1442 /* Once this is over, assuming we live through it... hmm. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @1443 /* Hmm? */ + rh#talk22_main1
 	++ @1444 /* Are you suddenly thinking about settling down? */ + rh#talk22_settle
 	++ @1445 /* At this point, I find that highly unlikely. */ + rh#talk22_unlikely
 	++ @1446 /* 'Assuming'? When did you become such a pessimist? */ + rh#talk22_pessimist
 	++ @1447 /* I wish you'd stop breaking off mid-sentence as if you're trying to decide exactly how much you want to share. */ + rh#talk22_share
 	++ @1448 /* Can we talk about this later? */ + rh#talk_delay

CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",44) Global("rh#AdrianFriendshipActive","GLOBAL",1)~ THEN RH#ADRJ rh#ft13 
@1442 /* Once this is over, assuming we live through it... hmm. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1)~
END
 	++ @1443 /* Hmm? */ + rh#talk22_main1 
 	++ @1445 /* At this point, I find that highly unlikely. */ + rh#talk22_unlikely
 	++ @1446 /* 'Assuming'? When did you become such a pessimist? */ + rh#ft13_pessimist
 	++ @1447 /* I wish you'd stop breaking off mid-sentence as if you're trying to decide exactly how much you want to share. */ + rh#ft13_share
 	++ @1449 /* Every time you open your mouth, your chance of living through it decreases substantially. */ + rh#ft13_shutup
 	++ @1448 /* Can we talk about this later? */ + rh#talk_delay

APPEND RH#ADRJ

IF ~~ rh#talk22_settle
 SAY @1450 /* Ah... no. Not exactly. It's a little soon for that. */
IF ~~ + rh#talk22_main1 
END

IF ~~ rh#talk22_unlikely
 SAY @1451 /* Stranger things have happened. */
IF ~~ + rh#talk22_main1 
END

IF ~~ rh#talk22_pessimist
 SAY @1452 /* A pessimist? I'm trying to be realistic. For the first time in my life, perhaps. */
IF ~~ + rh#talk22_main1 
END

IF ~~ rh#talk22_share
 SAY @1453 /* Oh. Don't think anything of it, <CHARNAME>. Old habit, I suppose. */
IF ~~ + rh#talk22_main1 
END

IF ~~ rh#ft13_pessimist
 SAY @1454 /* A pessimist? No, I'm trying to be realistic. */
IF ~~ + rh#talk22_main1 
END

IF ~~ rh#ft13_share
 SAY @1455 /* Old habit, I suppose. */
IF ~~ + rh#talk22_main1 
END

IF ~~ rh#ft13_shutup
 SAY @1456 /* Fine. I won't make that mistake again. */
IF ~~ DO ~SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk22_main1
 SAY @1457 /* I've tried not to think about it that much, but... I'm in exile now, aren't I? I suppose there's nothing much to go back to at this point anyway, but even if there were... */
 = @1458 /* I'm not sure what to make of that. */
 	++ @1459 /* Haven't you spent about half your life away as it is? */ + rh#talk22_away
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @1460 /* Don't worry about it. We can still build a new life elsewhere. */ + rh#talk22_newlife
  	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @1461 /* Don't worry about it. You're young. You still have plenty of time to build a new life elsewhere. */ + rh#ft13_newlife
 	++ @1462 /* I know the feeling. */ + rh#talk22_feeling
 	++ @1463 /* Don't tell me you're missing that frozen tyrannical rock of yours. */ + rh#talk22_tyrannicalrock
 	++ @1464 /* Why do you need to make anything of it at all? */ + rh#talk22_atall
END

IF ~~ rh#talk22_away
 SAY @1465 /* I have, and thank all the gods for that, but... it's strange, finally being completely, irrevocably away. Stranger than I ever thought it would be, though I suppose I never much considered the possibility at all until it became reality. */
IF ~~ + rh#talk22_main2
END

IF ~~ rh#talk22_newlife
 SAY @1466 /* I'd like that, I think, but... it's strange, finally being completely, irrevocably away. Stranger than I ever thought it would be, though I suppose I never much considered the possibility at all until it became reality. */
IF ~~ + rh#talk22_main2
END

IF ~~ rh#ft13_newlife
 SAY @1467 /* Relatively young, but... it's strange, finally being completely, irrevocably away. Stranger than I ever thought it would be, though I suppose I never much considered the possibility at all until it became reality. */
IF ~~ + rh#talk22_main2
END

IF ~~ rh#talk22_feeling
 SAY @1468 /* I suppose you do. For me, it's strange, finally being completely, irrevocably away. Stranger than I ever thought it would be, though I suppose I never much considered the possibility at all until it became reality. */
IF ~~ + rh#talk22_main2
END

IF ~~ rh#talk22_tyrannicalrock
 SAY @1469 /* Missing? I don't know. It's just... strange, finally being completely, irrevocably away. Stranger than I ever thought it would be, though I suppose I never much considered the possibility at all until it became reality. */
IF ~~ + rh#talk22_main2
END

IF ~~ rh#talk22_atall
 SAY @1470 /* I can't help it. I guess it's just... strange, finally being completely, irrevocably away. Stranger than I ever thought it would be, though I suppose I never much considered the possibility at all until it became reality. */
IF ~~ + rh#talk22_main2
END

IF ~~ rh#talk22_main2
 SAY @1471 /* I don't know if it's the same for you, being away from Candlekeep. */
	++ @1472 /* I probably could go back at this point. There's just nothing much to go back to. */ + rh#talk22_nothing
	++ @1473 /* I spent my whole childhood wanting to get away, but when the gates were finally barred to me... no, the feeling isn't pleasant. */ + rh#talk22_barred
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @1474 /* It is. I would give anything to go back to the way things were before. */ + rh#talk22_anything
	+ ~Global("rh#AdrianFriendshipActive","GLOBAL",1)~ + @1474 /* It is. I would give anything to go back to the way things were before. */ + rh#ft13_anything
	++ @1475 /* I've put Candlekeep behind me entirely. I hardly think about it at all. */ + rh#talk22_hardly
	++ @1476 /* At least I don't have to worry about being hunted by the monks of Oghma. */ + rh#talk22_hunted
END

IF ~~ rh#talk22_nothing
 SAY @1477 /* Yes, I understand that as well. */
IF ~~ + rh#talk22_main3
END

IF ~~ rh#talk22_barred
 SAY @1478 /* It doesn't even matter that you don't necessarily want to go back, it's just... the fact that you can't, I suppose. And beyond that... */
IF ~~ + rh#talk22_main3
END

IF ~~ rh#talk22_anything
 SAY @1479 /* Anything, my dear? */
 = @1480 /* No, I'm happier now than I was before, but... */
IF ~~ + rh#talk22_main3
END

IF ~~ rh#ft13_anything
 SAY @1481 /* I'd need to go back more than simply a year or two. */
IF ~~ + rh#talk22_main3
END

IF ~~ rh#talk22_hardly
 SAY @1482 /* I wish I could do the same. Hmm. */
IF ~~ + rh#talk22_main3
END

IF ~~ rh#talk22_hunted
 SAY @1483 /* ... */
 = @1484 /* No, I guess you don't. Hunted by the rest of the world, perhaps, but that's neither here nor there. */
IF ~~ + rh#talk22_main3
END

IF ~~ rh#talk22_main3
 SAY @1485 /* It's funny, isn't it? So many people value freedom above anything else, but me... I'm not even sure that I like it. */
 	++ @1486 /* I think your problem is purpose rather than freedom. You need meaning in your life beyond me and my affairs. */ + rh#talk22_affairs
 	++ @1487 /* That's completely nonsensical. There's nothing more precious. */ + rh#talk22_nonsensical
 	++ @1488 /* So used to oppression that you can't function without it? */ + rh#talk22_nonsensical
 	+ ~Alignment(Player1,MASK_EVIL)~ + @1489 /* Well, if you'd rather go terrorize the Heartlands into submission, I'll put it on our to-do list. */ + rh#talk22_list1
 	+ ~!Alignment(Player1,MASK_EVIL)~ + @1489 /* Well, if you'd rather go terrorize the Heartlands into submission, I'll put it on our to-do list. */ + rh#talk22_list2
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @1490 /* Freedom is hardly something you have to worry about. Not with me ordering you around. */ + rh#talk22_order
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @1490 /* Freedom is hardly something you have to worry about. Not with me ordering you around. */ + rh#ft13_order
END

IF ~~ rh#talk22_affairs
 SAY @1491 /* Heh. Perhaps. I suppose after that nonsense in Baldur's Gate, the Iron Throne wouldn't be interested in our service? */
 = @1492 /* But I jest. I hope. I'm not actually sure that what I want is a new master. */
IF ~~ + rh#talk22_main4
END

IF ~~ rh#talk22_nonsensical
 SAY @1493 /* Perhaps. Still, I'm not actually sure that what I want is a new master. */
IF ~~ + rh#talk22_main4
END

IF ~~ rh#talk22_list1
 SAY @1494 /* Given how many other things are on your to-do list, I suppose it may take a while to reach that one. */
IF ~~ + rh#talk22_main4
END

IF ~~ rh#talk22_list2
 SAY @1495 /* Heh. Don't make promises you don't intend to keep, my <PRO_LADYLORD>. */
IF ~~ + rh#talk22_main4
END

IF ~~ rh#talk22_order
 SAY @1496 /* That's... strangely comforting, truth be told, though it's not quite the same thing. My dear, you can't really afford to come after me if I run. */
IF ~~ + rh#talk22_main4
END

IF ~~ rh#ft13_order
 SAY @1497 /* It's not quite the same thing. My <PRO_LADYLORD>, you can't really afford to come after me if I run. */
IF ~~ + rh#talk22_main4
END

IF ~~ rh#talk22_main4
 SAY @1498 /* There's no point in obsessing over it, though. No direction left to take but forward. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#talk22_main4a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ rh#talk22_main4a
 SAY @1499 /* It's banal and cliche when put into words, but... sometimes I envy your conviction. The world knocks you down again and again, and you simply come back each time, stronger than ever, to the hells with anyone's rules except your own. */
 = @1500 /* <CHARNAME>, do you have any idea how attractive that is? */
 	++ @1501 /* Don't build me up to be something I'm not, Adrian. I have questions too. At least as many as you do. */ + rh#talk22_build
 	++ @1502 /* So I've been told more times than I can count. */ + rh#talk22_told
 	++ @1503 /* You struggle back to your feet or you collapse, and the more often it happens, the easier it gets. */ + rh#talk22_struggle
 	++ @1504 /* Given that I can't get you into my bed, it can't be very attractive at all. */ + rh#talk22_bed
 	++ @1505 /* Don't sell yourself short, Adrian. You're stronger than you think. */ + rh#talk22_stronger
 	++ @1506 /* I don't mind hearing it again, my dear. You're welcome to indulge me. */ + rh#talk22_welcome
END 
 
IF ~~ rh#talk22_build
 SAY @1507 /* Perhaps, but you handle them a grace and dignity that is well beyond your years... no, don't deny it. False modesty really doesn't become you. */
IF ~~ DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2)~ EXIT
END

IF ~~ rh#talk22_told
 SAY @1508 /* Ha! Well, let me add a couple more numbers to that scoresheet of yours, <CHARNAME>, because it really is true. */
IF ~~ DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2)~ EXIT
END

IF ~~ rh#talk22_struggle
 SAY @1509 /* Unless you're pinned onto the ground, at least. Ahh, but I'm tired of being morose about this. */
IF ~~ DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2)~ EXIT
END

IF ~~ rh#talk22_bed
 SAY @1510 /* Is that your angle, my dear? As... enjoyable as it would be to remedy that right here and now, perhaps that's a discussion best saved until tonight. */
IF ~~ DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk22_stronger
 SAY @1511 /* Maybe. I used to think so, but now... well, things make less sense in general. Let's just move on. */
IF ~~ DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2)~ EXIT
END

IF ~~ rh#talk22_welcome
 SAY @1512 /* And I shall. In great detail. Over a few glasses of wine and a fine meal -- assuming we can even find one in this country -- and... mmm. What were we even talking about? */
IF ~~ DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2)~ EXIT
END
END

// 23.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",46)~ THEN RH#ADRJ rh#talk23
@1513 /* It must be easy for you. You wave your hand around and the whole damn world bows down in front of you. */
= @1514 /* Myself included, but hells... I've spent my entire life bowing. Why stop now? */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @1515 /* Oh, not this again. What did I do this time? */ + rh#talk23_thistime
	++ @1516 /* Aren't you a bit too old for temper tantrums? Just calm down. */ + rh#talk23_tantrum
	++ @1517 /* Do you honestly think the world bows down in front of me? Irenicus certainly didn't. I have the scars to prove it, if you'd care to take a look. */ + rh#talk23_scars
	+ ~CheckStatGT(Player1,13,WIS)~ + @1518 /* Do you always have to attack me whenever you're upset about something? */ + rh#talk23_attack
	++ @1519 /* You're certainly right about the whole world bowing in front of me. You never had a problem with that before. */ + rh#talk23_wholeworld
	++ @1520 /* If you can't keep a courteous tongue in your mouth, we're done here. */ + rh#talk23_tongue

APPEND RH#ADRJ

IF ~~ rh#talk23_thistime
 SAY @1521 /* You... nothing. That's not the point. I... I don't even know what the point is. */
IF ~~ + rh#talk23_main1
END

IF ~~ rh#talk23_tantrum
 SAY @1522 /* Temper tantums? Well, isn't that a lovely way to frame it. I... I don't even know anymore. */
IF ~~ + rh#talk23_main1
END

IF ~~ rh#talk23_scars
 SAY @1523 /* You... no, I know that. I... */
IF ~~ + rh#talk23_main1
END

IF ~~ rh#talk23_attack
 SAY @1524 /* Is that what I'm doing? I... maybe it is. */
IF ~~ + rh#talk23_main1
END

IF ~~ rh#talk23_wholeworld
 SAY @1525 /* Oh, am I having problems now? Well, wonderful. I... I don't even know anymore. */
IF ~~ + rh#talk23_main1
END

IF ~~ rh#talk23_tellme
 SAY @1526 /* I... you're right, I don't. */
IF ~~ + rh#talk23_main1
END

IF ~~ rh#talk23_tongue
 SAY @1527 /* Fine. Maybe that's for the best. */
 	++ @1528 /* You don't mean that. Whatever is bothering you, just tell me. */ + rh#talk23_tellme
 	++ @1529 /* Oh, here we go again. Ever with the temper tantrums. */ + rh#talk23_tantrum
 	++ @1530 /* Maybe it is. */ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk23_main1
 SAY @1531 /* Look at me, lashing out. But I suppose that's what I'm best at. It's the way I've handled my problems for the last two years, no use trying something new. */
	++ @1532 /* I doubt it's gotten you anywhere in the past and it's certainly not getting you anywhere now. */ + rh#talk23_anywhere
	++ @1533 /* Only the last two years? I sincerely doubt that. */ + rh#talk23_twoyears
	++ @1534 /* For once, just drop the nonsense and tell me what's bothering you. */ + rh#talk23_nonsense1
	++ @1535 /* Don't bother. I'm not interested anyway. Just get lost. */ + rh#talk23_hellswithyou
END

IF ~~ rh#talk23_anywhere
 SAY @1536 /* *Nothing* has gotten me much of anywhere in the past, <CHARNAME>, I... */
IF ~~ + rh#talk23_main2
END

IF ~~ rh#talk23_twoyears
 SAY @1537 /* Probably... probably not. I... */
IF ~~ + rh#talk23_main2
END

IF ~~ rh#talk23_nonsense1
 SAY @1538 /* The nonsense? What am I without the nonsense? */
IF ~~ + rh#talk23_main2
END

IF ~~ rh#talk23_hellswithyou
 SAY @1539 /* Fine. To the hells with you too, <CHARNAME>. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk23_main2
 SAY @1540 /* I am not being remotely coherent, am I? I just... have you ever woken up and found yourself wondering if everything you ever thought you knew was somehow... backwards? */
 	++ @1541 /* Well, I woke up one morning and found out I was a daughter of Bhaal, if that counts. */ + rh#talk23_bhaal
 	++ @1542 /* I hope you're not suddenly losing it because you've decided you can never truly know if your hand is really your hand. I don't do metaphysics. */ + rh#talk23_philosophy
 	++ @1543 /* I wish you could have started this conversation like that in the first place. */ + rh#talk23_first
 	++ @1544 /* That's nothing to be afraid of. It's better to face these questions than to live your life ignoring them. */  + rh#talk23_questions
  	+ ~!Alignment(Player1,MASK_EVIL)~ + @1545 /* Well, it isn't as if everything you've ever known isn't a crazy mess. */ + rh#talk23_nothelping	
 	+ ~!Alignment(Player1,MASK_GOOD)~ + @1546 /* This isn't the time for self-doubt. Remorse and regret... that isn't what I fell in love with. */ + rh#talk23_remorse
END

IF ~~ rh#talk23_bhaal
 SAY @1547 /* Hmm. With that damn Harper keeping secrets, making you believe you were something you weren't... maybe you could understand. */
IF ~~ + rh#talk23_main3
END

IF ~~ rh#talk23_philosophy
 SAY @1548 /* What? No. I've little enough interest in meaningless questions. They may be entertaining thought exercises, but... no, I'm not in the mood for that sort of nonsense. */
IF ~~ + rh#talk23_main3
END

IF ~~ rh#talk23_first
 SAY @1549 /* I'm... sorry. You're right, but... */
IF ~~ + rh#talk23_main3
END

IF ~~ rh#talk23_questions
 SAY @1550 /* Well, it's a hell of a lot easier ignoring them. */
IF ~~ + rh#talk23_main3
END

IF ~~ rh#talk23_remorse
 SAY @1551 /* No. No, sometimes I don't even know what you fell in love with. */
IF ~~ + rh#talk23_main3
END

IF ~~ rh#talk23_nothelping
 SAY @1552 /* You're really not helping. */
IF ~~ + rh#talk23_main3
END
 
IF ~~ rh#talk23_main3
 SAY @1553 /* Two years, <CHARNAME>. I spent two years telling myself to be strong enough to cope with a situation I didn't like, but...  what a damned joke in the end. */ 
 = @1554 /* Was there any strength there at all? No, I was just too damn frightened to run. I...really can't hide from that anymore. I let myself be treated as badly as the slaves we were moving. */
 = @1555 /* I talked myself into believing I was showing conviction. Commitment. How utterly pathetic. */
 	++ @1556 /* And it didn't bother you at all? Trading slaves? */ + rh#talk23_slaves
 	++ @1557 /* You did what you had to do. That's nothing to get worked up about. They terrorized you into it. */ + rh#talk23_nothing
 	++ @1558 /* You dwell on things like this and it'll destroy you, Adrian. Just move on. */ + rh#talk23_moveon
 	++ @1559 /* You're capable of conviction and commitment, Adrian. You've proven as much. You don't need to let your moments of cowardice destroy you. */ + rh#talk23_conviction
 	++ @1560 /* That is pretty pathetic. I hear nonsense like this and I wonder why I put up with you at all. */ + rh#talk23_pathetic
END
 
IF ~~ rh#talk23_slaves
 SAY @1561 /* It... it did. Not as much as it would you, no doubt, but I've never had a taste for the business. I think that's why they finally assigned me to those slaving caravans. Just another cruel jest. */
IF ~~ + rh#talk23_main4
END
 
IF ~~ rh#talk23_nothing
 SAY @1562 /* They did. Oh, did they ever. And I just let them. For two years, I just let them. It took my whole city getting razed to the ground before I could even bring myself to run. */
IF ~~ + rh#talk23_main4
END
 
IF ~~ rh#talk23_moveon
 SAY @1563 /* How am I even supposed to? */
 = @1564 /* No, I know that's a stupid question. I move on because I have to. If I've learned nothing else over the years, I've learned how to survive. I just... */
IF ~~ + rh#talk23_main4
END
 
IF ~~ rh#talk23_conviction
 SAY @1565 /* Am I? I started chasing this quest of yours because the thought of having no goal at all was terrifying, and... gods, I may have fallen for you somewhere along the line, but... */
IF ~~ + rh#talk23_main4
END
 
IF ~~ rh#talk23_pathetic
 SAY @1566 /* Well, you certainly don't have to. */
	++ @1567 /* This is idiotic. You shouldn't dwell on nonsense like this. Just move on. */ + rh#talk23_moveon
	++ @1568 /* Adrian, you're capable of conviction, and I don't like this defeatist attitude. */ + rh#talk23_conviction
 	++ @1569 /* And I don't intend to. Go cry to someone else from now on. */ + rh#talk23_hellswithyou
END

IF ~~ rh#talk23_main4
 SAY @1570 /* I don't think I even realized it until I finally hit rock bottom. I've spent so much time blaming myself for getting into that mess in the first place, but... hells, I'd been a slave long before the Melvauntians clapped me in chains. */
 = @1571 /* You... you probably don't want to hear this nonsense. */
	++ @1572 /* It's hardly nonsense. Stop trying to pretend that the things that bother you don't matter. */ + rh#talk23_nonsense
	++ @1573 /* You're wrong. I've been hoping you'd finally realize this for quite some time. */ + rh#talk23_realize
	++ @1574 /* I want to help you. It's not like I haven't always known you had some serious issues. */ + rh#talk23_helpyou
	++ @1575 /* It's not exactly pleasant, but you obviously need to talk about it. */ + rh#talk23_pleasant
	++ @1576 /* You're right. I really don't. */ + rh#talk23_goaway
END

IF ~~ rh#talk23_nonsense
 SAY @1577 /* But they're not supposed to bother me. I'm not supposed to care. */
IF ~~ + rh#talk23_main5
END

IF ~~ rh#talk23_realize
 SAY @1578 /* If you thought so little of me, it's a wonder you let me travel with you at all. I'm not supposed to be bothered by things like this... I'm not supposed to care. */
IF ~~ + rh#talk23_main5
END

IF ~~ rh#talk23_helpyou
 SAY @1579 /* I'm not supposed to be bothered by things like this... I'm not supposed to care. Just... just leave me alone for a bit. Please. */
IF ~~ EXIT
END

IF ~~ rh#talk23_pleasant
 SAY @1580 /* Do I? I don't even know what to say. I'm not supposed to need to talk about it. I'm not supposed to care. */
IF ~~ + rh#talk23_main5
END

IF ~~ rh#talk23_goaway
 SAY @1581 /* Then I'll leave you alone. */
IF ~~ EXIT
END

IF ~~ rh#talk23_main5
 SAY @1582 /* I... can't talk about this. Not right now. Just... just leave me alone for a bit. Please. */
IF ~~ EXIT
END
END

// 24.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",48)~ THEN RH#ADRJ rh#talk24
@1583 /* I'm sorry, <CHARNAME>. I shouldn't have dropped something like... well, like that on you the other day. You must think I'm completely insane. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) IncrementGlobal("rh#Adfyfyriad","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @1584 /* Come, now. You know full well I've thought that for quite some time. */ + rh#talk24_insane
 	++ @1585 /* You should have told me you were feeling like that long before yesterday. */ + rh#talk24_yesterday
 	++ @1586 /* Are you feeling better now, at least? */ + rh#talk24_better
 	+ ~OR(6) Class(Player1,MAGE_ALL) Class(Player1,7) Class(Player1,10) Class(Player1,13) Class(Player1,14) Class(Player1,17)~ + @1587 /* The next time you attack me like that, I have a Power Word Silence with your name on it. */ + rh#talk24_silence
 	+ ~!Class(Player1,MAGE_ALL) !Class(Player1,7) !Class(Player1,10) !Class(Player1,13) !Class(Player1,14) !Class(Player1,17)~ + @1588 /* Attack me like that again, and I'll hit you over the head with a blunt object. */ + rh#talk24_sharp
 	++ @1589 /* You can apologize later. We're a bit busy right now. */ + rh#talk_delay

APPEND RH#ADRJ

IF ~~ rh#talk24_insane
 SAY @1590 /* Heh. Still, I don't like... demonstrating it so convincingly. */
IF ~~ + rh#talk24_main1
END

IF ~~ rh#talk24_yesterday
 SAY @1591 /* Maybe. I'm... not sure I even really knew. */
IF ~~ + rh#talk24_main1
END

IF ~~ rh#talk24_better
 SAY @1592 /* Yes, I think so. */
IF ~~ + rh#talk24_main1
END

IF ~~ rh#talk24_silence
 SAY @1593 /* My lady, what a terribly irresponsible use of magic that would be! */
IF ~~ + rh#talk24_main1
END

IF ~~ rh#talk24_sharp
 SAY @1594 /* Better than a sharp one, I suppose. I'll... keep that in mind. */
IF ~~ + rh#talk24_main1
END

IF ~~ rh#talk24_main1
 SAY @1595 /* It's a hard thing to admit to. Two years of my life, wasted. And perhaps... perhaps even more than that. A bit too late for sudden moralizing, but... */
 = @1596 /* Hells, maybe we're all just playing follow the leader, pitiful dogs begging for scraps at the master's table, letting ourselves be played against each other for the amusement of our glorious overlords, to weak to be able to stand on our own. */
 = @1597 /* I've always saved my disdain for the rest of the world, but... perhaps we're just as worthy. */
 	+ ~!Alignment(Player1,MASK_EVIL)~ + @1598 /* I think that goes for your glorious overlords as well. Fear of others, fear of failure, fear of death. They let those fears consume them until nothing remains but ambition. */ + rh#talk24_pitfall
	++ @1599 /* Better to assert your own will, even at the cost of everything, than allow yourself to be trampled into the mud. I can't say I disagree. */ + rh#talk24_mud
	++ @1600 /* Weakness disguised as strength. If there's such a thing as true evil, perhaps that's what it would be. */ + rh#talk24_disguise
	++ @1601 /* And that's enough tormented philosophizing for one <DAYNIGHT>. At least you're not still screaming at me, but I hate to see you so morose. Care for a candlelit dinner and then... well, wherever the night takes us? */ + rh#talk24_dinner
	+ ~Alignment(Player1,MASK_EVIL)~ + @1602 /* You're not going to suddenly start having moral dilemmas whenever I decide to do something slightly entertaining, are you? */ + rh#talk24_dilemmas
END

IF ~~ rh#talk24_pitfall
 SAY @1603 /* All? Possibly. I don't know. A tyrant not motivated by fear, one who's true to his or her own convictions... that would be a person to admire, perhaps, but... */
IF ~~ + rh#talk24_main2
END

IF ~~ rh#talk24_mud
 SAY @1604 /* And the people who have that conviction... well, I suppose they're the ones to truly admire. */
IF ~~ + rh#talk24_main2
END

IF ~~ rh#talk24_disguise
 SAY @1605 /* True evil... that's still such a strange concept, but... perhaps. I suppose that's where we make the mistakes that haunt us. */
IF ~~ + rh#talk24_main2
END

IF ~~ rh#talk24_dinner
 SAY @1606 /* Mmm, is self-indulgent melancholy considered romantic in this part of Faerun? I'm quite sure the night can take us wherever you're willing, my dear, but... hmm. */
IF ~~ + rh#talk24_main2
END

IF ~~ rh#talk24_dilemmas
 SAY @1607 /* A moral dilemma? Is that what this is? As long as you don't do something insane, my dear, I really couldn't care less what horrible, horrible things you do. Beyond that... */
IF ~~ + rh#talk24_main2
END

IF ~~ rh#talk24_main2
 SAY @1608 /* I honestly don't know how you do it, <CHARNAME>. Leader of a party of dysfunctional madmen, committed to an impossible task... I would fall apart at the seams. Obviously. */
 	++ @1609 /* So I've noticed. */ + rh#talk24_noticed
 	+ ~!GlobalLT("AsylumPlot","GLOBAL",40)~ + @1610 /* It's not like I have a choice. I'm not sure what happens if I don't get my soul back, and I'm not interested in finding out. */ + rh#talk24_soul
 	+ ~GlobalLT("AsylumPlot","GLOBAL",40)~ + @1611 /* It's not like I have a choice. If I give up, Imoen pays the price. */ + rh#talk24_imoen
 	++ @1612 /* If I fell apart, I wouldn't be able to put myself back together. I suppose that keeps me going as much as anything else. */ + rh#talk24_apart
 	++ @1613 /* I wish I could just lose control entirely for a bit. Just lie back and let things play out as they will. */ + rh#talk24_lose
 	++ @1614 /* You honestly think I'm still sane? I've been out of control since Gorion was murdered. */ + rh#talk24_sane
 	++ @1615 /* It's a matter of conviction. I know I'm going to win. Falling apart isn't an option. */ + rh#talk24_option
END

IF ~~ rh#talk24_noticed
 SAY @1616 /* That's... rather evasive of you, my dear. */
IF ~~ + rh#talk24_main3
END

IF ~~ rh#talk24_soul
 SAY @1617 /* Neither am I, my dear. Neither am I. Selfish of me to toss my own minor issues at you when the stakes are already so high. */
IF ~~ + rh#talk24_main3
END

IF ~~ rh#talk24_imoen
 SAY @1618 /* The things we do for love, is it? */
IF ~~ + rh#talk24_main3
END

IF ~~ rh#talk24_apart
 SAY @1619 /* I can sympathize with that. I wish it were as much a motivator for me, but... (sigh) */
IF ~~ + rh#talk24_main3
END

IF ~~ rh#talk24_lose
 SAY @1620 /* And I'd like to be able to take up that responsibility for you, if only for a bit. If you ever want me to... well, all you have to do is ask. */
IF ~~ + rh#talk24_main3
END

IF ~~ rh#talk24_sane
 SAY @1621 /* You may be a whirlwind, my dear, but you do get things done. Don't sell yourself short. */
IF ~~ + rh#talk24_main3
END

IF ~~ rh#talk24_option
 SAY @1622 /* To imagine defeat is to accept it, hmm? Maybe that is the key. */
IF ~~ + rh#talk24_main3
END

IF ~~ rh#talk24_main3
 SAY @1623 /* I think the very first thing I ever noticed about you was your strength, <CHARNAME>. Shocking, I know. Not your beauty, not even your mind, but the aura of command about you. */
 = @1624 /* Perhaps it's a result of your divine heritage, perhaps not. Whatever its origin, it's... intoxicating. */
	++ @1625 /* I'd say what the first thing I noticed about you was, but that would be telling. */ + rh#talk24_telling
	++ @1626 /* I'm just as mortal as you are, Adrian. */ + rh#talk24_human
	++ @1627 /* Is that all I am to you? The strongest master available? */ + rh#talk24_master
	++ @1628 /* If you're trying to seduce me, that's really not quite necessary. */ + rh#talk24_seduce
	++ @1629 /* Still attracted to power, then? I'm glad to hear it. */ + rh#talk24_ilikeit
END

IF ~~ rh#talk24_telling
 SAY @1630 /* My sickeningly desperate pleas for help, no doubt. But we're all human, aren't we? Or half-elven, at least. */
IF ~~ + rh#talk24_main4
END

IF ~~ rh#talk24_human
 SAY @1631 /* I never said that you weren't, <CHARNAME>. These masks we wear... */
IF ~~ + rh#talk24_main4
END

IF ~~ rh#talk24_master
 SAY @1632 /* What? No. I'd never have agreed to this if you were just something to cling to. You deserve better than that. We both do. */
 = @1633 /* But these masks we wear. You may be one of the strongest people I know, but I suppose we're all human in the end. Or half-elven, at least. */
IF ~~ + rh#talk24_main4
END

IF ~~ rh#talk24_seduce
 SAY @1634 /* Shall we call a break and finish this conversation with you in my arms, then? I can't say I'd mind that at all. */
 = @1635 /* Ahh, but these masks we wear. You may be one of the strongest people I know, but I suppose  we're all human in the end. Or half-elven, at least. */
IF ~~ + rh#talk24_main4
END

IF ~~ rh#talk24_ilikeit
 SAY @1636 /* Always, my dear. But these masks we wear. You may be one of the strongest people I know, but I suppose  we're all human in the end. Or half-elven, at least. */
IF ~~ + rh#talk24_main4
END

IF ~~ rh#talk24_main4
 SAY @1637 /* I... think I finally understand that now. Or accept it, rather. A little bit late, perhaps, but I suppose that can't be helped. */
 = @1638 /* I... know you've been having trouble sleeping, <CHARNAME>. If you... if you want to talk at some point, I'm willing to listen. */
	++ @1639 /* Thank you. I think I'd like that. */ + rh#talk24_talk
	++ @1640 /* So you finally don't plan on lunging at the first sign of weakness? I never thought I'd see the day. */ + rh#talk24_lunge
	++ @1641 /* You watch me sleep, do you? */ + rh#talk24_shameless
	++ @1642 /* If I start talking now, I don't know if I'll ever be able to stop. */ + rh#talk24_stop
	++ @1643 /* I appreciate the thought, but I'm quite all right. */ + rh#talk24_appreciate
	+ ~!Alignment(Player1,MASK_GOOD)~ + @1644 /* Just because you're suddenly turning into a conflicted sentimental mess doesn't mean that I am. Indulge in weakness if you want. Just don't expect me to follow suit. */ + rh#talk24_suit
END	

IF ~~ rh#talk24_talk
 SAY @1645 /* I'm glad to hear it. We've probably spent more than enough time talking at the moment, but... do keep the offer in mind. */
IF ~~ EXIT
END

IF ~~ rh#talk24_lunge
 SAY @1646 /* A rare occurrence indeed, I know. No, you... the rules are different for you, <CHARNAME>. You should know that by now. Do keep the offer in mind. */
IF ~~ EXIT
END 

IF ~~ rh#talk24_stop
 SAY @1647 /* I... think I've noticed that with myself. I'm not really sure if that's a bad thing. I won't try to force you to tell me anything, but... do keep the offer in mind. */
IF ~~ EXIT
END

IF ~~ rh#talk24_shameless
 SAY @1648 /* Shamelessly. Jests aside, though, keep the offer in mind. */
IF ~~ EXIT
END
	
IF ~~ rh#talk24_appreciate
 SAY @1649 /* Are you? At this point, I can't quite believe it. I won't try to force you to tell me anything, but... do keep the offer in mind. */
IF ~~ EXIT
END
	
IF ~~ rh#talk24_suit
 SAY @1650 /* I see. Fine. If you don't want to take me up on the offer, I'll accept that. I understand your reasons as well as anyone could. But if you think I'm going to sit back and let you insult me, you're very, very wrong. */
 = @1651 /* Are we understood? */
 	++ @1652 /* You haven't lost your spine after all, apparently. Maybe... maybe this isn't such a terrible idea after all. */ + rh#talk24_idea
 	++ @1653 /* Shall we agree to disagree, then? Fine. Just don't bring it up again. */ + rh#talk24_end
 	++ @1654 /* The only thing I understand here is that you've lost your nerve entirely. */ + rh#talk24_nerve
END 

IF ~~ rh#talk24_idea
 SAY @1655 /* You can trust me, <CHARNAME>. I'm not going to betray you. Even if I wanted to, I wouldn't dare. */
 = @1656 /* I won't try to force you to tell me anything, but... do keep the offer in mind. */
IF ~~ EXIT
END

IF ~~ rh#talk24_end
 SAY @1657 /* Fair enough. */
IF ~~ EXIT
END 

IF ~~ rh#talk24_nerve
 SAY @1658 /* I'm... sorry you feel that way. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

// 25.

// mage

IF ~Global("rh#AdrianTalks","GLOBAL",50) !Class(Player1,SORCERER) OR(6) Class(Player1,MAGE_ALL) Class(Player1,7) Class(Player1,10) Class(Player1,13) Class(Player1,14) Class(Player1,17)~ THEN BEGIN rh#talk25mg
 SAY @1659 /* You don't mind me taking another look through your spellbooks, do you? */
 	++ @1660 /* Of course not. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25mg1
 	++ @1661 /* Just don't take notes in them this time. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25mg2
 	++ @1662 /* If you've got improvements to suggest, you know I like to hear them. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25mg3
 	++ @1663 /* Sometimes I think you only love me for my magic. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25mg4
 	++ @1664 /* Hands off. Those are mine. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25mg10
END

IF ~~ rh#talk25mg1
 SAY @1665 /* Wonderful. Thank you. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25mg5
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25mg11
END

IF ~~ rh#talk25mg2
 SAY @1666 /* That was a spelling correction, hardly an essay on arcane theory. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25mg5
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25mg11
END

IF ~~ rh#talk25mg3
 SAY @1667 /* <CHARNAME>, you know full well that you've as decent a grasp as anyone I know. Minus a handful of dark wizards I wish I weren't acquainted with. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25mg5
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25mg11
END

IF ~~ rh#talk25mg4
 SAY @1668 /* Don't be ridiculous, <CHARNAME>. Granted, it is a nice advantage. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25mg5
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25mg11
END

IF ~~ rh#talk25mg10
 SAY @1669 /* You might as well just let me. I'll complain until you do. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25mg5
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25mg11
END

IF ~~ rh#talk25mg5
 SAY @1670 /* You know, I've never understood arcane preparation. I never had the knack for it, as much as my uncle tried to teach me. But you make it look good. */
 	++ @1671 /* Of course I make it look good. */ + rh#talk25mg6
 	++ @1672 /* As long as you stop trying to distract me when I'm studying. */ + rh#talk25mg7
 	++ @1673 /* Honestly, I'd rather have your type of magic. */ + rh#talk25mg8
 	++ @1674 /* Come back here. I can't kiss you when you have your nose in my spellbook. */ + rh#talk25mg9
END

IF ~~ rh#talk25mg11
 SAY @1675 /* It's a precious thing, you know... this sort of rapport. So many tend to guard their spellbooks from the eyes of others. */
 	++ @1676 /* Well, we've shared a great deal more than mere spells. */ + rh#talk25mg12
  	++ @1677 /* I've long since realized that trying to guard it from you is useless. */ + rh#talk25mg12
 	++ @1678 /* Mages are jealous people... don't ever forget that. */ + rh#talk25mg13
	++ @1679 /* I don't blame them. I can't kiss you when you have your nose in my spellbook. */ + rh#talk25mg9
END	
	
IF ~~ rh#talk25mg6
 SAY @1680 /* You make a great many other things look good as well, my dear. */
IF ~~ EXIT
END

IF ~~ rh#talk25mg7
 SAY @1681 /* Try? I do no such thing, my dear. I'm quite sure I've always succeeded. */
IF ~~ EXIT
END

IF ~~ rh#talk25mg8
 SAY @1682 /* Well, I'm not trading, my dear. */
IF ~~ EXIT
END

IF ~~ rh#talk25mg9
 SAY @1683 /* Mmm, a suggestion like that... how could I refuse? */
IF ~~ EXIT
END

IF ~~ rh#talk25mg12
 SAY @1684 /* I suppose that is a valid point. */
IF ~~ EXIT
END

IF ~~ rh#talk25mg13
 SAY @1685 /* Ah... my dear, if my eyes ever roam, you're well within your rights to pluck them out of my head. */
IF ~~ EXIT
END

// sorceress

IF ~Global("rh#AdrianTalks","GLOBAL",50) Class(Player1,SORCERER)~ THEN BEGIN rh#talk25sr
 SAY @1686 /* I can't help but think that Tymora tossed a coin when you were born... and it landed on its edge. So lucky and yet unlucky at the same time. */
 = @1687 /* Daughter of murder, gifted with sorcery. At least it should help you win in the end. */
 	++ @1688 /* And trained by a wizard as well. Most sorcerers aren't so lucky. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25sr1
 	+ ~!Class("rh#Adrian",SORCERER)~ + @1689 /* Jealous, are you? */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25sr2
 	+ ~Class("rh#Adrian",SORCERER)~ + @1690 /* Much of that applies to you as well, you know. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25sr3
  	++ @1691 /* Sometimes I think you only love me for my sorcery. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25sr4
	++ @1692 /* My magic is hardly the only thing I rely upon. (smile) */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25sr5
END

IF ~~ rh#talk25sr1
 SAY @1693 /* No, I suppose that isn't particularly common. For once... well, for once I ought to be grateful for your old Harper. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25sr6
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25sr7
END

IF ~~ rh#talk25sr2
 SAY @1694 /* A little bit, I have to admit. */
IF ~~ + rh#talk25sr7
END

IF ~~ rh#talk25sr3
 SAY @1695 /* I would hardly consider myself a daughter of murder, but no... you do have a point. */
IF ~~ + rh#talk25sr6
END

IF ~~ rh#talk25sr4
 SAY @1668 /* Don't be ridiculous, <CHARNAME>. Granted, it is a nice advantage. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25sr6
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25sr7
END

IF ~~ rh#talk25sr5
 SAY @1696 /* No... you're quite welcome to rely upon mine as well. */
IF ~Class("rh#Adrian",SORCERER)~ + rh#talk25sr6
IF ~!Class("rh#Adrian",SORCERER)~ + rh#talk25sr7
END

IF ~~ rh#talk25sr6
 SAY @1697 /* There's nothing quite like a sorcerer with full mastery and understanding to even the odds, and the time that a wizard would spend studying afterwards... */
 = @1698 /* Well. (smile) I'm sure we could find more interesting ways to spend it. */
	++ @1699 /* ...please tell me I'm not blushing now. */ + rh#talk25sr8
	++ @1700 /* Do at least try to take things seriously, Adrian. */ + rh#talk25sr9
	++ @1701 /* Shameless. I do love that. */ + rh#talk25sr10
	++ @1702 /* Careful. With a comment like that, I may well decide that we're done working for the <DAYNIGHT> here and now. */ + rh#talk25sr11
END

IF ~~ rh#talk25sr7
 SAY @1703 /* Watching you... I've never been that impressed with sorcery before... too much of a traditionalist, perhaps, but you really are magnificent, <CHARNAME>. */
	++ @1704 /* And don't you ever forget it. */ + rh#talk25sr12
	++ @1705 /* And a wizard's study suits you. */ + rh#talk25sr13
	++ @1706 /* We do complement each other well. */ + rh#talk25sr14
	++ @1707 /* You hardly need to seduce me, you know. */ + rh#talk25sr15
END

IF ~~ rh#talk25sr8
 SAY @1708 /* Ha! I assure you, <CHARNAME>, it becomes you. */
IF ~~ EXIT
END

IF ~~ rh#talk25sr9
 SAY @1709 /* I'm the very image of sobriety, my dear. */
IF ~~ EXIT
END

IF ~~ rh#talk25sr10
 SAY @1710 /* Yes... I have noticed that. */
IF ~~ EXIT
END

IF ~~ rh#talk25sr11
 SAY @1711 /* Ahh... don't tease me with such promises, my dear. */
IF ~~ EXIT
END

IF ~~ rh#talk25sr12
 SAY @1712 /* My dear, how could I? */
IF ~~ EXIT
END

IF ~~ rh#talk25sr13
 SAY @1713 /* Well, as long as you don't mind that I spend half the evening with my nose in a book. */
IF ~~ EXIT
END

IF ~~ rh#talk25sr14
 SAY @1714 /* In more ways than one. */
IF ~~ EXIT
END

IF ~~ rh#talk25sr15
 SAY @1715 /* Mmm, no... I would assume not. */
IF ~~ EXIT
END

// cleric

IF ~Global("rh#AdrianTalks","GLOBAL",50) OR(4) Class(Player1,CLERIC_ALL) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_THIEF) Class(Player1,CLERIC_RANGER)~ THEN BEGIN rh#talk25cl
 SAY @1716 /* Sometimes I'm amazed that either of us still believes in anything at all. My faith in the gods has been shaken more than once, and you... */
 = @1717 /* You've suffered at a god's hands far more intimately than I have. */
 	++ @1718 /* It isn't always easy, but neither are most things that are worthwhile. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25cl1 
 	++ @1719 /* Sometimes I think my faith is the only thing that holds me together. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25cl2
 	++ @1720 /* They struggle as much as we do sometimes. That makes me love them more, not less. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25cl3
 	++ @1721 /* Nobody is more aware of the gods' power and importance than I am, at least. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25cl4
 	+ ~OR(2) Alignment(Player1,LAWFUL_GOOD) Alignment(Player1,LAWFUL_NEUTRAL)~ + @1722 /* My suffering only makes me treasure the cause of justice even more. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25cl5
  	+ ~Alignment(Player1,MASK_GOOD) !Alignment(Player1,LAWFUL_GOOD)~ + @1723 /* My suffering only makes me treasure the cause of freedom even more. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25cl5
 	+ ~Alignment(Player1,MASK_EVIL)~ + @1724 /* I believe in power. Bhaal's blood gives it me, as does my own deity's will. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25cl6
END
 
IF ~~ rh#talk25cl1
 SAY @1725 /* Yes, I'm quite sure I've heard this from you before. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl7
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl8
END
 
IF ~~ rh#talk25cl2
 SAY @1726 /* It is a constant to cling to, I suppose. That is... increasingly important. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl7
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl8
END
 
IF ~~ rh#talk25cl3
 SAY @1727 /* You're more generous than I, <CHARNAME>. It only makes me trust them less. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl7
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl8
END
 
IF ~~ rh#talk25cl4
 SAY @1728 /* No... I suppose you have a point. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl7
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl8
END
 
IF ~~ rh#talk25cl5
 SAY @1729 /* Well... at least you're consistent, I suppose. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl7
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl8
END
 
IF ~~ rh#talk25cl6
 SAY @1730 /* Great power with an even greater price... for you, perhaps it's worth it. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl7
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ + rh#talk25cl8
END

IF ~~ rh#talk25cl7
 SAY @1731 /* Still... shameful as it may be to even ask it, do you never waver? */
	++ @1732 /* If we never questioned our faith, what real worth would it have? */ + rh#talk25cl9
	++ @1733 /* Occasionally I wonder if I'm on the right path, but the will of my deity... never. */ + rh#talk25cl10
	++ @1734 /* More than I care to admit, but my deity hasn't abandoned me yet. I suppose that's something. */ + rh#talk25cl11
	++ @1735 /* No, never. My convictions are absolute. */ + rh#talk25cl12
END
 
IF ~~ rh#talk25cl8
 SAY @1736 /* Still... do you never waver? */
 	++ @1732 /* If we never questioned our faith, what real worth would it have? */ + rh#talk25cl13
 	++ @1733 /* Occasionally I wonder if I'm on the right path, but the will of my deity... never. */ + rh#talk25cl10
 	++ @1734 /* More than I care to admit, but my deity hasn't abandoned me yet. I suppose that's something. */ + rh#talk25cl14
 	++ @1735 /* No, never. My convictions are absolute. */ + rh#talk25cl12
END

IF ~~ rh#talk25cl9
 SAY @1737 /* For ourselves or for our gods? Some prefer mindless fanaticism, but... well. Perhaps you have a point. */
IF ~~ EXIT
END

IF ~~ rh#talk25cl10
 SAY @1738 /* When you can take everything the multiverse throws at you without flinching away... I suppose that's how you know your path is right. */
IF ~~ EXIT
END

IF ~~ rh#talk25cl11
 SAY @1739 /* Yes... all too often, I feel like that as well. */
IF ~~ EXIT
END

IF ~~ rh#talk25cl12
 SAY @1740 /* I envy you that, my dear. I really do. */
IF ~~ EXIT
END

IF ~~ rh#talk25cl13
 SAY @1741 /* Trust without question isn't trust at all, is it? Maybe you have a point. */
IF ~~ EXIT
END

IF ~~ rh#talk25cl14
 SAY @1742 /* Pray everyday and your spells still come? If only it were that easy for all of us. */
IF ~~ EXIT
END

// bard

IF ~Global("rh#AdrianTalks","GLOBAL",50) Class(Player1,BARD_ALL)~ THEN BEGIN rh#talk25bd
 SAY @1743 /* I know you may be a musician, <CHARNAME>, but do you really need to wander around Amn with an orchestra in your bag? */
 	++ @1744 /* Why exactly are you going through my bags? */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25bd1
 	++ @1745 /* Hey, careful! You'll break that! */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25bd2
 	++ @1746 /* It's a harp, two flutes, a guitar, and a tambourine. That's hardly an orchestra. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25bd3
 	++ @1747 /* Coming from a man who travels with a private library, that's pretty rich. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25bd4
END

IF ~~ rh#talk25bd1
 SAY @1748 /* I might have tossed something into it last night without thinking. */
IF ~~ + rh#talk25bd5
END

IF ~~ rh#talk25bd2
 SAY @1749 /* I will not. I'm perfectly capable of handling an instrument. It's only the harps that tend to spontaneously go up in flames. */
IF ~~ + rh#talk25bd5
END
 
IF ~~ rh#talk25bd3
 SAY @1750 /* True. At least we don't need to travel with a coterie of slaves to carry your pump organ like they do in Thay. */
 = @1751 /* Though that's a rather amusing image if you're ever interested. */
IF ~~ + rh#talk25bd5
END
 
IF ~~ rh#talk25bd4
 SAY @1752 /* I'd say that those at least have utility, but I think you might kill me. */
IF ~~ + rh#talk25bd5
END
 
IF ~~ rh#talk25bd5
 SAY @1753 /* You do know I love your music, though, don't you? */
 	++ @1754 /* Of course I do. */ + rh#talk25bd6
 	++ @1755 /* It's nice to hear you say it. */ + rh#talk25bd6
 	++ @1756 /* And you, my dear, have a beautiful voice. I wish you'd sing for me someday. */ + rh#talk25bd7
 	++ @1757 /* And as much as I enjoy the sound of your voice, I wish you'd come over here and use your lips for something else. */ + rh#talk25bd8
END

IF ~~ rh#talk25bd6
 SAY @1758 /* Mm, good. */
IF ~~ EXIT
END
  
IF ~~ rh#talk25bd7
 SAY @1759 /* Heh. Maybe. */
IF ~~ EXIT
END
  
IF ~~ rh#talk25bd8
 SAY @1760 /* As my lady commands. */
IF ~~ EXIT
END

// paladin

IF ~Global("rh#AdrianTalks","GLOBAL",50) Class(Player1,PALADIN_ALL)~ THEN BEGIN rh#talk25pl
 SAY @1761 /* I'm honestly somewhat surprised that your precious order hasn't thrown you out for this yet, <CHARNAME>. */
 	++ @1762 /* You sound almost unhappy about that. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25pl1
 	++ @1763 /* My order actually respects its members, as difficult as that may be for you to understand. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25pl2
 	++ @1764 /* For falling in love? That's hardly a crime, Adrian. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25pl3
 	++ @1765 /* Honestly, so am I. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25pl4
END

IF ~~ rh#talk25pl1
 SAY @1766 /* Unhappy? No, not exactly. */
IF ~~ + rh#talk25pl5
END

IF ~~ rh#talk25pl2
 SAY @1767 /* Point taken. */
IF ~~ + rh#talk25pl5
END

IF ~~ rh#talk25pl3
 SAY @1768 /* Yes, but your choice of lover? */
IF ~~ + rh#talk25pl5
END

IF ~~ rh#talk25pl4
 SAY @1769 /* And yet you would risk it anyway? */
IF ~~ + rh#talk25pl5
END

IF ~~ rh#talk25pl5
 SAY @1770 /* I suppose sometimes I can't help but wonder if this isn't part of some diabolical paladin plot. It isn't as if the reverse has never happened. */
 	++ @1771 /* I would be more worried about my paladinhood were I truly trying to manipulate you like that. */ + rh#talk25pl6
 	++ @1772 /* I don't doubt it has. At least I don't need to worry about that. */ + rh#talk25pl7
 	++ @1773 /* I'm quite sure my order barely knows you exist. */ + rh#talk25pl8
 	++ @1774 /* Adrian, I've been convinced for quite some time now that you're only evil by association. If even that. My order would trust my judgement in such things. */ + rh#talk25pl9
 	++ @1775 /* Paladins don't *make* diabolical plans. That's part of the definition of paladinhood. */ + rh#talk25pl10
END

IF ~~ rh#talk25pl6
 SAY @1776 /* That's...actually probably true. */
 = @1777 /* Well, if it doesn't bother you, I suppose I might as well let it drop. */
IF ~~ EXIT
END

IF ~~ rh#talk25pl7
 SAY @1778 /* Indeed, because all I need in my life right now is a blackguard of Cyric. */
IF ~~ EXIT
END

IF ~~ rh#talk25pl8
 SAY @1779 /* Nothing would make me happier than that. */
 = @1780 /* ...well. I suppose that's not quite true. */
IF ~~ EXIT
END

IF ~~ rh#talk25pl9
 SAY @1781 /* ...that's still quite some association to overlook, my lady. */
 = @1777 /* Well, if it doesn't bother you, I suppose I might as well let it drop. */
IF ~~ EXIT
END

IF ~~ rh#talk25pl10
 SAY @1782 /* Heh. Forgive the quaint phrasing then, my lady. */
IF ~~ EXIT
END
 
// thief

IF ~Global("rh#AdrianTalks","GLOBAL",50) OR(2) Class(Player1,THIEF_ALL) Class(Player1,FIGHTER_THIEF)~ THEN BEGIN rh#talk25tf
 SAY @1783 /* I'm beginning to think that I have a type. */
 	++ @1784 /* Secretive, shadowy, beautiful? */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25tf1
 	++ @1785 /* If you've got a torrid love affair with one of my sister Bhaalspawn to share, you really should have told me earlier. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25tf2
 	+ ~!Alignment(Player1,MASK_EVIL)~ + @1786 /* I may be a rogue, but I'm not an assassin. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25tf3
 	++ @1787 /* What are you talking about? */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25tf4
END

IF ~~ rh#talk25tf1
 SAY @1788 /* And quick, talented, and dangerous to know. */
IF ~~ + rh#talk25tf5
END

IF ~~ rh#talk25tf2
 SAY @1789 /* Ha. No, my dear. But you're a creature of the shadows, born and bred. */
IF ~~ + rh#talk25tf5
END
 
IF ~~ rh#talk25tf3
 SAY @481 /* True enough. */
IF ~~ + rh#talk25tf5
END
 
IF ~~ rh#talk25tf4
 SAY @1790 /* Just thinking aloud, my dear. */
IF ~~ + rh#talk25tf5
END
 
IF ~~ rh#talk25tf5
 SAY @1791 /* Still, there's nothing quite like the skillful hands of a thief... */
 	++ @1792 /* Are you asking for a massage? */ + rh#talk25tf6
 	++ @1793 /* Care for a demonstration? */ + rh#talk25tf6
 	++ @1794 /* I don't know. A wizard's skillful tongue... */ + rh#talk25tf7
 	+ ~Class("rh#Adrian",MAGE_THIEF)~ + @1795 /* As you demonstrate quite often yourself. */ + rh#talk25tf8
 	++ @1796 /* Skillful hands, is it? I could always hit you, you know. */ + rh#talk25tf9
END

IF ~~ rh#talk25tf6
 SAY @1797 /* Oh... definitely, yes. */
IF ~~ EXIT
END

IF ~~ rh#talk25tf7
 SAY @1798 /* Mmm, we might as well find out... */
IF ~~ EXIT
END

IF ~~ rh#talk25tf8
 SAY @1799 /* Is that a request, <CHARNAME>? */
IF ~~ EXIT
END

IF ~~ rh#talk25tf9
 SAY @1800 /* ...fine, I suppose I walked into that one. */
IF ~~ EXIT
END

// ranger

IF ~Global("rh#AdrianTalks","GLOBAL",50) Class(Player1,RANGER_ALL)~ THEN BEGIN rh#talk25rg
 SAY @1801 /* If someone had told me a year ago that I would be falling for a ranger... */
 	++ @1802 /* You would have murdered him? */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25rg1
 	++ @1803 /* At least I'm not an elf. Then where would you be? */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25rg2
 	++ @1804 /* Is that humor in your voice? Perhaps there's hope for you yet. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25rg3
END

IF ~~ rh#talk25rg1
 SAY @1805 /* ...a year ago? No. I'd probably have just upended a mug of mead over his head and assigned him double guard shifts. */
IF ~~ + rh#talk25rg4
END

IF ~~ rh#talk25rg2
 SAY @1806 /* Even more bemused than I already am. */
IF ~~ + rh#talk25rg4
END

IF ~~ rh#talk25rg3
 SAY @1807 /* Laugh or cry, <CHARNAME>. */
IF ~~ + rh#talk25rg4
END

IF ~~ rh#talk25rg4
 SAY @1808 /* I could do with a bit less rescuing of the weak and pathetic, but wandering around in the woodlands, almost alone but for you... I like it more than I thought I would. */
 	++ @1809 /* My love, you should try to decide whether you're aiming for condescending or romantic before you open your mouth. */ + rh#talk25rg5
 	++ @1810 /* I'm glad to hear it. That was very nearly romantic of you. */ + rh#talk25rg6
 	++ @1811 /* Enough rescuing and one day maybe you'll like even that part too. */ + rh#talk25rg7
 	++ @1812 /* I enjoy the sound of your voice almost as much as you do, Adrian, but I wish you'd come over here and use your lips for something else. */ + rh#talk25rg8
END

IF ~~ rh#talk25rg5
 SAY @1813 /* Ha! Mercy, my lady... I can't help myself. */
IF ~~ EXIT
END

IF ~~ rh#talk25rg6
 SAY @1814 /* Mmm, I suppose I'll blame the elven blood. */
IF ~~ EXIT
END

IF ~~ rh#talk25rg7
 SAY @1815 /* Don't hang your hopes on it, <CHARNAME>. I don't want to disappoint you. */
IF ~~ EXIT
END

IF ~~ rh#talk25rg8
 SAY @1816 /* Mmm, as my lady commands. */
IF ~~ EXIT
END

// druid

IF ~Global("rh#AdrianTalks","GLOBAL",50) OR(2) Class(Player1,DRUID_ALL) Class(Player1,FIGHTER_DRUID)~ THEN BEGIN rh#talk25dr
 SAY @1817 /* <CHARNAME>, I think you're out of bat guano again. */
 	++ @1818 /* Just because I'm a druid doesn't mean you can raid my bags for spell components whenever you want to. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25dr1
 	++ @1819 /* I never had any. I stopped stocking it the last time you stole it all. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~  + rh#talk25dr1
 	++ @1820 /* Really? I'll have to get some more, I suppose. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25dr2
END

IF ~~ rh#talk25dr1
 SAY @1821 /* Boundaries, boundaries. Fine, I'll keep my hands to myself. */
IF ~~ + rh#talk25dr3
END
 
IF ~~ rh#talk25dr2
 SAY @1822 /* Wonderful. */
IF ~~ + rh#talk25dr3
END
 
IF ~~ rh#talk25dr3
 SAY @1823 /* I've never been much of a woodsman, but you do know I like this, right? Wandering around in the forests, almost alone but for you... */
	++ @1824 /* I don't think your approval has anything to do with the forest. */ + rh#talk25dr4
	++ @1810 /* I'm glad to hear it. That was very nearly romantic of you. */ + rh#talk25dr5
	++ @1812 /* I enjoy the sound of your voice almost as much as you do, Adrian, but I wish you'd come over here and use your lips for something else. */ + rh#talk25rg8
END

IF ~~ rh#talk25dr4
 SAY @1825 /* ...I never said it did, my dear. */
IF ~~ EXIT
END
 
IF ~~ rh#talk25dr5
 SAY @1814 /* Mmm, I suppose I'll blame the elven blood. */
IF ~~ EXIT
END 

// fighter

IF ~Global("rh#AdrianTalks","GLOBAL",50) Class(Player1,FIGHTER_ALL)~ THEN BEGIN rh#talk25ft
 SAY @1826 /* I should thank you for saving my life in that last battle, <CHARNAME>. */
 	++ @1827 /* You sound a bit bemused. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25ft1
 	++ @1828 /* You were well out of danger, you know. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25ft2
 	+ ~Class("rh#Adrian",SORCERER)~ + @1829 /* As if I'm going to let some ruffian cut my sorcerer to pieces. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25ft3
 	+ ~!Class("rh#Adrian",SORCERER)~ + @1830 /* As if I'm going to let some ruffian cut my wizard to pieces. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25ft3
 	++ @973 /* You're very welcome. */ DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~ + rh#talk25ft4
END

IF ~~ rh#talk25ft1
 SAY @1831 /* A bit, I suppose. I'm used to relying upon armed warriors, but I've never before really felt like thanking one for doing his or her job. */
IF ~~ + rh#talk25ft4
END

IF ~~ rh#talk25ft2
 SAY @1832 /* In the middle of battle, there's no such thing. */
IF ~~ + rh#talk25ft4
END

IF ~~ rh#talk25ft3
 SAY @1833 /* Spin it however you'd like, my dear. */
IF ~~ + rh#talk25ft4
END

IF ~~ rh#talk25ft4
 SAY @1834 /* A warrior lady... it's a bit strange, even now. I suppose the only fighters I'm used to these days are Zhentilar scum, but still... */
 	++ @1835 /* I take too much pride in my skill to waste it on a common military. */ + rh#talk25ft5
 	++ @1836 /* Not all military men and women are rampaging psychopaths, you know. */ + rh#talk25ft6
 	++ @1837 /* Please, no magical elitism to<DAYNIGHT>, Adrian. */ + rh#talk25ft7
 	+ ~Class("rh#Adrian",SORCERER)~ + @1838 /* And does my skill awe the great sorcerer? */ + rh#talk25ft8
  	+ ~!Class("rh#Adrian",SORCERER)~ + @1839 /* And does my skill awe the mighty wizard? */ + rh#talk25ft8
END

IF ~~ rh#talk25ft5
 SAY @1840 /* As you should. */
IF ~~ + rh#talk25ft9
END

IF ~~ rh#talk25ft6
 SAY @1841 /* All the ones I've ever met are. Or close enough. On both sides. */
IF ~~ + rh#talk25ft9
END

IF ~~ rh#talk25ft7
 SAY @1842 /* Ha, I'd be afraid you might kill me. */
IF ~~ + rh#talk25ft9
END

IF ~~ rh#talk25ft8
 SAY @1843 /* ...more than I'd care to admit. */
IF ~~ + rh#talk25ft9
END

IF ~~ rh#talk25ft9
 SAY @1844 /* Just... be careful, <CHARNAME>. Please. */
IF ~~ EXIT
END
END

// 26.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",52)~ THEN RH#ADRJ rh#talk26
@1845 /* Murder me in my sleep if I ever start waxing poetic, but some <DAYNIGHT>s I suppose I can't help but come close. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
 	++ @1846 /* Ah... do I finally get my love poetry now? I knew it would only be a matter of time. */ + rh#talk26_poetry
 	++ @1847 /* Would you prefer poison or a knife? Or shall I just smother you, my dear? */ + rh#talk26_smother
 	++ @1848 /* Do you have any moods at all besides black and quixotic? At the same time, no less! */ + rh#talk26_moods
 	++ @1849 /* What's on your mind? */ + rh#talk26_mind
	++ @1850 /* I'm sure this can wait. */ + rh#talk_delay

APPEND RH#ADRJ

IF ~~ rh#talk26_poetry
 SAY @1851 /* If I tried to write you poetry, I'm sure you would flee in horror. Best not to inflict that madness upon either of us. */
IF ~~ + rh#talk26_main1
END

IF ~~ rh#talk26_smother
 SAY @1852 /* Hmm, I suppose I wouldn't have room to complain, whichever you chose. I've more than enough experience with the first two, but smothering sounds new and exciting. */
IF ~~ + rh#talk26_main1
END

IF ~~ rh#talk26_moods
 SAY @1853 /* I certainly hope so. Hmm. */
IF ~~ + rh#talk26_main1
END

IF ~~ rh#talk26_mind
 SAY @1854 /* Besides senseless romanticism? */
IF ~~ + rh#talk26_main1
END

IF ~~ rh#talk26_main1
 SAY @1855 /* No, I don't really intend to sing your praises or anything of the sort, but... ha. Were I another man, I'd play the role of the chivalrous prince, no doubt. I'd lay flowers at your feet and shower you with a kingdom's worth of jewelry. */
 = @1856 /* Now, wouldn't that be a sight. */
 	++ @1857 /* Prince charming wouldn't suit you, my dear. Best stick with the roles you know. */ + rh#talk26_roles
 	++ @1858 /* Did you really bring flowers? This I have to see. */ + rh#talk26_flowers
 	++ @1859 /* I think I'd enjoy you in the role of the chivalrous prince for once. */ + rh#talk26_chivalry
 	++ @1860 /* Quite the sight. If you didn't want to live to see the dawn. */ + rh#talk26_dawn
 	++ @1861 /* Drop the act, Adrian. What are you trying to say? */ + rh#talk26_act
END

IF ~~ rh#talk26_roles
 SAY @1862 /* That shouldn't be particularly hard. */
IF ~~ + rh#talk26_main3
END

IF ~~ rh#talk26_flowers
 SAY @1863 /* Heh. No, I didn't. What would we do with them anyway? Drop them on the side of the road and watch them rot? */
IF ~~ + rh#talk26_main3
END

IF ~~ rh#talk26_chivalry
 SAY @1864 /* You'd get bored by it even more quickly than I would, I suspect. */
IF ~~ + rh#talk26_main3
END

IF ~~ rh#talk26_dawn
 SAY @1865 /* Ha! I suppose we might as well skip the flowers, then. What would we do with them anyway? Drop them on the side of the road and watch them rot? */
IF ~~ + rh#talk26_main3
END

IF ~~ rh#talk26_act
 SAY @1866 /* Ahh... you really do have no patience at all sometimes, <CHARNAME>. */
IF ~~ + rh#talk26_main3
END

IF ~~ rh#talk26_main3
 SAY @1867 /* But no... no flowers, and as for gems... well, they took everything when I was captured. Everything of significant monetary value, everything even lightly enchanted. */
 = @1868 /* My grandmother Anzhela -- my grandfather's third wife and the only one he didn't murder -- she had several chests full of heirloom jewelry... beautiful. A bit on the gaudy side sometimes, but there were several pieces there that would have looked magnificent on you. */
 = @1869 /* I don't doubt they're decorating a white dragon's lair now, but... (sigh) */
 	++ @1870 /* I don't need your family's lost wealth, Adrian. You're more than enough. */ + rh#talk26_enough
 	++ @1871 /* You went digging through your grandmother's jewelry, did you? */ + rh#talk26_jewelry
 	++ @1872 /* I'd have loved to have seen them. */ + rh#talk26_haveseen
 	++ @1873 /* There's more than enough jewelry in Amn, you know. */ + rh#talk26_amn
END

IF ~~ rh#talk26_enough
 SAY @1874 /* I'm glad to hear it, but I'd have liked to have something more substantial to give you. As it is, all I have is *this*. */
IF ~~ + rh#talk26_main4
END

IF ~~ rh#talk26_jewelry
 SAY @1875 /* My dear, apparently some of us never do recover from the childhood desire to dig through every treasure chest in sight. */
 = @1876 /* Still, it's a pity. I'd have liked to have something more substantial to give you. As it is, all I have is *this*. */
IF ~~ + rh#talk26_main4
END

IF ~~ rh#talk26_haveseen
 SAY @1877 /* You would have loved them, <CHARNAME>. I'd have given you a chest full of them if I could, but as it is, all I have left is *this*. */
IF ~~ + rh#talk26_main4
END

IF ~~ rh#talk26_amn
 SAY @1878 /* Still, I'd have liked to have something more substantial to give you. As it is, all I have is *this*. */
IF ~~ + rh#talk26_main4
END

IF ~~ rh#talk26_main4
 SAY @1879 /* My grandfather's old signet ring. He gave it to me when I proved myself to him. It's not enchanted in any way, oddly enough... the slavers would have taken it from me if it had been, their own misgivings aside. I can't say grandfather was that creative at designing the thing. Banites. */
 = @1880 /* It's not the most beautiful thing in the Realms, and there's no explaining away its resemblence to a certain holy symbol, but maybe that's fitting for a daughter of Bhaal. */
 = @1881 /* In any case, it's the only heirloom I still have, so I'd like you to have it. */
 	++ @1882 /* Not beautiful? Your grandmother's jewelry must have been exquisite, because this is gorgeous work, if a bit large. */ + rh#talk26_beautiful
 	++ @1883 /* The thing really does just scream "power," doesn't it? I love it, Adrian. Thank you. */ + rh#talk26_beautiful
 	++ @1884 /* It could have "Death to Bhaalspawn" engraved on the inside, and I'd still love it if it were from you. */ + rh#talk26_beautiful
 	++ @1885 /* I... um, that's very sweet, but I really can't accept something like... this. */ + rh#talk26_lolbanites
 	++ @1886 /* I can't. As much as I appreciate the gesture, if it's the only thing you have left, I can't take it from you. */ + rh#talk26_gesture
END

IF ~~ rh#talk26_lolbanites
 SAY @1887 /* I'm not asking you to wear it openly. Just to accept it. */
 	++ @1888 /* If it means this much to you... very well. Thank you. */ + rh#talk26_beautiful
 	++ @1889 /* I'm sorry, I can't. */ + rh#talk26_noring
END

IF ~~ rh#talk26_gesture
 SAY @1890 /* <CHARNAME>, I *want* you to have it. Please. */
 	++ @1888 /* If it means this much to you... very well. Thank you. */ + rh#talk26_beautiful
 	++ @1889 /* I'm sorry, I can't. */ + rh#talk26_noring
END

IF ~~ rh#talk26_noring
 SAY @1891 /* I... see. Well, perhaps I'll be able to find something more appropriate from the next jewelry merchant we come across. */
IF ~~ EXIT
END

IF ~~ rh#talk26_beautiful
 SAY @1892 /* We can put it on a chain around your neck, perhaps. Probably out of sight so that it doesn't get you in any trouble with the unenlightened masses. */
IF ~~ DO ~GiveItemCreate("rh#adrng",Player1,1,0,0)~ EXIT
END
END

// 27. (evening)
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",54)~ THEN RH#ADRJ rh#talk27
@1893 /* <CHARNAME>? Ahh... it's your watch, I see. Better you than one of the others. If you'd like to get some rest, I'll take over. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1) RealSetGlobalTimer("rh#AdrianTalksTimer","GLOBAL",2700)~
END
	++ @1894 /* What's wrong? You look terrible! */ + rh#talk27_confidence
	++ @1895 /* And have you pass out when your own watch comes up? Get some sleep. */ + rh#talk27_sleep
	++ @1896 /* That sounds good. Thank you. */ + rh#talk27_thankyou

APPEND RH#ADRJ

IF ~~ rh#talk27_sleep
 SAY @1897 /* That's not happening, I don't think. Any rest to<DAYNIGHT> is a lost cause. */
IF ~~ + rh#talk27_main1
END

IF ~~ rh#talk27_confidence
 SAY @1898 /* Thank you for the vote of confidence. No, I'm fine. */
IF ~~ + rh#talk27_main1
END

IF ~~ rh#talk27_thankyou
 SAY @1899 /* Good night. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_main1
 SAY @1900 /* Just... nightmares. Nothing like yours, but I guess they were kind of inevitable. Don't... tell the others. Please. */
 	++ @1901 /* You're having nightmares also? Do you want to talk about it? */ + rh#talk27_notparticularly
 	++ @1902 /* I wasn't planning to do so. You should know by now that what you say to me stays with me. */ + rh#talk27_stay
 	++ @1903 /* They're not your enemies, Adrian. */ + rh#talk27_enemy
 	++ @1904 /* Inevitable? How so? */ + rh#talk27_inevitable
 	++ @1905 /* I have enough to worry about with my own nightmares. I can't deal with yours also. */ + rh#talk27_burden
END
 
IF ~~ rh#talk27_notparticularly
 SAY @1906 /* Not particularly. I... those were the longest months of my life, <CHARNAME>. The ones before I met you. I've never been... I don't think, I-- */
IF ~~ + rh#talk27_main2
END
 
IF ~~ rh#talk27_stay
 SAY @1907 /* No, I do know that. But... those were the longest months of my life, <CHARNAME>. The ones before I met you. I've never been... I don't think, I-- */
IF ~~ + rh#talk27_main2
END
 
IF ~~ rh#talk27_enemy
 SAY @1908 /* No? Perhaps not at the moment, but I've no desire to flaunt my weaknesses for them. */
IF ~~ + rh#talk27_inevitable
END
 
IF ~~ rh#talk27_inevitable
 SAY @1909 /* I... those were the longest months of my life, <CHARNAME>. The ones before I met you. I've never been... I don't think, I-- */
IF ~~ + rh#talk27_main2
END

IF ~~ rh#talk27_main2
 SAY @1910 /* Nine Hells. Listen to this. I'm not even coherent to<DAYNIGHT>. I... can't say I've never spent time in enemy hands before, but... not like that. */
	++ @1911 /* No, decent people tend not to torture their prisoners. You've been imprisoned before? */ + rh#talk27_cormyr
	++ @1912 /* Don't upset yourself over a nightmare. Whatever happened, it's over now. */ + rh#talk27_nightmare
	++ @1913 /* Given the ghoulish company you used to keep, I'm surprised it bothers you so much. */ + rh#talk27_ghoulish
	++ @1914 /* You've seen me dealing with nightmares for how long now? Why didn't you ever mention anything!? */ + rh#talk27_sostupid
END
 
IF ~~ rh#talk27_cormyr
 SAY @1915 /* Once, in Suzail. Cormyr. War had broken out when I was traveling abroad with my uncle, and... needless to say, things didn't go very well for us. But compared to the last few months... */
IF ~~ + rh#talk27_main3 
END

IF ~~ rh#talk27_nightmare
 SAY @1916 /* I know it is. I'm fine, <CHARNAME>. Really, I am. I just... */
IF ~~ + rh#talk27_main3 
END

IF ~~ rh#talk27_ghoulish
 SAY @1917 /* Of course. I suppose that makes everything acceptable. */ 
IF ~~ + rh#talk27_main3 
END

IF ~~ rh#talk27_sostupid
 SAY @1918 /* I... suppose it never occurred to me to do so. I'm okay, <CHARNAME>. I really am. I just... */
IF ~~ + rh#talk27_main3 
END

IF ~~ rh#talk27_main3
 SAY @1919 /* It's funny, you know. People draw the lines so starkly... black and white. Three months trapped in a cage in a slaving caravan. It got easier later, but at the beginning, when people still knew where I was from... */
 = @1920 /* It wasn't the slavers who scared me. They didn't give a damn about me so long as I didn't cause problems, but the other prisoners... they weren't quite so apathetic. */
 = @1921 /* Zhent. Zhentarim skymage, no less, and it isn't as if I hadn't roasted my own fair share of caravans. With the dead pegasus right there... well, they were angry. So very angry. */
	++ @1922 /* People are just people, and when pushed to their limits, sometimes they snap. */ + rh#talk27_snap
	++ @1923 /* Pull yourself together. My dreams are far worse than this and I don't fall apart over them. */ + rh#talk27_burden
	++ @1924 /* Pegasus? Wouldn't a pegasus hate someone like you? */ + rh#talk27_pegasus
	++ @1925 /* The idiots probably didn't even recognize that they were acting just like their enemies. */ + rh#talk27_idiots
	++ @1926 /* Considering what your old friends are like, you can't really blame them for that. */ + rh#talk27_oldfriends
END
 
IF ~~ rh#talk27_snap
 SAY @1927 /* Maybe. I still find myself praying that they met even worse fates than I did, but... I suppose that's a fair way to look at it. */
IF ~~ + rh#talk27_main4
END

IF ~~ rh#talk27_burden
 SAY @1928 /* I'm glad to hear I'm such a burden for you. But if you'd rather stand watch in silence, I'd be happy to oblige. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_pegasus
 SAY @1929 /* Displays of power, <CHARNAME>. Some of us got a thrill from enslaving monsters. Me... I enjoyed the irony. I treated her fairly well, for what it's worth. */
IF ~~ + rh#talk27_main4
END

IF ~~ rh#talk27_idiots
 SAY @1930 /* Maybe. In the end, perhaps the only thing that separates us is self-knowledge. I don't know. */
IF ~~ + rh#talk27_main4
END

IF ~~ rh#talk27_oldfriends
 SAY @1931 /* Lovely, <CHARNAME>, how some people are allowed to torture and others aren't. No doubt you think I deserved it. */
	++ @1932 /* I'm sorry. I didn't mean it like that. */ + rh#talk27_meanit
	++ @1933 /* It doesn't really matter if you deserved it or not. It happened. */ + rh#talk27_deserve
	++ @1934 /* You lost the right to complain about it a long time ago. */ + rh#talk27_complain
	++ @1935 /* I guess this isn't the best time for attempted levity. */ + rh#talk27_levity
END

IF ~~ rh#talk27_meanit
 SAY @1936 /* Then you're one of the few people who wouldn't have. */
IF ~~ + rh#talk27_main4
END

IF ~~ rh#talk27_deserve
 SAY @1937 /* How very concise. */
IF ~~ + rh#talk27_main4
END

IF ~~ rh#talk27_complain
 SAY @1938 /* It's a wonder you can bear to look at me at all. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) RestParty()~ EXIT
END

IF ~~ rh#talk27_levity
 SAY @492 /* No, it really isn't. */
IF ~~ + rh#talk27_main4
END
 
IF ~~ rh#talk27_main4
 SAY @1939 /* But I think we've wasted enough time talking. I'd hate to find out that something sneaked up upon us while I was sitting here whining at you. */
IF ~Global("rh#AdrSex","GLOBAL",1)~ + rh#talk27_main4a
IF ~!Global("rh#AdrSex","GLOBAL",1)~ + rh#talk27_main4b
END

IF ~~ rh#talk27_main4a
 SAY @1940 /* Still, I'd rather not try to sleep again until you can join me. */
	++ @1941 /* You're welcome to stand watch with me for the moment. */ + rh#talk27_watch
	++ @1942 /* Once I join you, I won't be letting you sleep again for quite some time. */ + rh#talk27_sometime
	+ ~!Name("rh#Adrian",Player2)~ + @1943 /* In that case, perhaps I should get <PLAYER2> to stand watch right now. */ + rh#talk27_wakeup
	+ ~NumInPartyGT(2) Name("rh#Adrian",Player2)~ + @1944 /* In that case, perhaps I should get <PLAYER3> to stand watch right now. */ + rh#talk27_wakeup
	++ @1945 /* I'm afraid that won't be happening to<DAYNIGHT>. */ + rh#talk27_tonight
END

IF ~~ rh#talk27_main4b
 SAY @1946 /* Still, once your watch is over... this isn't exactly how I'd expected to broach the topic, but perhaps I was a fool for not doing so earlier. */ 
 = @1947 /* Would you spend the night with me? */
	++ @1948 /* I'd like that. */ + rh#talk27_like
	++ @1949 /* You're really not very attractive like this. */ + rh#talk27_attract
	++ @1950 /* Not now. I don't want to serve merely as a distraction. */ + rh#talk27_distraction
	++ @1951 /* Yes. It certainly took you long enough! */ + rh#talk27_longer
END

IF ~~ rh#talk27_watch
 SAY @1213 /* I think I'd like that. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_sometime
 SAY @1952 /* Mmm, I do like the sound of that. */ 
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_wakeup
 SAY @1953 /* I doubt that will go over all too well, but... by all means, my dear. */ 
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_tonight
 SAY @1954 /* No? Then... I'd hate to disgust you further. I'll see you tomorrow. */ 
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_like
 SAY @1955 /* (smile) And I'd almost rather we forget about to<DAYNIGHT>'s watch and enjoy this now. */ 
IF ~~ DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) RestParty()~ EXIT
END

IF ~~ rh#talk27_attract
 SAY @1956 /* No, I don't suppose I am. I suppose I'll simply see you tomorrow, then. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_distraction
 SAY @1957 /* I can assure you, you wouldn't, but if you'd rather wait... fine. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#talk27_longer
 SAY @1958 /* The next fifteen or so minutes are going to feel longer still... I'd almost rather we forget about to<DAYNIGHT>'s watch and enjoy this now. */ 
IF ~~ DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) RestParty()~ EXIT
END
END

// 28.
CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",56) !Global("chapter","GLOBAL",%bg2_chapter_4%) !Global("chapter","GLOBAL",%bg2_chapter_5%) !Global("chapter","GLOBAL",%bg2_chapter_7%)~ THEN RH#ADRJ rh#talk28
@1959 /* They call Athkatla the City of Coin... and we've certainly managed to accumulate a fair share of that coin ourselves. */
= @1960 /* It's a pity we haven't had a chance to put some of it to more personal use. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1)~
END
	++ @1961 /* What did you have in mind? */ + rh#talk28_decadence
	++ @1962 /* And here I thought we were doing nothing but putting it to personal use. */ + rh#talk28_use
	++ @1963 /* I should think it obvious that we need every piece of gold we can find. */ + rh#talk28_need
	+ ~!Global("PlayerLooksLikeDrow","GLOBAL",1)~ + @1964 /* Should I be expecting a night of dark decadence someday soon? */ + rh#talk28_decadence
	+ ~Global("PlayerLooksLikeDrow","GLOBAL",1)~ + @1964 /* Should I be expecting a night of dark decadence someday soon? */ + rh#talk28_ustnatha
	++ @1965 /* We need to focus on the task at hand, Adrian. */ + rh#talk28_task

CHAIN IF ~Global("rh#AdrianTalks","GLOBAL",56)~ THEN RH#ADRJ rh#talk28b
@1966 /* They call Athkatla the City of Coin... and we certainly managed to accumulate a fair share of that coin ourselves. */
= @1967 /* It's a pity we didn't have the chance to put some of it to more personal use. */
DO ~IncrementGlobal("rh#AdrianTalks","GLOBAL",1)~
END
	++ @1961 /* What did you have in mind? */ + rh#talk28_decadence
	++ @1962 /* And here I thought we were doing nothing but putting it to personal use. */ + rh#talk28_use
	++ @1968 /* I should think it obvious that we needed every piece of gold we could find. */ + rh#talk28_need
	+ ~!Global("PlayerLooksLikeDrow","GLOBAL",1)~ + @1964 /* Should I be expecting a night of dark decadence someday soon? */ + rh#talk28_decadence
	+ ~Global("PlayerLooksLikeDrow","GLOBAL",1)~ + @1964 /* Should I be expecting a night of dark decadence someday soon? */ + rh#talk28_ustnatha
	++ @1965 /* We need to focus on the task at hand, Adrian. */ + rh#talk28_task
	
APPEND RH#ADRJ

IF ~~ rh#talk28_decadence
 SAY @1969 /* Well, I'm not quite sure where to find the priestesses of Loviatar here, and in my... rather comprehensive experience, no festivity is quite complete without them-- */
IF ~Alignment(Player1,MASK_EVIL)~ + rh#talk28_decadence1
IF ~!Alignment(Player1,MASK_EVIL)~ + rh#talk28_decadence2
END

IF ~~ rh#talk28_decadence1
 SAY @1970 /* Don't look at me like that, <CHARNAME>. You know full well that they'd pale in comparison to you... as much as they might like to believe otherwise. */
IF ~~ + rh#talk28_main1
END

IF ~~ rh#talk28_decadence2
 SAY @1971 /* Don't look at me like that, <CHARNAME>. I didn't think you'd care for that brand of... entertainment, but you should know better than to ask. */
IF ~~ + rh#talk28_main1
END

IF ~~ rh#talk28_ustnatha
 SAY @1972 /* In Ust Natha? I should certainly hope so. Pity the worship of Loviatar hasn't spread quite so far. In my... rather comprehensive experience, no festivity is quite complete without her worshippers-- */
IF ~Alignment(Player1,MASK_EVIL)~ + rh#talk28_decadence1
IF ~!Alignment(Player1,MASK_EVIL)~ + rh#talk28_decadence2
END

IF ~~ rh#talk28_use
 SAY @1973 /* Perhaps I should have said "frivolous" instead of "personal," then. */
IF ~~ + rh#talk28_main1
END

IF ~~ rh#talk28_need
 SAY @1974 /* But we've found so very, very much of it that a bit spent extravagantly would hardly be noticed at all. */
IF ~~ + rh#talk28_main1
END

IF ~~ rh#talk28_task
 SAY @1975 /* As you wish. */
IF ~~ EXIT
END

IF ~~ rh#talk28_main1
 SAY @1976 /* Regardless, the whole train of thought is moot. Given the state of affairs, we don't have nearly enough time to wallow in mindless decadence, but if we did... */
 = @1977 /* How would you like to spend it? */
 	++ @1978 /* I'd prefer to spend more time in the country myself, maybe get to watch a sunrise without worrying about the next day. */ + rh#talk28_country
 	++ @1979 /* I think I'd enjoy some of your suggestions. */ + rh#talk28_main2
 	+ ~Global("rh#AdrSex","GLOBAL",1)~ + @1980 /* Frankly, I wouldn't mind simply spending it in bed. */ + rh#talk28_bed
 	++ @1981 /* Strange as it may sound to you, I prefer to keep myself busy with matters of importance. */ + rh#talk28_matters
 	++ @1982 /* As long as you're nearby, I couldn't care less. */ + rh#talk28_careless
 	++ @1983 /* Traveling, albeit without the constant attempts on my life. */ + rh#talk28_travel
END

IF ~~ rh#talk28_country
 SAY @1984 /* The sun dawns over the city as well, my dear. */
IF ~~ + rh#talk28_main2
END

IF ~~ rh#talk28_bed
 SAY @1985 /* (smile) I'm sure we can get a bit more creative than that, my dear. */
IF ~~ + rh#talk28_main2
END

IF ~~ rh#talk28_matters
 SAY @1986 /* Have you never heard of mixing business and pleasure, my dear? True, I would probably advise against it, but it does have its advantages. */
IF ~~ + rh#talk28_main2
END

IF ~~ rh#talk28_careless
 SAY @1987 /* (smile) As nice as that is to hear, I'm sure we can get a bit more creative. */
IF ~~ + rh#talk28_main2
END

IF ~~ rh#talk28_travel
 SAY @1988 /* (smile) New places and new sights, is it? */
IF ~~ + rh#talk28_main2
END
END

CHAIN RH#ADRJ rh#talk28_main2
@1989 /* You know, back when I still lived in Sembia, I might have taken a lover to watch the sun rise over the Sea of Fallen Stars once or twice. A bit quixotic, perhaps, but it... ah, tended to get results. */
== RH#ADRJ IF ~!Global("Chapter","GLOBAL",%bg2_chapter_4%) !Global("Chapter","GLOBAL",%bg2_chapter_5%) !Global("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @1990 /* When we get the chance, perhaps we should climb down to the docks to watch it set over the ocean. That's a sight I've never really seen. */
== RH#ADRJ IF ~OR(3) Global("Chapter","GLOBAL",%bg2_chapter_4%) Global("Chapter","GLOBAL",%bg2_chapter_5%) Global("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @1991 /* If we ever get back to Athkatla, perhaps we should climb down to the docks to watch it set over the ocean. That's a sight I've never really seen. */
END
	++ @1707 /* You hardly need to seduce me, you know. */ + rh#talk28_seduce
	++ @1992 /* "A bit quixotic?" Darling, you're drowning in romanticism right now. */ + rh#talk28_quixotic
	++ @1993 /* Given the disposition of the docks, it may well be the last sight we ever see. */ + rh#talk28_docks
	++ @1994 /* I used to watch the sun set over the ocean in Candlekeep. Those days are long gone, but a night's reminiscence would be welcome. */ + rh#talk28_main3
 	++ @1995 /* Eventually, perhaps, but for now we need to stay focused. */ + rh#talk28_focus

APPEND RH#ADRJ

IF ~~ rh#talk28_seduce
 SAY @1996 /* It isn't that, <CHARNAME>... well, not exactly. */
IF ~~ + rh#talk28_main3
END

IF ~~ rh#talk28_quixotic
 SAY @1997 /* I really don't mean to, <CHARNAME>. */
IF ~~ + rh#talk28_main3
END

IF ~~ rh#talk28_docks
 SAY @1998 /* Any thief foolish enough to touch you would be lucky to just lose the hand. */
IF ~~ + rh#talk28_main3
END

IF ~~ rh#talk28_focus
 SAY @1999 /* You're right, I know. */
IF ~~ + rh#talk28_main3
END
 
IF ~~ rh#talk28_main3
 SAY @2000 /* This is a strange time to get wistful, I know, but I suppose... well, I've always thought that love was for fools and madmen. And I've certainly been both in the past, but-- */
 = @2001 /* Hells. Since I've become incoherent, perhaps I should just ask you what love means to you. */
	++ @2002 /* It means getting to know somebody more completely than you know yourself, and perhaps getting to know yourself a bit better in the process. */ + rh#talk28_knowledge
	++ @2003 /* It's the small things that matter. A shared look, a shared touch, the ring of laughter, a night curled up by a fire. */ + rh#talk28_remember
	++ @2004 /* It's best left unspoken. Analyze it too much and it'll just turn to mist in the end. */ + rh#talk28_analyze
 	++ @2005 /* It means giving of yourself entirely, unsurpassed trust in another person. It may be terrifying, but it's worth it all the same. */ + rh#talk28_trust
 	++ @2006 /* Love? Apparently it means sentimental digressions and frivolous questions. */ + rh#talk28_frivolity
 	++ @2007 /* I think I'd be as incoherent about it as you seem to be. */ + rh#talk28_incoherent
END

IF ~~ rh#talk28_knowledge
 SAY @2008 /* No greater gift than self-knowledge, is it? I would never have valued that before, but... I don't know. */
IF ~~ + rh#talk28_main4
END 

IF ~~ rh#talk28_remember
 SAY @2009 /* The little things that you remember once everything else has faded? As much as I don't care for the transience of that... I don't know. */
IF ~~ + rh#talk28_main4
END 

IF ~~ rh#talk28_analyze
 SAY @2010 /* Perhaps that's why so many of the great sages end their lives alone. Too much time spent thinking and not enough spent living... I don't know. */
IF ~~ + rh#talk28_main4
END 

IF ~~ rh#talk28_trust
 SAY @2011 /* It's terrifying even when you don't stop to think about it, but... I don't know. */
IF ~~ + rh#talk28_main4
END 

IF ~~ rh#talk28_frivolity
 SAY @2012 /* Ha! Excuse the frivolity, then. */
IF ~~ + rh#talk28_main4
END

IF ~~ rh#talk28_incoherent
 SAY @2013 /* Well, I certainly can't hold that against you. */
IF ~~ + rh#talk28_main4
END 
 
IF ~~ rh#talk28_main4
 SAY @2014 /* I should thank you. For your persistance. I could laugh at myself for being so nervous at first, for almost throwing this away before it even began. I would have regretted that, I think. */
 	++ @2015 /* You should thank me for my patience also. */ + rh#talk28_patience
 	++ @2016 /* Taking the chance was brave of you. More so than I think you realize. */ + rh#talk28_chance
 	++ @2017 /* As if I was going to let you get away. */ + rh#talk28_getaway
 	++ @2018 /* Don't worry. You'll get a chance to thank me with interest soon enough. */ + rh#talk28_thank
 	++ @2019 /* I have to say that I'm actually getting tired of this. I liked you better when you were a closed book. */ + rh#talk28_closedbook
END

IF ~~ rh#talk28_patience
 SAY @2020 /* Mercy, my lady! I certainly won't deny that. */
IF ~~ + rh#talk28_main5
END

IF ~~ rh#talk28_chance
 SAY @2021 /* I've... never actually considered that before. It still seems a bit ridiculous, but... less so than I would have expected. */
IF ~~ + rh#talk28_main5
END

IF ~~ rh#talk28_getaway
 SAY @2022 /* Heh. No, I suppose you didn't give me much of a chance to run. */
IF ~~ + rh#talk28_main5
END

IF ~~ rh#talk28_thank
 SAY @2023 /* Mmm. That sounds... rather interesting. */
IF ~~ + rh#talk28_main5
END

IF ~~ rh#talk28_closedbook
 SAY @2024 /* Oh. I... see. You really do know how to destroy a nice moment, don't you? */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#talk28_main5
 SAY @2025 /* Ah, listen to me. So much to be done, and here I am indulging in shameless sentimentality. This is becoming something of a habit. */
  	++ @2026 /* It isn't shameless. You don't need to pretend you're a heartless bastard, you know. */ + rh#talk28_shameless
 	+ ~Global("rh#AdrSex","GLOBAL",1)~ + @2027 /* We should indulge more often. I think I'd like that. */ + rh#talk28_indulge1
 	+ ~!Global("rh#AdrSex","GLOBAL",1)~ + @2027 /* We should indulge more often. I think I'd like that. */ + rh#talk28_indulge2
 	++ @2028 /* It must be all of that elven blood you hate so much. */ + rh#talk28_elven
 	++ @2029 /* I don't mind these romantic digressions at all. */ + rh#talk28_romantic
 	++ @2030 /* A habit I would very much like to break you of. */ + rh#talk28_complain
END
 
IF ~~ rh#talk28_shameless
 SAY @2031 /* Heartless? I hardly pretend that at all. Still, it is more than a bit indulgent. */
IF ~~ + rh#talk28_main6
END 

IF ~~ rh#talk28_indulge1
 SAY @2032 /* Mmm, and here I thought we did. Quite often. */
IF ~~ + rh#talk28_main6
END 

IF ~~ rh#talk28_indulge2
 SAY @2033 /* Mmm, I think I would as well. */
IF ~~ + rh#talk28_main6
END 

IF ~~ rh#talk28_elven
 SAY @2034 /* At least that gives me something to blame it on. */ 
IF ~~ + rh#talk28_main6
END 

IF ~~ rh#talk28_romantic
 SAY @2035 /* No? At least I'm not boring you. */
IF ~~ + rh#talk28_main6
END 

IF ~~ rh#talk28_complain
 SAY @2036 /* In that case, the songs and poetry can wait for another day. And I can only pray -- to any god who'll listen -- that there be many, many more of those. */
IF ~~ EXIT
END

IF ~~ rh#talk28_main6
 SAY @2037 /* But come, <CHARNAME>. The songs and poetry... that can wait for another day. And I can only pray -- to any god who'll listen -- that there be many, many more of those. */
IF ~~ EXIT
END
END

// PLOT RELATED DIALOGUE

// Plot Talks

// Slavers

CHAIN IF ~Global("rh#AdrianTalkSlavers","GLOBAL",2)~ THEN RH#ADRJ rh#slavers
@2038 /* Would that Irenicus fell as easily as those slavers back in the Coronet... and the same for my initial captors as well. */
= @2039 /* No matter. I'll take whatever vengeance I can get. */
DO ~SetGlobal("rh#AdrianTalkSlavers","GLOBAL",3)~
END
 	+ ~!Global("rh#AdrianZhent","GLOBAL",1)~ + @2040 /* Your initial captors? */ + rh#slavers_captors
 	+ ~Global("rh#AdrianZhent","GLOBAL",1)~ + @2041 /* Well, going north and hunting down Melvauntians would be a bit out of our ways. */ + rh#slavers_melvaunt
 	++ @2042 /* We saved people. Is revenge really all you care about? */ + rh#slavers_revenge
 	++ @2043 /* Don't worry. We'll get even with Irenicus too. */ + rh#slavers_irenicus
 	++ @2044 /* As long as I don't have to listen to any more of Hendak's awkward begging, I'm happy. */ + rh#slavers_begging
 	++ @2045 /* That's nice, I suppose. We don't really have time to talk about this. */ + rh#slavers_notalk

APPEND RH#ADRJ

IF ~~ rh#slavers_captors
 SAY @2046 /* Unpleasant people. Granted, everyone back home is fairly unpleasant. */
IF ~~ + rh#slavers1
END

IF ~~ rh#slavers_melvaunt
 SAY @2047 /* Indeed. It's not really a priority anyway. I'd rather not end up needing another rescue myself, and if I head home... that's rather likely. Still... */
IF ~~ + rh#slavers1
END

IF ~~ rh#slavers_revenge
 SAY @2048 /* It should be obvious by now that I care about magic and money also, my <PRO_LADYLORD>. But... I don't know. You might be right. */
IF ~~ + rh#slavers1
END

IF ~~ rh#slavers_irenicus
 SAY @2049 /* I don't doubt it for a moment. */
IF ~~ + rh#slavers1
END

IF ~~ rh#slavers_begging
 SAY @2050 /* That was rather embarrassing, wasn't it? A proud northerner reduced to... gods, I suppose I know a bit about that myself these days. */
IF ~~ + rh#slavers1
END

IF ~~ rh#slavers_notalk
 SAY @2051 /* No? Too busy listening to the rustle of the wind? Fine, I'll leave you alone. */
IF ~~ EXIT
END

IF ~~ rh#slavers1
 SAY @2052 /* I've never actually... hunted slavers before. A useless task if ever there was one, but... heh, once you've been on the other side, I suppose. */
 = @2053 /* Forget it. Let's just move on. */ 
IF ~~ EXIT
END
END

// Lavok (friendship/romance only)

CHAIN IF ~Global("rh#AdrianTalkLavok","GLOBAL",2)~ THEN RH#ADRJ rh#Lavok
@2054 /* Hells, if not for all the loot we dragged out of that sphere, I'd have almost wished we had never gone after that damned necromancer at all. */
DO ~SetGlobal("rh#AdrianTalkLavok","GLOBAL",3)~
END
 	++ @2055 /* He was a danger to the Realms that needed to be stopped. */ + rh#Lavok_danger
 	+ ~InParty("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ + @2056 /* And abandon Valygar to his fate? */ + rh#Lavok_Valygar
 	++ @2057 /* Well, he's dead now, so there's no use worrying about him at all. */ + rh#Lavok_worry
 	++ @2058 /* He got what was coming to him. */ + rh#Lavok_coming
 	++ @2059 /* Hey, it's not every day you get to slay an ancient necromancer. */ + rh#Lavok_glory

APPEND RH#ADRJ

IF ~~ rh#Lavok_danger
 SAY @2060 /* Yes, yes. I'm sure there are plenty of dangers to the Realms that need to be stopped. As far as I'm concerned, let the paladins take care of that. */
IF ~~ + rh#Lavok1
END

IF ~~ rh#Lavok_Valygar
 SAY @2061 /* Why not? I'm quite sure he's looking forward to abandoning me to mine. */
IF ~~ + rh#Lavok1
END

IF ~~ rh#Lavok_worry
 SAY @2062 /* I'm not *worried* about him, per se. */
IF ~~ + rh#Lavok1
END

IF ~~ rh#Lavok_coming
 SAY @2063 /* I... suppose so. */
IF ~~ + rh#Lavok1
END

IF ~~ rh#Lavok_glory
 SAY @2064 /* If you start going after demilichs next, excuse me if I watch from the side. */
IF ~~ + rh#Lavok1
END

IF ~~ rh#Lavok1
 SAY @2065 /* Don't get me wrong, I enjoy puzzling things out, but the sort of questions I find myself asking in the wake of Lavok's demise... I don't particularly care for them. */
 	++ @2066 /* Then ignore them. You're thinking too much. */ + rh#Lavok_thinking
 	++ @2067 /* What types of questions? */ + rh#Lavok2
 	++ @2068 /* Another round of "was he good or was he evil," is it? */ + rh#Lavok_redemption
 	++ @2069 /* I suppose you don't need to be an ancient necromancer to realize your life is a mess. */ + rh#Lavok_delightful
 	++ @2070 /* I don't care for philosophy, so forgive me if I don't want to hear it. */ + rh#Lavok_philosophers
END

IF ~~ rh#Lavok_thinking
 SAY @2071 /* Maybe. */
IF ~~ + rh#Lavok2
END

IF ~~ rh#Lavok_redemption
 SAY @2072 /* What? No, nothing so ridiculous. */
IF ~~ + rh#Lavok2
END

IF ~~ rh#Lavok_delightful
 SAY @2073 /* You really are delightful, aren't you? */
IF ~~ + rh#Lavok2
END

IF ~~ rh#Lavok_philosophers
 SAY @2074 /* Very well. Some <DAYNIGHT>s, <CHARNAME>, you are exquisitely poor company. */
IF ~~ EXIT
END

IF ~~ rh#Lavok2
 SAY @2075 /* I can't help but consider his fall. He had all of the power and wealth his magic could grant him, and he reached out just a bit further... */
 = @2076 /* Was he broken by the end? I couldn't say. He fought that entity to the last, protecting this plane from its ravages. That takes strength. Enormous strength, but his regret? */
 = @2077 /* I can't decide if that was authentic or the result of years of self-pity. */
	+ ~Class(Player1,PALADIN_ALL)~ + @2078 /* It was self-pity and nothing more. There's no real chance for remorse in one who has blackened his soul to that extent. */ + rh#Lavok_black1
	+ ~!Class(Player1,PALADIN_ALL)~ + @2078 /* It was self-pity and nothing more. There's no real chance for remorse in one who has blackened his soul to that extent. */ + rh#Lavok_black2
	++ @2079 /* Does it really matter in the end? There was a spark of goodness in him buried deeply, even if a taste of suffering was required for it to finally flourish. */ + rh#Lavok_spark
	++ @2080 /* Strength? Maybe, but it was weakness that shone through in the end. Whatever core of fortitude was once there had long since been eaten away. */ + rh#Lavok_strength
	++ @2081 /* I think only Lavok could answer those concerns, and he's not quite available for questioning. */ + rh#Lavok_concerns
	++ @2082 /* It hardly makes a difference in the end. He's still dead. */ + rh#Lavok_dead
END

IF ~~ rh#Lavok_black1
 SAY @2083 /* I suppose I should have expected that from a paladin. Come down from your pedestal, my <PRO_LADYLORD>, and you might find that not everything is as black and white as that. */
IF ~~ + rh#Lavok3
END

IF ~~ rh#Lavok_black2
 SAY @2084 /* Spoken like a paladin, my <PRO_LADYLORD>, but live a little and you might find that not everything is as black and white as that. */
IF ~~ + rh#Lavok3
END

IF ~~ rh#Lavok_spark
 SAY @2085 /* Hmm. Is it strange that I can't decide whether the church of Ilmater or Loviatar would agree more with that assessment? Perhaps they're closer than either would care to admit. */
IF ~~ + rh#Lavok3
END

IF ~~ rh#Lavok_strength
 SAY @2086 /* I don't think so, <CHARNAME>. Had we forgone the quest, I dare say he would have continued to fight that entity for another century, if need be. */
IF ~~ + rh#Lavok3
END

IF ~~ rh#Lavok_concerns
 SAY @2087 /* I think Lavok is the last person who could answer them. */
IF ~~ + rh#Lavok3
END

IF ~~ rh#Lavok_dead
 SAY @2088 /* True enough. Still... */
IF ~~ + rh#Lavok3
END

IF ~~ rh#Lavok3
 SAY @2089 /* We build our houses of cards, and when they come crumbling down... I don't know. */
IF ~~ EXIT
END
END

// Slaying Firkraag

CHAIN IF ~Global("rh#AdrianFirkraagTalk","GLOBAL",2)~ THEN RH#ADRJ rh#Firkraag
@2090 /* Not so frightening now, you overgrown pink lizard. */
= @2091 /* I think this calls for some wine and red dragon meat, assuming it didn't set the former afire. I haven't eaten dragon in months. */
DO ~SetGlobal("rh#AdrianFirkraagTalk","GLOBAL",3)~
END
 	++ @2092 /* Well, we won't need to worry about finding fire to cook it. Half the cavern is ablaze. */ + rh#Firkraag_ablaze
 	++ @2093 /* That's vile. You don't eat your talking, thinking enemies. */ + rh#Firkraag_ethics
 	++ @2094 /* Is dragon even edible? */ + rh#Firkraag_edible
 	++ @2095 /* Nice of you to be brave now. You looked about ready to run and hide before. */ + rh#Firkraag_hide 	
 	++ @2096 /* Would you stop circling the damn dragon and start removing those scales? */ + rh#Firkraag_scales

CHAIN RH#ADRJ rh#Firkraag_ablaze
@2097 /* You may want to put some of those out, <CHARNAME>. Come. Hopefully old Firkraag won't be too disappointing. */
EXIT

CHAIN RH#ADRJ rh#Firkraag_ethics
@2098 /* You should tell that to the dragons, I think. But have it your way, my <PRO_LADYLORD>. */
EXIT

CHAIN RH#ADRJ rh#Firkraag_edible
@2099 /* White dragon certainly is, and tastes well enough when there's nothing else available. Hopefully old Firkraag won't be too disappointing. */
EXIT

CHAIN RH#ADRJ rh#Firkraag_hide
@2100 /* Unlike you, <CHARNAME>, I happen to be sane. */
EXIT

CHAIN RH#ADRJ rh#Firkraag_scales
@2101 /* Well, I suppose that would be the logical first step. */
EXIT

// working for Aran

CHAIN IF ~Global("rh#AdrianLinvailTalk","GLOBAL",2)~ THEN RH#ADRJ rh#Aran
@2102 /* And here we are, exactly where we were always meant to be: working for the true power in Amn. I would warn you to be careful, but I'm sure you've figured that out for yourself by now. */
DO ~SetGlobal("rh#AdrianLinvailTalk","GLOBAL",3)~
END
	++ @2103 /* Don't sound so happy about it. They're just using us. */ + rh#Aran_happy
	++ @2104 /* Yes, the alternative wasn't particularly savory, was it? */ + rh#Aran_savory
	+ ~OR(5) Class(Player1,THIEF_ALL) Class(Player1,9) Class(Player1,10) Class(Player1,13) Class(Player1,15)~ + @2105 /* I know how to handle thieves. */ + rh#Aran_thieves1
	+ ~!Class(Player1,THIEF_ALL) !Class(Player1,9) !Class(Player1,10) !Class(Player1,13) !Class(Player1,15)~ + @2105 /* I know how to handle thieves. */ + rh#Aran_thieves2
	++ @2106 /* They seemed pretty trustworthy. */ + rh#Aran_trust
	++ @2107 /* I intend to get the best out of the deal that I can, and I can't imagine Bodhi would have let me in on her regime without biting me first. */ + rh#Aran_fangs

CHAIN RH#ADRJ rh#Aran_happy
@2108 /* Everyone in the world is out to use you, <CHARNAME>. All you can do is get as much in return as possible. */
EXIT

CHAIN RH#ADRJ rh#Aran_savory
@2109 /* Unless you enjoy the thought of destabilizing Athkatla entirely. I suppose the idea has its merits, but I'd hate this country even more with vampires in charge of it. */
EXIT

CHAIN RH#ADRJ rh#Aran_thieves1
@2110 /* I know you do, <CHARNAME>. Still, you would not be the first <PRO_MANWOMAN> destroyed by overconfidence. */
EXIT

CHAIN RH#ADRJ rh#Aran_thieves2
@2111 /* I suppose we'll find out quickly enough if you don't. Watch your back and it should be fine. Certainly better than the alternative. */
EXIT

CHAIN RH#ADRJ rh#Aran_trust
@2112 /* They're Shadow Thieves, <CHARNAME>. They're only trustworthy so long as you have something to offer them. I suggest we make ourselves useful. */
EXIT

CHAIN RH#ADRJ rh#Aran_fangs
@2113 /* Indeed. At least the Shadow Thieves' motivations are comprehensible. Vampires... I wouldn't even know where to begin. */
EXIT

// working for Bodhi

CHAIN IF ~Global("rh#AdrianBodhiTalk","GLOBAL",2)~ THEN RH#ADRJ rh#Bodhi
@2114 /* I hope you know what you're doing, <CHARNAME>, throwing in with this blood-sucking fiend. */
DO ~SetGlobal("rh#AdrianBodhiTalk","GLOBAL",3)~
END
 	++ @2115 /* At least she's playing me straight. More than the Shadow Thieves ever did. */ + rh#Bodhi_straight
 	++ @2116 /* I like to side with the winner. Given the situation, I'm guessing that will be Bodhi. */ + rh#Bodhi_winner
 	++ @2117 /* There was something... odd about her. I'm not sure I was thinking straight when I said yes, but it's too late to turn back now. */ + rh#Bodhi_odd

CHAIN RH#ADRJ rh#Bodhi_straight
@2118 /* Straight? <CHARNAME>, that creature was as crooked as anything I've ever seen, and twice as subtle as any Shadow Thief. Don't fool yourself into thinking it's your friend. */
EXIT

CHAIN RH#ADRJ rh#Bodhi_winner
@2119 /* I like the side with the winner who isn't going to tear my throat out on a whim once it's finished with its game. The undead play by different rules, <CHARNAME>. Don't forget that. */
EXIT

CHAIN RH#ADRJ rh#Bodhi_odd
@2120 /* Wonderful. Probably some sort of subtle vampire mind control. Just... be careful and hopefully we'll get through this alive. */
EXIT

// Brynnlaw (friendship/romance only)

CHAIN IF ~Global("rh#AdrianTalkBrynnlaw","GLOBAL",2) OR(6) Class(Player1,MAGE_ALL) Class(Player1,7) Class(Player1,10) Class(Player1,13) Class(Player1,14) Class(Player1,17)~ THEN RH#ADRJ rh#brynn
@2121 /* Well, here we are, I suppose. */
DO ~SetGlobal("rh#AdrianTalkBrynnlaw","GLOBAL",3)~
END
 	++ @2122 /* Here we are indeed. */ + rh#brynn_hereweare1
 	++ @2123 /* You don't sound too happy about it. */ + rh#brynn_wrong1
	++ @2124 /* Why so unhappy? It's a town of lawless thugs. Isn't this your sort of thing? */ + rh#brynn_thugs1
 	++ @2125 /* Imoen won't rescue herself. Let's go. */ + rh#brynn_imoen

CHAIN IF ~Global("rh#AdrianTalkBrynnlaw","GLOBAL",2) !Class(Player1,MAGE_ALL) !Class(Player1,7) !Class(Player1,10) !Class(Player1,13) !Class(Player1,14) !Class(Player1,17)~ THEN RH#ADRJ rh#brynn2
@2121 /* Well, here we are, I suppose. */
DO ~SetGlobal("rh#AdrianTalkBrynnlaw","GLOBAL",3)~
END
 	++ @2122 /* Here we are indeed. */ + rh#brynn_hereweare2
 	++ @2123 /* You don't sound too happy about it. */ + rh#brynn_wrong2
	++ @2124 /* Why so unhappy? It's a town of lawless thugs. Isn't this your sort of thing? */ + rh#brynn_thugs2
 	++ @2125 /* Imoen won't rescue herself. Let's go. */ + rh#brynn_imoen

APPEND RH#ADRJ

IF ~~ rh#brynn_hereweare1
 SAY @2126 /* A prison meant to hold people like us. Spellcasters. This is going to be fun, isn't it? */
 	++ @2127 /* It makes me nervous too, but we'll get through it. We always have. */ + rh#brynn_nervous
 	++ @2128 /* It's no worse than walking into a dragon's lair, is it? */ + rh#brynn_dragon
 	++ @2129 /* Come on, where's your sense of adventure? */ + rh#brynn_sanity
 	++ @2130 /* Don't lose your nerve now, Adrian. */ + rh#brynn_nerve
END

IF ~~ rh#brynn_hereweare2
 SAY @2131 /* A prison meant to hold people like me... this is going to be fun, isn't it? */
 	++ @2127 /* It makes me nervous too, but we'll get through it. We always have. */ + rh#brynn_nervous
 	++ @2128 /* It's no worse than walking into a dragon's lair, is it? */ + rh#brynn_dragon
 	++ @2129 /* Come on, where's your sense of adventure? */ + rh#brynn_sanity
 	++ @2130 /* Don't lose your nerve now, Adrian. */ + rh#brynn_nerve
END

IF ~~ rh#brynn_wrong1
 SAY @2132 /* I'll be fine. It's just...the thought of walking into a prison meant to hold people like us. Spellcasters. It makes me... nervous. */
 	++ @2127 /* It makes me nervous too, but we'll get through it. We always have. */ + rh#brynn_nervous
 	++ @2133 /* More nervous than walking into a dragon's lair? */ + rh#brynn_dragon
 	++ @2129 /* Come on, where's your sense of adventure? */ + rh#brynn_sanity
 	++ @2130 /* Don't lose your nerve now, Adrian. */ + rh#brynn_nerve
END

IF ~~ rh#brynn_wrong2
 SAY @2134 /* I'll be fine. It's just...the thought of walking into a prison meant to hold people like me. It makes me... nervous. */
 	++ @2127 /* It makes me nervous too, but we'll get through it. We always have. */ + rh#brynn_nervous
 	++ @2133 /* More nervous than walking into a dragon's lair? */ + rh#brynn_dragon
 	++ @2129 /* Come on, where's your sense of adventure? */ + rh#brynn_sanity
 	++ @2130 /* Don't lose your nerve now, Adrian. */ + rh#brynn_nerve
END

IF ~~ rh#brynn_thugs1
 SAY @2135 /* You'd be surprised. In any case, it's that... fortress on the horizon that's bothering me. The thought of walking into a prison meant to hold people like us. Spellcasters. It makes me... nervous. */
 	++ @2127 /* It makes me nervous too, but we'll get through it. We always have. */ + rh#brynn_nervous
 	++ @2133 /* More nervous than walking into a dragon's lair? */ + rh#brynn_dragon
 	++ @2129 /* Come on, where's your sense of adventure? */ + rh#brynn_sanity
 	++ @2130 /* Don't lose your nerve now, Adrian. */ + rh#brynn_nerve
END

IF ~~ rh#brynn_thugs2
 SAY @2136 /* You'd be surprised. In any case, it's that... fortress on the horizon that's bothering me. The thought of walking into a prison meant to hold people like me. It makes me... nervous. */
 	++ @2127 /* It makes me nervous too, but we'll get through it. We always have. */ + rh#brynn_nervous
 	++ @2133 /* More nervous than walking into a dragon's lair? */ + rh#brynn_dragon
 	++ @2129 /* Come on, where's your sense of adventure? */ + rh#brynn_sanity
 	++ @2130 /* Don't lose your nerve now, Adrian. */ + rh#brynn_nerve
END

IF ~~ rh#brynn_imoen
 SAY @2137 /* True enough, I suppose. */
IF ~~ EXIT
END

IF ~~ rh#brynn_nervous
 SAY @2138 /* Well, you haven't led me wrong so far. */
IF ~~ + rh#brynn1
END

IF ~~ rh#brynn_dragon
 SAY @2139 /* I just don't like prisons, <CHARNAME>. */
IF ~~ + rh#brynn1
END

IF ~~ rh#brynn_sanity
 SAY @2140 /* With your sanity, apparently. */
IF ~~ + rh#brynn1
END
IF ~~ rh#brynn_nerve
 SAY @2141 /* I'll be fine. */
IF ~~ + rh#brynn1
END

IF ~~ rh#brynn1
 SAY @2142 /* Mmm, a bottle of wine will take the nerves away, no doubt. I'm sure I've got at least one squirreled away. Not like I can't find more in a city full of pirates. */
 	++ @2143 /* I'd rather you nervous than witless, Adrian. */ + rh#brynn_cruel
 	++ @2144 /* I think I'd like some of that too. */ + rh#brynn_likesome
 	++ @2145 /* You may want to save that for later. We might need it. */ + rh#brynn_savelater
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2146 /* Oh, put that bottle down for now and just come over here for a bit. */ + rh#brynn_arm
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrSex","GLOBAL",1)~ + @2147 /* I'd be more than happy to... distract you for a time. In an inn, perhaps. */ + rh#brynn_distract
 	++ @2148 /* (leave him to it) */ EXIT
END

IF ~~ rh#brynn_cruel
 SAY @2149 /* <CHARNAME>, you know full well that that's completely unfair. But you're right. We're so close now, we might as well get this over with. */
IF ~~ EXIT
END

IF ~~ rh#brynn_likesome
 SAY @2150 /* Mmm, I certainly expected as much. */
IF ~~ EXIT
END

IF ~~ rh#brynn_savelater
 SAY @2151 /* If you're trying to make me even more nervous, <CHARNAME>, I think you just succeeded. */
IF ~~ EXIT
END

IF ~~ rh#brynn_arm
 SAY @2152 /* With an invitation like that... ahh, very well. */
IF ~~ EXIT
END

IF ~~ rh#brynn_distract
 SAY @2153 /* Mmm, unless you'd like to make love like a pirate, pressed against the wall in a back alley, I suppose that's a very good idea. */
IF ~~ DO ~RestParty()~ EXIT
END
END

// Spellhold (romance only)

CHAIN IF ~Global("rh#AdrianTalkSpellhold","GLOBAL",2)~ THEN RH#ADRJ rh#Spellhold
@2154 /* It would end like this, wouldn't it? The story of my godsdamned life. */
DO ~SetGlobal("rh#AdrianTalkSpellhold","GLOBAL",3)~
END
	++ @2155 /* Don't write my eulogy yet, Adrian. I don't plan on dying here. */ + rh#Spellhold_eulogy
	++ @2156 /* I'm sorry. I should never have dragged you into this, not with my own future so uncertain. */ + rh#Spellhold_drag
	++ @2157 /* Don't fall apart on me, Adrian. I need you to be strong now. */ +rh#Spellhold_eulogy
	++ @2158 /* At least you've still got your wretched soul intact. Pity I can't say the same for your heart. */ + rh#Spellhold_heart

APPEND RH#ADRJ

IF ~~ rh#Spellhold_eulogy
 SAY @2159 /* I... I know. I just... */
IF ~~ + rh#Spellhold1
END

IF ~~ rh#Spellhold_drag
 SAY @2160 /* I... maybe. I don't know. I just... */
IF ~~ + rh#Spellhold1
END

IF ~~ rh#Spellhold_heart
 SAY @2161 /* I... I'm sorry. I just... */
IF ~~ + rh#Spellhold1
END

IF ~~ rh#Spellhold1
  SAY @2162 /* Hells, <CHARNAME>. I'm getting tired of tragedy. All things considered, perhaps I should have expected something suitably horrific. */
  	++ @2163 /* I hope you're not saying what I think you're saying. */ + rh#Spellhold_think
  	++ @2164 /* I really can't deal with this from you right now. */ + rh#Spellhold_deal
  	++ @2165 /* And you think I'm not tired of this? */ + rh#Spellhold_deal
  	++ @2166 /* You've finally figured out that you reap what you sow, have you? */ + rh#Spellhold_pity
END

IF ~~ rh#Spellhold_think
 SAY @2167 /* No. No... I'm sorry, <CHARNAME>. This isn't fair of me. */
IF ~~ + rh#Spellhold2
END

IF ~~ rh#Spellhold_deal
 SAY @2168 /* I'm sorry, <CHARNAME>. This isn't fair of me. */
IF ~~ + rh#Spellhold2
END

IF ~~ rh#Spellhold_pity
 SAY @2169 /* And I've sown my fair share of misery? That hasn't bothered you before. */
 	++ @2170 /* Wait, I didn't mean that. */ + rh#Spellhold_wait
	++ @871 /* (say nothing) */ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END  

IF ~~ rh#Spellhold_wait
 SAY @2171 /* What a pair we are to<DAYNIGHT>. I'm sorry... this isn't fair of me. */
IF ~~ + rh#Spellhold2
END

IF ~~ rh#Spellhold2
 SAY @2172 /* I just feel useless. I wish I knew something... anything about this, but I don't. My own area of expertise, and I'm lost. */
 = @2173 /* When we get out of here, we can look into it... pull down the walls of Candlekeep and tear the library apart if we have to. */
 	++ @2174 /* Don't look at me like that. This is bad enough as it without worrying if you're about to do something insane. */ + rh#Spellhold_insane
 	++ @2175 /* Forget about Candlekeep. It's Irenicus I'm going to tear apart. And his pet vampire. */ + rh#Spellhold_irenicus
 	++ @2176 /* After everything that's happened to me because of their incompetence, I think I'd *like* to tear down the walls of Candlekeep. */ + rh#Spellhold_candlekeep
 	++ @2177 /* So your knowledge of dark magic is less than complete... I guess that's something decent to take away from this conversation. */ + rh#Spellhold_knowledge
END

IF ~~ rh#Spellhold_insane
 SAY @2178 /* I'll do whatever I damn well have to if it fixes this. I just... I don't know what to do. */
IF ~~ + rh#Spellhold3
END

IF ~~ rh#Spellhold_pain
 SAY @2179 /* I can imagine. If there were anything I could do... */
IF ~~ + rh#Spellhold3
END

IF ~~ rh#Spellhold_irenicus
 SAY @2180 /* Right. Right... if we can keep from walking directly into another trap. I feel like such a fool. */
IF ~~ + rh#Spellhold3
END

IF ~~ rh#Spellhold_candlekeep
 SAY @2181 /* Then we will. If it makes you feel any better, we can tear apart the whole damn world. */
IF ~~ + rh#Spellhold3
END

IF ~~ rh#Spellhold_knowledge
 SAY @2182 /* Knowledge is power, dark or otherwise. You don't have to look at me and see Irenicus. I-- */
IF ~~ + rh#Spellhold3
END

IF ~~ rh#Spellhold3
 SAY @2183 /* Here. Take my arm. It's not much, but if it helps at all... */
 	++ @2184 /* Thank you. That might help, at least a bit. */ EXIT
 	++ @2185 /* Please. Just stay near. */ + rh#Spellhold_intend
 	++ @2186 /* Not right now. We need to get out of this deathtrap. */ + rh#Spellhold_right
 	++ @2187 /* Just leave me alone right now. */ + rh#Spellhold_right
END

IF ~~ rh#Spellhold_intend
 SAY @2188 /* I don't intend to go anywhere, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ rh#Spellhold_right
 SAY @2189 /* Right. Of course. */
IF ~~ EXIT
END
END

// Underdark (friendship/romance only)

CHAIN IF ~Global("rh#AdrianTalkUnderdark","GLOBAL",2)~ THEN RH#ADRJ rh#ndrdrk
@2190 /* Hmm. A trace of elven blood goes a long way in a place like this, I suppose. I've never been so grateful for the infravision. */
DO ~SetGlobal("rh#AdrianTalkUnderdark","GLOBAL",3)~
END
 	+ ~!Race(Player1,HUMAN) !Race(Player1,HALFORC)~ + @2191 /* I'd be lost without it myself. */ + rh#ndrdrk_lost
	+ ~!Class(Player1,MAGE_ALL) !Class(Player1,BARD_ALL) OR(2) Race(Player1,HUMAN) Race(Player1,HALFORC)~ + @2192 /* And I've never wished for it more. */ + rh#ndrdrk_lolhuman
	+ ~OR(2) Class(Player1,MAGE_ALL) Class(Player1,BARD_ALL) OR(2) Race(Player1,HUMAN) Race(Player1,HALFORC)~ + @2192 /* And I've never wished for it more. */ + rh#ndrdrk_lolmage
	++ @2193 /* I do hope you're enjoying the sights. */ + rh#ndrdrk_sight
	++ @2194 /* We're in the Underdark. You don't need to sound so calm about it. */ + rh#ndrdrk_calm
	++ @2195 /* This isn't the time or place for conversation, sorcerer. */ + rh#ndrdrk_exit

APPEND RH#ADRJ

IF ~~ rh#ndrdrk_lost
 SAY @2196 /* It was always just a minor convenience in the past, and now... now it's the difference between life and death. Funny, that. Simply being here... */
IF ~~ + rh#ndrdrk_main1
END

IF ~~ rh#ndrdrk_lolhuman
 SAY @2197 /* Find me a scroll and I'll cast it for you. Simply being here... */
IF ~~ + rh#ndrdrk_main1
END

IF ~~ rh#ndrdrk_lolmage
 SAY @2198 /* Find a scroll and cast it, then. Simply being here... */
IF ~~ + rh#ndrdrk_main1
END

IF ~~ rh#ndrdrk_sight
 SAY @2199 /* I won't deny it. Hmm, simply being here... */
IF ~~ + rh#ndrdrk_main1
END

IF ~~ rh#ndrdrk_calm
 SAY @2200 /* Calm? No, this is one of the most dangerous places in Faerun. I won't deny that, but simply being here... */
IF ~~ + rh#ndrdrk_main1
END

IF ~~ rh#ndrdrk_main1
 SAY @2201 /* I'm not quite sure what to make of it. They're quite beautiful in their own way, though... these caverns. If you lit one up entirely, I can't help but wonder what you'd find. */
 	++ @2202 /* Don't you dare try it. I don't want to get attacked by everything in the vicinity. */ + rh#ndrdrk_attack
 	++ @2203 /* An entirely different world, under our feet... it is a bit humbling to actually see it, isn't it? */ + rh#ndrdrk_world
 	++ @2204 /* I'm sure you'd just see several dozen mind flayers staring at you. A beautiful sight indeed. */ + rh#ndrdrk_flayers
 	++ @2205 /* You really do turn quixotic at the weirdest of things, don't you? */ + rh#ndrdrk_quixotic
 	++ @2206 /* Would you like to try? */ + rh#ndrdrk_try
END

IF ~~ rh#ndrdrk_attack
 SAY @2207 /* Ha! We would be too. I don't deny that. */
IF ~~ + rh#ndrdrk_main2
END

IF ~~ rh#ndrdrk_world
 SAY @2208 /* Humbling? I don't know. There are peasants wasting their short lives on the same patch of earth for decades, and here we are, wandering the most secretive and dangerous place in Faerun. */
IF ~~ + rh#ndrdrk_main2
END

IF ~~ rh#ndrdrk_flayers
 SAY @2209 /* Ha! Hells, <CHARNAME>, I'm going to have nightmares tonight. Well, more than I usually do. */
IF ~~ + rh#ndrdrk_main2
END

IF ~~ rh#ndrdrk_quixotic
 SAY @2210 /* If you would rather I panicked, I can try to oblige you. */
IF ~~ + rh#ndrdrk_main2
END

IF ~~ rh#ndrdrk_try
 SAY @2211 /* Hells, <CHARNAME>, of course not! I'd like to get out of this alive. */
IF ~~ + rh#ndrdrk_main2
END

IF ~~ rh#ndrdrk_main2
 SAY @2212 /* It's strange, though, actually being here. It's a fate I've considered more than once... barely avoided, truth be told. Back home, I-- */
 	++ @2213 /* You what? */ + rh#ndrdrk_main3
 	++ @2214 /* Did terrible, terrible things. Yes, I know. */ + rh#ndrdrk_main3
 	++ @2215 /* Are you alright? You look a bit ill. */ + rh#ndrdrk_ill
 	++ @2216 /* Oh, this isn't going to be pretty, is it? I don't want one of your nasty stories right now. Things are bad enough as it is. */ + rh#ndrdrk_exit
END

IF ~~ rh#ndrdrk_ill
 SAY @2217 /* I'll... be fine, <CHARNAME>. */
IF ~~ + rh#ndrdrk_main3
END

IF ~~ rh#ndrdrk_main3
 SAY @2218 /* We used to trade with dark elves. Perhaps we still do. Possibly even with those of that nearby city, I wouldn't know. Delightful merchants if ever there were, but better to trade with them than to be traded to them. My masters made it clear that those were my alternatives. */
 = @2219 /* Funny, how things turn out. Here we are anyway. Granted, at least we still have our freedom. */
  	++ @2220 /* That's not funny at all. That's terrible. */ + rh#ndrdrk_terrible
 	++ @2221 /* Well, why don't we focus on fates not avoided instead. Like me and my missing soul. */ + rh#ndrdrk_soul 
 	++ @2222 /* You've spent your whole life in way over your head, haven't you? */ + rh#ndrdrk_deepwater
 	++ @2223 /* I need you focused, Adrian, not dwelling on past nightmares. */ + rh#ndrdrk_exit
END

IF ~~ rh#ndrdrk_terrible
 SAY @2224 /* Is it? Hmm. I guess I don't notice anymore. */
IF ~~ EXIT
END

IF ~~ rh#ndrdrk_soul
 SAY @2225 /* I... know. I know, <CHARNAME>. We'll get through this. Just hold on a while longer. */
IF ~~ EXIT
END

IF ~~ rh#ndrdrk_deepwater
 SAY @2226 /* That's a sobering thought, isn't it? I really can't deny it, though. Not now. */
IF ~~ EXIT
END

IF ~~ rh#ndrdrk_exit
 SAY @2227 /* Of course. I'll leave you alone, then. */
IF ~~ EXIT
END
END

// Post-Elhan

CHAIN IF ~Global("rh#AdrianTalkElhan","GLOBAL",2)~ THEN RH#ADRJ rh#Elhan
@2228 /* And people wonder why I hate elves so much. */
DO ~SetGlobal("rh#AdrianTalkElhan","GLOBAL",3)~
END
	++ @2229 /* He was more than a bit arrogant. */ + rh#Elhan_arrogant
	+ ~Race(Player1,ELF)~ + @2230 /* Not all elves are like Elhan. Don't hate all of us. */ + rh#Elhan_elf
	+ ~!Race(Player1,ELF)~ + @2231 /* Not every elf is like Elhan. You don't need to hate all of them. */ + rh#Elhan_elf
	++ @2232 /* All things considered, could you really blame them for being so terse and suspicious? */ + rh#Elhan_blame
	++ @2233 /* I don't blame you. And now we have to run errands for the fool. */ + rh#Elhan_fool
	++ @2234 /* Couldn't you have at least tried to control yourself? */ + rh#Elhan_control

CHAIN RH#ADRJ rh#Elhan_arrogant
@2235 /* 'Arrogant' is the most pleasant thing I could call him. */
EXIT

CHAIN RH#ADRJ rh#Elhan_elf
@2236 /* No? I suppose some are even more infuriating. But we'd best get this over with. */
EXIT

CHAIN RH#ADRJ rh#Elhan_blame
@2237 /* I take issue with more than just that, but... well, we haven't the time to list their faults right now. */
EXIT

CHAIN RH#ADRJ rh#Elhan_fool
@2238 /* Well, we'd best get this over with. */
EXIT

CHAIN RH#ADRJ rh#Elhan_control
@2239 /* I assure you, <CHARNAME>, I was trying. */
EXIT

// Suldanessellar (friendship/romance only, certain conditions apply)

CHAIN IF ~Global("rh#AdrianTalkElf","GLOBAL",2)~ THEN RH#ADRJ rh#Sulda
@2240 /* He's mad, isn't he? Completely mad. */
DO ~SetGlobal("rh#AdrianTalkElf","GLOBAL",3)~
END
 	++ @2241 /* You just noticed that, did you? */ + rh#Sulda_notice
 	++ @2242 /* If madness is a prerequisite for wanting to be a god, it's no wonder the world is so insane. */ + rh#Sulda_prereq
 	++ @2243 /* Utterly. Through the roof. You're a paragon of sanity in comparison. */ + rh#Sulda_sanity
 	++ @2244 /* I can certainly sympathize with his need for vengeance and dreams of godhood. That doesn't mean I intend to spare him, of course. */ + rh#Sulda_vengeance

APPEND RH#ADRJ

IF ~~ rh#Sulda_notice
 SAY @2245 /* Ah... no. Not quite. But I'm not sure I really understood what it meant before. */
IF ~~ + rh#Sulda1
END

IF ~~ rh#Sulda_prereq
 SAY @2246 /* Perhaps that's true. */
IF ~~ + rh#Sulda1
END

IF ~~ rh#Sulda_sanity
 SAY @2247 /* You're too kind. Still. */
IF ~~ + rh#Sulda1
END

IF ~~ rh#Sulda_vengeance
 SAY @2248 /* Quite the opposite, I should think. */
IF ~~ + rh#Sulda1
END
 
IF ~~ rh#Sulda1
 SAY @2249 /* Look at him... swallowed up by vengeance, and what is he now? A caricature of himself. There's nothing elven there. There's nothing even human there anymore. There's just... */
 	++ @2250 /* Madness. Hatred. Ambition. */ + rh#Sulda2
 	++ @2251 /* You're awfully thoughtful about this. I'd have expected a bit more anger from you. */ + rh#Sulda_rage
 	++ @2252 /* Don't get worked up over it. He'll be dead shortly. */ + rh#Sulda_dead
 	++ @2253 /* Call it what you will. He's still one of the most powerful wizards in Faerun. */ + rh#Sulda_power
 END
 
IF ~~ rh#Sulda_rage
 SAY @2254 /* I... I don't know, <CHARNAME>. It's a bit late for that. */
IF ~~ + rh#Sulda2
END

IF ~~ rh#Sulda_dead
 SAY @2255 /* In many ways, I think he already is. */
IF ~~ + rh#Sulda2
END
 
IF ~~ rh#Sulda_power
 SAY @2256 /* And what does it matter in the end? */
IF ~~ + rh#Sulda2
END

IF ~~ rh#Sulda2
 SAY @2257 /* I could blame the elves for making him what he is, but... I suppose I've spent my whole life doing that. For once I'd like to put the blame where it belongs. */
 = @2258 /* Maybe... maybe for more than just once. Let's just finish this. */
IF ~~ DO ~ActionOverride("rh#Adrian",ChangeAlignment(Myself,LAWFUL_NEUTRAL))~ EXIT
END
END

//// ROMANCE CONFLICTS

// Jaheira

APPEND JAHEIRAJ

IF ~Global("rh#JaheiraChallenge1","GLOBAL",2)~ rh#AdrJaeChallenge
 SAY @2259 /* You would be wise to stay away from Vasiliev, <CHARNAME>. I do not care for the way he looks at you. */
 	++ @2260 /* Jaheira, that's my business, not yours. */ DO ~SetGlobal("rh#JaheiraChallenge1","GLOBAL",3)~ + rh#AdrJaeChallenge1
 	++ @2261 /* Why? Because of an organization he no longer works for? */ DO ~SetGlobal("rh#JaheiraChallenge1","GLOBAL",3)~ + rh#AdrJaeChallenge2
 	++ @2262 /* But he's finally beginning to calm down around me. */ DO ~SetGlobal("rh#JaheiraChallenge1","GLOBAL",3)~ + rh#AdrJaeChallenge3
 	++ @2263 /* Why? What do you think about this? */ DO ~SetGlobal("rh#JaheiraChallenge1","GLOBAL",3)~ + rh#AdrJaeChallenge4
 	++ @2264 /* There's nothing going on between us, Jaheira. Nor do I want there to be. */ DO ~SetGlobal("rh#JaheiraChallenge1","GLOBAL",3)~ + rh#AdrJaeChallenge5
END

IF ~~ rh#AdrJaeChallenge1
 SAY @2265 /* I do not contest that, <CHARNAME>, but I know more about this man than you do. I do not deny that the stories told about him by Harpers may be exaggerated, but his heart has caused him nothing but trouble in the past. */
IF ~~ + rh#AdrJaeChallenge6
END

IF ~~ rh#AdrJaeChallenge2
 SAY @2266 /* His loyalties may have changed, but he is still who he was, <CHARNAME>. I do not deny that the stories told about him by Harpers may be exaggerated, but his heart has caused him nothing but trouble in the past. */
IF ~~ + rh#AdrJaeChallenge6
END

IF ~~ rh#AdrJaeChallenge3
 SAY @2267 /* Perhaps, but he is still who he was. I do not deny that the stories told about him by Harpers may be exaggerated, but his heart has caused him nothing but trouble in the past. */
IF ~~ + rh#AdrJaeChallenge6
END

IF ~~ rh#AdrJaeChallenge4
 SAY @2268 /* Nothing good will come of it, <CHARNAME>. I do not deny that the stories told about him by Harpers may be exaggerated, but his heart has caused him nothing but trouble in the past. */
IF ~~ + rh#AdrJaeChallenge6
END

IF ~~ rh#AdrJaeChallenge5
 SAY @2269 /* I am glad to hear it. See to it that he understands this as well. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrJaeChallenge6
 SAY @2270 /* You have enough to concern you without worrying about the demons that may plague a renegade Zhent. Do not forget that. */
IF ~~ EXIT
END
END

// Anomen

APPEND ANOMENJ

IF ~Global("rh#AnomenChallenges1","GLOBAL",2)~ rh#AdrAnoChallenge1
 SAY @2271 /* My lady, might I speak with you for a moment? */
 	++ @2272 /* Of course. What is it, Anomen? */ DO ~SetGlobal("rh#AnomenChallenges1","GLOBAL",3)~ + rh#AdrAnoChallenge1.1
 	++ @2273 /* I'm sorry if I've led you on, but... */ DO ~SetGlobal("rh#AnomenChallenges1","GLOBAL",3)~ + rh#AdrAnoChallenge1.1
 	++ @2274 /* Whatever it is, I don't want to hear it. */ DO ~SetGlobal("rh#AnomenChallenges1","GLOBAL",3)~ + rh#AdrAnoChallenge1.5
END 

IF ~~ rh#AdrAnoChallenge1.1
 SAY @2275 /* I would speak of Adrian, my lady. I have seen the way that you and he look at each other, and I fear for you. He is an evil man, <CHARNAME>, one who has attempted to hide the magnitude of his depravity from us, but the truth won out in the end, as is only right. */ 
 = @2276 /* He... my lady, has he charmed you? I know little of the ways of magicians, but there is nothing that I would consider beyond that man. */
 	++ @2277 /* You only see what he chooses to show you, Anomen, but there is more to him than that. He has neither charmed, seduced, nor corrupted me, I assure you. */ + rh#AdrAnoChallenge1.2
 	++ @2278 /* Do you think so little of me that you believe I would be charmed, Anomen? He has more to offer me than you realize. */ + rh#AdrAnoChallenge1.3
 	++ @2279 /* Maybe. It was a strange, convoluted seduction, true, but a seduction none the less. Whatever it was, it's over. */ + rh#AdrAnoChallenge1.4
 	++ @2280 /* You can take your assumptions and choke on them, Anomen. */ + rh#AdrAnoChallenge1.5
END

IF ~~ rh#AdrAnoChallenge1.2
 SAY @2281 /* I am glad to hear it. You are... nobler than I, my lady, to see goodness even in one such as he. I... I shall not bother you again, <CHARNAME>. */
IF ~~ DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3) SetGlobal("AnomenMatch","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrAnoChallenge1.3
 SAY @2282 /* I will not claim to understand it, but if this is what you wish, then I... I shall not bother you again, my lady. */
IF ~~ DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3) SetGlobal("AnomenMatch","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrAnoChallenge1.4
 SAY @2283 /* I am glad that you have come to your senses, <CHARNAME>. Come, let us move on. */ 
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrAnoChallenge1.5
 SAY @2284 /* I see. Then I... I must assume that the Zhentarim snake has corrupted you. I am sorry, my lady, but I cannot bear to see you like this. */
IF ~~ DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3) SetGlobal("AnomenMatch","GLOBAL",3) GivePartyAllEquipment() LeaveParty() EscapeArea()~ EXIT
END
END

APPEND RH#ADRJ	

// Anomen romance: after Anomen's LT24 - Global("LoveTalk","LOCALS",25)

IF ~Global("rh#AnomenChallenges2","GLOBAL",2)~ THEN BEGIN rh#AdrAnoChallenge2
 SAY @2285 /* Careful, <CHARNAME>. That white knight of yours will no doubt be professing his undying love for you any day now. */
 	++ @2286 /* (sigh) Do you think so? Oh, I hope so. */ DO ~SetGlobal("rh#AnomenChallenges2","GLOBAL",3)~ + rh#AdrAnoChallenge2.1
 	++ @2287 /* He is beginning to take things a bit seriously, isn't he? */ DO ~SetGlobal("rh#AnomenChallenges2","GLOBAL",3)~ + rh#AdrAnoChallenge2.2
 	++ @2288 /* Leave him alone, Adrian. He's twice the man you'll ever be. */ DO ~SetGlobal("rh#AnomenChallenges2","GLOBAL",3)~ + rh#AdrAnoChallenge2.3
 	++ @2289 /* Ha! And I look forward to throwing it back in his pompous face. */ DO ~SetGlobal("rh#AnomenChallenges2","GLOBAL",3)~ + rh#AdrAnoChallenge2.4
END

IF ~~ rh#AdrAnoChallenge2.1
 SAY @2290 /* Hells, please tell me you're joking. */
	++ @2291 /* He has the makings of a great man, whether you're willing to see it or not. */ + rh#AdrAnoChallenge2.5
	++ @2292 /* I'm not. He's twice the man you'll ever be. */ + rh#AdrAnoChallenge2.3
	++ @2293 /* Of course I am. I'm not interested in him. */ + rh#AdrAnoChallenge2.6
	++ @2294 /* Ha! I'm no blushing maiden waiting for her white knight, my dear. */ + rh#AdrAnoChallenge2.7
END

IF ~~ rh#AdrAnoChallenge2.2
 SAY @2295 /* I take it you don't want to be his lady wife, then? */
 	++ @2296 /* We'll see. He's certainly twice the man you'll ever be. */ + rh#AdrAnoChallenge2.3
 	++ @2297 /* Perhaps I do. He has the makings of a great man, whether you're willing to see it or not. */ + rh#AdrAnoChallenge2.5
	++ @2298 /* No. I like him well enough, but I'm not interested in him. */ + rh#AdrAnoChallenge2.6
	++ @2294 /* Ha! I'm no blushing maiden waiting for her white knight, my dear. */ + rh#AdrAnoChallenge2.7
END

IF ~~ rh#AdrAnoChallenge2.3
 SAY @2299 /* And three times the fool, as I'm sure you'll find out soon enough. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrAnoChallenge2.4
 SAY @2300 /* Heh. As entertaining as that would be, it's probably not worth the inevitable drama. */
IF ~~ DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3) SetGlobal("AnomenMatch","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrAnoChallenge2.5
 SAY @2301 /* Well, I suppose he's pointed that out enough times for it to become something like the truth. I'm sure you two will be... very happy. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrAnoChallenge2.6
 SAY @494 /* I'm glad to hear it. */
IF ~~ DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3) SetGlobal("AnomenMatch","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrAnoChallenge2.7
 SAY @2302 /* Heh. I didn't think you were. */
IF ~~ DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3) SetGlobal("AnomenMatch","GLOBAL",3)~ EXIT
END

// Edwin romance

IF ~Global("rh#EdwinChallenge","GLOBAL",2) !Gender("Edwin",MALE)~ THEN BEGIN rh#AdrEdwinChallengeA
 SAY @2303 /* <CHARNAME>, I don't know what that scarlet robed freak has been whispering in your ear, but even by a Red Wizard's standards, he... or she, rather, is frankly worthless. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ DO ~SetGlobal("rh#EdwinChallenge","GLOBAL",3)~ + rh#AdrEdwinChallenge1
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ DO ~SetGlobal("rh#EdwinChallenge","GLOBAL",3)~ + rh#AdrEdwinChallenge2
END

IF ~Global("rh#EdwinChallenge","GLOBAL",2) Gender("Edwin",MALE)~ THEN BEGIN rh#AdrEdwinChallengeB
 SAY @2304 /* <CHARNAME>, I don't know what that scarlet robed freak has been whispering in your ear, but even by a Red Wizard's standards, he's... well, frankly worthless. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",1)~ DO ~SetGlobal("rh#EdwinChallenge","GLOBAL",3)~ + rh#AdrEdwinChallenge1
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ DO ~SetGlobal("rh#EdwinChallenge","GLOBAL",3)~ + rh#AdrEdwinChallenge2
END

IF ~~ rh#AdrEdwinChallenge1
 SAY @2305 /* If you really want one of them, I could point you towards any number who are more stable, but you could honestly do better. */
	++ @2306 /* Edwin isn't a scarlet robed freak, Adrian. If you treated him with a bit of respect, you would know that. */ + rh#AdrEdwinChallenge3
	++ @2307 /* You're seeing things that don't exist. I only wanted to get to know him a bit better. */ + rh#AdrEdwinChallenge4
	++ @2308 /* Edwin? You thought... oh. Eww. No, never. */ + rh#AdrEdwinChallenge5
	++ @2309 /* If I wanted stable, I would stay away from evil wizards in general. And that's what I plan on doing. Now, could you stop always dragging your organizational feud into this party? */ + rh#AdrEdwinChallenge6
END

IF ~~ rh#AdrEdwinChallenge2
 SAY @2310 /* In any case, I would have hoped that you had enough notoriety right here. */
	++ @2311 /* He's not a scarlet robed freak, Adrian. If you treated him with a bit of respect, you would know that. */ + rh#AdrEdwinChallenge7
	++ @2312 /* Jealous, are we? You're seeing things that don't exist. I only wanted to get to know him a bit better. */ + rh#AdrEdwinChallenge4
	++ @2308 /* Edwin? You thought... oh. Eww. No, never. */ + rh#AdrEdwinChallenge5
	++ @2313 /* More than enough notoriety, to be honest. I'm sick and tired of both of you. Now, could you stop always dragging your organizational feud into this party? */ + rh#AdrEdwinChallenge6
END

IF ~~ rh#AdrEdwinChallenge3
 SAY @2314 /* I've treated him with as much respect as he deserves. Fine. Enjoy what passes for Thayvian sophistication these days, if you wish. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrEdwinChallenge4
 SAY @2315 /* I can't imagine why. Just make sure he doesn't toss a fireball at you in a fit of rage when he finds out that you're not interested. */
IF ~~ DO ~SetGlobal("EdwinRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrEdwinChallenge5
 SAY @2316 /* I'm glad to hear it. Just make sure he doesn't toss a fireball at you in a fit of rage when he finds out that you're not interested. */
IF ~~ DO ~SetGlobal("EdwinRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrEdwinChallenge6
 SAY @2317 /* Our... organizational feud? If that's the way you see things, then fine. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3) SetGlobal("EdwinRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#AdrEdwinChallenge7
 SAY @2318 /* You almost sound as if you prefer him now. */
	++ @2319 /* You don't need to sound so jealous. Of course I don't. */ + rh#AdrEdwinChallenge5
	++ @2320 /* Actually, I do prefer him. */ + rh#AdrEdwinChallenge8
END

IF ~~ rh#AdrEdwinChallenge8
 SAY @2321 /* ...fine. Enjoy whatever it is that passes for Thayvian sophistication these days. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

// Haer'dalis

// was sleeping with HD before committing here

IF ~Global("rh#HaerDalisChallenge1","GLOBAL",2)~ THEN BEGIN rh#HDChallenge1.0
 SAY @2322 /* <CHARNAME>, you and that mad tiefling... */
 = @2323 /* I don't much mind that you've slept with him in the past, but whatever bizarre relationship there is between you, could you please put an end to it? */
 	++ @2324 /* I don't care for being told who I can and can't speak with, Adrian. */ DO ~SetGlobal("rh#HaerDalisChallenge1","GLOBAL",3)~ + rh#HDChallenge1.1
 	++ @2325 /* If it makes you uncomfortable, I'll tell him to keep his distance. */ DO ~SetGlobal("rh#HaerDalisChallenge1","GLOBAL",3)~ + rh#HDChallenge1.2
 	++ @2326 /* What are you talking about? There's nothing going on between us. */ DO ~SetGlobal("rh#HaerDalisChallenge1","GLOBAL",3)~ + rh#HDChallenge1.3
 	++ @2327 /* Loosen up a bit. Maybe you'd enjoy something a bit less conventional yourself. */ DO ~SetGlobal("rh#HaerDalisChallenge1","GLOBAL",3)~ + rh#HDChallenge1.4
END

IF ~~ rh#HDChallenge1.1
 SAY @2328 /* I hardly mind you talking to him, but I have noticed the way he looks at you. I'd have to be blind to miss it... and a fool to welcome it. */
	++ @2329 /* Very well. If it makes you uncomfortable, I'll have to dissuade his attentions. */ + rh#HDChallenge1.2
 	++ @2330 /* There isn't anything going on between us. */ + rh#HDChallenge1.3
 	++ @2327 /* Loosen up a bit. Maybe you'd enjoy something a bit less conventional yourself. */ + rh#HDChallenge1.4
 	++ @2331 /* I suppose this was bound to come up eventually. I do appreciate him. Quite a bit. */ + rh#HDChallenge1.5
END

IF ~~ rh#HDChallenge1.2
 SAY @1132 /* Thank you. */
IF ~~ DO ~SetGlobal("LS_HaerDalisRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#HDChallenge1.3
 SAY @2332 /* I don't care for being lied to, <CHARNAME>. */
	++ @2333 /* Fine. I suppose this was bound to come up eventually. I do appreciate him. Quite a bit, in fact. */ + rh#HDChallenge1.5
	++ @2334 /* It's not a lie. Our relationship was merely physical, nothing more substantial. */ + rh#HDChallenge1.6
	++ @2335 /* I haven't invited him to my bed in quite some time. There really isn't anything going on anymore. */ + rh#HDChallenge1.6
	++ @2336 /* But you're imagining things! */ + rh#HDChallenge1.7
END

IF ~~ rh#HDChallenge1.4
 SAY @2337 /* I very much doubt that. */
 	++ @2338 /* Oh, very well. If it makes you uncomfortable, I'll tell him to keep his distance. */ + rh#HDChallenge1.2
 	++ @2339 /* You'll never know if you don't try. */ + rh#HDChallenge1.8
	++ @2340 /* If that's the way you intend to be, I suppose this was bound to come up eventually. I do appreciate him. Quite a bit, in fact. */ + rh#HDChallenge1.5
END

IF ~~ rh#HDChallenge1.5
 SAY @2341 /* I... see. Very well, then. I certainly won't stand in your way. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#HDChallenge1.6
 SAY @2342 /* I see. I'm not quite certain he agrees that there's nothing significant between you... he looks damn interested in worming his way back into your bed. */
	++ @2343 /* Well, if it makes you uncomfortable, I'll tell him to keep his distance. */ + rh#HDChallenge1.2
	++ @2344 /* Does he? That might be interesting. */ + rh#HDChallenge1.5
	++ @2345 /* I refuse to discuss this one way or the other. */ + rh#HDChallenge1.9
END

IF ~~ rh#HDChallenge1.7
 SAY @2346 /* ...I'm imagining quite a few things, apparently. But fine. You needn't bother lying in the future. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#HDChallenge1.8
 SAY @2347 /* I've tried quite a few things, my dear, but I really don't like to share. Will you break this off or not? */
	++ @2338 /* Oh, very well. If it makes you uncomfortable, I'll tell him to keep his distance. */ + rh#HDChallenge1.2
	++ @2340 /* If that's the way you intend to be, I suppose this was bound to come up eventually. I do appreciate him. Quite a bit, in fact. */ + rh#HDChallenge1.5
END

IF ~~ rh#HDChallenge1.9
 SAY @2348 /* Do you? I... suppose that's as much an answer as I could need. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

// haven't been sleeping with HD

IF ~Global("rh#HaerDalisChallenge2","GLOBAL",2)~ THEN BEGIN rh#HDChallenge2.0
 SAY @2322 /* <CHARNAME>, you and that mad tiefling... */
 = @2349 /* I've tried to ignore whatever bizarre relationship there is between you two, but I'm not doing a very good job of it. Could you please put an end to it? */
 	++ @2324 /* I don't care for being told who I can and can't speak with, Adrian. */ DO ~SetGlobal("rh#HaerDalisChallenge2","GLOBAL",3)~ + rh#HDChallenge2.1
 	++ @2325 /* If it makes you uncomfortable, I'll tell him to keep his distance. */ DO ~SetGlobal("rh#HaerDalisChallenge2","GLOBAL",3)~ + rh#HDChallenge2.2
 	++ @2326 /* What are you talking about? There's nothing going on between us. */ DO ~SetGlobal("rh#HaerDalisChallenge2","GLOBAL",3)~ + rh#HDChallenge2.3
 	++ @2327 /* Loosen up a bit. Maybe you'd enjoy something a bit less conventional yourself. */ DO ~SetGlobal("rh#HaerDalisChallenge2","GLOBAL",3)~ + rh#HDChallenge2.4
END

IF ~~ rh#HDChallenge2.1
 SAY @2328 /* I hardly mind you talking to him, but I have noticed the way he looks at you. I'd have to be blind to miss it... and a fool to welcome it. */
	++ @2350 /* Very well. If it makes you uncomfortable, I'll have to tell him to keep his distance. */ + rh#HDChallenge2.2
 	++ @2330 /* There isn't anything going on between us. */ + rh#HDChallenge2.3
 	++ @2327 /* Loosen up a bit. Maybe you'd enjoy something a bit less conventional yourself. */ + rh#HDChallenge2.4
 	++ @2351 /* I suppose this was bound to come up eventually. I do appreciate him. Quite a bit, in fact. */ + rh#HDChallenge2.5
END

IF ~~ rh#HDChallenge2.2
 SAY @1132 /* Thank you. */
IF ~~ DO ~SetGlobal("LS_HaerDalisRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#HDChallenge2.3
 SAY @2332 /* I don't care for being lied to, <CHARNAME>. */
	++ @2333 /* Fine. I suppose this was bound to come up eventually. I do appreciate him. Quite a bit, in fact. */ + rh#HDChallenge2.5
	++ @2352 /* It's not a lie. I may enjoy speaking with him, but that really is all there is to it. */ + rh#HDChallenge2.6
	++ @2336 /* But you're imagining things! */ + rh#HDChallenge2.7
END

IF ~~ rh#HDChallenge2.4
 SAY @2337 /* I very much doubt that. */
 	++ @2338 /* Oh, very well. If it makes you uncomfortable, I'll tell him to keep his distance. */ + rh#HDChallenge2.2
 	++ @2339 /* You'll never know if you don't try. */ + rh#HDChallenge2.8
	++ @2340 /* If that's the way you intend to be, I suppose this was bound to come up eventually. I do appreciate him. Quite a bit, in fact. */ + rh#HDChallenge2.5
END

IF ~~ rh#HDChallenge2.5
 SAY @2341 /* I... see. Very well, then. I certainly won't stand in your way. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#HDChallenge2.6
 SAY @2353 /* For you, perhaps, but he seems pretty damn interested in worming his way into your bed. */
	++ @2354 /* I see. If it makes you uncomfortable, I'll tell him to keep his distance. */ + rh#HDChallenge2.2
	++ @2355 /* Does he? Well, that might be interesting. */ + rh#HDChallenge2.5
	++ @2345 /* I refuse to discuss this one way or the other. */ + rh#HDChallenge2.9
END

IF ~~ rh#HDChallenge2.7
 SAY @2346 /* ...I'm imagining quite a few things, apparently. But fine. You needn't bother lying in the future. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#HDChallenge2.8
 SAY @2347 /* I've tried quite a few things, my dear, but I really don't like to share. Will you break this off or not? */
	++ @2338 /* Oh, very well. If it makes you uncomfortable, I'll tell him to keep his distance. */ + rh#HDChallenge2.2
	++ @2340 /* If that's the way you intend to be, I suppose this was bound to come up eventually. I do appreciate him. Quite a bit, in fact. */ + rh#HDChallenge2.5
END

IF ~~ rh#HDChallenge2.9
 SAY @2348 /* Do you? I... suppose that's as much an answer as I could need. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

// if you start sleeping with Haer'dalis after committing

IF ~Global("rh#HaerDalisChallenge3","GLOBAL",2)~ THEN BEGIN rh#HDChallenge3.0
 SAY @2356 /* Perhaps I should have commented on the situation earlier, but I actually trusted you. Foolish of me, I know. */
 = @2357 /* No, don't say anything. I honestly don't want to hear it. If you'd rather that damn tiefling in your bed... well, so be it. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)
SetGlobal("rh#HaerDalisChallenge3","GLOBAL",3)~ EXIT
END

// NPC INITIATED FLIRTS

IF ~Global("rh#AdrTimeForFlirt","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",2) !Global("PlayerLooksLikeDrow","GLOBAL",1)~ rh#AdrStartFlirt
 SAY @2358 /* (It is no wonder that Adrian's attention is again focused upon you.) */
 	IF ~RandomNum(20,1)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt1
  	IF ~RandomNum(20,2)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt2
  	IF ~RandomNum(20,3) !GlobalGT("AsylumPlot","GLOBAL",21)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt3
  	IF ~RandomNum(20,3) GlobalGT("AsylumPlot","GLOBAL",21)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt3b
  	IF ~RandomNum(20,4) !GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt4
	IF ~RandomNum(20,4) GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt4b
  	IF ~RandomNum(20,5)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt5
  	IF ~RandomNum(20,6)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt6  	
  	IF ~RandomNum(20,7) !GlobalGT("AsylumPlot","GLOBAL",21)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt7
  	IF ~RandomNum(20,7) GlobalGT("AsylumPlot","GLOBAL",21)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt7b
  	IF ~RandomNum(20,8)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt8
    IF ~RandomNum(20,9)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt9
  	IF ~RandomNum(20,10)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt10	
  	IF ~RandomNum(20,11)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt11
  	IF ~RandomNum(20,12)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt12  	
  	IF ~RandomNum(20,13) !GlobalGT("AsylumPlot","GLOBAL",21)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt13
  	IF ~RandomNum(20,13) GlobalGT("AsylumPlot","GLOBAL",21)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt13b
  	IF ~RandomNum(20,14)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt14
  	IF ~RandomNum(20,15) OR(2) !TimeOfDay(NIGHT) !AreaType(OUTDOOR)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt15
  	IF ~RandomNum(20,15) TimeOfDay(NIGHT) AreaType(OUTDOOR)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt15b
  	IF ~RandomNum(20,16)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt16
  	IF ~RandomNum(20,17)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt17
  	IF ~RandomNum(20,18)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt18
  	IF ~RandomNum(20,19)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt19
	IF ~RandomNum(20,20)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrFlirt20
END

// Ust Natha

IF ~Global("PlayerLooksLikeDrow","GLOBAL",1) Global("rh#AdrTimeForFlirt","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",2)~  rh#AdrStartFlirtDrow
 SAY @2359 /* (Even in this darkest of places, Adrian's attention is again focused upon you.) */
	IF ~Global("rh#AdrDrowFlirt","GLOBAL",0)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrDrowFlirt1
	IF ~Global("rh#AdrDrowFlirt","GLOBAL",1)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrDrowFlirt2
	IF ~Global("rh#AdrDrowFlirt","GLOBAL",2)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrDrowFlirt3
	IF ~Global("rh#AdrDrowFlirt","GLOBAL",3)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#AdrDrowFlirt4
END
END

CHAIN RH#ADRJ rh#AdrFlirt1
@2360 /* (Adrian draws closer to you as you walk, silently wrapping an arm around your waist. He smiles at you, the expression of sincerity saying more than words ever could.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt2
@2361 /* (Adrian seems vaguely annoyed at the world to<DAYNIGHT>, but as his eyes fall upon you, the angry set of his face softens somewhat.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt3
@2362 /* (Humming softly to himself, Adrian reaches out and offers you his hand, the gesture incongruously courtly given his otherwise casual demeanor.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt3b
@2363 /* (You find Adrian watching you, openly concerned about your condition. He moves closer to you, wrapping an arm around your shoulders protectively.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt4
@2364 /* (Rifling through your packs, you find a luxurious - if extremely revealing - silken dress. You glance up to find Adrian watching you, a suggestive smile on his face.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt4b
@2365 /* (Rifling through your packs, you find a luxurious - if extremely revealing - silken dress. The spider motif makes it obvious where it came from. You glance up to find Adrian watching you, a suggestive smile on his face.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt5
@2366 /* Can we not take at least a <DAYNIGHT> off, <CHARNAME>? A glass of wine and the privacy of dark corner of an inn somewhere seems so much more promising than constant wandering. */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt6
@2367 /* (Adrian takes your hand in an almost chivalrous gesture. With a slightly ironic smile, he begins to gently massage the tension out of your palm.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt7
@2368 /* (You catch Adrian watching you, his expression for once completely unguarded. Blushing slightly, he looks away.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt7b
@2369 /* (Seeing you stumble slightly after a brief moment's dizziness, Adrian wordlessly pulls you close to him, shouldering some of your equipment to make your own pack lighter.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt8
@2370 /* (In an unexpected private moment, Adrian draws near you, his lips brushing against the side of your jaw, one hand tangled in your hair.) */ 
EXIT

CHAIN RH#ADRJ rh#AdrFlirt9
@2371 /* (You glance up to find Adrian's attention focused upon you, his expression far from chaste. He somehow manages to give you an innocent smile when he notices that you've seen, and then quickly turns away, laughing softly.) */ 
EXIT

CHAIN RH#ADRJ rh#AdrFlirt10
@2372 /* (You feel fingers fall onto your shoulders, gently but firmly massaging the tension out of your neck. Watching Adrian from the corner of your eye, you can tell that he is enjoying the massage as much as you are.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt11
@2373 /* Have I ever thanked you for not letting me throw this away, <CHARNAME>? Because... thank you. Sincerely. */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt12
@2374 /* (Adrian pulls you into his arms, his hands slipping beneath your clothing. He presses his lips against the back of your neck as he traces arcane symbols across your skin.) */
== RH#ADRJ IF ~OR(3) Class(Player1,MAGE_ALL) Class(Player1,BARD_ALL) Class(Player1,CLERIC_ALL)~ THEN @2375 /* You don't need to look at me like that, <CHARNAME>. I know there are more romantic runes out there than 'fireball.' It's simply the first one that comes to mind. */
== RH#ADRJ IF ~!Class(Player1,MAGE_ALL) !Class(Player1,BARD_ALL) !Class(Player1,CLERIC_ALL)~ THEN @2376 /* I'm not about to enchant you, my dear. Don't worry. */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt13
@2377 /* (As you look over the group, you find Adrian watching you, a small smile on his lips. As your eyes meet, he quirks an eyebrow in what must be mild amusement before looking away. His smile, however, doesn't fade for a few moments.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt13b
@2378 /* (As you look over the group, you find Adrian watching you, a small frown on his lips. As your eyes meet, he gives you an encouraging smile.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt14
@2379 /* (Adrian is humming to himself to<DAYNIGHT>, clearly pleased with the state of affairs. His eyes keep on seeking you out, and there's a faint, slightly suggestive smile upon his face, as if his thoughts are not as innocent as they might be.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt15
@2380 /* On days like this, I almost understand why people worship Lathander. I can't convince you to stop a while and enjoy it, I suppose? */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt15b
@2381 /* On nights like this, I almost understand why people worship Selune. I can't convince you to stop a while and enjoy it, I suppose? */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt16
@2382 /* I wish my magic were more... appropriate for a romantic situation, but there isn't any point in charming you, no illusion could compare, and I certainly don't want to set you afire. */
= @2383 /* (smile) I suppose I'll have to get more creative. Or perhaps I'll start collecting scrolls. */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt17
@2384 /* If I had to guess which dark deity was your parent, I would probably have said Loviatar instead, my love. 'Fear her and yet long for her.' No doubt half the world does one or the other. */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt18
@2385 /* (Adrian has pulled a recently acquired tome of magical theory out of his pack, and while he at first seems deeply engrossed in his reading, you notice after a moment that he hasn't turned a page for ten minutes. He glances up, his eyes finding you almost unconsciously, before shaking his head and turning his attention back to the book.) */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt19
@2386 /* Mmm, I was thinking of this festhall in Selgaunt I would have liked to have been able to show you. They had dancers from as far away as Mulhorand, and the fertility rites of Isis... */
= @2387 /* Well, perhaps it would not have been completely appropriate, but so few of the worthwhile things in life are. */
EXIT

CHAIN RH#ADRJ rh#AdrFlirt20
@2388 /* (Adrian pulls you into his arms during a moment's break, brushing your hair aside to press his lips against the back of your neck.) */
EXIT

// Ust Natha

CHAIN RH#ADRJ rh#AdrDrowFlirt1
@2389 /* (You find Adrian watching you to<DAYNIGHT> with an audacity that is not entirely out of place for a drow wizard. He seems to be enjoying the role you have been assigned, and if he still feels anything for you but lust mingled with hatred, he is hiding it well.) */
DO ~SetGlobal("rh#AdrDrowFlirt","GLOBAL",1)~
EXIT

CHAIN RH#ADRJ rh#AdrDrowFlirt2
@2390 /* (Adrian's eyes sweep across the caverns, ever alert for dangers, and you notice how he displays both the alertness of one expecting violence and the casualness that only comes from long familiarity. His gaze meets yours, and the tension eases slightly from his face.) */
DO ~SetGlobal("rh#AdrDrowFlirt","GLOBAL",2)~
EXIT

CHAIN RH#ADRJ rh#AdrDrowFlirt3
@2391 /* (Adrian brushes against you, his fingers grazing against your skin. He draws away quickly, apologizing profusely for the slight, but he can't quite suppress a small, contented smile.) */
DO ~SetGlobal("rh#AdrDrowFlirt","GLOBAL",3)~
EXIT

CHAIN RH#ADRJ rh#AdrDrowFlirt4
@2392 /* (Adrian's eyes fall upon you, and he spends a long moment admiring your drow body. Smiling ruefully, he finally draws close enough to whisper.) */
= @2393 /* The clothing is... memorable, no doubt, but I find myself missing your true form almost as much as the sky, Veldrin. */
DO ~SetGlobal("rh#AdrDrowFlirt","GLOBAL",0)~
EXIT

// INTERJECTIONS

// waukeen's promenade

CHAIN IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) Global("rh#PostCutSpeak","AR0700",1)~ THEN rh#AdrJ rh#AdrCutScene
@2394 /* Dammit! So many wizards and not a brain between them. They're fools to take a mage of that power alive. */
= @2395 /* Hells, what a <DAYNIGHT>! Could we find the nearest tavern, <CHARNAME>? I'd like to drown myself in wine for a while. */
DO ~SetGlobal("rh#PostCutSpeak","AR0700",2)~
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @2396 /* You would counsel revelry at a time such as this? Do not be a fool, Adrian. */
== RH#ADRJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @2397 /* If not at a time like this, then when? */
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianBelmin","GLOBAL",0)~ THEN BELMIN rh#AdrBelmin
@2398 /* The plague of the world, those elves! They're to blame, I tell you! They're to blame for everything! */
DO ~SetGlobal("rh#AdrianBelmin","GLOBAL",1)~
== RH#ADRJ @2399 /* Insipid, useless creatures, aren't they? */
== BELMIN @2400 /* A supporter! Wait, you... you have elven blood! I can see its mark on you! Do you dare mock me!? */
== RH#ADRJ @2401 /* Hardly. Go crusading and I may well find you a barony somewhere. */
== BELMIN @2402 /* See! Even their wretched spawn hates them! DEMONS! DEMONS, ALL OF THEM! */ 
EXIT

I_C_T SEVDRU01 4 rh#AdrBonito // *raised of spells and casting well, but always wanting better, to sing of knights and days of yore, to leave the robes that... that fetter! I wizard prone to song and prose, though oft accused of failling, I shall sing despite the odds...*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2403 /* Nine Hells, how... utterly disgraceful. */
END

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianMurtlen","GLOBAL",0)~ THEN MURTLEN rh#AdrMurtlen
@2404 /* You! Have you ever been cheated, here? I bet ye have! */
== RH#ADRJ @2405 /* Honestly, I'm used to worse. */
DO ~SetGlobal("rh#AdrianMurtlen","GLOBAL",1)~
EXIT

I_C_T AERIE 27 rh#AdrAerie // *Kalah! Oh, I don't know what he's done, exactly, or how...but everything here is an illusion! But it's magic that can hurt you, if you believe in it...*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2406 /* I've...heard of powerful enough illusions being capable of such things, but I've never quite seen it. Who is this Kalah anyway? */
== AERIE @2407 /* He's an illusionist, but... no! He shouldn't be capable of this! */
END

// copper coronet & slavers

I_C_T DRUNK1 2 rh#AdrGaroll1 // *Well, I be Garoll, thank ye. <burp> (Who wash 'at?) Now that you an' I be proper frendsh an' all, how aboutsh you buyin Garoll a drink, aye?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2408 /* If you're buying someone a drink, <CHARNAME>, I'd much rather it be me. */
== DRUNK1 @2409 /* Bah! Ye can has some too. */
END

I_C_T DRUNK1 3 rh#AdrGaroll2 // *Weeellll, I shpose thatsh true, it ish. <hic> Now, then. It wouldsht be truer if ye bought ol' Garrol a drink, aye?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2408 /* If you're buying someone a drink, <CHARNAME>, I'd much rather it be me. */
== DRUNK1 @2409 /* Bah! Ye can has some too. */
END

I_C_T NALIA 13 rh#AdrNalia1 // *Wonderful! Do you help people often? I have often wanted to get away from the keep and Aunty's rules. She doesn't understand that I just want to help people.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2410 /* <CHARNAME>... is this really necessary? */
END

I_C_T NALIA 14 rh#AdrNalia2 // *Very well, but if you reconsider, I've always wanted to travel. Do you help people often? I really like helping the less fortunate. I am told they work so hard.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2411 /* As low as my expectations of the Amnish nobility were, perhaps I should lower them further. */
END

I_C_T NALIAJ 136 rh#AdrNalia5 // *That was a nice thing to do, <CHARNAME>. Althought I'm sure you could spare a lot more...what are you saving up for? A golden sword?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("chapter","GLOBAL",%bg2_chapter_2%)~ THEN
@2412 /* I take it <CHARNAME>'s own monetary needs are irrelevant, or do you plan on whining at the Shadow Thieves as well? By all means, go ahead. It should prove entertaining, at least. */
END

I_C_T FIRKRA01 5 rh#AdrFirk1 // *I have no doubt your service will be exemplary. If all goes well, we shall all receive exactly what we deserve. My lands are on your map; the Windspear Hills await.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2413 /* Mm, that's quite the sum. Almost too good to be true, but certainly worth the hassle. */
END

I_C_T JAHEIRAJ 356 rh#AdrFirk2 // *I think it would be an excellent idea to get outside of the city and administer justice on such evil creatures. Tyranny is best matched with equal force.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2414 /* Spoken like a true tyrant, my lady Harper. */
== JAHEIRAJ @2415 /* Direct your venom elsewhere, mage. */
END

I_C_T SALVANAS 25 rh#AdrSalv1 // *Prepare...? Really? You...um...want to get a room, here? Well, I...I...I think I hear my captain calling! Yes, my captain! COMING, CAPTAIN!!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2416 /* Beautifully done, <CHARNAME>. */
== SALVANAS @2417 /* COMING!!! */
END

I_C_T LEHTIN 8 rh#AdrLehtinan // *(hurrrm...hurrrmmm) Very well. You look like one who might...appreciate...such entertainments. There is more to my little place than meets the eye.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2418 /* This... charming little establishment just got considerably more interesting. Shall we, my <LADYLORD>? */
== LEHTIN @2419 /* (hurrrm) The Copper Coronet aims to please... a customer with coin to spend. */
END

INTERJECT MADAM 0 rh#AdrMadam // *Greetings, my <LADYLORD>. I am Madame Nin, and I am here to ensure you are pleasantly accompanied. Are you interested in companionship, my <LADYLORD>?*
== RH#ADRJ IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN @2420 /* Sell your no doubt damaged goods to those who can't afford better, woman. */
== MADAM @2421 /* I see. Perhaps you should reconsider where you are then...and remember not to bother other customers with your puerile attitude. */
DO ~SetGlobal("MadamUpset","GLOBAL",1)~
EXIT

I_C_T COPGREET 7 rh#AdrCCgreet // *Slavery is such a harsh word, my <LADYLORD>. Here, we think of them as purchased employees...and an excellent source of entertainment! Go on in and witness it for yourself!*
== RH#ADRJ IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN
@2422 /* Purchased employees? At least have the courage to call it what it is. */
END

I_C_T HENDAK 1 rh#AdrHendak1 // *I beg of you, please from us! I have never begged before, and yet I do it now so I might wreak vengeance on Lehtinan and end his sick and twisted enterprise!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2423 /* Unbent, unbroken...after everything. Not that it has done him any good. Do what you will, <CHARNAME>. I care not. */
END

I_C_T HENDAK 18 rh#AdrHendak2 // *They have many children, yet, that they retain as slaves.  I would ask of you to rid the city of this infestation once and for all.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2424 /* Unlikely. New slavers will have moved in before the week is over, but I am not... adverse to paying these ones a short visit. */
END

I_C_T HAEGAN 0 rh#AdrHaegan // *You! How dare you! We were doin' good business in this town before you took out my partner, Lehtinan at the Copper Coronet! Why are you out to ruin me?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2425 /* You don't remember me, I see. No matter, I wasn't very memorable at the time. Once your corpse is cold, I expect to find you equally forgettable. */
== HAEGAN @2426 /* You! The Moonsea scum I barely managed to sell off last time! What is going on here!? */
END

I_C_T HAEGAN 4 rh#AdrHaegan2 // *Who in the Nine Hells are you? Why have you barged in here with drawn weapons and attacked my men? If you want to be buying some slaves from me you're going about it the wrong way.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2425 /* You don't remember me, I see. No matter, I wasn't very memorable at the time. Once your corpse is cold, I expect to find you equally forgettable. */
== HAEGAN @2426 /* You! The Moonsea scum I barely managed to sell off last time! What is going on here!? */
END

I_C_T GIRL2 5 rh#AdrSlaves1 // *O-okay! Thank you again, <SIRMAAM>! I am sure the Lady of Joy will smile on you!* (given money)
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2427 /* Well, it may well serve to get some of them home, if they can hold onto it long enough. The rest will no doubt end up as thieves, whores, or slaves in Calimshan. A glorious victory, <CHARNAME>. */
== GIRL2 @2428 /* That's n-not true! */
END

I_C_T GIRL2 4 rh#AdrSlaves2 // *O-okay! Thank you again, <SIRMAAM>! I am sure the Lady of Joy will smile on you!* (not given money)
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2429 /* And thus they shall no doubt end up as thieves, whores, or slaves in Calimshan. A glorious victory indeed, <CHARNAME>. */
== GIRL2 @2428 /* That's n-not true! */
END

I_C_T ANOMENJ 179 rh#AdrSlaves3 // *That such outrageous slavery has been allowed to exist in this city for so long sickens me to the stomach. It is a good thing that heroes such as we exist, no?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2430 /* Heroes? It would have been kinder by far to find the children a new master than to set them loose upon a foreign city with no means whatsoever. But I imagine a coddled knight such as yourself hasn't the life experience to understand that. */
== ANOMENJ @2431 /* Hold your tongue, fiend, lest I cut it out for you. That you would suggest selling innocent children into slavery once more is despicable, though I find it less and less surprising. */
END

// docks

CHAIN IF WEIGHT #-1 ~CombatCounter(0)
    See("rh#Adrian")
    InParty("rh#Adrian")
    !See([ENEMY])
    !StateCheck("rh#Adrian",CD_STATE_NOTVALID)
    RandomNum(2,1)
    Global("rh#celvanadrian","AR0300",0)~ THEN CELVAN rh#AdrCelvan
@2432 /* There once was a mage from the keep,
who followed his lords like a sheep.
His city in ashes,
a new life he snatches,
is it wisdom or ruin he'll reap? */
DO ~SetGlobal("rh#celvanadrian","AR0300",1)~
== RH#ADRJ @2433 /* And you wonder why I hate poetry! How in the hells-- */
EXTERN CELVAN 1

I_C_T ARLED 0 rh#AdrArled // *A fair day to you, my <LADYLORD>. I am afraid I can do no business with you until Gaelan wills it, however.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2434 /* And no amount of money might change your mind? */
== ARLED @2435 /* I'm afraid not, my lord. */
END

I_C_T BOOTER 0 rh#AdrBooter // *Oy...I'm Booter, th' official torturer of th' guild, here. 'Tis a foin job, ye sees...an' it requires more skill then anyone thinks, aye?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2436 /* Skill, certainly. Intelligence, apparently not. */
== BOOTER @2437 /* Ye best b' careful with that bearin', friend. I'd hates t' see ye on me table one day... well... mayhap I'd like it a' that, aye? */
== RH#ADRJ @2438 /* You'd best get in line. */
END

CHAIN IF WEIGHT #-1 ~!NumTimesTalkedTo(0) InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianMissy","GLOBAL",0)~ THEN ARNGRL01 rh#adarangirl1
@2439 /* HEY! Half-elf, don't you think I can't see you eyeing that coat! Yeah, I know it's pretty. You touch it, you'll be paying a price in blood! */
== RH#ADRJ @2440 /* Ah... my apologies. */
DO ~SetGlobal("rh#AdrianMissy","GLOBAL",1)~ 
EXIT

I_C_T ARNMAN03 0 rh#AdrArnman03 // *Heh...welcome to the guild, friend. We haven't met, yet...me name's Cuchul. Burglar extraordinaire. Best rooftop crawler this side o' Waterdeep, aye.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2441 /* I find that exceptionally hard to believe. */
END

I_C_T ARNMAN06 7 rh#AdrArnman06 // *(sigh) If only I'd known. I never would have come back. Although I suppose they'd have found me, eventually.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2442 /* They always do, don't they? */
END

I_C_T RENAL 17 rh#AdrRenal1 // *at that point I would offer you the position which poor Mae'vVar would be forced to vacate. How about it, <CHARNAME>? Interested in running your own guildhouse?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2443 /* A position with the Shadow Thieves... it's a fine offer, <CHARNAME>. */
== RENAL @2444 /* Yes, yes. The choice is ultimately <CHARNAME>'s. */
END

I_C_T RENAL 26 rh#AdrRenal2 // *but don't look on that as a threat, truly. We're all good friends here, right? If you change your mind, do come back and we'll talk again.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2445 /* Do reconsider, <CHARNAME>. The Shadow Thieves make for powerful friends. You could do much worse. */
END

I_C_T RENAL 30 rh#AdrRenal3 // *work for Mae'Var as long as it takes to collect your evidence, and bring whatever you can find to me. I'll be waiting to receive it most eagerly.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2446 /* Ah... the favor of the Shadow Thieves and a classic infiltration mission. Perhaps I shall find Athkatla to my liking after all. */ 
= @2447 /* Just remember, <CHARNAME>: you are a Shadow Thief now. You care about wealth and power, and you obey your masters without protest. Nothing is more important to you than success and advancement. The subtleties of...morality have little place in your world. */
== RENAL @2448 /* Advice to take to heart... if you could afford to have one now. */
END

I_C_T RENAL 47 rh#AdrRenal5 // *Well, the choice is yours. If you change your mind and wish to collect, I would consider it. I wouldn't wait too long, however. Eventually I'll do it myself.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2449 /* What, do you think your hands will be less bloody if you don't carry out the execution yourself? Don't be a fool, <CHARNAME>, and don't throw away good money. */
END

I_C_T RENAL 69 rh#AdrRenal4 // *Excellent, I look forward to seeing what you can do. Return to Mae'Var's vacant office. I will have it seeded with a few promising young thieves*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2450 /* Well done. Tying yourself this closely with the Shadow Thieves can only help our chances of success in Amn. Hopefully. */
END

I_C_T MAEVAR 13 rh#AdrMaevar // *Fetch me...the golden statuette acquired by the church. We need a centerpiece for the guild table. I care not how you get it, just keep the profile low.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2451 /* Heh. I doubt the Lathandrites would ever notice it's gone. */
END

I_C_T MAEVAR 15 rh#AdrMaevar // *You need not kill her to get it. She likely removes it in the night. As pleasing as it is, even it would leave a welt the size of a melon if slept upon.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2452 /* Hmm. I doubt a god like Talos would be offended by such trivial matters anyway. */
END

I_C_T EDWIN 0 rh#AdrEdwin1 // *Greetings. I am Edwin Odesseiron. You simians may refer to me merely as "Sir," if you prefer a less... syllable intensive workout.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2453 /* A rather odd place for a Red Wizard. */
== EDWIN @2454 /* I would not expect a second rate spellcaster to discern the aspirations that motivate one such as myself. */
END

I_C_T EDWIN 8 rh#AdrEdwin2 // *Good. Don't linger about then, get going! (Ugh, motivating these sloths is like pulling teeth)*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2455 /* Eliminating a Red Wizard's rival... lovely. It is nice to see the Shadow Thieves putting their resources towards such valuable tasks. */
== EDWIN @2456 /* Bah! You are hardly worthy of such distinguished work! */
END

I_C_T EDWIN 40 rh#AdrEdwin3 // *Mae'Var has been courting the Night Knives in order to bolster his own strategic position and betray Renal. Masterfully planned, but I have seen through it.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2457 /* Courting a Westhavian guild? In Athkatla? Audacious, if insane. */
== EDWIN @2458 /* Silence, fool. */
END

I_C_T EDWIN 30 rh#AdrEdwin4 // *A wise decision, lout. We should go to Mae'Var's room promptly. It's on the floor below this one.I have the key that will let us into his strongbox.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2459 /* We don't need the Red Wizard, <CHARNAME>. He has the social skills of a viper and as much a taste for treachery. You'd be better off without his dubious magical talents. */ 
== EDWIN @2460 /* Dubious? Don't think I did not hear that, oaf. */
END

I_C_T EMBARL 3 rh#AdrEmbarl2 // *I'm as good as dead, I know it! Please don't kill me, though... I've been faithful to the Shadow Thieves! I never wanted to get mixed up in this!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2461 /* I hope you're not actually considering sparing the fool, <CHARNAME>. */
END

CHAIN IF WEIGHT #-2 ~Global("rh#AdrianEmbarlJob","GLOBAL",1)~ THEN RH#ADRJ rh#AdrEmbarl1
@2462 /* I haven't noticed any likely spies, but that doesn't mean that none exist. You're playing a dangerous game, with dangerous people. This isn't the time to decide you don't like the stakes, <CHARNAME>. Any misstep is likely to get all of us killed. */
= @2463 /* As for the the thief... he's no innocent bystander. He's a Shadow Thief, a profession he's always known might one day cost him everything. Don't forget that. */
DO ~SetGlobal("rh#AdrianEmbarlJob","GLOBAL",2)~ 
EXIT

I_C_T BARONP 13 rh#AdrPloyer // *It is my gift to you. You will be slowly destroyed, just as my family was. It is my curse, my nasty, nasty curse. I little something I had made just for you.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2464 /* My, Harper, you certainly know how to make friends. */
END

I_C_T LYROS 19 rh#AdrXzar1 // *Excellent. Go to their building and return once you have found him. Short...halfling...thief... even one of your intellectual capacity can't miss him.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2465 /* And thus do we draw the Harpers' attention...and for little or no true purpose. Any information this Xzar knows was probably shared by the voices in his head. */
== LYROS @2466 /* Bah! Complain if you want. So long as you do as you're told, I care not. */
END

I_C_T JAHEIRAJ 388 rh#AdrXzar3 // *Be wary, <CHARNAME>, the Harpers will not brook interference lightly, and this Zhentarim likely holds only the worst of intentions in his heart.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2467 /* For once I agree with the Harper. This is a conflict I'd rather stay as far away from as possible. */
END

I_C_T RYLOCK 24 rh#AdrXzar4
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2468 /* And our grand reward... a knife in the back, no doubt. */
END

I_C_T RYLOCK 38 rh#AdrXzar5
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2469 /* Well, well... it's not quite Twilight Hall, but I suppose it'll do. */
END

I_C_T MERONIA 1 rh#AdrMeronia1 // *A little, but it may not make total sense. Harpers follow the Code and maintain the Balance. Both great evil and great good must be kept from getting out of hand.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2470 /* For being such proponents of individuality, it really is just the same nonsense over and over again, isn't it? */
END

I_C_T JAHEIRAJ 390 rh#AdrJaeXzar // *If the Harpers will even speak to us, which I doubt, they certainly will not reveal what they did with the halfling. Best not to ask about him directly.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2471 /* They've no doubt already killed the fool. */
END

I_C_T LUSETTE 7 rh#AdrLucette // *He could not lay low with such a flamboyant manner, and we knew of him quickly. You merely helped in the inevitable, and so you are free.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2472 /* Lucky us. Even for Harpers, this is convoluted. */
END

I_C_T JAHEIRAJ 100 rh#AdrJaeHarpers1a // *I...Yes, I see. If you would give me a moment I will do what needs be done.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2473 /* I don't like this, <CHARNAME>. I don't like this at all. */
END

I_C_T JAHEIRAP 9 rh#AdrJaeHarpers2a // *Hail there! I said I would return, and I have. Sorry to have kept you waiting, but there were things I had to take care of. Now that we have met once again there is something I must ask of you. We must go...we must go to the Harper hold in Athkatla.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2474 /* I'm sorry, but *what*? */
== JAHEIRAP IF ~Global("rh#AdrianZhent","GLOBAL",1)~ THEN 
@2475 /* You have nothing to fear, Zhent. You are not as interesting as you think you are. It is <CHARNAME> whom they wish to see. */
== JAHEIRAP IF ~!Global("rh#AdrianZhent","GLOBAL",1)~ THEN 
@2476 /* Do not interrupt, Adrian. It is <CHARNAME> whom they wish to see. */
END

I_C_T JAHEIRAP 8 rh#AdrJaeHarpers2b // *There you are! I...I missed you while I was gone. I mean...well, I am glad to see you. I must tell you, however, that we must go to the Harper Hold in Athkatla.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2474 /* I'm sorry, but *what*? */
== JAHEIRAP IF ~Global("rh#AdrianZhent","GLOBAL",1)~ THEN 
@2475 /* You have nothing to fear, Zhent. You are not as interesting as you think you are. It is <CHARNAME> whom they wish to see. */
== JAHEIRAP IF ~!Global("rh#AdrianZhent","GLOBAL",1)~ THEN 
@2476 /* Do not interrupt, Adrian. It is <CHARNAME> whom they wish to see. */
END

INTERJECT DCLERIC 0 rh#AdrCyricist // *YOU! Bow, worm, and pray that Cyric allows you to become one of His holy worshippers! Cast aside whatever false god you pray to and embrace the Prince of Lies in all His majesty!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2477 /* Majesty? Your damned Dark Sun doesn't know his head from his arse. Granted, from the looks of it, neither do you. */
== DCLERIC @2478 /* BLASPHEMER! TRAITOR! RRRRAAAAAAGH! */
DO ~Enemy()~
EXIT

// government district

I_C_T KAYL2 25 rh#AdrPaladins // *Recently one of our highest-ranking officers was implicated in smuggling slaves. His name is Anarg, and though he was once a friend, he was expelled from the Order.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2479 /* Paladins, smuggling slaves? Oh, where is a proper bard when you need one? */
END

I_C_T VICONI 9 rh#AdrViccy1 // *No! Nau! Oloth plynn d'jal!!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2480 /* I've had enough of witch-hunts... <CHARNAME>, please. Do something. */
END

I_C_T VICONI 2 rh#AdrViccy2 // *It would be both a privilege and an honor to join you, <CHARNAME>. What say you to my proposal?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2481 /* She would be a powerful ally, but for the inevitable betrayal. */
== VICONI @2482 /* You know nothing of treason, surfacer. */
END

I_C_T KELDORJ 179 rh#AdrViccy4 // *And justice is done.  If all evil could meet such a fate, perhaps right would be restored to this world. I have pledged myself to such a cause, in Torm's name.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN
@2483 /* Of course. Only the suffering of the righteous matters. */
== KELDORJ @2484 /* Evil-doers have earned whatever misery befalls them tenfold, mage. It is little compared to the fate that awaits them in the Abyss. */
== RH#ADRJ @2485 /* To the hells with you too, paladin. */
END

I_C_T CORNEIL 11 rh#AdrCorny1 // *Ahh? I see. Very well, then, my <LADYLORD>. You and your companions will have the right, for now, to cast magic within the city. Do not abuse the privilege or you will lose it.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2486 /* Oh... I don't plan on abusing it at all. Thank you, <CHARNAME>. */
== CORNEIL @2487 /* See to it that you don't. */
END

I_C_T CORNEIL 13 rh#AdrCorny2 // *Fine. Should you change your mind, I shall still be here.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2488 /* <CHARNAME>, I'd rather not be helpless because you didn't want to spend a bit of gold. Unless you plan on taking down the whole damn order. */
END

I_C_T TOLGER 8 rh#AdrTolger1 // *We will offer you an item of substantial magical power as well as a good deal of gold coin. But, again, I must have your word on the matter before I continue.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2489 /* Words are tricky things... if he plays you fair, so be it. If not, I dare say he has broken the contract himself. */
END

I_C_T TOLGER 18 rh#AdrTolger2a // *We do not ask that you commit any murder. We wish Valygar be delivered to us, that is all. He will likely resist, so if you must kill him so be it.*
== RH#ADRJ IF ~GLOBAL("KnowsCowledBribe","LOCALS",1) InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2490 /* Killing the fool may prove kinder. I'm not adverse to courting the Cowled Wizards a bit more, <CHARNAME>, whether or not this story be true. */
END

I_C_T DELON 6  rh#AdrDelon // *I'm not looking for any one p-p-person, <SIRMAAM>. I was sent to find someone who could h-help my village. Terrible things are happening there, and nobody knows what to do!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2491 /* Village? Can't we go find someone who can pay instead? */
== DELON @2492 /* P-p-please... */
END

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianGNoble","GLOBAL",0)~ THEN GNOBLEF1 rh#adrgnoblef1
@2493 /* Excuse me, half-elf? My lord husband has been searching for a new manservant and you-- */
= @2494 /* You... you hit me! You barbaric peasant! */
== RH#ADRJ @2495 /* If your face scars, that was probably the signet ring. We like them sharp back home. */
DO ~ActionOverride("GnobleF1",RunAwayFrom("rh#Adrian",120)) SetGlobal("rh#AdrianGNoble","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianGNoble","GLOBAL",0)~ THEN GNOBLEF2 rh#adrgnoblef2
@2493 /* Excuse me, half-elf? My lord husband has been searching for a new manservant and you-- */
= @2494 /* You... you hit me! You barbaric peasant! */
== RH#ADRJ @2495 /* If your face scars, that was probably the signet ring. We like them sharp back home. */
DO ~ActionOverride("GnobleF2",RunAwayFrom("rh#Adrian",120)) SetGlobal("rh#AdrianGNoble","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianGNoble","GLOBAL",0)~ THEN GNOBLEM1 rh#adrgnoblem1
@2496 /* You there! Half-elf! I have been searching for a new manservant and you-- */
= @2494 /* You... you hit me! You barbaric peasant! */
== RH#ADRJ @2495 /* If your face scars, that was probably the signet ring. We like them sharp back home. */
DO ~ActionOverride("GnobleM1",RunAwayFrom("rh#Adrian",120)) SetGlobal("rh#AdrianGNoble","GLOBAL",1)~ 
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianGNoble","GLOBAL",0)~ THEN GNOBLEM2 rh#adrgnoblem2
@2496 /* You there! Half-elf! I have been searching for a new manservant and you-- */
= @2494 /* You... you hit me! You barbaric peasant! */
== RH#ADRJ @2495 /* If your face scars, that was probably the signet ring. We like them sharp back home. */
DO ~ActionOverride("GnobleM2",RunAwayFrom("rh#Adrian",120)) SetGlobal("rh#AdrianGNoble","GLOBAL",1)~ 
EXIT


CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianGFTown","GLOBAL",0)~ THEN GFTOWN01 rh#adrgtown1
@2497 /* You! Another elven spy in our midst, no doubt! */
== RH#ADRJ @2498 /* Oh, yes. I plan to bring all your worthless secrets back to Myth Drannor. Well, what's left of it, at least. */
DO ~SetGlobal("rh#AdrianGFTown","GLOBAL",1)~
EXIT

// temples

I_C_T SCSARLES 11  rh#AdrSarles // *Now go! I will work for whatever church acquires the necessary materials! If not yours, then another! 200 pounds of illithium or I go back to enjoying my holiday!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2499 /* I'd love the see the look on the priests' faces if we brought the fool's corpse back instead. Granted, they could just raise him again. */
END

I_C_T BHARVAL 16  rh#AdrHarval2 // *May the Morninglord light the way. We have healing and tools for you here should you need them. Merely ask one of our acolytes and they shall provide.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2500 /* I may not particularly care for the Morninglord, but working against upstart gods... *that* is a task to be relished. */
END

I_C_T BHNALLA 15  rh#AdrNalla // *Then may the force of Talos destroy those in your path. The services of the temple are here for you. Demand service from an acolyte and you will receive it.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2501 /* ...it's almost like being home again. Still, working against upstart gods... *that* is a task to be relished. */
END

I_C_T BHOISIG 18 rh#AdrOisig // *May the Great Guard give light to all wrongs against you. You may seek healing and tools to aid you here as you need. Ask an acolyte and you will receive.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2502 /* I may not worship Helm, but working against upstart gods... *that* is a task to be relished. */
END

I_C_T KELDOR 2  RH#AdKel // *Come, let us seal our fates together and seek it out. I was instructed to await the group that I would aid in this matter. It is my duty to serve for the greater good.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2503 /* Let him serve the greater good *elsewhere*, <CHARNAME>. */
END

I_C_T GAAL 4  rh#AdrEye1 // *He is the most ancient and wise of the race you might know as 'beholders'. We servants have flocked to him gladly, and his mightly power protects us. YOu would be wise to serve him as we do.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2504 /* A beholder cult? Here? Interesting. */
END

I_C_T SASSAR 20  rh#AdrEye3 // *Be careful in the levels below, and remember that the gods will likely not allow one to take the artifact for themselves for long. Remember that! Godspeed!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2505 /* First, shameless deicide, and now long lost artifacts of immense power... I'm enjoying this quest more and more. */
== SASSAR @2506 /* Do not let lust for power get the better of you, mage, unless you wish a fate such as ours. */
END

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianPostul4","GLOBAL",0)~ THEN POSTUL4 rh#adrpostul
@2507 /* Haven't ye got yer own silly elven gods to pray to? Why do they let ye in here with the true believers anyway? */
== RH#ADRJ @2508 /* I have no interest in the Seldarine. Be glad Azuth doesn't condone the reckless use of magic... you'd be on fire right now if he did. */
= @2509 /* Granted, if I can just pay my way back into his favor, I may make an exception. */
== POSTUL4 @2510 /* I... ah... */
DO ~SetGlobal("rh#AdrianPostul4","GLOBAL",1) ActionOverride("Postul4",RunAwayFrom("rh#Adrian",120)) ~
EXIT

// bridge district

I_C_T BBEGG1 1 rh#AdrBeggar // *Bless you, my <LADYLORD>! You are a sweet and generous soul...my mother will be indebted to you forever!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2511 /* Hells, <CHARNAME>. At least save your generosity for someone slightly more convincing. */
== BBEGG1 @2512 /* Bah! Shut your trap, mage! */
END

I_C_T BMERCH1 2 rh#AdrBMerch1 // *Don't force me to get the whip out, you moronic twits! Keep loading, I say! Keep loading!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2513 /* Oh, this is almost comically stupid. */
END

I_C_T INSPECT 13 rh#AdrInspect1 // *He flays them... alive. There has been blood all over the area. Little Faraji, a local urchin, found the latest victim. I hate to think of a child seeing that.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2514 /* Better to see than to experience. This isn't religiously inspired, is it? */
== INSPECT @2515 /* No, there is no evidence that the intent here is sacrifice. No evidence of any clear intent at all. */
END

I_C_T SAFE RAELIS 33  rh#AdrRaelis // *I...I am sorry, good folk of the audience. As you can see, things are not right with our troupe due to circumstances beyond our control.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2516 /* Circumstances beyond one's control... such as lack of talent, perhaps? */
END

I_C_T AMSI 9 rh#AdrAmsi // *I...I couldn't! I can't...I can't stand the blood!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2517 /* Listen to this nonsense. If you can't compete, stay away from the damn game. */
END

I_C_T EDWINJ 80 rh#AdrElgea2 // *Wait <CHARNAME>! There is no reason that we cannot ransom this lady off ourselves, yes? There is no reason we cannot profit from this!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2518 /* Loath as I am to admit it, the Red Wizard has a point. */
END

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) !Global("rh#DamarovQuest","GLOBAL",4) Global("rh#AdrianFFCust01","GLOBAL",0)~ THEN FFCUST01 rh#adrercias13
@2519 /* You... half-elf, ye looks a bit familiar. Do I know ye? */
== RH#ADRJ @2520 /* ...I hope you're not implying that we all look alike. */
== FFCUST01 @2521 /* Bah! Close enough. */
== RH#ADRJ @2522 /* Hmm. You should have kept your mouth shut, friend. */
DO ~SetGlobal("rh#AdrianFFCust01","GLOBAL",1)
SetGlobal("rh#Adrian_spydies","GLOBAL",1) RealSetGlobalTimer("rh#Adrian_spydies_timer","GLOBAL",1800)~
EXIT

//trying to get Ercias/Jaheira global to set properly
INTERJECT JAHEIRAJ 368 rh#erciasjaheira
== FFCUST01 @2523 /* Er... no, no I don't think so.  I must be going, actually... */
DO ~SetGlobal("rh#ErciasDead","GLOBAL",1) EscapeArea()~
== JAHEIRAJ @2524 /* I see.  A Zhentarim agent, if I recall, but one of no consequence.  Pay him no heed, <CHARNAME>. */
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianBProst1","GLOBAL",0)~ THEN BPROST1 rh#adrbprost
@2525 /* Well, aren't you a pretty one, half-elf? Would you care to-- */
== RH#ADRJ @2526 /* Laugh in your face? I'm certainly about to. */
DO ~SetGlobal("rh#AdrianBProst1","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianBFTown1","GLOBAL",0)~ THEN BFTOWN1 rh#adrbftown1
@2527 /* You know... it's a shame that they let mages walk the streets! Those sorcerers shouldn't be allowed to show their faces! */
== RH#ADRJ @2528 /* Keep it up, woman, and you won't have a face to show at all. */
DO ~SetGlobal("rh#AdrianBFTown1","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianBFTown3","GLOBAL",0)~ THEN BFTOWN3 rh#adrbftown3
@2529 /* You... you look so angry, sir! You're not a murderer, are you? */
== RH#ADRJ @2530 /* Not in this country, no. I could change that if you'd like. */
DO ~ActionOverride("BFTown3",RunAwayFrom("rh#Adrian",120)) SetGlobal("rh#AdrianBFTown3","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~InParty("rh#Adrian") See("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) RandomNum(2,1) Global("rh#AdrianBurch","GLOBAL",0)~ THEN BURCH2 rh#adrburch2
@2531 /* MY MOTHER SAYS THAT SORCERERS ARE DEMONS THAT SHOULD BE BURNT AT THE STAKE. */
== RH#ADRJ @2532 /* How very creative of her. You'd best wander off before I give her another reason to say that. */
DO ~SetGlobal("rh#AdrianBurch","GLOBAL",1)~
EXIT

INTERJECT BNOBLE1 2 rh#AdrFeveron // *(sigh) Very well. My...apologies...commoner. Your smell offends me almost as much as your demeanor, but as a noble I must learn to tolerate both. Now go away.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN @2533 /* Why don't you crawl into a hole and die, my lord Feveron? I'd be happy to help you along. */
== BNOBLE2 @2534 /* Why, I never! */
== BNOBLE1 @2535 /* My lady, these peasants simply do not know their places! */
== RH#ADRJ @2536 /* My place? My place is leagues higher than yours, you inbred southern freak, I can assure you of that much. */
== BNOBLE1 @2537 /* You dare insult my ancestry, peasant? Do you have any idea who-- */
== BNOBLE2 @2538 /* My lord... my lord, perhaps it's best-- */
== RH#ADRJ @2539 /* This whole damn country is a joke, my lord Feveron, but you... unless you're descended from the king of old Netheril, I don't give a damn who you are. And even a lineage like that... */
BRANCH ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ BEGIN
  == BNOBLE2 @2540 /* Eek! */
  == KELDORJ @2541 /* Adrian! Adrian, that is enough! You will cease this madness immediately. */
  == RH#ADRJ @2542 /* Did you honestly just jump me, paladin!? Get your hands off of me! */
  == KELDORJ @2543 /* Not until you have regained your senses. I shall not allow you to murder these people. */
END
BRANCH ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID) OR(3) !InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ BEGIN
  == BNOBLE2 @2540 /* Eek! */
  == MAZZYJ @2544 /* Adrian! Adrian, that is enough. Stop it this minute! */
  == RH#ADRJ @2545 /* Did you honestly just jump me, halfling!? You're half my size! Get your hands off of me! */
  == MAZZYJ @2546 /* I may be half your size, but I shall not allow you to murder these people. Come to your senses! */ 
END
BRANCH ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) OR(3) !InParty("Mazzy") !InMyArea("Mazzy") StateCheck("Mazzy",CD_STATE_NOTVALID) OR(3) !InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ BEGIN
== BNOBLE2 @2540 /* Eek! */
== JAHEIRAJ @2547 /* Adrian, that is enough. You will not hurt these people. */
== RH#ADRJ @2548 /* Get your hands off of me, Harper! */
== JAHEIRAJ @2549 /* Not until you have come to your senses. Assuming you even have any. */
END
END
     + ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) OR(3) !InParty("Mazzy") !InMyArea("Mazzy") StateCheck("Mazzy",CD_STATE_NOTVALID) OR(3) !InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @2550 /* (grab him before he can cast something) */ EXTERN RH#ADRJ rh#AdrFeveron2
     + ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) OR(3) !InParty("Mazzy") !InMyArea("Mazzy") StateCheck("Mazzy",CD_STATE_NOTVALID) OR(3) !InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @2551 /* Oh, this should be good. */ EXTERN BNOBLE2 rh#AdrFeveron4
     
IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) OR(3) !InParty("Mazzy") !InMyArea("Mazzy") StateCheck("Mazzy",CD_STATE_NOTVALID) OR(3) !InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ EXTERN RH#ADRJ rh#AdrFeveron3
IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID) OR(3) !InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ EXTERN RH#ADRJ rh#AdrFeveron3
IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ EXTERN RH#ADRJ rh#AdrFeveron3

CHAIN RH#ADRJ rh#AdrFeveron2
@2552 /* Ow! Get your hands off me, <CHARNAME>! I... */
= @2553 /* Fine, fine. I won't kill the bastard. Let's just... get out of here. */
== BNOBLE2 @2554 /* I warned you you would start a riot, my lord! */
DO ~ActionOverride("diana",EscapeArea()) ActionOverride("feveron",EscapeArea()) SetGlobal("rh#Adrian_guardsescape","AR0500",1)~
EXIT

CHAIN RH#ADRJ rh#AdrFeveron3
@2553 /* Fine, fine. I won't kill the bastard. Let's just... get out of here. */
== BNOBLE2 @2554 /* I warned you you would start a riot, my lord! */
DO ~ActionOverride("diana",EscapeArea()) ActionOverride("feveron",EscapeArea()) SetGlobal("rh#Adrian_guardsescape","AR0500",1)~
EXIT

CHAIN BNOBLE2 rh#AdrFeveron4
@2540 /* Eek! */
DO ~ActionOverride("rh#Adrian",ReallyForceSpell("feveron",WIZARD_MAGIC_MISSILE)~ EXIT

// graveyard

I_C_T TIRDIR 9 rh#AdrTirdir1 // *I...I thank you for saving my life. But I am still in danger! <cough!> You...look capable with your weapons...please find these men and stop them!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2555 /* <CHARNAME>, leave it to the garrison. They're paid to handle this sort of nonsense. We have better things to do. */
END

I_C_T TIRDIR 5 rh#AdrTirdir2 // *I woke up with this in my hand...I think I must have torn it off his shirt when he threw me in the grave. Here...perhaps it will help you find him.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2555 /* <CHARNAME>, leave it to the garrison. They're paid to handle this sort of nonsense. We have better things to do. */
END

// city gates

I_C_T CROTHF02 12 rh#AdrLovers1 // *Thanks <CHARNAME>! We owe this all to you!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2556 /* Larger than life... if they're lucky, they won't live to regret it. */
END

I_C_T CROTHF02 8 rh#AdrLovers2 // *Maybe I don't want to be quiet. How about you, stranger? Should I be quiet?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2557 /* Unless you want to die horribly, my lady, I'd recommend it. */
END

// umar hills & temple

I_C_T VALYGAR 4 rh#AdrVal1 // *I have no desire to meet my ancestor, and even less desire to help the Cowled Wizards, who seem certain that my body is the only key to the sphere... alive or no.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2558 /* Hmm. Little wonder the wizards proved less than forthcoming. They're dangerous people to cross, <CHARNAME>, though I suppose a longer game could prove... profitable. Be careful. */
END

I_C_T UHMAY01 20 rh#AdrUH1 // *Herrrm...well, my village is in dire need. I'll tell you what...if you end the murders, I will give you the armor that belonged to our first ranger protector.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2559 /* Unless it cost more than this whole village, I'm unimpressed. */
END

I_C_T UHMAY01 18 rh#AdrUH2 // *Yes...true. I suppose I should warn you... I've already hired the famous knight, Mazzy Fentan, and her troupe...but they haven't been back.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2560 /* Folk legend? If anything, it's someone taking advantage of folk legend. Let the famous knight handle it, <CHARNAME>. That's what they're good for. */
END

// the keep

I_C_T NALIA 9 rh#AdrNalia3 // *You are very cruel. My family will be papers...think of the servants we employ. We are kind, and I have given more than my share to those less fortunate.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2561 /* Pathetic. Absolutely pathetic. Your family will have finally fallen to a state fitting its timid nature, it would seem. */
END

I_C_T DELCIA 1 rh#AdrDelcia1 // *I dare say I have tried to wean Nalia off such charities, but I have failed. Why else would such as you be here? You sound like a noble, but you are obviously more adept at arms than societal graces.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN @2562 /* In some parts of the world, the two are indistinguishable, though I'd hardly expect such sense from an inbred southern dilettante. Show the proper respect when addressing your betters, woman, or you may yet find yourself decorating the slave quarters of a Calishite pasha. */
== DELCIA IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN @2563 /* Must I ever be subjected to such coarse manners? Your threats do not interest me in the slightest, peasant. */
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN @2564 /* ...hells, sometimes I wish I still worshiped a god who condoned the spectacular misuse of magic. */
== DELCIA @IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 2565 /* Your petty concerns are of little enough value to one of my station. I believe I was speaking with your employer. */
END

I_C_T DELCIA 7 rh#AdrDelcia2 // *Nalia sent you, didn't she? Only she would know where to get such ruffians. Consorting with servants will leave her dead like her softhearted mother, earning a virulent fever for her charitable excesses.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2566 /* I can't decide whether you're mad or stupid, though I suppose I shouldn't expect more from an inbred southern dilettante. Show the proper respect when addressing your betters, woman, or you may yet find yourself decorating the slave quarters of a Calishite pasha. */
== DELCIA @2563 /* Must I ever be subjected to such coarse manners? Your threats do not interest me in the slightest, peasant. */
== RH#ADRJ @2564 /* ...hells, sometimes I wish I still worshiped a god who condoned the spectacular misuse of magic. */
== DELCIA @2565 /* Your petty concerns are of little enough value to one of my station. I believe I was speaking with your employer. */
END

I_C_T ISAEA 29 rh#AdrIsaea // *Don't take it so hard; I am just better than you. Oh, feel free to lodge a complaint to the proper authority. That would be... me.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2567 /* Ha! We're off to rescue the princess now, I hope? If only to wipe that ugly sneer off of dear Mister Roenal's face? I'm sure a man like that leaves a paper trail a mile long, out of sheer stupidity if nothing else. */
END

// trademeet

I_C_T TRGENI01 6 rh#AdrGenie // *We Dao buy all that comes here, you see, and charge prices too high for the mortals to afford... and we will not relinquish it until the mortals find this rakshasa for us.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2568 /* Ha! That's really quite clever. */
== TRGENI01 @2569 /* It is, is it not? */
END

I_C_T CELOGAN 21 rh#AdrLogan // *What I would have you do is escort him to his task, or see to it yourselves, whichever you prefer. I would seem to be collaborating if my men or I were to help him, and alone he may not make it out of town. Will you help?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2570 /* (smile) We might as well help this poor merchant town in its hour of need, <CHARNAME>. I dare say its pockets are deep enough. */
== CELOGAN @2571 /* What say you, <CHARNAME>? */
END

I_C_T CELOGAN 86 rh#AdrLogan2 // *This can only end in bloodshed. I cannot offer the gold that the nobles have, but in the name of peace I ask that you bring the mantle to me once it is found.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2572 /* Peace? What is peace worth in the end? Let the so-called nobles kill each other if they can't control themselves... no real loss, I suspect. */
END

I_C_T TREVIL01 16 rh#AdrTRevil // *Within moments, more druids burst in casting spells at my men! They trussed me up with vines and roots! Kept us tied up all afternoon, lecturing about nature and other garbage.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2573 /* A lovely mental image, if ever there was one. */
END

I_C_T TREVIL01 22 rh#AdrTRevil2 // *There is an evil spirit in the Grove that desires nothing less than the destruction of this town and all within it. Logan, that fool, ignores this!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2574 /* Ha! This Lord Menold talks well, for a pompous bastard, but I doubt he has half as much to offer as Coprith, or that he'll remember his former friends even if he does come to power. If you want to play this game for the sheer entertainment value, though, I won't try to stop you. */
== TREVIL01 @2575 /* Hmph. I shall let that pass. */
END

EXTEND_BOTTOM TRGYP02 2
IF ~!InPartySlot(LastTalkedToBy,0)
    Name("rh#Adrian",LastTalkedToBy)~ THEN GOTO rh#AdrGypsy
END

CHAIN TRGYP02 rh#AdrGypsy 
@2576 /* There is much anger in you, half-elf, forged into a weapon you would use to keep at bay those who need not be your foes. Take care, lest you turn it upon yourself. */ 
== RH#ADRJ @2577 /* Neither you nor your vague threats impress me, charlatan. */ 
EXIT 

// windspear hills

I_C_T GARREN 1 rh#AdrGarren1 // *I wonder if I saw what I think I saw. You were all ogres fighting, yet deaths yielded human bodies. Now there are no monsters, only you and these slain knights.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2578 /* Hells! To be taken in by such an illusion! */
END

I_C_T GARREN 18 rh#AdrGarren2 // *He sought my lands, so he discredited me. There were missing people only he could find, banditry only he could stop. Solutions to problems I am sure he caused.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2579 /* A common enough tactic. */
END

I_C_T FIRKRA02 0 rh#AdrFirk3 // *Welcome. You have come as I wanted. It has been an interesting game, but to tell the truth, I tire of it.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2580 /* Hells! That... dragon... ancient dragon... */
== FIRKRA02 @2581 /* As I said, <CHARNAME>, both you and your... courageous companions have come to bore me. */
END

I_C_T FIRKRA02 21 rh#AdrFirk4 // *Now walk away, and see to your little rescue efforts. Take your time. Enjoy life. You have much to face.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2582 /* If the ancient red dragon doesn't want a fight, <CHARNAME>, I'd happily refrain... */
== FIRKRA02 @2583 /* You are a brave one, are you not? One wonders where you find the courage even to run. */
END

// working for Aran

I_C_T GAELAN 66 rh#AdrGaelan1 // *Remember, it's northwest in the Docts district. As unlikely as it seems, Shadow Thieves will prove to be the least of all evils you will encounter.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2584 /* I can believe it. Step carefully, <CHARNAME>, we're dealing with the powers that be now. */
== GAELAN @2585 /* Yes. Don't doubt that for a moment. */
END

I_C_T ARAN 51 rh#AdrAran1 // *First and foremost, you will be compensated for the gold you have paid. I will give you several magical items; they are yours to keep regardless of what comes.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2586 /* Oh, I would happily take a look at those. Hopefully they're even worthwhile. */
END

I_C_T ARAN 53 rh#AdrAran2 // *No, no, no, everything is as it should be. There are merely some added difficulties that we have encountered. I regret that I must ask a few tasks of you.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2587 /* You *charge* us to perform services for you, Shadow Master? That's bold. */
END

I_C_T ARAN 3 rh#AdrAran3 // *Go at night, and you will find my present guard captain there already; a woman by the name of Mook. Take note of anything odd that happens and report to me.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2588 /* A simple task, if ever there was one. I do appreciate the lack of dungeons. */
== ARAN @1840 /* As you should. */
END

I_C_T SAFE ARAN 20 rh#AdrAran4 // *They may prove unreasonable, so prepare yourself for hostility. Return when you have the information we need.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2589 /* Hunting traitors, are we? Well, better than the reverse. */
END

I_C_T ARAN 40 rh#AdrAran5 // *You must realize that it is not as simple as launching an assault. Spellhold is a fortress asylum, designed to hold mages and other... talented people.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2590 /* A fortress prison for mages... of course. Wonderful. */
END

// working for Bodhi

I_C_T BODHI 1 rh#AdrBodhi1 // *You may be concerned about why we must meet here. There are a number of reasons, only a few of which you need worry about. First, I shall introduce myself. I am Bodhi.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2591 /* Be careful, <CHARNAME>. I know a vampire when I see one, even if this one is... stranger than most. */
END

I_C_T BODHI 6 rh#AdrBodhi2 // *I would offer an alternative. I would help you find your friend for...oh... 15,000 gold? It is a sizeable amount less than the Shadow Thieves have asked and, coincdentally, it is what you have now.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2592 /* Don't do it, <CHARNAME>. She'll drain you dry and leave you for dead when she's finished using you. */
== BODHI IF ~Class("rh#Adrian",SORCERER)~ THEN @2593 /* From a man like you, that is quite the accusation, sorcerer. Be silent. */
== BODHI IF ~!Class("rh#Adrian",SORCERER)~ THEN @2594 /* From a man like you, that is quite the accusation, wizard. Be silent. */
END

I_C_T BODHI 56 rh#AdrBodhi4 // *You will rescue him. He will be killed once they are through, so go quickly. They have him at the Shadow Thief guild house on the ssecond floor. You know the building, I think?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2595 /* The vampire sends us to rescue a man? I wonder what he knows. */
END

I_C_T BODHI 49 rh#AdrBodhi5 // *He will die easy, though there may be guards. His small house is in the Government District between the Jail and the Government Building. Go.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2596 /* Oh. Well, that's not so terrible. */
END

I_C_T BODHI 72 rh#AdrBodhi6 // *You must invade their lair for one last time. You must kill Aran Linvail, the Shadow Master. Do this for me and our arrangement will be fulfilled.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2597 /* Kill the Shadow Master? That's... ambitious. */
END

I_C_T BODHI 82 rh#AdrBodhi7 // *There is a caveat, however. When you find Irenicus he is to be mine as well. His death is not to come until we have both been satisfied.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2598 /* I would have liked to have known of this caveat earlier. */
== BODHI @2599 /* Your time of choice has long since passed. */
END

I_C_T BODHI 106 rh#AdrBodhi8 // *Spellhold is an asylum, a space designed to hold mages and other... talented people. Even in this magically repressive society it would be considered cruel.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2600 /* A fortress prison for mages... of course. First she wants us to spare her wretched brother, and now... this. */
END

// Brynnlaw

I_C_T PPSAEM 54 rh#AdrSaemon1 // *Yes, well, I thought they might be pirates, so I merely displayed a series of lights that mirrored their own. I wished to appear as though I was one of their own.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2601 /* As simple a task as breathing, no doubt. */
== PPSAEM @2602 /* Well, yes. They are none too intelligent. */
END

I_C_T PPSAEM 15 rh#AdrSaemon2 // *Yes, well, I thought they might be pirates, so I merely displayed a series of lights that mirrored their own. I wished to appear as though I was one of their own.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2601 /* As simple a task as breathing, no doubt. */
== PPSAEM @2602 /* Well, yes. They are none too intelligent. */
END

I_C_T PIRCOR02 13 rh#AdrGinia // *He put me to work as a courtesan for the drunken pirates. It's horrible, <SIRMAAM>! He says he'll kill my brother Ason if I don't do it.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2603 /* She's lucky he hasn't killed her brother and forced her into prostitution anyway. Or worse. This Desharik likes his power games, I dare say. But then, who doesn't? */
END

I_C_T PPTIAX 1 rh#AdrTiax // *Tiax rules all from this throne room! You are all servants of his majesty, even as you feign ignorance!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2604 /* There's nothing quite like insane megalomania to make a man homesick. */
END

I_C_T PPNALJ 3 rh#AdrNalj // *Shouldn't look so far... it looks back... but now I don't care. I collect my pretties. Shiny things... pretty...*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2605 /* I'm sure they are. <CHARNAME>, why are we even talking to these freaks? */
END

I_C_T YOSHJ 113 rh#AdrYoshBetrayal // *I apologize, <CHARNAME>. There are circumstances that you are not aware of.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2606 /* I expected little from you, thief, but treachery such as this... rest assured, Yoshimo, there will be a special hell reserved for you! */
END

I_C_T PPBODHI4 13 rh#AdrBodhi9 // *It has been some time since I have given chase to a worthy foe. Enter the maze of this place and seek an exit. I give you time to run, after which I will come to feed.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2607 /* Like a cat with a couple of mice, is it? You'll regret this, vampire. With your life. */
== PPBODHI4 @2608 /* So you say, but I very much doubt it will come to that. */
END

I_C_T PPSAEM2 7 rh#AdrSaemon3 // *The inmates of this place are a resource to be tapped. Release them and their anger and frustrations will strike at Irenicus.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2609 /* Those lunatics are hardly my idea of a decent army, but magic is magic, and even a mad wizard can be of use. */
END

I_C_T PPIRENI2 35 rh#AdrIrenicus // *You tortured those here long before I arrived.I merely had more purpose to do it. Bah, I speak with madmen when I should be at my revenge.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2610 /* You...you can take your own dreams of revenge with you to your grave, wizard! Ours has waited long enough! */
== PPIRENI2 IF ~OR(3) !InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) OR(3) !InParty("Minsc") !InMyArea("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID) OR(3) !InParty("Imoen2") !InMyArea("Imoen2") StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @2611 /* Bah! Your pathetic mewlings mean even less to me than <CHARNAME>'s! */
END

I_C_T PPSAEM3 1 rh#AdrSaemon6 // *I have no ship with which to offer passage. It has been scuttled in an act of the purest malice. Such villainy I am subjected too!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2612 /* And you need our help now, no doubt. I'd sooner kill you and swim home. */
END

// Suhuagin City

I_C_T SAHKNG01 36 rh#AdrSahuagin1 // *Hunt down the rebel leader for me, my <PRO_RACE>...bring me his heart and I shall reward you with great riches!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN @2613 /* ...assuming the lunatic fish has anything of real value. */
END

I_C_T SAHBEH01 25 rh#AdrBeholder // *Keep in mind that the drow who summoned me was mad. But hey, who am I to judge, I suppose. I've been playing tic-tac-toe with a pair of imps for sixty years.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN @2614 /* Do you win, at least? */
== SAHBEH01 @2615 /* What? Of course I win. Didn't I say that they were *imps*? */
== RH#ADRJ @2616 /* Then you're saner than you could be. */
== SAHBEH01 @2137 /* True enough, I suppose. */
END

// Underdark

I_C_T UDVITH 10 rh#AdrVithim1 // *This spot is 'thin,' and careful spells may breach the walls between dimensions. On the other side one might find some valuable magic, if one knows where to look.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2617 /* Thin spots in the boundaries between dimensions? That's considered heresy by most theorists, last I heard. */
== UDVITH @2618 /* Indeed, it is. Incorrectly, I have come to believe. I spent several years before my imprisonment researching the particulars... a search that led me to this cavern. */
== RH#ADRJ @2619 /* Fascinating. <CHARNAME>, if we could stay here a bit longer, I'd like to see the results. */
END

I_C_T UDVITH 41 rh#AdrVithim2 // *I return! Ahh, it is good to have the Prime Material under my feet. There is beauty on the other side, but it is not my home.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2620 /* Do you know what plane you found there? */
== UDVITH @2621 /* It is hard to say for certain, as the planes are infinite. This, I believe, was a demiplane, created long ago by a powerful wizard. Elven, I would hazard to guess, given the beauty of the place. */
== RH#ADRJ @2622 /* Elves are hardly the only ones capable of great beauty, you know. */
== UDVITH @2623 /* Certainly not, though their high wizardry is immensely powerful, certainly potent enough to create a realm such as that. */
END

I_C_T UDSILVER 14 rh#AdrAdalon1 // *Silence! I... I will tell you when you may speak. This is a VERY important matter, and I will not be interrupted.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2624 /* Holy hells... try not to prod the dragon, <CHARNAME>. */
END

I_C_T UDSILVER 19 rh#AdrAdalon2 // *You must retrieve them for me. Do this, and I will reveal a safe escape route to leave the Underdark, one that emerges close to where Irenicus plots his next move.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2625 /* Die wandering the Underdark or die on the altar of a temple of Lolth, is it? */
== UDSILVER @2626 /* I never promised that the task would be simple. */
END

I_C_T UDSILVER 25 rh#AdrAdalon3 // *You will take the identity of a group of Drow I dispatched recently, a party from another city destined for Ust Natha.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2627 /* Oh, I like this. This could work. */
END

I_C_T UDILSLA2 2 rh#AdrIllithidSlave // *I am unsure. We were part of an expedition to find adventure in the Underdark. Hah! This was... hardly what we were expecting, you can be certain.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2628 /* Are you mad, man? What other type of adventure were you hoping to find in the Underdark? A Calishite carnaval? */
== UDILSLA2 @2629 /* It was foolish. I do not deny that. */
END

I_C_T UDSIMYAZ 5 rh#AdrSimyaz1 // *We harbor a special hatred for the illithid, and we will see them dead before we are done. Or we die ourselves.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2630 /* Defeatism at its very best. Dammit. There *must* be a way out of this. */
END

I_C_T UDSIMYAZ 16 rh#AdrSimyaz2 // *But we of the Githyanki have power of our own, and I believe we may be able to disrupt the illithids and allow another to make an escape.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2631 /* Hmm. It sounds better than the alternatives, at least. */
END

I_C_T UDSVIR03 12 rh#AdrSvir // *The tunnel will readily collapse, of that we are sure. What is unsure is whether that would kill the beast now that it is awakened.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2632 /* Awakened? Oh, doesn't this sound delightful. */
END

I_C_T KORGANJ 151 rh#AdrSvir2 // *What good is this indigo she-beast if she is as much a target down here as the rest of us?*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2633 /* Watch your tongue, dwarf. */
== KORGANJ @2634 /* Har! An' here I thought ye two hated each other. */
END

// Ust Natha

I_C_T UDSOLA01 10 rh#AdrSolaufein2 // *I will go seek her out now. If you are intelligent, you will go to the entrance platform quickly. The Handmaidens are notoriously impatient.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2635 /* I would rebel here no more than I would back home, Veldrin. The very walls have eyes, I suspect. */
== UDSOLA01 @2636 /* Quaintly put, but accurate. */
END

I_C_T UDPHAE01 61 rh#AdrPhae // *Approach the svirfneblin village in the great caverns and await a patrol. Slaughter them... and bring back proof of the deed.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2637 /* Foolish of them to live so close to a drow city in any case. */
== UDPHAE01 @2638 /* Exceedingly so. */
END

I_C_T UDDROW04 2 rh#AdrDrow4 // *You seem a hardy type. There are several dread beasts that have been captured and await your death-blow, if you dare.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2639 /* I save my spells for the wretched surface elves. I have no desire to waste them in the pit, Veldrin. */
== UDDROW04 @2640 /* Your patriotism does you credit, male, but you are a curiosity all the same. */
END

I_C_T UDDROW10 7 rh#AdrDrow10 // *The Spider Queen is a jealous goddess, reserving all worship for herself. Most drow will not even breathe the names of the others for fear of retribution. Myself, I am old enough to care little any longer.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2641 /* You do not fear her vengeance in the hereafter, male? */
== UDDROW10 @2642 /* Bah! It will come to me whether I seek it or no. */
END

I_C_T DASLAVE1 4 rh#AdrDrowSlave3 // *No! No, please! If... if you have any compassion at all, you will not send us there!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2643 /* You'll gain no lasting favor from this, Veldrin, and we hardly need to risk the goddess's attentions. */
END

INTERJECT UDDROW16 17 rh#AdrDrow16a // *As you wish! Attention! We have another challenge immediately! <PLAYER2> will now enter the arena and face Lasaonar!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Name("rh#Adrian",Player2)~ THEN
@2644 /* I think not, Veldrin. I'll quite happily watch from the sidelines instead. */
EXTERN UDDROW16 12

INTERJECT UDDROW16 18 rh#AdrDrow16b // *As you wish! Attention! We have another challenge immediately! <PLAYER3> will now enter the arena and face Lasaonar!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Name("rh#Adrian",Player3)~ THEN
@2644 /* I think not, Veldrin. I'll quite happily watch from the sidelines instead. */
EXTERN UDDROW16 12

INTERJECT UDDROW16 19 rh#AdrDrow16c // *As you wish! Attention! We have another challenge immediately! <PLAYER4> will now enter the arena and face Lasaonar!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Name("rh#Adrian",Player4)~ THEN
@2644 /* I think not, Veldrin. I'll quite happily watch from the sidelines instead. */
EXTERN UDDROW16 12

INTERJECT UDDROW16 20 rh#AdrDrow16d // *As you wish! Attention! We have another challenge immediately! <PLAYER5> will now enter the arena and face Lasaonar!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Name("rh#Adrian",Player5)~ THEN
@2644 /* I think not, Veldrin. I'll quite happily watch from the sidelines instead. */
EXTERN UDDROW16 12

INTERJECT UDDROW16 21 rh#AdrDrow16e // *As you wish! Attention! We have another challenge immediately! <PLAYER6> will now enter the arena and face Lasaonar!*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Name("rh#Adrian",Player6)~ THEN
@2644 /* I think not, Veldrin. I'll quite happily watch from the sidelines instead. */
EXTERN UDDROW16 12

I_C_T UDDROW26 2 rh#AdrDrow10 // *See? Ha ha!! I must find the clever mage who installed such a fabulous thing and reward him duly! Would you like to give it a try?  It'll only cost you a hundred gold.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2645 /* We haven't time to waste on this... frivolity. More pressing matters require our attention, male. */
== UDDROW26 @1975 /* As you wish. */
END

// elves

I_C_T C6ELHAN2 27 rh#AdrElhan1 // *You might have received a warmer welcome, but Irenicus has triggered the strongest of emotions where e'er he has tread.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2646 /* You don't say. */
END

I_C_T C6ELHAN2 41 rh#AdrElhan2 // *The attack came without warning, born in the mind of a human we did not know. This was not in the realm of possibility, and it remains as such.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2647 /* Obviously, your definition of "possibility" leaves much to be desired. As does your grasp of common courtesy, elf. So much for elven diplomacy, it would seem. */
== C6ELHAN2 @2648 /* You know nothing of this situation, half-blood. */
END

I_C_T C6ELHAN2 60 rh#AdrElhan3 // *And she must agree to a Geas. That is the only way.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2649 /* I have seen geas before, elf. More than once. I wouldn't have associated them with your type, but perhaps I'm closer in nature to my elven kin than I'd realized. A disturbing thought if ever there was one. */
== C6ELHAN2 @2650 /* Another word from you, half-blood, and I will require a geas of you as well. */
END

// Suldanessellar

I_C_T SUDEMIN 30 rh#AdrDem // *One group of exiles helping another, both so full of their petty hatred and jealousy that they would stop at nothing to strike at our hearts.*
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2651 /* You rip out his soul and call his hatred petty? Elves. You're so lost in your own self-righteous, self-indulgent hypocrisy that you can't even recognize your enemies until they've set your cities afire. */
== SUDEMIN @2652 /* Think what you may, but the Exile threatens innocents alongside those who harmed him. */
END

// Player 1

// slayer changes

INTERJECT PLAYER1 3 rh#slayerchange1a
== RH#ADRJ IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN @2653 /* <CHARNAME>? <CHARNAME>, are you all right? */
END
	++ @2654 /* I'll be fine. I'm just a bit faint. */ EXTERN RH#ADRJ rh#slayerchange1b
	++ @2655 /* I felt... out of control for a moment, but it passed. */ EXTERN RH#ADRJ rh#slayerchange1b
	++ @2656 /* It's nothing. Don't worry about it. */ EXTERN RH#ADRJ rh#slayerchange1b

APPEND RH#ADRJ
IF ~~ rh#slayerchange1b
  SAY @2657 /* I see. That damn ritual, no doubt. We need to get out of here as quickly as possible, I think. */
COPY_TRANS PLAYER1 3
END
END

I_C_T PLAYER1 5 rh#slayerchange2
== RH#ADRJ IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) InMyArea("rh#Adrian")~ THEN
@2658 /* <CHARNAME>, are you... are you still there? That was Bhaal's avatar... */
= @2659 /* We need to get your soul back as soon as possible; that may have been the only thing keeping that... thing in check. */
END

INTERJECT PLAYER1 7 rh#slayerchange3
== RH#ADRJ IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)    InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN
@2660 /* <CHARNAME>? <CHARNAME>, wake up, you... */
END
	++ @2661 /* Get back! Before I kill you! I can't stop this! */ DO ~SetGlobal("rh#EndangerLovedOne","GLOBAL",1)~ EXTERN RH#ADRJ rh#slayerchange3a
	++ @2662 /* Something's... something's happening, I... */ DO ~SetGlobal("rh#EndangerLovedOne","GLOBAL",1)~ EXTERN RH#ADRJ rh#slayerchange3a
	++ @2663 /* Don't touch me! I... */ DO ~SetGlobal("rh#EndangerLovedOne","GLOBAL",1)~ EXTERN RH#ADRJ rh#slayerchange3a

CHAIN RH#ADRJ rh#slayerchange3a
@2664 /* Your lips are moving but... <CHARNAME>? I... oh, hells-- */
DO ~ActionOverride(Player1,ReallyForceSpell(Myself,SLAYER_CHANGE))~
EXIT

EXTEND_BOTTOM PLAYER1 10
IF ~Global("rh#EndangerLovedOne","GLOBAL",1) OR(3) !InParty("rh#Adrian") !InMyArea("rh#Adrian") StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("DrowTalk","GLOBAL",5)~ GOTO 12
IF ~Global("rh#EndangerLovedOne","GLOBAL",1) InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("DrowTalk","GLOBAL",5)~ EXTERN RH#ADRJ rh#slayerchange3b
END

CHAIN RH#ADRJ rh#slayerchange3b
@2665 /* ...you're not getting rid of me that easily, <CHARNAME>. */
= @2666 /* I shouldn't joke about it, I know, but... come on. We need to get out of here and find help wherever we can before you lose control entirely. */
EXIT

I_C_T PLAYER1 16 rh#irenicusdead
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN @2667 /* And dead... finally, gloriously dead, but... <CHARNAME>? */
END

// Tree of Life

// romance

INTERJECT PLAYER1 33 rh#AdrianTreeOfLife1
== PLAYER1 IF ~Global("rh#AdrianRomanceActive","GLOBAL",2) InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2668 /* Adrian, your mercurial half-elven lover. The road for you has been rocky at times, but his eyes are calm as he regards you now. */
END
++ @2669 /* Adrian... I --- */ EXTERN RH#ADRJ rh#AdrTree1

// friendship

INTERJECT PLAYER1 33 rh#AdrianTreeOfLife2
== PLAYER1 IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2) InParty("rh#Adrian")   InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2670 /* Adrian, the mercurial half-elven mage. You know that you have slowly won his trust, but will his faith stand in the face of what is to come? */
END
	+ ~Alignment("rh#Adrian",LAWFUL_NEUTRAL)~ + @2671 /* You can still walk away from this, Adrian. It isn't your fight anymore. */ EXTERN RH#ADRJ rh#AdrTree2
	+ ~Alignment("rh#Adrian",LAWFUL_EVIL)~ + @2671 /* You can still walk away from this, Adrian. It isn't your fight anymore. */ EXTERN RH#ADRJ rh#AdrTree3
	+ ~Alignment("rh#Adrian",LAWFUL_NEUTRAL)~ + @2672 /* You've seen how powerful Irenicus is, Adrian. You understand the dangers as well as anyone does. You don't need to do this. */ EXTERN RH#ADRJ rh#AdrTree4
	+ ~Alignment("rh#Adrian",LAWFUL_EVIL)~ + @2672 /* You've seen how powerful Irenicus is, Adrian. You understand the dangers as well as anyone does. You don't need to do this. */ EXTERN RH#ADRJ rh#AdrTree5
	++ @2673 /* Can you still handle this, Adrian? I need to know that you're not faltering now. */ EXTERN RH#ADRJ rh#AdrTree6

APPEND RH#ADRJ

IF ~~ rh#AdrTree1
 SAY @2674 /* I know, <CHARNAME>. And as much as I'd rather stand here and talk right now... come, let's finish this. */
COPY_TRANS PLAYER1 33
END

IF ~~ rh#AdrTree2
 SAY @2675 /* It never really was, was it? A not-so-innocent bystander in a game between gods... that's all I've ever been. But I haven't abandoned you yet, <CHARNAME>, and I won't turn and run now. */
COPY_TRANS PLAYER1 33
END

IF ~~ rh#AdrTree3
 SAY @2676 /* No? As much as I might enjoy watching Irenicus burn this tree to cinders, I want his head more. */
COPY_TRANS PLAYER1 33
END

IF ~~ rh#AdrTree4
 SAY @2677 /* And leave you to face him alone? I haven't abandoned you yet, <CHARNAME>, and I won't turn and run now. */
COPY_TRANS PLAYER1 33
END

IF ~~ rh#AdrTree5
 SAY @2678 /* Yes, <CHARNAME>, I do. And as much as I might enjoy watching Irenicus burn this tree to cinders, I want his head more. */
COPY_TRANS PLAYER1 33
END

IF ~~ rh#AdrTree6
 SAY @2679 /* I haven't abandoned you yet, <CHARNAME>, and I certainly won't turn and run now. */
COPY_TRANS PLAYER1 33
END
END

// hell

I_C_T PLAYER1 25 rh#AdrNineHells1
== RH#ADRJ
IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) !Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN
@2680 /* The Nine Hells... not the afterlife I've been hoping for, but I've followed you this far, <CHARNAME>, I might as well follow you a little longer... */
END

I_C_T PLAYER1 25 rh#AdrNineHells2
== RH#ADRJ
IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN
@2681 /* The Nine Hells... not the afterlife I've been hoping for, but I won't abandon you now, <CHARNAME>, even at the end... */
END

I_C_T HELLJON 7 rh#Adrhelljon1
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2682 /* Get used to the Nine Hells, wizard. There's nothing left for you but this. */
END

I_C_T HELLJON 8 rh#Adrhelljon2
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2682 /* Get used to the Nine Hells, wizard. There's nothing left for you but this. */
END

I_C_T HELLJON 9 rh#Adrhelljon3
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2682 /* Get used to the Nine Hells, wizard. There's nothing left for you but this. */
END

I_C_T HELLJON 10 rh#Adrhelljon4
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN
@2682 /* Get used to the Nine Hells, wizard. There's nothing left for you but this. */
END

// bad reputation

CHAIN IF WEIGHT #-1 ~ReputationLT(Player1,4) Global("rh#AdrianReputation","GLOBAL",1)~ THEN rh#AdrJ rh#AdrBadRep
@2683 /* Nine Hells, <PRO_MANWOMAN>, have you no sense of discretion whatsoever? Continue drawing attention like this and we'll soon be hunted throughout the entire country. At least go bribe the nearest church. Last I heard, heroes respect that sort of thing. */
DO ~SetGlobal("rh#AdrianReputation","GLOBAL",2)~
EXIT

// good reputation

CHAIN IF WEIGHT #-1 ~ReputationGT(Player1,17) Global("rh#AdrianReputation","GLOBAL",1)~ THEN rh#AdrJ rh#AdrGoodRep
@2684 /* I can't say I mind being loved and admired and given special discounts, but don't you think you're taking this "heroics" thing a little bit too far? You're likely to get us all killed. */
DO ~SetGlobal("rh#AdrianReputation","GLOBAL",2)~
EXIT

// PLAYER INITIATED DIALOGUE

// Opening Menus

APPEND RH#ADRJ
IF ~IsGabber(Player1) Global("PlayerLooksLikeDrow","GLOBAL",1)~ THEN BEGIN rh#PID5
 SAY @2685 /* Veldrin? */
	+ ~RandomNum(4,1)~ + @2686 /* What do you think of Ust Natha? */ + rh#AdrianUstNatha1
	+ ~RandomNum(4,2)~ + @2686 /* What do you think of Ust Natha? */ + rh#AdrianUstNatha2
	+ ~RandomNum(4,3)~ + @2686 /* What do you think of Ust Natha? */ + rh#AdrianUstNatha3
	+ ~RandomNum(4,4)~ + @2686 /* What do you think of Ust Natha? */ + rh#AdrianUstNatha4
	+ ~RandomNum(4,1)~ + @2687 /* Are you enjoying the local scenery? */ + rh#AdrianScenery1
	+ ~RandomNum(4,2)~ + @2687 /* Are you enjoying the local scenery? */ + rh#AdrianScenery2
	+ ~RandomNum(4,3)~ + @2687 /* Are you enjoying the local scenery? */ + rh#AdrianScenery3
	+ ~RandomNum(4,4)~ + @2687 /* Are you enjoying the local scenery? */ + rh#AdrianScenery4
	+ ~RandomNum(4,1)~ + @2688 /* What are you thinking right now? */ + rh#AdrianThink1
	+ ~RandomNum(4,2)~ + @2688 /* What are you thinking right now? */ + rh#AdrianThink2
	+ ~RandomNum(4,3)~ + @2688 /* What are you thinking right now? */ + rh#AdrianThink3
	+ ~RandomNum(4,4)~ + @2688 /* What are you thinking right now? */ + rh#AdrianThink4
	+ ~RandomNum(4,1)~ + @2689 /* How do you think we're doing? */ + rh#AdrianSpy1
	+ ~RandomNum(4,2)~ + @2689 /* How do you think we're doing? */ + rh#AdrianSpy2
	+ ~RandomNum(4,3)~ + @2689 /* How do you think we're doing? */ + rh#AdrianSpy3
	+ ~RandomNum(4,4)~ + @2689 /* How do you think we're doing? */ + rh#AdrianSpy4
	+ ~RandomNum(4,1)~ + @2690 /* I'll be happy when this is over. */ + rh#AdrianHappy1
	+ ~RandomNum(4,2)~ + @2690 /* I'll be happy when this is over. */ + rh#AdrianHappy2
	+ ~RandomNum(4,3)~ + @2690 /* I'll be happy when this is over. */ + rh#AdrianHappy3
	+ ~RandomNum(4,4)~ + @2690 /* I'll be happy when this is over. */ + rh#AdrianHappy4
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianFlirtsEnabled","GLOBAL",1)~ + @2691 /* Turn your insolent gaze elsewhere, male. Your attention has grown tiresome. */ + rh#AdrianFlirtDisableDrow
  	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianFlirtsEnabled","GLOBAL",0)~ + @2692 /* Entertain me, male. Don't pretend you don't like what you see. */ + rh#AdrianFlirtEnableDrow
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtUD
	++ @2694 /* (Say nothing.) */ EXIT
END

IF ~IsGabber(Player1) !Global("PlayerLooksLikeDrow","GLOBAL",1) GlobalGT("rh#AdrianTalks","GLOBAL",11) !Dead("rh#Tanya")~ THEN BEGIN rh#PID2
 SAY @2695 /* (You glance at Adrian and find him tense and withdrawn. It is unlikely that he will react well to questioning at the moment.) */
IF ~~ EXIT
END


IF ~IsGabber(Player1) !Global("PlayerLooksLikeDrow","GLOBAL",1) OR(3) Global("rh#AdrianFriendshipActive","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN BEGIN rh#PID3
 SAY @2696 /* (Adrian glances in your direction.) */
	+ ~Global("rh#PID.Bodhi","GLOBAL",0) Global("BodhiAppear","GLOBAL",1) GlobalLT("WorkingForAran","GLOBAL",1) GlobalLT("WorkingForBodhi","GLOBAL",1)~ + @2697 /* Do you think I should work with the Shadow Thieves or with Valen's mysterious mistress? */ + rh#PID.Bodhi
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_2%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice1
	+ ~Global("WorkingForAran","GLOBAL",1) Global("Chapter","GLOBAL",%bg2_chapter_3%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice2a
	+ ~Global("WorkingForBodhi","GLOBAL",1) Global("Chapter","GLOBAL",%bg2_chapter_3%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice2b
	+ ~!AreaCheck("AR2300") Global("Chapter","GLOBAL",%bg2_chapter_4%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice3
	+ ~AreaCheck("AR2300")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice4a
	+ ~!Global("PlayerLooksLikeDrow","GLOBAL",1) !AreaCheck("AR2300") Global("Chapter","GLOBAL",%bg2_chapter_5%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice4b
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_6%) !Dead("C6Bodhi")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice5a
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_6%) Dead("C6Bodhi")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice5b
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2699 /* Could I ask you a question? */ + rh#AdrianChat
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2700 /* Could I speak with you? */ + rh#AdrianRomanceChat	
	+ ~Gender(Player1,MALE) Global("rh#AdrianFlirtMale","GLOBAL",0)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtMale
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",1) !Global("rh#AdrianRomanceActive","GLOBAL",2) Gender(Player1,FEMALE) Global("rh#AdrianFlirtFemale","GLOBAL",0)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtFemale
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1) GlobalLT("rh#AdrianTalks","GLOBAL",32)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtEarly
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1) !GlobalLT("rh#AdrianTalks","GLOBAL",32)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtMid
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtLate
	++ @2694 /* (Say nothing.) */ EXIT
END

IF ~IsGabber(Player1) Dead("rh#Tanya") !Global("PlayerLooksLikeDrow","GLOBAL",1) !Global("rh#AdrianRomanceActive","GLOBAL",1) !Global("rh#AdrianRomanceActive","GLOBAL",2) !Global("rh#AdrianFriendshipActive","GLOBAL",1)~ THEN BEGIN rh#PID4
 SAY @2701 /* Do you simply plan on staring, <CHARNAME>, or did you have something to say? */
	+ ~Global("rh#PID.Bodhi","GLOBAL",0) Global("BodhiAppear","GLOBAL",1) GlobalLT("WorkingForAran","GLOBAL",1) GlobalLT("WorkingForBodhi","GLOBAL",1)~ + @2697 /* Do you think I should work with the Shadow Thieves or with Valen's mysterious mistress? */ + rh#PID.Bodhi
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_2%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice1
	+ ~Global("WorkingForAran","GLOBAL",1) Global("Chapter","GLOBAL",%bg2_chapter_3%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice2a
	+ ~Global("WorkingForBodhi","GLOBAL",1) Global("Chapter","GLOBAL",%bg2_chapter_3%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice2b
	+ ~!AreaCheck("AR2300") Global("Chapter","GLOBAL",%bg2_chapter_4%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice3
	+ ~AreaCheck("AR2300")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice4a
	+ ~!Global("PlayerLooksLikeDrow","GLOBAL",1) !AreaCheck("AR2300") Global("Chapter","GLOBAL",%bg2_chapter_5%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice4b
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_6%) !Dead("C6Bodhi")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice5a
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_6%) Dead("C6Bodhi")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice5b
	++ @2702 /* Could I ask you what you think of someone? */ + rh#AdrianParty
	++ @2703 /* Could I ask you something a bit silly? */ + rh#AdrianQuestions
	++ @2704 /* Not at all. */ EXIT
END

IF ~IsGabber(Player1) !Global("PlayerLooksLikeDrow","GLOBAL",1)~ THEN BEGIN rh#PID1
 SAY @2705 /* Did you want something, <CHARNAME>? */
  	++ @2706 /* How exactly did you get sold into slavery? */ + rh#PID.Slavery
	++ @2707 /* Where are you from? */ + rh#PID.Origin
 	++ @2708 /* You don't seem to be an adventurer by profession. What do you normally do? */ + rh#PID.LifeStory
 	++ @2709 /* How many places have you been in your life? */ + rh#PID.Places
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",10) GlobalLT("rh#AdrianTalks","GLOBAL",22) Global("rh#PID.Family","GLOBAL",0)~ + @2710 /* What was your childhood like? */ + PID.Childhood
	+ ~Global("rh#PID.Bodhi","GLOBAL",0) Global("BodhiAppear","GLOBAL",1) GlobalLT("WorkingForAran","GLOBAL",1) GlobalLT("WorkingForBodhi","GLOBAL",1)~ + @2697 /* Do you think I should work with the Shadow Thieves or with Valen's mysterious mistress? */ + rh#PID.Bodhi
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_2%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice1
	+ ~Global("WorkingForAran","GLOBAL",1) Global("Chapter","GLOBAL",%bg2_chapter_3%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice2a
	+ ~Global("WorkingForBodhi","GLOBAL",1) Global("Chapter","GLOBAL",%bg2_chapter_3%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice2b
	+ ~!AreaCheck("AR2300") Global("Chapter","GLOBAL",%bg2_chapter_4%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice3
	+ ~AreaCheck("AR2300")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice4a
	+ ~!Global("PlayerLooksLikeDrow","GLOBAL",1) !AreaCheck("AR2300") Global("Chapter","GLOBAL",%bg2_chapter_5%)~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice4b
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_6%) !Dead("C6Bodhi")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice5a
	+ ~Global("Chapter","GLOBAL",%bg2_chapter_6%) Dead("C6Bodhi")~ + @2698 /* Do you have any advice for me? */ + rh#PID.Advice5b
	++ @2702 /* Could I ask you what you think of someone? */ + rh#AdrianParty
	++ @2703 /* Could I ask you something a bit silly? */ + rh#AdrianQuestions
	+ ~Gender(Player1,MALE) Global("rh#AdrianFlirtMale","GLOBAL",0)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtMale
	+ ~Gender(Player1,FEMALE) Global("rh#AdrianFlirtFemale","GLOBAL",0)~ + @2693 /* (Flirt with him.) */ + rh#AdrianFlirtFemale
	+ ~Global("rh#AdrianRomanceCheck","GLOBAL",2) Gender(Player1,FEMALE) CheckStatGT(Player1,11,INT) CheckStatGT(Player1,11,CHR) OR(2) Race(Player1,HALF_ELF) Race(Player1,HUMAN) !HasItemEquiped("ring30",Player1)~ + @2711 /* So, you and I... */ + rh#RomanceRestart
	++ @2704 /* Not at all. */ EXIT
END

// Questions

IF ~~ rh#AdrianChat
 SAY @2712 /* That depends on the question. */
	+ ~Global("rh#PIDTanya","GLOBAL",0)~ + @2713 /* You seemed rather familiar with Tanya. Did you two used to know each other? */ + pid.Tanya
	+ ~Global("rh#SoargylAftermath","GLOBAL",2)~ + @2714 /* Tell me about Talsar Soargyl. */ + pid.soargyl
	+ ~Global("rh#PID.ZhentilKeep","GLOBAL",0)~ + @2715 /* What was Zhentil Keep really like? */ + PID.ZhentilKeep
	+ ~Global("rh#PID.Zhentarim","GLOBAL",0)~ + @2716 /* Could you tell me anything about the Zhentarim? */ + PID.Zhentarim
	+ ~Global("rh#PID.Magic","GLOBAL",0)~ + @2717 /* You worship Azuth, right? The Lord of Spells? What is it like being in a country where magic is illegal? */ + PID.Azuth
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",10) GlobalLT("rh#AdrianTalks","GLOBAL",22) Global("rh#PID.Family","GLOBAL",0)~ + @2710 /* What was your childhood like? */ + PID.Childhood
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",22) GlobalLT("rh#PID.Family","GLOBAL",2)~ + @2718 /* Could you tell me a bit more about your family? */ + PID.Family
	+ ~Global("rh#PID.Family","GLOBAL",2) Global("rh#PID.Cousins","GLOBAL",1)~ + @2719 /* Your cousins who got sold into slavery... dare I ask what really happened to them? */ + PID.Cousins
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",1) Global("rh#PID.Family","GLOBAL",3) GlobalGT("rh#AdrianTalks","GLOBAL",24)~ + @2720 /* You mentioned a shortlived political marriage... could you tell me more about that? */ + PID.Marriage
  	++ @2702 /* Could I ask you what you think of someone? */ + rh#AdrianParty
	++ @2703 /* Could I ask you something a bit silly? */ + rh#AdrianQuestions
	++ @2721 /* Never mind. */ EXIT
END

IF ~~ rh#AdrianRomanceChat
 SAY @2722 /* Of course. */
	+ ~Global("rh#PIDTanya","GLOBAL",0)~ + @2713 /* You seemed rather familiar with Tanya. Did you two used to know each other? */ + pid.Tanya
	+ ~Global("rh#SoargylAftermath","GLOBAL",2)~ + @2714 /* Tell me about Talsar Soargyl. */ + pid.soargyl
	+ ~Global("rh#PID.ZhentilKeep","GLOBAL",0)~ + @2715 /* What was Zhentil Keep really like? */ + PID.ZhentilKeep
	+ ~Global("rh#PID.Zhentarim","GLOBAL",0)~ + @2716 /* Could you tell me anything about the Zhentarim? */ + PID.Zhentarim
	+ ~Global("rh#PID.Magic","GLOBAL",0)~ + @2717 /* You worship Azuth, right? The Lord of Spells? What is it like being in a country where magic is illegal? */ + PID.Azuth
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",10) GlobalLT("rh#AdrianTalks","GLOBAL",22) Global("rh#PID.Family","GLOBAL",0)~ + @2710 /* What was your childhood like? */ + PID.Childhood
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",22) GlobalLT("rh#PID.Family","GLOBAL",2)~ + @2718 /* Could you tell me a bit more about your family? */ + PID.Family
	+ ~Global("rh#PID.Family","GLOBAL",2) Global("rh#PID.Cousins","GLOBAL",1)~ + @2719 /* Your cousins who got sold into slavery... dare I ask what really happened to them? */ + PID.Cousins
	+ ~Global("rh#PID.Family","GLOBAL",3) GlobalGT("rh#AdrianTalks","GLOBAL",24)~ + @2720 /* You mentioned a shortlived political marriage... could you tell me more about that? */ + PID.Marriage
	+ ~Global("rh#PID.Life","GLOBAL",0)~ + @2723 /* This isn't exactly what I was expecting out of life. */ + rh#PID.Life1
 	+ ~!GlobalGT("rh#AdrianTalks","GLOBAL",48)~ + @2724 /* Have you ever thought of getting married? */ + rh#PID.Marriage1
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) GlobalGT("rh#AdrianTalks","GLOBAL",48)~ + @2724 /* Have you ever thought of getting married? */ + rh#PID.Marriage2
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",48) GlobalGT("AsylumPlot","GLOBAL",39) Global("rh#PIDsoul","GLOBAL",0)~ + @2725 /* Losing my soul... I'm lucky I survived that ritual at all. */ + rh#PID.soul
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",48) !GlobalGT("AsylumPlot","GLOBAL",39) Global("rh#PIDImoen1","GLOBAL",0)~ + @2726 /* I can't stop worrying about Imoen. */ + rh#PID.imoen1
	+ ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) GlobalGT("rh#AdrianTalks","GLOBAL",48) GlobalGT("AsylumPlot","GLOBAL",39) Global("rh#PIDImoen2","GLOBAL",0)~ + @2727 /* After everything, do you think Imoen will be okay? */ + rh#PID.imoen2
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",48) Global("rh#PIDdreams","GLOBAL",0)~ + @2728 /* I'm getting very tired of these constant nightmares. */ + rh#PID.nightmare
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",48) Global("rh#PIDwishes","GLOBAL",0)~ + @2729 /* I wish none of this had happened. Sarevok. Irenicus. Everything. */ + rh#PID.wishes
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",48) Global("rh#PIDwhelm","GLOBAL",0)~ + @2730 /* You'd think I'd be used to things like this by now, but I'm really not. Every day I just feel more overwhelmed by everything. */ + rh#PID.whelm
	+ ~GlobalGT("rh#AdrianTalks","GLOBAL",48) Global("rh#PIDalive","GLOBAL",0)~ + @2731 /* Do you really think we're going to get through this alive? */ + rh#PID.alive
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrAskedSex","GLOBAL",0)~ + @2732 /* Would you care to share my bed tonight? */ + rh#PIDSex1
	+ ~Global("rh#AdrAskedSex","GLOBAL",2)~ + @2733 /* What do I have to do to get you into my bed? */ + rh#PIDSex2
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianFlirtsEnabled","GLOBAL",1)~ + @2734 /* I appreciate the attention, but could you not flirt with me in public? */ + rh#AdrianFlirtDisable
  	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianFlirtsEnabled","GLOBAL",0)~ + @2735 /* I know it's somewhat exhibitionistic, but I enjoy your attention. Could you flirt with me more? */ + rh#AdrianFlirtEnable
  	++ @2702 /* Could I ask you what you think of someone? */ + rh#AdrianParty
	++ @2703 /* Could I ask you something a bit silly? */ + rh#AdrianQuestions
	++ @2736 /* I don't think this relationship is working out. I'm sorry. */ + rh#PID.Breakup
	++ @2721 /* Never mind. */ EXIT
END
END

// Early Questions

CHAIN RH#ADRJ rh#PID.Slavery
@2737 /* Extraordinarily bad luck. */
EXIT

CHAIN RH#ADRJ rh#PID.Origin
@2738 /* Sembia, fairly recently. It's a great country for wizards who are happy enough getting their hands dirty. Half the country is spying on the other half or trying to poison it. */
= @2739 /* It's quite the melting pot as well, with traders from as far away as Mulhorand wandering in to do business. */
EXIT

CHAIN RH#ADRJ rh#PID.Places
@2740 /* I suppose I'm fairly well traveled, at least when it comes to the lands just west of the Inland Sea. Sembia, the Dales. Cormyr. */
EXIT

CHAIN RH#ADRJ rh#PID.LifeStory
@2741 /* I've been involved in a few things over the past decade or so... politics back home, a bit of... commercial consulting, shall we say, and a few other things. A pseudo-military stint that wasn't exactly pleasant. That one I don't miss. */
EXIT

// Advice

CHAIN RH#ADRJ rh#PID.Bodhi
@2742 /* The Shadow Thieves. They're less likely to stab you in the back afterwards. */ 
= @2743 /* Whatever you might think of them, nine times out of ten the monster you know is better than the one waiting in the shadows, and they haven't burnt down Athkatla just yet. */
DO ~SetGlobal("rh#PID.Bodhi","GLOBAL",1)~
EXIT

CHAIN RH#ADRJ rh#PID.Advice1
@2744 /* The sum might seem large, but it's not the gold that concerns me. That mage... if we're going to match him, we need power. Magic. And as much of it as possible. */
EXIT

CHAIN RH#ADRJ rh#PID.Advice2a
@2745 /* Make ourselves as useful to the thieves as possible. That shouldn't be terribly hard; they haven't proved entirely competent themselves, have they? */
EXIT

CHAIN RH#ADRJ rh#PID.Advice2b
@2746 /* Get this nonsense over with as quickly as possible and pray for the best. */
EXIT

CHAIN RH#ADRJ rh#PID.Advice3
@2747 /* Mount that damn mage's head on a pike. */
EXIT

CHAIN RH#ADRJ rh#PID.Advice4a
@2748 /* Try not to get eaten by these overgrown fish. It's a pity a Lightning Bolt wouldn't electrocute the whole lot of them. */
EXIT

CHAIN RH#ADRJ rh#PID.Advice4b
@2749 /* Check every shadow for enemies and find a way back to the surface before we get killed. */
EXIT

CHAIN RH#ADRJ rh#PID.Advice5a
@2750 /* Find whatever allies we can to throw at that vampire. Myself, I'd rather simply just watch. */
EXIT

CHAIN RH#ADRJ rh#PID.Advice5b
@2751 /* I'd delay going after Irenicus again as long as possible to obtain more power, but we're playing by his rules, unfortunately, and time seems very much of the essence. */
EXIT

// Minor Flirts

CHAIN RH#ADRJ rh#AdrianFlirtMale
@2752 /* Don't walk into any walls on my account, <CHARNAME>. */
DO ~SetGlobal("rh#AdrianFlirtMale","GLOBAL",1)~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtFemale
@2753 /* Don't walk into any walls on my account, my dear. */
DO ~SetGlobal("rh#AdrianFlirtFemale","GLOBAL",1)~
EXIT

CHAIN RH#ADRJ rh#RomanceRestart
@2754 /* (smile) The things you don't know about me could fill up all the shelves in Candlekeep, my lady. */
DO ~SetGlobal("rh#AdrianRomanceCheck","GLOBAL",1)~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtMid
@2755 /* Not right now, <CHARNAME>. */
EXIT

// Ust Natha

CHAIN RH#ADRJ rh#AdrianUstNatha1
@2756 /* I'd prefer a bit more order and less arbitrary capriciousness myself. */
EXIT

CHAIN RH#ADRJ rh#AdrianUstNatha2
@2757 /* It makes me strangely nostalgic, truth be told. */
EXIT

CHAIN RH#ADRJ rh#AdrianUstNatha3
@2758 /* Needless to say, I'd prefer a magocracy. */
EXIT

CHAIN RH#ADRJ rh#AdrianUstNatha4
@2759 /* I'm surprised they don't have as strict a law against the use of magic here as they do back home, though. But perhaps the thought of their males rebelling is unthinkable. */
EXIT

CHAIN RH#ADRJ rh#AdrianScenery1
@2760 /* Not particularly. Very little about Ust Natha speaks well for the populace's imagination. */
EXIT

CHAIN RH#ADRJ rh#AdrianScenery2
@2761 /* It is surprisingly beautiful. In its own way. */
EXIT

CHAIN RH#ADRJ rh#AdrianScenery3
@2762 /* It does keep one's wits sharply honed, doesn't it? */
EXIT

CHAIN RH#ADRJ rh#AdrianScenery4
@2763 /* I revere Lolth as much as the next disenfranchised male, but... well. */
EXIT

CHAIN RH#ADRJ rh#AdrianThink1
@2764 /* I'm honored that you would even think to ask, Malla Veldrin. */
EXIT

CHAIN RH#ADRJ rh#AdrianThink2
@2765 /* About priestesses, shockingly enough. */
EXIT

CHAIN RH#ADRJ rh#AdrianThink3
@2766 /* About my long and exciting history with blasphemy. */
EXIT

CHAIN RH#ADRJ rh#AdrianThink4
@2767 /* Inevitable treachery. */
EXIT

CHAIN RH#ADRJ rh#AdrianSpy1
@2768 /* I'd be happier if you hadn't just asked that question. */
EXIT

CHAIN RH#ADRJ rh#AdrianSpy2
@2769 /* Better than I would have expected. */
EXIT

CHAIN RH#ADRJ rh#AdrianSpy3
@2770 /* What we lack in training, we make up for in desperation, I suppose. */
EXIT

CHAIN RH#ADRJ rh#AdrianSpy4
@2771 /* Phaere has little enough reason to be displeased, I should think. */
EXIT

CHAIN RH#ADRJ rh#AdrianHappy1
@2772 /* So will I, actually. */
EXIT

CHAIN RH#ADRJ rh#AdrianHappy2
@2773 /* Missing Ched Nasad, are we? I don't blame you. */
EXIT

CHAIN RH#ADRJ rh#AdrianHappy3
@2774 /* Call it villainy or call it flavor, I suppose. */
EXIT

CHAIN RH#ADRJ rh#AdrianHappy4
@2775 /* It is a bit exhausting by anyone's standards. */
EXIT

// Zhentil Keep

CHAIN RH#ADRJ PID.ZhentilKeep
@2776 /* Before or after it got smashed to pieces? */
= @2777 /* No, I suppose that isn't fair. Shall I tell you about the paladins at the gates... or the lichs in their crypts, perhaps? Though I suppose we have a few of those here in Amn as well. */
DO ~SetGlobal("rh#PID.ZhentilKeep","GLOBAL",1)~
END
	++ @2778 /* Could you tell me what it was like to actually live there? */ + PID.ZhentilKeep.live
	++ @2779 /* Paladins at the gates? I can't even tell if that's hyperbole. */ + PID.ZhentilKeep.paladins
	++ @2780 /* Lichs in their crypts? Is that really an issue there? */ +PID.ZhentilKeep.lichs
	++ @2781 /* I've heard less than pleasant things about the people from that part of the world in general. */ + PID.ZhentilKeep.stereo
	++ @2782 /* I'd personally rather hear about its taverns and festhalls. */ + PID.ZhentilKeep.fest
	++ @2783 /* If you're going to resent it, I'll leave you alone. */ + PID.ZhentilKeep.done
	
APPEND RH#ADRJ

IF ~~ PID.ZhentilKeep.live
 SAY @2784 /* I dare say that depends upon who you are. It was a rich city... back when it was still a city, at least. You'd never know it, of course. The lords hoarded away all of the money. */
 = @2785 /* (smile) Not that I had anything to complain about in that regard. */
	++ @2786 /* And yet you seem to miss Sembia more. */ + PID.ZhentilKeep.live.sembia
	++ @2787 /* I'm surprised you even had a lower class if you treated them so horrifically. */ + PID.ZhentilKeep.live.lower
	++ @2788 /* You still had money even after you angered your masters? */ + PID.ZhentilKeep.live.money
	++ @2789 /* I can imagine what the city guard was like. */ + PID.ZhentilKeep.live.guard
	++ @2790 /* You're not at all ashamed to be from a place that corrupt? */ + PID.ZhentilKeep.live.corrupt
	++ @2791 /* Perhaps I shouldn't ask. */ + PID.ZhentilKeep.live.done
END

IF ~~ PID.ZhentilKeep.live.sembia
 SAY @2792 /* Yes, well. Sembia is certainly an easier place to live, regardless of social class. If I had actually had more of a choice in the matter... */
 = @2793 /* But there's no point in considering that. Needless to say, I preferred the Keep before the Time of Troubles. */
IF ~~ + PID.ZhentilKeep2
END

IF ~~ PID.ZhentilKeep.live.lower
 SAY @2794 /* Well... by and large, they wouldn't be able to afford to leave. The exit toll is not exactly cheap, and it wasn't safe outside of the city. Not that it was particularly safe inside of it either. */
 = @2795 /* In any case, it isn't as if we made no concessions. They haven't had to pay any taxes since the last time they were overtaxed and tried to flee the city en masse. */
IF ~~ + PID.ZhentilKeep2
END

IF ~~ PID.ZhentilKeep.live.money
 SAY @2796 /* Ahh... well. My grandmother was still alive at that point. And still rich. I might not have had much of an opportunity to use that money, but I wasn't exactly disowned. */
IF ~~ + PID.ZhentilKeep2
END

IF ~~ PID.ZhentilKeep.live.guard
 SAY @2797 /* ...brutal. Hilariously so, when they weren't down south attacking Hillsfar or the Dalelands. */
 = @2798 /* You know, it's been said that we're such aggressive expansionists because once upon a time, the lords needed to find reasons to keep their armies out of the city itself. I can certainly believe it. */
IF ~~ + PID.ZhentilKeep2
END

IF ~~ PID.ZhentilKeep.live.corrupt
 SAY @2799 /* It is what it is. What would be the point? */
IF ~~ + PID.ZhentilKeep2
END

IF ~~ PID.ZhentilKeep.live.done
 SAY @2800 /* Perhaps not. */
IF ~~ EXIT
END

IF ~~ PID.ZhentilKeep2
 SAY @2801 /* My... delightful former home isn't really my favorite topic of conversation, <CHARNAME>, so if you have any other questions, you might as well ask them now. */
	++ @2802 /* You mentioned paladins at the gates before... I can't even tell if that's hyperbole. */ + PID.ZhentilKeep.paladins
	++ @2803 /* You said something about lichs in their crypts? Is that really an issue there? */ +PID.ZhentilKeep.lichs
	++ @2781 /* I've heard less than pleasant things about the people from that part of the world in general. */ + PID.ZhentilKeep.stereo
	++ @2804 /* Tell me about its taverns and festhalls. */ + PID.ZhentilKeep.fest
	++ @2783 /* If you're going to resent it, I'll leave you alone. */ + PID.ZhentilKeep.done
END

IF ~~ PID.ZhentilKeep.paladins
 SAY @2805 /* Well, it isn't very far from. We aren't particularly fond of adventurers back home. They tend to like to cause problems. */
	+ ~Alignment(Player1,MASK_EVIL)~ + @2806 /* Is that why you hate the concept of adventuring so much? */ + PID.ZhentilKeep.paladins.hate
	+ ~!Alignment(Player1,MASK_EVIL)~ + @2806 /* Is that why you hate the concept of adventuring so much? */ + PID.ZhentilKeep.paladins.hate2
	++ @2807 /* How often do they cause problems? */ + PID.ZhentilKeep.paladins.problems
	++ @2808 /* I'm sure you had enough problems of your own without worrying about that too. */ + PID.ZhentilKeep.paladins.own
	++ @2809 /* I suppose the hunt for evil isn't particularly difficult in a place like that. */ + PID.ZhentilKeep.paladins.evil
END

IF ~~ PID.ZhentilKeep.paladins.hate
 SAY @2810 /* I suppose it may be part of it. Not that all adventurers are mindless do-gooders... yourself, for instance, but more often than not it tends to be the assumption. */
IF ~~ + PID.ZhentilKeep3
END

IF ~~ PID.ZhentilKeep.paladins.hate2
 SAY @2811 /* I suppose it may be part of it. Not that all adventurers are mindless do-gooders... no offense intended. Still, more often than not it tends to be the assumption. */
IF ~~ + PID.ZhentilKeep3
END

IF ~~ PID.ZhentilKeep.paladins.problems
 SAY @2812 /* Occasionally. It's not particular easy to get in or out of the city, and the guards at the gates are ever on the lookout for Harper spies and the like. */
IF ~~ + PID.ZhentilKeep3
END

IF ~~ PID.ZhentilKeep.paladins.own
 SAY @2813 /* That's a bit of an understatement at this point. */
IF ~~ + PID.ZhentilKeep3
END

IF ~~ PID.ZhentilKeep.paladins.evil
 SAY @2814 /* Turn a corner and charge at the nearest person, is it? I'm sure it happened occasionally. */
IF ~~ + PID.ZhentilKeep3
END

IF ~~ PID.ZhentilKeep3
 SAY @2815 /* As much as I enjoy the thought of paladins and other... wonderful people wandering my former city, if you have any other questions, you might as well ask them now. */
	++ @2778 /* Could you tell me what it was like to actually live there? */ + PID.ZhentilKeep.live
	++ @2816 /* You said something about lichs in their crypts? Is that really an issue there as well? */ +PID.ZhentilKeep.lichs
	++ @2781 /* I've heard less than pleasant things about the people from that part of the world in general. */ + PID.ZhentilKeep.stereo
	++ @2817 /* Tell me about the taverns and festhalls. */ + PID.ZhentilKeep.fest
	++ @2783 /* If you're going to resent it, I'll leave you alone. */ + PID.ZhentilKeep.done
END

IF ~~ PID.ZhentilKeep.lichs
 SAY @2818 /* It certainly isn't much of a priority currently, but... well, if you'd care for a ghost story, I'd be happy to indulge. */
	++ @2819 /* Crazy folk tales, is it? Please do share. */ + PID.ZhentilKeep.lichs.story
	++ @2820 /* I think I'll pass on that. */ + PID.ZhentilKeep.lichs.done
END

IF ~~ PID.ZhentilKeep.lichs.story
 SAY @2821 /* I wouldn't say we have a problem, per se, but once, several centuries ago... we call them Those Who Walk By Night. */
 = @2822 /* They were once the original mage-lords of the city, or so it's said. But like so many mages, particularly of the darker variety, they weren't content to simply surrender to death. And so they slipped beneath the city and into undeath instead, and for a time, they disappeared. And then they started to go mad. */
 = @2823 /* In their insanity, they began wandering the city by night, committing acts that even by our standards were vile. All in the name of research. The city's lords protected themselves with powerful magics, but the citizenry... well, life has never been particularly kind to the commoners of Zhentil Keep. */
 = @2824 /* When trade began to suffer, though... then the lords finally decided they cared, and the lichs disappeared one by one. Slain or simply in hiding once more, nobody can say for certain. */
 = @2825 /* Some say that when the last lords of the city are slain, the lichs will walk once more... superstitious nonsense, of course, but stranger things have happened. */
	++ @2826 /* I'm going to have to remember this. */ +  PID.ZhentilKeep.lichs.remember
	++ @2827 /* I hope you don't have your sights set on lichdom as well. */ + PID.ZhentilKeep.lichs.sights
	++ @2828 /* Well, there were dopplegangers hidden beneath Candlekeep once upon a time, but only because the Iron Throne put them there. */ + PID.ZhentilKeep.lichs.dopple
	++ @2829 /* It's nice to know that your city was always completely mad. */ + PID.ZhentilKeep.lichs.mad
	++ @2830 /* That's the most ridiculous thing I have ever heard. */ + PID.ZhentilKeep.lichs.ridiculous
END

IF ~~ PID.ZhentilKeep.lichs.remember
 SAY @2831 /* I suppose no collection of ghost stories is complete without it. */
IF ~~ + PID.ZhentilKeep4
END

IF ~~ PID.ZhentilKeep.lichs.sights
 SAY @2832 /* ...not particularly, no. */
 = @2833 /* Actually, we're not quite as enamored of it as, say, Thayvians. Perhaps that story is part of why. */
IF ~~ + PID.ZhentilKeep4
END

IF ~~ PID.ZhentilKeep.lichs.dopple
 SAY @2834 /* Ha! You'll need to tell me more about that someday, <CHARNAME>. But for now... */
IF ~~ + PID.ZhentilKeep4
END

IF ~~ PID.ZhentilKeep.lichs.mad
 SAY @2835 /* I'd prefer to call it colorful, but whatever you'd like. */
IF ~~ + PID.ZhentilKeep4
END

IF ~~ PID.ZhentilKeep.lichs.ridiculous
 SAY @2836 /* You must have been very, very secluded in Candlekeep, then. */
IF ~~ + PID.ZhentilKeep4
END

IF ~~ PID.ZhentilKeep.lichs.done
 SAY @1975 /* As you wish. */
IF ~~ EXIT
END

IF ~~ PID.ZhentilKeep4
 SAY @2801 /* My... delightful former home isn't really my favorite topic of conversation, <CHARNAME>, so if you have any other questions, you might as well ask them now. */
	++ @2778 /* Could you tell me what it was like to actually live there? */ + PID.ZhentilKeep.live
	++ @2802 /* You mentioned paladins at the gates before... I can't even tell if that's hyperbole. */ + PID.ZhentilKeep.paladins
	++ @2781 /* I've heard less than pleasant things about the people from that part of the world in general. */ + PID.ZhentilKeep.stereo
	++ @2804 /* Tell me about its taverns and festhalls. */ + PID.ZhentilKeep.fest
	++ @2783 /* If you're going to resent it, I'll leave you alone. */ + PID.ZhentilKeep.done
END

IF ~~ PID.ZhentilKeep.stereo
 SAY @2837 /* Do you simply enjoy throwing mindless stereotypes at me, or are you trying to say something? */
	++ @2838 /* I suppose I could have phrased that better. */ + PID.ZhentilKeep.stereo.better
	++ @2839 /* Oh, calm down. Is everyone from the Moonsea so touchy? */ + PID.ZhentilKeep.stereo.touchy
	++ @2840 /* If I were trying to say something, you would know. */ + PID.ZhentilKeep.stereo.say
	++ @2841 /* Sullen, moody, and unfriendly. If you have a problem with the stereotype, perhaps you shouldn't embody it so completely. */ + PID.ZhentilKeep.stereo.embody
	++ @2842 /* ...never mind. */ EXIT
END

IF ~~ PID.ZhentilKeep.stereo.better
 SAY @2843 /* Quite possibly. */
IF ~~ EXIT
END

IF ~~ PID.ZhentilKeep.stereo.touchy
 SAY @2844 /* Well, if you're going to offend someone, it's best to do it during the winter. It's harder to toss someone into the sea when it's frozen over. */
IF ~~ EXIT
END

IF ~~ PID.ZhentilKeep.stereo.say
 SAY @2845 /* How very unsubtle of you, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ PID.ZhentilKeep.stereo.embody
 SAY @777 /* Very funny. */
 = @2846 /* But relying on stereotypes can be dangerous, <CHARNAME>. You never can tell when they'll *stop* being accurate. */
IF ~~ EXIT
END

IF ~~ PID.ZhentilKeep.fest
 SAY @2847 /* And the wicked, wicked things that went on within? */
	++ @2848 /* Absolutely. */ + PID.ZhentilKeep.fest.yes
	++ @2849 /* It can't all be that bad. */ + PID.ZhentilKeep.fest.bad
	++ @2850 /* Decadence hardly counts as wickedness. */ + PID.ZhentilKeep.fest.lovi
	++ @2851 /* You really aren't going to take this at all seriously, are you? */ + PID.ZhentilKeep.fest.serious
END

IF ~~ PID.ZhentilKeep.fest.yes
 SAY @2852 /* Most of them weren't even worth visiting, truth be told. Ruined by the cruder elements of society. The festhalls, though... those tended to be pleasant enough. */
IF ~~ + PID.ZhentilKeep5
END

IF ~~ PID.ZhentilKeep.fest.bad
 SAY @2853 /* No, there are some halfway decent places. Well, there were, at least, prior to the Razing. People who murder their patrons tend not to do good business. */
IF ~~ + PID.ZhentilKeep5
END

IF ~~ PID.ZhentilKeep.fest.lovi
 SAY @2854 /* You've never entertained with the clergy of Loviatar, have you? */
 = @2855 /* Most of the inns weren't even worth visiting, truth be told. Ruined by the cruder elements of society. The festhalls, though... those tended to be pleasant enough. */
IF ~~ + PID.ZhentilKeep5
END

IF ~~ PID.ZhentilKeep.fest.serious
 SAY @2856 /* You know me so well. */
= @2855 /* Most of the inns weren't even worth visiting, truth be told. Ruined by the cruder elements of society. The festhalls, though... those tended to be pleasant enough. */
IF ~~ + PID.ZhentilKeep5
END

IF ~~ PID.ZhentilKeep5
 SAY @2857 /* But my... delightful former home isn't really my favorite topic of conversation, <CHARNAME>, so if you have any other questions, you might as well ask them now. */
	++ @2778 /* Could you tell me what it was like to actually live there? */ + PID.ZhentilKeep.live
	++ @2802 /* You mentioned paladins at the gates before... I can't even tell if that's hyperbole. */ + PID.ZhentilKeep.paladins
	++ @2816 /* You said something about lichs in their crypts? Is that really an issue there as well? */ +PID.ZhentilKeep.lichs
	++ @2781 /* I've heard less than pleasant things about the people from that part of the world in general. */ + PID.ZhentilKeep.stereo
	++ @2783 /* If you're going to resent it, I'll leave you alone. */ + PID.ZhentilKeep.done
END

IF ~~ PID.ZhentilKeep.done
 SAY @2858 /* Not a terrible idea. */
IF ~~ EXIT
END
END

// Zhentarim

CHAIN RH#ADRJ pid.Tanya
@2859 /* I never slept with her, if that's what you're asking. She was an... acquaintance of the family, back before she became a Cyricist. Back before Cyric was even a god, technically. */
DO ~SetGlobal("rh#PIDTanya","GLOBAL",1)~
EXIT

CHAIN RH#ADRJ PID.Zhentarim
@2860 /* And bare our dark, dark secrets to the world? */
DO ~SetGlobal("rh#PID.Zhentarim","GLOBAL",1)~
END
	++ @2861 /* Don't be so defensive. You don't owe them anything. */ + PID.Zhentarim.owe
	++ @2862 /* You're really not one for gossip, are you? */ + PID.Zhentarim.gossip
	+ ~!Global("LyrosJob","GLOBAL",0)~ + @2863 /* Could you at least tell me if you knew Montaron and Xzar? */ + PID.Zhentarim.monty
	++ @2864 /* Do you even regret it at all? */ + PID.Zhentarim.regret
	++ @2865 /* Fine. Keep your secrets. */ EXIT

APPEND RH#ADRJ

IF ~~ PID.Zhentarim.owe
 SAY @2866 /* On the contrary, I'd say I owe them a great deal... though nothing particularly pleasant. */
IF ~~ + PID.Zhentarim2
END
	
IF ~~ PID.Zhentarim.gossip
 SAY @2867 /* That would depend upon the gossip, I should think. */
IF ~~ + PID.Zhentarim2
END
	
IF ~~ PID.Zhentarim.monty
 SAY @2868 /* No, I didn't. And from what I've seen, I can't count that as much of a loss. */
IF ~~ + PID.Zhentarim2
END

IF ~~ PID.Zhentarim.regret
 SAY @2869 /* Now that's something of a loaded question, isn't it? I regret the way it ended, but beyond that... hmm. */
IF ~~ + PID.Zhentarim2
END

IF ~~ PID.Zhentarim2
 SAY @2870 /* If I cared much for sharing stories, I'd have taken up bardcraft instead. */
	++ @2871 /* Any old fool in a bar has a story or two to tell. */ + PID.Zhentarim2.1
	++ @2872 /* I really don't care for these mixed loyalties. */ + PID.Zhentarim2.2
	++ @2873 /* I'm glad you didn't. You're irritating enough as you are. */ + PID.Zhentarim2.3
	++ @2874 /* I guess I should expect secrecy from you by now. */ + PID.Zhentarim3
	++ @2875 /* Next time I feel like asking something, I'll remember to wait until you're completely drunk. */ + PID.Zhentarim2.4
END

IF ~~ PID.Zhentarim2.1
 SAY @2876 /* Yes, and I'd like to think that there's more separating them from myself than the quality of wine being ordered. */ 
IF ~~ + PID.Zhentarim3
END

IF ~~ PID.Zhentarim2.2
 SAY @2877 /* My loyalties are hardly mixed, my <PRO_<LADYLORD>. I suppose a lifetime of silence is just a hard habit to break. */
IF ~~ + PID.Zhentarim3
END

IF ~~ PID.Zhentarim2.3
 SAY @2878 /* How... kind of you to point that out, my <PRO_<LADYLORD>. */
IF ~~ + PID.Zhentarim3
END

IF ~~ PID.Zhentarim2.4
 SAY @2879 /* I doubt you'll have to wait very long for that. */ 
IF ~~ + PID.Zhentarim3
END

IF ~~ PID.Zhentarim3
 SAY @2880 /* It's really not a comfortable subject, <CHARNAME>. Eventually, perhaps, it will be, but certainly not to<DAYNIGHT>. */
IF ~~ EXIT
END
END

// Religion

CHAIN RH#ADRJ PID.Azuth
@2881 /* Irritating. I'm happy enough going underground for the latest writings in arcane theory, but it's still inconvenient. And ridiculous. */
DO ~SetGlobal("rh#PID.Magic","GLOBAL",1)~
END
	++ @2882 /* Is your church even active here? */ + PID.Azuth.church
	++ @2883 /* You don't talk about your religion very much. */ + PID.Azuth.talk
	+ ~OR(2) GlobalLT("rh#AdrianTalks","GLOBAL",42) !Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2884 /* All things considered, I'd have expected you to worship a somewhat darker god than the Lord of Spells. */ + PID.Azuth.darker
	+ ~!GlobalLT("rh#AdrianTalks","GLOBAL",42) Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2885 /* Bane to Azuth. How does that happen anyway? */ + PID.Azuth.conversion
	++ @2886 /* I take it Azuthans aren't particularly interested in converts or crusades. */ + PID.Azuth.crusade 
	++ @2887 /* Are the latest writings really the only things that matter to you? */ + PID.Azuth.crusade
	
APPEND RH#ADRJ
	
IF ~~ PID.Azuth.church
 SAY @2888 /* Not very much so, I suspect, though more than a handful of the Cowled Wizards are likely worshippers. I haven't really bothered to find out. */
 = @2889 /* Utter religious secrecy is a difficult habit to break, I suppose, and those who didn't worship Cyric were not treated very well back home. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + PID.Azuth2
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ EXIT
END

IF ~~ PID.Azuth.talk
 SAY @2890 /* I suppose not. But then, utter religious secrecy is a difficult habit to break, and those who didn't worship Cyric were not treated very well back home. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + PID.Azuth2
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ EXIT
END

IF ~~ PID.Azuth.darker
 SAY @2891 /* I hope you don't expect me to comment on that one way or the other. */
IF ~~ EXIT
END

IF ~~ PID.Azuth.conversion
 SAY @2892 /* My priorities changed. Quite a bit. These things happen when you don't have to worry about disappointed elders sacrificing you at the altar one day. */
IF ~~ EXIT
END
	
IF ~~ PID.Azuth.crusade
 SAY @2893 /* Well, we're hardly Mystrans. We're quite happy to debate amongst ourselves and leave the pointless causes to those with more idealism than sense. */
IF ~Class("rh#Adrian",CLERIC_MAGE)~ + PID.Azuth2
IF ~!Class("rh#Adrian",CLERIC_MAGE)~ EXIT
END

IF ~~ PID.Azuth2
 SAY @2894 /* If you expect proselytizing, you'd best find another priest. */
IF ~~ EXIT
END
END

// Childhood

CHAIN RH#ADRJ PID.Childhood
@2895 /* I survived it. That's the best that can be said about it. */
DO ~SetGlobal("rh#PID.Family","GLOBAL",1)~
END
	++ @2896 /* You mentioned that you once ran away from home? */ + PID.Childhood.run
	+ ~Class("rh#Adrian",SORCERER)~ + @2897 /* You must have at least some pleasant memories of it. */ + PID.Childhood.pleasant1
	+ ~!Class("rh#Adrian",SORCERER)~ + @2897 /* You must have at least some pleasant memories of it. */ + PID.Childhood.pleasant2
	++ @2898 /* After being questioned on my past, I think I'm well within my rights to want to know more about yours. */ + PID.Childhood.past
	++ @2899 /* You make that almost sound like an accomplishment. */ + PID.Childhood.acc
	++ @1975 /* As you wish. */ EXIT

APPEND RH#ADRJ

IF ~~ PID.Childhood.run
 SAY @2900 /* I suppose I did mention that. A mistake on my part. */
	++ @2901 /* Could you at least tell me why? */ + PID.Childhood.runaway
	++ @2898 /* After being questioned on my past, I think I'm well within my rights to want to know more about yours. */ + PID.Childhood.past2
	++ @2902 /* Fine. I won't bother you about it. */ EXIT
END

IF ~~ PID.Childhood.pleasant1
 SAY @2903 /* Does almost killing one of my cousins in an explosion of sorcery count? */
	++ @2904 /* Should it? */ + PID.Childhood.notpleasant
	++ @2905 /* I asked you for a pleasant memory, not something like that! */ + PID.Childhood.notpleasant
	++ @2906 /* Is that why you once ran away? */ + PID.Childhood.run2
	++ @2907 /* So even as a child, you were a little monster. */ + PID.Childhood.monster
	++ @2908 /* Fine. Never mind. */ EXIT
END

IF ~~ PID.Childhood.pleasant2
 SAY @2909 /* Does accidentally almost killing my cousin with one of my uncle's wands count? */
	++ @2904 /* Should it? */ + PID.Childhood.notpleasant
	++ @2905 /* I asked you for a pleasant memory, not something like that! */ + PID.Childhood.notpleasant
	++ @2906 /* Is that why you once ran away? */ + PID.Childhood.run2
	++ @2907 /* So even as a child, you were a little monster. */ + PID.Childhood.monster
	++ @2908 /* Fine. Never mind. */ EXIT
END

IF ~~ PID.Childhood.past
 SAY @2910 /* Is that what this is? Needless to say, I didn't grow up in Candlekeep, and I certainly didn't have a deranged Harper for a foster father. */
	+ ~!Global("rh#AdrianZhent","GLOBAL",1)~ + @2911 /* Where did you grow up? */ + PID.Childhood.cormyr
	+ ~Global("rh#AdrianZhent","GLOBAL",1)~ + @2912 /* He'd have had to have been deranged to live in your home city. */ + PID.Childhood.harper
	++ @2913 /* But you had a family, I take it. */ + PID.Childhood.family
	++ @2896 /* You mentioned that you once ran away from home? */ + PID.Childhood.run2
	++ @2914 /* Even a deranged Harper would have raised you better than your own family clearly did. */ + PID.Childhood.deranged
	++ @2902 /* Fine. I won't bother you about it. */ EXIT
END

IF ~~ PID.Childhood.acc
 SAY @2915 /* I sometimes think it was. */
	++ @2896 /* You mentioned that you once ran away from home? */ + PID.Childhood.runaway
	+ ~Class("rh#Adrian",SORCERER)~ + @2897 /* You must have at least some pleasant memories of it. */ + PID.Childhood.pleasant1
	+ ~!Class("rh#Adrian",SORCERER)~ + @2897 /* You must have at least some pleasant memories of it. */ + PID.Childhood.pleasant2
	++ @2898 /* After being questioned on my past, I think I'm well within my rights to want to know more about yours. */ + PID.Childhood.past
	++ @2908 /* Fine. Never mind. */ EXIT
END

IF ~~ PID.Childhood.runaway
 SAY @2916 /* My cousins... well, they were older than I was, and childhood rivalries... our grandfather encouraged them, to say the least. It weeds out the weak, he'd say, even though he hardly needed any excuses. */
 = @2917 /* It was a long time ago, <CHARNAME>. It hardly matters now. */
IF ~~ EXIT
END

IF ~~ PID.Childhood.past2
 SAY @2910 /* Is that what this is? Needless to say, I didn't grow up in Candlekeep, and I certainly didn't have a deranged Harper for a foster father. */
 = @2916 /* My cousins... well, they were older than I was, and childhood rivalries... our grandfather encouraged them, to say the least. It weeds out the weak, he'd say, even though he hardly needed any excuses. */
 = @2917 /* It was a long time ago, <CHARNAME>. It hardly matters now. */
IF ~~ EXIT
END

IF ~~ PID.Childhood.notpleasant
 SAY @2918 /* It's certainly the most pleasant memory I have of my cousins, at least. */
 = @2919 /* (smile) Well, the second most pleasant. */
 = @2920 /* They were older than I was, and childhood rivalries... our grandfather encouraged them, to say the least. It weeds out the weak, he'd say, even though he hardly needed any excuses. */
 = @2917 /* It was a long time ago, <CHARNAME>. It hardly matters now. */
IF ~~ EXIT
END

IF ~~ PID.Childhood.run2
 SAY @2921 /* No, not quite. My cousins... well, they were older than I was, and childhood rivalries... our grandfather encouraged them, to say the least. It weeds out the weak, he'd say, even though he hardly needed any excuses. */
 = @2917 /* It was a long time ago, <CHARNAME>. It hardly matters now. */
IF ~~ EXIT
END

IF ~~ PID.Childhood.monster
 SAY @2922 /* A little monster? (smile) I suppose I had to be. My cousins... well, they were older than I was, and childhood rivalries... */
 = @2923 /* Our grandfather encouraged them, to say the least. It weeds out the weak, he'd say, even though he hardly needed any excuses. */
 = @2917 /* It was a long time ago, <CHARNAME>. It hardly matters now. */
IF ~~ EXIT
END

IF ~~ PID.Childhood.cormyr
 SAY @2924 /* Here and there. I spent quite some time in Deepingdale and Cormyr. Alas, the Crown wasn't too fond of me. */ 
IF ~~ EXIT
END
END

CHAIN RH#ADRJ PID.Childhood.harper
@2925 /* Don't think that we didn't catch Harpers wandering about every now and then. */
== RH#ADRJ IF ~OR(3) !InParty("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID) !InMyArea("Jaheira")~ THEN @2926 /* That was always... exciting, even if the fallout was a bit more public than I would have liked. */
== RH#ADRJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) InMyArea("Jaheira")~ THEN @2927 /* I would tell you all about their terrible, terrible fates, but your own Harper hates me enough as it is. */
EXIT

CHAIN RH#ADRJ PID.Childhood.family
@2928 /* Once upon a time. */
= @2917 /* It was a long time ago, <CHARNAME>. It hardly matters now. */
EXIT

CHAIN RH#ADRJ PID.Childhood.deranged
@2929 /* (smile) Perish the thought. */
EXIT

// Family

CHAIN RH#ADRJ PID.Family
@2930 /* There's not that much more to tell. */
DO ~SetGlobal("rh#PID.Family","GLOBAL",2)~
END
	++ @2931 /* You haven't told me much of anything at all. Did your mother raise you? */ + PID.Family.mother
	++ @2932 /* You've mentioned your grandfather a time or two. Was your mother not around? */ + PID.Family.mother
	++ @2933 /* You history is hardly dull, you know. I'm sure you can think of something to add. */ + PID.Family.add
	++ @2934 /* You can't honestly expect me to believe that. The son of a lord's daughter... what does that make you? */ + PID.Family.lordling
	++ @2865 /* Fine. Keep your secrets. */ EXIT

APPEND RH#ADRJ 

IF ~~ PID.Family.mother
 SAY @2935 /* Not exactly. She was sent away again when I was eight or so years old. I haven't seen her since. After that... well, my uncles were around, more or less. */
IF ~~ + PID.Family.uncles
END

IF ~~ PID.Family.add
 SAY @2936 /* You aren't going to let this lie, are you? If you must know, my mother was sent away again when I was eight or so years old. I haven't seen her since. After that... well, my uncles were around, more or less. */
IF ~~ + PID.Family.uncles
END

IF ~~ PID.Family.lordling
 SAY @2937 /* Fabulously rich. */
IF ~~ + PID.Family.add
END

IF ~~ PID.Family.uncles
 SAY @2938 /* One was a lieutenant with the Zhentilar... a witless fool who'd cared more about his career than his own children, let alone me. Not that it got him very far in the end. His brother... */
 = @2939 /* His brother took me on as an apprentice once my own talent for the Art became obvious. We... traveled quite a bit. For a time, at least. */
	+ ~Class("rh#Adrian",SORCERER)~ + @2940 /* Was he a sorcerer as well? */ + PID.Family.enchanter
	+ ~!Class("rh#Adrian",SORCERER)~ + @2941 /* Was he a mage as well? */ + PID.Family.enchanter
	++ @2942 /* Do you know what happened to your mother? */ + PID.Family.agents
	++ @2943 /* Are any of your relatives still living? */ DO ~SetGlobal("rh#PID.Cousins","GLOBAL",1)~ + PID.Family.living
	++ @202 /* I see. */ EXIT
END

IF ~~ PID.Family.enchanter
 SAY @2944 /* An enchanter... amongst other things. I can't say he actually spent much time teaching me about the Art, but... well, I learned quite a bit in general. Nothing I would care to share, though. */
	++ @2942 /* Do you know what happened to your mother? */ + PID.Family.agents
	++ @2945 /* Could you tell me if any of your relatives are still living? */ DO ~SetGlobal("rh#PID.Cousins","GLOBAL",1)~ + PID.Family.living
	++ @1581 /* Then I'll leave you alone. */ EXIT
END

IF ~~ PID.Family.agents
 SAY @2946 /* No, I don't. I doubt she's even still alive, though I couldn't say for certain. Our enemies don't usually return the bodies. When somebody disappears, it can be difficult to know exactly why. */
 = @2947 /* For once, I suppose that's something to be grateful for. Are we quite done here, <CHARNAME>? */
	++ @2945 /* Could you tell me if any of your relatives are still living? */ DO ~SetGlobal("rh#PID.Cousins","GLOBAL",1)~ + PID.Family.living
	++ @2948 /* I'll leave you alone, if that's what you want. */ EXIT
END

IF ~~ PID.Family.living
 SAY @2949 /* I honestly couldn't say. Most of them just disappeared at some point or another. Both of my uncles I know are dead; my two cousins... */
 = @2950 /* The poor lads managed to get themselves sold to a Thayvian slave trader. They may yet be living. */
	++ @2951 /* That's terrible! I'm sorry to hear it. */ + PID.Family.sorry
	++ @2952 /* I would hardly consider that a life. */ + PID.Family.life
	++ @2953 /* *Both* of them? */ + PID.Family.both
	++ @2954 /* I'm beginning to regret asking you at all. */ + PID.Family.regret
END

IF ~~ PID.Family.sorry
 SAY @2955 /* Don't be. I most certainly am not. */
IF ~~ EXIT
END

IF ~~ PID.Family.life
 SAY @2956 /* I don't disagree. Not anymore. */
IF ~~ EXIT
END
	
IF ~~ PID.Family.both
 SAY @2957 /* (smile) Life in Zhentil Keep can be very dangerous. */
IF ~~ EXIT
END

IF ~~ PID.Family.regret
 SAY @2958 /* (smile) My stories are hardly worse than your own, <CHARNAME>. */
IF ~~ EXIT
END
END

// Cousins

CHAIN RH#ADRJ PID.Cousins
@2959 /* Nothing that they didn't have coming. */
DO ~SetGlobal("rh#PID.Family","GLOBAL",3)~
END
	++ @2960 /* What did you do? */ + PID.Cousins.happened
	++ @2961 /* I suppose I really don't want to hear this. */ + PID.Cousins.no

APPEND RH#ADRJ 

IF ~~ PID.Cousins.happened
 SAY @2962 /* If you must know... I was just shy of my twentieth birthday, recently returned from Cormyr. I was half mad at that point, mad enough to offer myself to the powers that be, more than mad enough to... well. */
 = @2963 /* One of them said... something. I don't even remember exactly what. They'd said so many things over the years, it's difficult to keep them straight. I charmed them, I dragged them to the nearest slave trader... (smile) He happened to be from Thay. */
 = @2964 /* The Keep is a dangerous place for a Red Wizard, but for a simple trader with coin to spend... well, it can be quite profitable. */
	++ @2965 /* You would do something like that to your own relatives? */ + PID.Cousins.relatives
	++ @2966 /* You picked a Thayvian on purpose, didn't you? */ + PID.Cousins.thay
	++ @2967 /* I must admit, that's a creative way to settle a feud. */ + PID.Cousins.feud
	++ @2968 /* I really don't want to hear this anymore. */ + PID.Cousins.no
END

IF ~~ PID.Cousins.relatives
 SAY @2969 /* Coming from a <PRO_MANWOMAN> who killed <PRO_HISHER> own brother, that's delicious. What's blood next to years of hatred and abuse? */
	++ @2970 /* No remorse whatsoever, then? */ + PID.Cousins.remorse
	++ @2971 /* At least I didn't have a choice. */ + PID.Cousins.choice
	++ @2972 /* Don't misunderstand me; I'm actually impressed. */ + PID.Cousins.impress
	++ @2968 /* I really don't want to hear this anymore. */ + PID.Cousins.no
END

IF ~~ PID.Cousins.thay
 SAY @2973 /* Mmm, they do have quite the reputation, don't they? Nothing but the very best for my dear cousins. If they're lucky, they may yet be living on some farm in Thay, though I doubt they've lasted this long. */
	++ @2970 /* No remorse whatsoever, then? */ + PID.Cousins.remorse
	++ @2974 /* I'm surprised that the thought of selling people into slavery still gives you such pleasure. */ + PID.Cousins.pleasure
	++ @2975 /* It's a pity that there's no slaver in existence who could handle Irenicus. */ + PID.Cousins.irenicus
	++ @2968 /* I really don't want to hear this anymore. */ + PID.Cousins.no
END

IF ~~ PID.Cousins.feud
 SAY @2976 /* Indeed. If my cousins are lucky, they may yet be living on some farm in Thay, though I very much doubt they've lasted this long. */
	++ @2970 /* No remorse whatsoever, then? */ + PID.Cousins.remorse
	++ @2974 /* I'm surprised that the thought of selling people into slavery still gives you such pleasure. */ + PID.Cousins.pleasure
	++ @2975 /* It's a pity that there's no slaver in existence who could handle Irenicus. */ + PID.Cousins.irenicus
	++ @2968 /* I really don't want to hear this anymore. */ + PID.Cousins.no
END

IF ~~ PID.Cousins.remorse
 SAY @2977 /* I never pity the stupid and the weak, and they turned out to be both. Hells, my grandfather was pleased when he found out. The little half-elven freak had finally grown into a real Zhent. It just took a bit of pushing. */
IF ~~ EXIT
END

IF ~~ PID.Cousins.choice
 SAY @2978 /* A choice, was it? I assure you, <CHARNAME>, they would have done the same to me eventually. Hells, my grandfather was pleased when he found out. The little half-elven freak had finally grown into a real Zhent. It just took a bit of pushing. */
IF ~~ EXIT
END

IF ~~ PID.Cousins.impress
 SAY @2979 /* Ah. Then excuse my defensiveness. */
IF ~~ EXIT
END

IF ~~ PID.Cousins.pleasure
 SAY @2980 /* They were thugs, <CHARNAME>. They were never going to be anything more than thugs. Hells, my grandfather was pleased when he found out. The little half-elven freak had finally grown into a real Zhent. It just took a bit of pushing. */
IF ~~ EXIT
END

IF ~~ PID.Cousins.irenicus
 SAY @2981 /* Yes... that is unfortunate. */
IF ~~ EXIT
END

IF ~~ PID.Cousins.no
 SAY @2982 /* No? That's quite alright. */
IF ~~ EXIT
END
END

// Marriage

CHAIN RH#ADRJ PID.Marriage
@2983 /* Ivanna... Ivanna Blackryn. Slightly over a decade ago now. My grandfather had had it arranged, and neither she nor I really had the option of refusing. */
DO ~SetGlobal("rh#PID.Family","GLOBAL",4)~
END
	++ @2984 /* Would you have rather refused? */ + PID.Marriage.refuse
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2985 /* You didn't kill her, did you? */ + PID.Marriage.kill
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2985 /* You didn't kill her, did you? */ + PID.Marriage.kill2
	++ @2986 /* What was she like? */ + PID.Marriage.ivanna
	++ @2987 /* That's unfortunate. */ + PID.Marriage.unfortunate
	
APPEND RH#ADRJ 

IF ~~ PID.Marriage.refuse
 SAY @2988 /* No, I don't think so. I didn't care for her at first, but it was a very good match politically. */
	++ @2989 /* How so? */ + PID.Marriage.match
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2990 /* Is that all that mattered to you? Politics? */ + PID.Marriage.politics1
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2990 /* Is that all that mattered to you? Politics? */ + PID.Marriage.politics2
	++ @2986 /* What was she like? */ + PID.Marriage.ivanna
	++ @2991 /* What happened to her? */ + PID.Marriage.happen
END

IF ~~ PID.Marriage.kill
 SAY @2992 /* ...no, I didn't. Why does everybody always assume that? Whatever else you might want to say about me, I've never actually murdered my lovers. */
	++ @2993 /* Calm down, I didn't mean to offend. */ + PID.Marriage.offend
	++ @2994 /* I honestly wouldn't put anything past you. */ + PID.Marriage.putpast
	++ @2995 /* Could you tell me what she was like? */ + PID.Marriage.ivanna
	++ @2996 /* What did happen to her? */ + PID.Marriage.happen
END

IF ~~ PID.Marriage.kill2
 SAY @2992 /* ...no, I didn't. Why does everybody always assume that? Whatever else you might want to say about me, I've never actually murdered my lovers. */
= @2997 /* As far as I can tell, she walked into one of the zones of wild magic that had sprung up across the city. Bane wasn't around at that point, so there wasn't a damn thing a cleric could do about it. */
= @2998 /* I'm sorry, <CHARNAME>, I just... could you please not imply that you don't trust me? */
	++ @2999 /* I'm sorry. I really was just joking. */ + PID.Marriage.joke
	++ @3000 /* I do trust you, but you can't deny that the people you dislike tend to end up dead. */ + PID.Marriage.dead
	++ @3001 /* I trust who you are now, Adrian. The person you were ten years ago, however, seems more than a little bit unstable. */ + PID.Marriage.unstable
	++ @3002 /* I might enjoy having you around, but I would sooner trust a snake. */ + PID.Marriage.snake
END

IF ~~ PID.Marriage.ivanna
 SAY @3003 /* Surprisingly docile for a Zhent noblewoman, but there was iron underneath. She loved her family... hells, she was even willing to marry me for them. */
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3004 /* That doesn't seem like such a horrible fate. */ + PID.Marriage.fate1
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3004 /* That doesn't seem like such a horrible fate. */ + PID.Marriage.fate2
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3005 /* That poor woman. */ + PID.Marriage.poorwoman1
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3005 /* That poor woman. */ + PID.Marriage.poorwoman2
	++ @3006 /* But would you have rather refused her? */ + PID.Marriage.refuse
	++ @2991 /* What happened to her? */ + PID.Marriage.happen
END

IF ~~ PID.Marriage.unfortunate
 SAY @3007 /* It was fairly normal politics, but my thanks for the sentiment. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.match
 SAY @3008 /* The Blackryns were one of the oldest families in the city... what they lacked in power, they made up in prestige. There had once been magic in the bloodline, but it had long since died out. */
= @3009 /* I appreciated the connections, they appreciated the fresh influx of magical blood... it was all very symbiotic. */
	++ @3010 /* How very romantic. */ + PID.Marriage.romantic
	++ @2991 /* What happened to her? */ + PID.Marriage.happen
	++ @3011 /* You should have picked someone with real power instead. */ + PID.Marriage.power
	++ @3012 /* I guess I could never accuse you of not being opportunistic. */ + PID.Marriage.putpast
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2990 /* Is that all that mattered to you? Politics? */ + PID.Marriage.politics1
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @2990 /* Is that all that mattered to you? Politics? */ + PID.Marriage.politics2
END

IF ~~ PID.Marriage.politics1
 SAY @3013 /* At the time? I was young, <CHARNAME>, and love was not something I'd ever been taught to value. */
= @3014 /* Do we need to talk about this? */
IF ~~ EXIT
END

IF ~~ PID.Marriage.politics2
 SAY @3015 /* At the time? Yes. What's the point of a political marriage that isn't politically sound? */
IF ~~ EXIT
END

IF ~~ PID.Marriage.happen
 SAY @3016 /* She died. During the Time of Troubles. As far as I can tell, she walked into one of the zones of wild magic that had sprung up across the city. Bane wasn't around at that point, so there wasn't a damn thing a cleric could do about it. */
= @3017 /* It's... not the sort of thing I really care to think about, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.putpast
 SAY @3018 /* No... I suppose not. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.offend
 SAY @3019 /* No? I suppose it comes naturally, then. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.joke
 SAY @3020 /* I... see. Could we please not speak about her? */
IF ~~ EXIT
END

IF ~~ PID.Marriage.dead
 SAY @3021 /* I didn't quite dislike her, <CHARNAME>. I may never have truly loved her, but... I suppose we were good for each other while it lasted. Could we please not speak about her? */
IF ~~ EXIT
END

IF ~~ PID.Marriage.unstable
 SAY @3022 /* I... alright, I suppose that's a fair point. */
= @3023 /* If there's one thing that my marriage to Ivanna did for me, I suppose it left me somewhat calmer, but... <CHARNAME>, could we please not speak about her? */
IF ~~ EXIT
END

IF ~~ PID.Marriage.snake
 SAY @3024 /* I'm sorry to hear that. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ PID.Marriage.fate1
 SAY @3025 /* Heh. I'm glad to hear it, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.fate2
 SAY @3026 /* Well, there are certainly worse ones. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.poorwoman1
 SAY @3027 /* (smile) You, my dear, walked into it with open eyes. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.poorwoman2
 SAY @3028 /* There are worse fates, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.romantic
 SAY @3029 /* I hope you weren't expecting poetry and rose petals. */
IF ~~ EXIT
END

IF ~~ PID.Marriage.power
 SAY @3030 /* ...somehow I doubt that the high lord Manshoon would have accepted my suit. */
IF ~~ EXIT
END
END

// Soargyl encounter

CHAIN RH#ADRJ pid.soargyl
@3031 /* Our Sembian protegy? I should have expected him to turn up sooner or later... it was sloppy to let him escape Sembia alive at all. */
DO ~SetGlobal("rh#SoargylAftermath","GLOBAL",3)~
END
	++ @3032 /* What happened between you two? */ + pid.soargyl1.1
	++ @3033 /* Who was he? */ + pid.soargyl1.1
	++ @3034 /* That was careless of you. */ + pid.soargyl1.2
	++ @3035 /* You don't need to make every problem disappear, you know. */ + pid.soargyl1.3
	
APPEND RH#ADRJ

IF ~~ pid.soargyl1.1
 SAY @3036 /* He was a member of a merchant family in Selgaunt, and I... well, I let him court me for a time. Wizards may be as common as weeds in Sembia, but one who was already entrenched in a rival household... we can be valuable. */
 = @3037 /* I was very good at playing the role of the disillusioned underling, and the fool was convinced he had me. He told me things he shouldn't have, and when he had nothing more of value to share... needless to say, keeping him around would have been dangerous. */
	++ @3038 /* So you set him up and got him thrown out of the country. */ + pid.soargyl1.5
	++ @3039 /* Wouldn't it have been easier to kill him? */ + pid.soargyl1.6
	++ @3040 /* How often did you play games like that? */ + pid.soargyl1.7
	++ @3041 /* You're lucky I didn't just let him have you. */ + pid.soargyl1.8
END

IF ~~ pid.soargyl1.2
 SAY @3042 /* I won't deny that. */
	++ @3032 /* What happened between you two? */ + pid.soargyl1.1
	++ @3033 /* Who was he? */ + pid.soargyl1.1
	++ @3043 /* Let's move on. */ + pid.soargyl1.4
END

IF ~~ pid.soargyl1.3
 SAY @3044 /* And yet you see what happens when I don't. */
	++ @3032 /* What happened between you two? */ + pid.soargyl1.1
	++ @3033 /* Who was he? */ + pid.soargyl1.1
	++ @3043 /* Let's move on. */ + pid.soargyl1.4	
END

IF ~~ pid.soargyl1.4
 SAY @3045 /* Gladly. */
IF ~~ EXIT
END

IF ~~ pid.soargyl1.5
 SAY @3046 /* In the end, it was the simplest solution. He was from a powerful family... it was best to let them handle him. */
IF ~~ EXIT
END
	
IF ~~ pid.soargyl1.6
 SAY @3047 /* And face the inevitable investigation? He was from a powerful family... it was best to let them handle him. */
IF ~~ EXIT
END
	
IF ~~ pid.soargyl1.7
 SAY @3048 /* Often enough. Really, <CHARNAME>, intrigue is something of a sport in Sembia. */
IF ~~ EXIT
END
	
IF ~~ pid.soargyl1.8
 SAY @3049 /* And you have my thanks for that. */
IF ~~ EXIT
END
END

// Romance Questions

CHAIN RH#ADRJ rh#PID.Life1
@3050 /* Heh. I hope that's not a complaint. */
DO ~SetGlobal("rh#PID.Life","GLOBAL",1)~
END
 	++ @3051 /* Not about you, no. Just everything else. */ DO ~SetGlobal("rh#PIDLife2","GLOBAL",1)~ + rh#PIDLife1.1
 	++ @3052 /* Just an observation. */ + rh#PIDLife1.1
 	++ @3053 /* Well, you're not exactly prince charming, you know. */ + rh#PIDLife1.2

CHAIN RH#ADRJ rh#PIDLife1.1
@3054 /* I... suppose I can appreciate the sentiment, <CHARNAME>. Just remember that it can always be worse. */
EXIT

CHAIN RH#ADRJ rh#PIDLife1.2
@3055 /* My dear, you would have been bored by prince charming. */
EXIT

CHAIN RH#ADRJ rh#PID.Marriage1
@3056 /* What? Oh, you mean by a Sunite or a Lathandrite or something along those lines? I suppose it never really occurred to me. */
EXIT

CHAIN RH#ADRJ rh#PID.Marriage2
@3057 /* I can't say I've never considered it, but... perhaps that's a conversation that should wait until after this mess is over. */
EXIT

// Soullessness

CHAIN RH#ADRJ rh#PID.soul
@3058 /* I honestly can't imagine what that must feel like. You know I'll do whatever I can to help you, but I really don't know where to start. */
DO ~SetGlobal("rh#PIDsoul","GLOBAL",1)~
END
	++ @3059 /* It doesn't really feel any different at all. I'm just not sure what will happen if I don't get it back. */ + rh#PID.soul1
	++ @3060 /* I'm just afraid I'm going to lose control and kill someone. You, perhaps. */ + rh#PID.soul2
	++ @3061 /* It hurts. It's like a mortal wound that no amount of divine magic can heal. */ + rh#PID.soul3
	++ @3062 /* Well, I survived that horrible ritual. I'm sure I can hang on long enough to tear Irenicus apart and get it back. */ + rh#PID.soul4
	++ @3063 /* Do you think I'll even have an afterlife if I die before I get it back? */ + rh#PID.soul1

APPEND RH#ADRJ

IF ~~ rh#PID.soul1
 SAY @3064 /* I wish I could answer that question for you. I... I would guess that your ultimate fate is tied to Irenicus' now. Not the most pleasant of thoughts, I know. */
	++ @3065 /* How long do you think I have? */ + rh#PID.soul.time
	++ @1552 /* You're really not helping. */ + rh#PID.soul.help
	++ @3066 /* You're not going to run away from me, are you? */ + rh#PID.soul.run
	++ @3067 /* Have you really never heard of anything like this before? */ + rh#PID.soul.heard
END

IF ~~ rh#PID.soul2
 SAY @3068 /* If I can't get out of the way of your claws... hells, what a morbid topic. Still, I'm aware of the risks. */
	++ @3065 /* How long do you think I have? */ + rh#PID.soul.time
	++ @3069 /* If you can't get out of my way? You're really not helping, you know. */ + rh#PID.soul.help
	++ @3066 /* You're not going to run away from me, are you? */ + rh#PID.soul.run
	++ @3067 /* Have you really never heard of anything like this before? */ + rh#PID.soul.heard
END

IF ~~ rh#PID.soul3
 SAY @3070 /* I'm sorry. If I could do anything to lessen it... well, you know I would. */
	++ @3065 /* How long do you think I have? */ + rh#PID.soul.time
	++ @3071 /* Is that all you have to say? You're really not helping, you know. */ + rh#PID.soul.help
	++ @3066 /* You're not going to run away from me, are you? */ + rh#PID.soul.run
	++ @3067 /* Have you really never heard of anything like this before? */ + rh#PID.soul.heard
END

IF ~~ rh#PID.soul4
 SAY @3072 /* Good. And in the meantime... well, if you ever need anything. */
	++ @3065 /* How long do you think I have? */ + rh#PID.soul.time
	++ @3071 /* Is that all you have to say? You're really not helping, you know. */ + rh#PID.soul.help
	++ @3066 /* You're not going to run away from me, are you? */ + rh#PID.soul.run
	++ @3067 /* Have you really never heard of anything like this before? */ + rh#PID.soul.heard
END

IF ~~ rh#PID.soul.time
 SAY @3073 /* I think that depends upon you, <CHARNAME>. You've as much willpower as anyone I've ever known, and as long as you cling to that, we can hope for the best. */
IF ~~ EXIT
END

IF ~~ rh#PID.soul.help
 SAY @3074 /* I... I know. I'm sorry. There are some problems that talking helps to solve, and some... every second we waste is a small gift to Irenicus. We'll find him, <CHARNAME>. We have to. */
IF ~~ EXIT
END

IF ~~ rh#PID.soul.run
 SAY @3075 /* ...I've never been very good at running away before, <CHARNAME>. I'll be here to the bitter end... that much I can promise. */
IF ~~ EXIT
END

IF ~~ rh#PID.soul.heard
 SAY @3076 /* I've seen quite a few things, <CHARNAME> -- powerful men sometimes survived being possessed by gods during the Time of Troubles... but even that was somewhat different than this. */
 = @3077 /* You've as much willpower as anyone I've ever known, and as long as you cling to that, we can hope for the best. */
IF ~~ EXIT
END
END

// Imoen

CHAIN RH#ADRJ rh#PID.imoen1
@3078 /* I... understand that. For what it's worth, she has a better chance than most people ever get. */
DO ~SetGlobal("rh#PIDImoen1","GLOBAL",1)~
END
 	++ @3079 /* I know. She has people coming after her, at least. */ + rh#PID.imoen1a
 	++ @3080 /* How can you even say that? She's trapped with a mad archmage! */ + rh#PID.imoen1b
 	++ @3081 /* She always was strong. Stronger than she seemed. */ + rh#PID.imoen1c

CHAIN RH#ADRJ rh#PID.imoen1a
@3082 /* And you... I wouldn't bet against you, <CHARNAME>. Ever. */
EXIT

CHAIN RH#ADRJ rh#PID.imoen1b
@3083 /* I know. I know that as well as anyone. But you... I wouldn't bet against you, <CHARNAME>. Ever. */
EXIT

CHAIN RH#ADRJ rh#PID.imoen1c
@3084 /* I... certainly hope so. But dwelling upon it won't change anything. Let's just find her. And Irenicus. */
EXIT

// Imoen 2

CHAIN RH#ADRJ rh#PID.imoen2
@3085 /* I'm honestly more worried about you, but... she's strong, that one. She might not look like it, but then strength isn't always as black and white as it might seem. */
DO ~SetGlobal("rh#PIDImoen2","GLOBAL",1)~
EXIT

// Nightmare

CHAIN RH#ADRJ rh#PID.nightmare
@3086 /* I don't blame you. Are they... are you having nightmares about Irenicus? What he did to you? */
DO ~SetGlobal("rh#PIDdreams","GLOBAL",1)~
END
 	++ @3087 /* More or less. They're pretty bad. What I remember of them, at least. */ + rh#PID.nightmare1
  	+ ~GlobalGT("AsylumPlot","GLOBAL",39)~ + @3088 /* He used to offer me power, you know. In my dreams, he was there, as often as not, talking about my potential. */ + rh#PID.nightmare2
 	+ ~GlobalLT("AsylumPlot","GLOBAL",40)~ + @3089 /* He offers me power, you know. In my dreams, he's there, as often as not, talking about my potential. */ + rh#PID.nightmare3
 	++ @3090 /* I have all types of nightmares. Irenicus features in some of them, but not all. */ + rh#PID.nightmare1
 	++ @3091 /* I shouldn't complain about this. Talking won't help. */ + rh#PID.nightmare4

APPEND RH#ADRJ

IF ~~ rh#PID.nightmare1
 SAY @3092 /* I... can imagine. I was there too. Hells, the things I'd like to do to that man... */
 = @3093 /* You don't have to talk about it if you don't want to, but if you do, I will listen. */
	++ @3094 /* I think that might help. */ + rh#PID.nightmare5
	++ @3095 /* Well, I'd normally refuse, but I'd hate to disappoint you. */ + rh#PID.nightmare5
	++ @3096 /* And risk waking your memories too? No, I'd rather not. */ + rh#PID.nightmare4
 	++ @3097 /* No, I really don't want to remember any more of it. */ + rh#PID.nightmare4
END

IF ~~ rh#PID.nightmare2
 SAY @3098 /* He... oh, I didn't know that. Is this a new thing? */
	++ @3099 /* New enough, yes. Ever since getting out of that dungeon, he's been in my head, trying to lure me in with these empty promises of unlocking my potential, as if I need his help to gain control over my own power. */ + rh#PID.nightmare7
	++ @3100 /* New enough. He shows me terrible things... things I could do if I accepted Bhaal's legacy. I tell him I don't care, but he comes back. Over and over again. */ + rh#PID.nightmare7
	++ @3101 /* No, it started after I left Candlekeep. A whispering voice in my dreams... dead Bhaal, demanding I submit, as if I gave a damn what some ghost wanted me to do with my own power. */ + rh#PID.nightmare8
	++ @3102 /* No, it started after I left Candlekeep. Sinister voices in my dreams... my dead father, trying to win my submission, night after night... */ + rh#PID.nightmare8
	++ @3103 /* I really don't want to talk about it. */ + rh#PID.nightmare4
END

IF ~~ rh#PID.nightmare3
 SAY @3104 /* He... oh, I didn't know that. Was this a new thing? */
	++ @3105 /* New enough, yes. Ever since we got out of that dungeon, he was in my head, trying to lure me in with empty promises of unlocking my potential... obviously, it worked. */  + rh#PID.nightmare9
	++ @3106 /* New enough. He showed me terrible things... things I could do if I accepted Bhaal's legacy. I told him I didn't care, but he came back. Over and over again. */ + rh#PID.nightmare9
	++ @3101 /* No, it started after I left Candlekeep. A whispering voice in my dreams... dead Bhaal, demanding I submit, as if I gave a damn what some ghost wanted me to do with my own power. */ + rh#PID.nightmare8
	++ @3102 /* No, it started after I left Candlekeep. Sinister voices in my dreams... my dead father, trying to win my submission, night after night... */ + rh#PID.nightmare8
	++ @3107 /* I really don't want to talk about this. */ + rh#PID.nightmare4
END

IF ~~ rh#PID.nightmare4
 SAY @3108 /* Let's just move on, then. Still, if you ever do want to... */
 = @3109 /* Well. You know that I'm here. */
IF ~~ EXIT
END

IF ~~ rh#PID.nightmare5
 SAY @3110 /* All right. Come a bit closer, and you can tell me whatever you'd like. */
IF ~~ EXIT
END

IF ~~ rh#PID.nightmare6
 SAY @3111 /* I hope you're right, <CHARNAME>. I really do. */
IF ~~ EXIT
END

IF ~~ rh#PID.nightmare7
 SAY @3112 /* I'm sorry, that's... well, it doesn't even take an inconceivably powerful wizard to send messages through dreams, consensually or otherwise. That he'd be able to, even in the Cowled Wizards' hands... that doesn't bode well. */
 = @3113 /* Still, it's just another type of torture, <CHARNAME>. Don't listen to him. */
 	++ @3114 /* He had better still be in Spellhold when we get there. */ + rh#PID.nightmare10
 	++ @3115 /* I try not to. I just wish none of this had ever happened. */ + rh#PID.nightmare10
 	++ @3116 /* Wonderful. That just makes me worry about Imoen more. */ + rh#PID.nightmare10
 	++ @3117 /* I know that, Adrian. Let's stop talking about him now. */ + rh#PID.nightmare4
END

IF ~~ rh#PID.nightmare8
 SAY @3118 /* That's...what I was afraid of. I used to hear stories like that back home... mad Cyric haunting Banite priests' dreams, trying to force their submission before he lost patience and decided to kill the lot of them. That a dead god would do it too... */
 = @3119 /* That's disturbing, and I can't help but wonder who the true force behind your dreams about Irenicus is... the wizard or your father. */
 	++ @3120 /* As long as I keep on denying them, I don't think it makes much of a difference. */ + rh#PID.nightmare6
 	++ @3121 /* I've wondered about that often enough myself. */ + rh#PID.nightmare10
 	++ @3122 /* I know. I just wish none of this had ever happened. */ + rh#PID.nightmare10
 	++ @3123 /* Talking about this is just making it worse. Could we please just stop? */ + rh#PID.nightmare4
END

IF ~~ rh#PID.nightmare9
 SAY @3124 /* I'm sorry, that's... well, it doesn't even take an inconceivably powerful wizard to send messages through dreams, consensually or otherwise. Led along like cattle from the start... */
 = @3125 /* Well, we've survived this long. I won't believe he's invincible. */
 	++ @3126 /* Neither will I. */ + rh#PID.nightmare11
 	++ @3127 /* I just wish that none of this had ever happened. */ + rh#PID.nightmare10
 	++ @3128 /* He's seemed pretty damn invulnerable so far. */ + rh#PID.nightmare11
 	++ @3129 /* Let's stop talking about him now. */ + rh#PID.nightmare4
END

IF ~~ rh#PID.nightmare10
 SAY @3130 /* (sigh) Dwelling upon it won't change anything. Let's just find the bastard. */
IF ~~ EXIT
END 

IF ~~ rh#PID.nightmare11
 SAY @3131 /* There's a difference between undefeated and invincible. Our damn wizard is going to have to learn that sooner of later. */
IF ~~ EXIT
END
END

// Wishful Thinking

CHAIN RH#ADRJ rh#PID.wishes
@3132 /* Everything? Don't say that, <CHARNAME>. It's not all bad. Look at you. You've survived every challenge thrown at you. More than survived. You're practically a force of nature. */
= @3133 /* Don't wish all of this away. Please. */
DO ~SetGlobal("rh#PIDwishes","GLOBAL",1)~
END
	++ @3134 /* But is it worth all of the sacrifices? I don't think so. */ + rh#PID.wishes1
	++ @3135 /* Don't wish you away, you mean? */ + rh#PID.wishes2
	++ @3136 /* I don't. Not really. But if I can complain about it, I certainly intend to do so. */ + rh#PID.wishes3
	++ @3137 /* How can I not? I really don't want to talk about this. */ + rh#PID.wishes4

CHAIN RH#ADRJ rh#PID.wishes1
@3138 /* In the end, I suppose it has to be. */
EXIT

CHAIN RH#ADRJ rh#PID.wishes2
@3139 /* Among other things, yes. */
EXIT

CHAIN RH#ADRJ rh#PID.wishes3
@3140 /* Heh. You're turning into me, my dear. */
EXIT

CHAIN RH#ADRJ rh#PID.wishes4
@3141 /* Let's just move on, then. */
EXIT

// Overwhelmed

CHAIN RH#ADRJ rh#PID.whelm
@3142 /* I feel like that too. I'm used to high stakes, but this...? */
DO ~SetGlobal("rh#PIDwhelm","GLOBAL",1)~
END
	++ @3143 /* What if we lose? */ + rh#PID.whelm1
	++ @3144 /* Well, if you're falling apart, I just feel spectacular. */ + rh#PID.whelm2
	++ @3145 /* It'll be okay. It'll have to be okay. */ + rh#PID.whelm3
	++ @3146 /* You're supposed to dismiss my concerns, not agree with them! */ + rh#PID.whelm4
	++ @3147 /* Well, at least I'm not the only one worried. */ + rh#PID.whelm5

CHAIN RH#ADRJ rh#PID.whelm1
@3148 /* We won't. To even think it is to court defeat. You're stronger than you think you are, <CHARNAME>. We'll win. We have to. */
EXIT

CHAIN RH#ADRJ rh#PID.whelm2
@3149 /* I'm...not. Not exactly. You're stronger than you think you are, <CHARNAME>. We'll win. We have to. */
EXIT

CHAIN RH#ADRJ rh#PID.whelm3
@3150 /* We win or we die, my dear? With those options, you're right. It'll be okay. You're stronger than you think you are. */
EXIT

CHAIN RH#ADRJ rh#PID.whelm4
@3151 /* I can't do both? We'll win, <CHARNAME>. We have to. You're stronger than you think you are. */
EXIT

CHAIN RH#ADRJ rh#PID.whelm5
@3152 /* No, you're not, but... we'll win, <CHARNAME>. We have to. You're stronger than you think you are. */
EXIT

// Survival

CHAIN RH#ADRJ rh#PID.alive
@3153 /* I honestly don't know. Against a mage that powerful, I can't say I care for our chances, but... in Tymora's hands is not where I like to be, but in the end, I suppose we ultimately have no choice. */
= @3154 /* I doubt that's very reassuring. */
DO ~SetGlobal("rh#PIDalive","GLOBAL",1)~
END
 	++ @3155 /* No, it's not. */ + rh#PID.alive1
 	++ @3156 /* I did ask for the truth. */ + rh#PID.alive2
 	++ @3157 /* I have no quarrel with Tymora. She's always smiled upon me before. */ + rh#PID.alive3
 	++ @3158 /* And yet you stay. */ + rh#PID.alive4

CHAIN RH#ADRJ rh#PID.alive1
@3159 /* I'm sorry, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#PID.alive2
@301 /* I know. */
EXIT

CHAIN RH#ADRJ rh#PID.alive3
@3160 /* She's never been particularly fond of me, so hopefully your luck will be enough. */
EXIT

CHAIN RH#ADRJ rh#PID.alive4
@3161 /* <CHARNAME>, my chances are abysmal no matter where I go. One way or the other, I'd rather be with you. */
EXIT

// Sex

CHAIN RH#ADRJ rh#PIDSex1
@3162 /* Funny, that it would be me hesitating. Let's wait just a bit longer, <CHARNAME>. Please. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",1)~
EXIT

CHAIN RH#ADRJ rh#PIDSex2
@3163 /* Mmm. I'm sure the local Sunites and Sharessans could provide some... fascinating choices in attire. We'll talk about it tonight, my dear. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",3)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("rh#AdrFirstSex","GLOBAL",1)~ THEN RH#ADRJ rh#adrSex1
@3164 /* (Once you settle down for the night, Adrian draws you into his arms and begins to massage the tension out of your shoulders.) */
= @3165 /* (A moment before it might seem that this is all he has on his mind, you feel his lips brush against your ear.) */
= @3166 /* You haven't changed your mind, I assume? */
END
 	++ @3167 /* And if I have? */ + rh#adrSex1.1
 	++ @3168 /* I've never actually done this before. */ + rh#adrSex1.2
 	++ @3169 /* I think I've waited long enough as it is. */ + rh#adrSex1.3
 	++ @3170 /* You're not into anything weird, are you? */ + rh#adrSex1.4
 	++ @3171 /* (turn around and kiss him) */ + rh#adrSex1.5
 	++ @3172 /* I know I said I wanted this, but it's been a long <DAYNIGHT>. */ + rh#adrSex1.6

CHAIN RH#ADRJ rh#adrSex1.1
@3173 /* (sigh) You're quite the tease, aren't you, <CHARNAME>? Well, if you'd rather we wait, I won't complain. Overly. Let's just go to sleep, then. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2) SetGlobal("rh#AdrFirstSex","GLOBAL",0) RestParty()~
EXIT

CHAIN RH#ADRJ rh#adrSex1.2
@3174 /* If it makes you feel better, I haven't done it in quite some time myself. */
= @3175 /* I'm not going to hurt you, <CHARNAME>. If you'd like to wait, I can accept that. And if you'd rather... hmm, build up to it, that's perfectly acceptable as well. */
END
 	++ @3176 /* No, I'm ready. Just be careful. */ + rh#adrSex1.7
 	++ @3177 /* I like that second option. */ + rh#adrSex1.7
 	++ @3178 /* I'm not worried about me. You, however, had best perform. */ + rh#adrSex1.8
 	++ @3179 /* I would rather wait. */ + rh#adrSex1.9

CHAIN RH#ADRJ rh#adrSex1.3
@3180 /* Then we needn't wait any longer. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT

CHAIN RH#ADRJ rh#adrSex1.4
@3181 /* Nothing particularly so. You don't need to worry about it. */
END
 	++ @3182 /* Interesting. I'll have to remember that. (kiss him) */ + rh#adrSex1.5
 	++ @3183 /* On the contrary, I was very much hoping that the answer would be yes. */ + rh#adrSex1.10
 	++ @3184 /* I'm not worried. I prefer a man who can take a bit of punishment. */ + rh#adrSex1.11
 	++ @3185 /* I see. I know I said I wanted this, but it's been a long <DAYNIGHT>. */ + rh#adrSex1.6

CHAIN RH#ADRJ rh#adrSex1.5
@3186 /* (He returns your kiss eagerly, his hands drifting downward to caress your body through your clothing.) */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT 

CHAIN RH#ADRJ rh#adrSex1.6
@3187 /* Ah. I suppose it has. Let's just go to sleep, then. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2) SetGlobal("rh#AdrFirstSex","GLOBAL",0) RestParty()~
EXIT
 
CHAIN RH#ADRJ rh#adrSex1.7
@3188 /* If you don't like anything, <CHARNAME>, just tell me. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT 

CHAIN RH#ADRJ rh#adrSex1.8
@3189 /* (smile) I'll have to keep that in mind, then. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT 

CHAIN RH#ADRJ rh#adrSex1.9
@3190 /* Whenever you're ready, just tell me. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2) SetGlobal("rh#AdrFirstSex","GLOBAL",0) RestParty()~
EXIT

CHAIN RH#ADRJ rh#adrSex1.10
@507 /* Hmm. I see. */
= @3191 /* What shall I do with you, my love? I try not to misuse magic, but this once... */
= @3188 /* If you don't like anything, <CHARNAME>, just tell me. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT

CHAIN RH#ADRJ rh#adrSex1.11
@3192 /* ...oh, I see. I suppose I'm at your mercy then, my dear. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT

// Flirting

CHAIN RH#ADRJ rh#AdrianFlirtDisable
@3193 /* Hmm? Oh, of course not. */
DO ~SetGlobal("rh#AdrianFlirtsEnabled","GLOBAL",0)~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEnable
@3194 /* Getting bored, are we? */
DO ~SetGlobal("rh#AdrianFlirtsEnabled","GLOBAL",1) SetGlobal("rh#AdrStartFlirts","GLOBAL",0)~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtDisableDrow
@3195 /* As you wish, mistress. */
DO ~SetGlobal("rh#AdrianFlirtsEnabled","GLOBAL",0)~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEnableDrow
@3195 /* As you wish, mistress. */
DO ~SetGlobal("rh#AdrianFlirtsEnabled","GLOBAL",1) SetGlobal("rh#AdrStartFlirts","GLOBAL",0)~
EXIT

// Breakup

CHAIN RH#ADRJ rh#PID.Breakup
@3196 /* I... see. I'm sorry to hear that. */
DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~
EXIT

// Party Preferences

CHAIN RH#ADRJ rh#AdrianParty
@3197 /* I doubt it will be very flattering. */
END
	+ ~InParty("Aerie")~ + @3198 /* What do you think of Aerie? */ + rh#AdrianPartyAerie
	+ ~InParty("ADAngel")~ + @3199 /* What do you think of Angelo? */ + rh#AdrianPartyAngelo
	+ ~InParty("Anomen")~ + @3200 /* What do you think of Anomen? */ + rh#AdrianPartyAnomen
	+ ~InParty("c-aran")~ + @3201 /* What do you think of Aran? */ + rh#AdrianPartyAran
	+ ~InParty("Arath")~ + @3202 /* What do you think of Arath? */ + rh#AdrianPartyArath
	+ ~InParty("Cernd")~ + @3203 /* What do you think of Cernd? */ + rh#AdrianPartyCernd
	+ ~InParty("O#Coran")~ + @3204 /* What do you think of Coran? */ + rh#AdrianPartyCoran
	+ ~InParty("t1Dar")~ + @3205 /* What do you think of Darian? */ + rh#AdrianPartyDarian
	+ ~InParty("p#Deher")~ + @3206 /* What do you think of Deheriana? */ + rh#AdrianPartyDeheriana
	+ ~InParty("Dorn")~ + @3207 /* What do you think of Dorn? */ + rh#AdrianPartyDorn
	+ ~InParty("rh#Drys")~ + @3208 /* What do you think of Drystan? */ + rh#AdrianPartyDrystan
	+ ~InParty("Edwin")~ + @3209 /* What do you think of Edwin? */ + rh#AdrianPartyEdwin
	+ ~InParty("FHFRN")~ + @3210 /* What do you think of Faren? */ + rh#AdrianPartyFaren
	+ ~InParty("b!Gavin2")~ + @3211 /* What do you think of Gavin? */ + rh#AdrianPartyGavin
	+ ~InParty("HaerDalis")~ + @3212 /* What do you think of Haer'Dalis? */ + rh#AdrianPartyHaerDalis
	+ ~InParty("Hexxat")~ + @3213 /* What do you think of Hexxat? */ + rh#AdrianPartyHexxat
	+ ~InParty("Imoen2")~ + @3214 /* What do you think of Imoen? */ + rh#AdrianPartyImoen
	+ ~InParty("rh#Isra2")~ + @3215 /* What do you think of Isra? */ + rh#AdrianPartyIsra
	+ ~InParty("Jaheira")~ + @3216 /* What do you think of Jaheira? */ + rh#AdrianPartyJaheira
	+ ~InParty("Jan")~ + @3217 /* What do you think of Jan? */ + rh#AdrianPartyJan
	+ ~InParty("Keldorn")~ + @3218 /* What do you think of Keldorn? */ + rh#AdrianPartyKeldorn
	+ ~InParty("J#Kelsey")~ + @3219 /* What do you think of Kelsey? */ + rh#AdrianPartyKelsey
	+ ~InParty("Keto")~ + @3220 /* What do you think of Keto? */ + rh#AdrianPartyKeto
	+ ~InParty("p#Kivan")~ + @3221 /* What do you think of Kivan? */ + rh#AdrianPartyKivan
	+ ~InParty("Korgan")~ + @3222 /* What do you think of Korgan? */ + rh#AdrianPartyKorgan
	+ ~InParty("rh#Lya")~ + @3223 /* What do you think of Lyanna? */ + rh#AdrianPartyLyanna
	+ ~InParty("Mazzy")~ + @3224 /* What do you think of Mazzy? */ + rh#AdrianPartyMazzy
	+ ~InParty("Minsc")~ + @3225 /* What do you think of Minsc? */ + rh#AdrianPartyMinsc
	+ ~InParty("Nalia")~ + @3226 /* What do you think of Nalia? */ + rh#AdrianPartyNalia
	+ ~InParty("Neera")~ + @3227 /* What do you think of Neera? */ + rh#AdrianPartyNeera
	+ ~InParty("Nephele")~ + @3228 /* What do you think of Nephele? */ + rh#AdrianPartyNephele 
	+ ~InParty("Ninde")~ + @3229 /* What do you think of Ninde? */ + rh#AdrianPartyNinde
	+ ~InParty("Rasaad")~ + @3230 /* What do you think of Rasaad? */ + rh#AdrianPartyRasaad
	+ ~InParty("O#Tiax")~ + @3231 /* What do you think of Tiax? */ + rh#AdrianPartyTiax
	+ ~InParty("Tsujatha")~ + @3232 /* What do you think of Tsujatha? */ + rh#AdrianPartyTsujatha
	+ ~InParty("Valygar")~ + @3233 /* What do you think of Valygar? */ + rh#AdrianPartyValygar
	+ ~InParty("Viconia")~ + @3234 /* What do you think of Viconia? */ + rh#AdrianPartyViconia
	+ ~InParty("O#Xan")~ + @3235 /* What do you think of Xan? */ + rh#AdrianPartyXan
	+ ~InParty("Xulaye")~ + @3236 /* What do you think of Xulaye? */ + rh#AdrianPartyXulaye
	+ ~InParty("Yoshimo")~ + @3237 /* What do you think of Yoshimo? */ + rh#AdrianPartyYoshimo
	++ @2721 /* Never mind. */ EXIT

CHAIN RH#ADRJ rh#AdrianPartyAerie
@3238 /* Her obsession over her own weaknesses is grotesque. And irritating. */
== RH#ADRJ IF ~OR(2) Global("AerieRomanceActive","GLOBAL",1) Global("AerieRomanceActive","GLOBAL",2)~ THEN @3239 /* I honestly don't know what you see in her, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyAnomen
@3240 /* Every time he opens his mouth... well, I suppose I shouldn't finish that particular thought. I've never been fond of paladins, <CHARNAME>. Apparently their squires are even worse. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyCernd
@3241 /* I think he's laughing at me half the time, but he's too damn placid to ever admit it. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyDorn
@3242 /* The blackguard? Frankly, I try not to. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyEdwin
@3243 /* The Red Wizard? He's an idiot. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyHaerDalis
@3244 /* Remind me to never visit Sigil. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyHexxat
@3245 /* She knows what she's doing. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyImoen
@3246 /* She's been through quite a bit, hasn't she? I'm surprised she's as sane as she is. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyJaheira
@3247 /* The Harper? Hells, isn't it obvious? At least she knows what she's doing, I suppose. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyJan
@3248 /* I'll never eat another turnip again. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyKeldorn
@3249 /* I appreciate his skill, but I don't like the way he watches me. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyKorgan
@3250 /* I've worked with worse. At least he's competent. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyMazzy
@3251 /* I think I prefer the normal type of halflings. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyMinsc
@3252 /* He's a bit simple, isn't he? More than a bit, I suppose. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyNalia
@3253 /* She's quite something, isn't she? Granted, I can't decide exactly what. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyNeera
@3254 /* I'd like her better if she had the slightest idea what she was doing with that magic. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyRasaad
@3255 /* He's likely to get all of us killed. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyValygar
@3256 /* I've never met someone so afraid of his own evil, evil shadow. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyViconia
@3257 /* I wish she'd abandon the trappings of the Underdark entirely, but I suppose these things take time. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyYoshimo
@3258 /* He's a clever one, isn't he? */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyAngelo
@3259 /* I'm not sure how far I would trust him, but at least he knows what he's doing. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyNinde
@3260 /* Are you sure we can't find another vampire coven that might want her? */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyXan
@3261 /* Don't get me started. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyKivan
@3262 /* We're not particularly close. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyDeheriana
@3263 /* She's... not exactly what I would have expected. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyGavin
@3264 /* He's not the sort of priest I'm accustomed to. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyFaren
@3265 /* I wish he took things a bit more seriously sometimes. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyXulaye
@3266 /* I suppose we didn't really have much of a choice. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyCoran
@3267 /* He's more entertaining than most elves. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyKelsey
@3268 /* I've never met a sorcerer so frightened by his own abilities. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyKeto
@3269 /* She has wonderful taste in wine. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyTiax
@3270 /* It's a wonder I haven't snapped and killed him yet. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyTsujatha
@3271 /* I've been called an elitist bastard before, but that necromancer is beyond the pale. I wish he'd leave Toril and find himself another plane. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyArath
@3272 /* He's a bit much, isn't he? I suppose I appreciate that in a druid. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyAran
@3273 /* I don't care for soldiers, though he's more palatable than what I'm accustomed to. Granted, I doubt he'd find the comparison very flattering. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyDarian
@3274 /* Heh. Talking to that one feels suspiciously like smashing my head against a wall. And yet I can't seem to help myself. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyNephele
@3275 /* As long as she leaves me alone, I try not to. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyIsra
@3276 /* I haven't decided whether to even take her seriously. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyDrystan
@3277 /* The blasted Cormyrian? I try not to. */
EXIT

CHAIN RH#ADRJ rh#AdrianPartyLyanna
@3278 /* She's slightly more tolerable than her husband. */
EXIT

// Silly Questions

CHAIN RH#ADRJ rh#AdrianQuestions
@3279 /* I doubt I could stop you. */	
END
	+ ~!Global("rh#AdrianZhent","GLOBAL",1)~ + @3280 /* Do you have a favorite food? */ + PID.Food1
	+ ~Global("rh#AdrianZhent","GLOBAL",1)~ + @3280 /* Do you have a favorite food? */ + PID.Food2
	++ @3281 /* What's your favorite color? */ + PID.BestColour
	++ @3282 /* Do you have a least favorite color? */ + PID.WorstColour
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3283 /* Who do you admire most in the world? */ + PID.FavouritePerson1
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @3283 /* Who do you admire most in the world? */ + PID.FavouritePerson2
	+ ~Race(Player1,ELF)~ + @3284 /* Do you have any contact with your elven kin? */ + PID.Elf1
	+ ~!Race(Player1,ELF)~ + @3284 /* Do you have any contact with your elven kin? */ + PID.Elf2
	++ @3285 /* Who do you hate most in the world? */ + PID.HatedPerson
	++ @3286 /* Can you dance? */ + PID.Dance
	++ @3287 /* Have you ever been in love? */ + PID.Love
	++ @3288 /* How old are you? */ + PID.Age
  	++ @3289 /* Could you stop spending all my money on books and alcohol? */ + PID.Books
  	++ @3290 /* What's the worst thing you've ever done? */ + PID.Crimes
	++ @3291 /* If you could be any animal, which would it be? */ + PID.Animal
 	++ @3292 /* You don't use the common alphabet when you write. What language is that? */ + PID.Damaran
 	++ @3293 /* You're a half-elf. Ever considered a more musical career? */ + PID.Music
 	++ @3294 /* If you could go anywhere, where would you go? */ + PID.Country
 	+ ~Global("rh#PIDJanStory","GLOBAL",0) Global("rh#AdrianJan","GLOBAL",2)~ + @3295 /* Was that story you told Jan true? */ + PID.JanStory
 	++ @2721 /* Never mind. */ EXIT	

CHAIN RH#ADRJ PID.Food1
@3296 /* The more exotic, the better. */
EXIT

CHAIN RH#ADRJ PID.Food2
@3297 /* I couldn't even tell you. Lords' parties, back home, tended to feature the most extravagant and exotic food imaginable. I don't even know what half of it was. */
= @3298 /* You'd eat well, at least, even if you stumbled into the wrong corner to your death before the night was over. */
EXIT

CHAIN RH#ADRJ PID.BestColour
@3299 /* Silver and gold. Beyond that, I haven't really thought about it. */
EXIT

CHAIN RH#ADRJ PID.WorstColour
@3300 /* Purple, easily. That shade the Cormyrians like so much. */
EXIT

CHAIN RH#ADRJ PID.FavouritePerson1
@3301 /* That's actually difficult to answer. I'm not particular fond of my former allies these days. */
EXIT

CHAIN RH#ADRJ PID.FavouritePerson2
@3302 /* Fishing for compliments, are we? */
EXIT

CHAIN RH#ADRJ PID.Elf1
@3303 /* Aside from you? No. Nor do I want it. */
EXIT

CHAIN RH#ADRJ PID.Elf2
@3304 /* No. Nor do I want it. */
EXIT

CHAIN RH#ADRJ PID.HatedPerson
@3305 /* So many possibilities, why settle on just one? */
EXIT

CHAIN RH#ADRJ PID.Dance
@3306 /* I was raised within the nobility, <CHARNAME>. Granted, it's not one of my better skills. */
EXIT

CHAIN RH#ADRJ PID.Love
@3307 /* I hope you're not expecting a song of courtly love. */
EXIT

CHAIN RH#ADRJ PID.Age
@3308 /* I'll be thirty-four in a couple of months. */
EXIT

CHAIN RH#ADRJ PID.Books
@3309 /* It's not like we're running out of gold, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ PID.Animal
@3310 /* Hells, <CHARNAME>, what sort of question is that? A crocodile seems as good a choice as any. Oh, the teeth on those things. */
EXIT

CHAIN RH#ADRJ PID.Crimes
@3311 /* I try not to answer questions that could get me hanged, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ PID.Damaran
@3312 /* Hmm? Oh, those are Dethek runes. It's a more northeastern alphabet, partly dwarven in origin, if I recall. Old habit, I suppose. */
EXIT

CHAIN RH#ADRJ PID.Music
@3313 /* Absolutely not. */
EXIT

CHAIN RH#ADRJ PID.Country
@3314 /* Halruaa, I think. A fabled country where everyone practices wizardry... I think it would be worth a visit. */
= @3315 /* To live, however... probably Waterdeep. */
EXIT 	

CHAIN RH#ADRJ PID.JanStory
@3316 /* About the Cult of the Dragon? No. Well, it was based on a story I'd heard and half remembered, but it never involved me. */
= @3317 /* I was a lord's grandson; I never had to face a suicidal initiation mission. Still, the mad gnome spits out so many of his own lies, he deserves a couple in return. */
DO ~SetGlobal(" rh#PIDJanStory","GLOBAL",1)~
EXIT

// Flirts

CHAIN RH#ADRJ rh#AdrianFlirtEarly
@3318 /* (Adrian glances at you.) */
END
 	+ ~RandomNum(3,1) OR(11) AreaCheck("AR0021") AreaCheck("AR0313") AreaCheck("AR0406") AreaCheck("AR0509") AreaCheck("AR0513") AreaCheck("AR0522") AreaCheck("AR0704") AreaCheck("AR0709") AreaCheck("AR185") AreaCheck("AR1602") AreaCheck("AR208")~ + @3319 /* Dance with me. */ + rh#AdrianFlirtEarlyDance1
 	+ ~RandomNum(3,2) OR(11) AreaCheck("AR0021") AreaCheck("AR0313") AreaCheck("AR0406") AreaCheck("AR0509") AreaCheck("AR0513") AreaCheck("AR0522") AreaCheck("AR0704") AreaCheck("AR0709") AreaCheck("AR185") AreaCheck("AR1602") AreaCheck("AR208")~ + @3319 /* Dance with me. */ + rh#AdrianFlirtEarlyDance2
 	+ ~RandomNum(3,3) OR(11) AreaCheck("AR0021") AreaCheck("AR0313") AreaCheck("AR0406") AreaCheck("AR0509") AreaCheck("AR0513") AreaCheck("AR0522") AreaCheck("AR0704") AreaCheck("AR0709") AreaCheck("AR185") AreaCheck("AR1602") AreaCheck("AR208")~ + @3319 /* Dance with me. */ + rh#AdrianFlirtEarlyDance3
	+ ~RandomNum(8,1)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch1
	+ ~RandomNum(8,2)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch2
	+ ~RandomNum(8,3)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch3
	+ ~RandomNum(8,4)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch4
	+ ~RandomNum(8,5)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch5
	+ ~RandomNum(8,6)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch6
	+ ~RandomNum(8,7)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch7
	+ ~RandomNum(8,8)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtEarlyWatch8
	+ ~RandomNum(8,1)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand1
	+ ~RandomNum(8,2)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand2
	+ ~RandomNum(8,3)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand3
	+ ~RandomNum(8,4)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand4
	+ ~RandomNum(8,5)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand5
	+ ~RandomNum(8,6)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand6
	+ ~RandomNum(8,7)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand7
	+ ~RandomNum(8,8)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtEarlyHand8
	+ ~RandomNum(8,1)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile1
	+ ~RandomNum(8,2)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile2
	+ ~RandomNum(8,3)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile3
	+ ~RandomNum(8,4)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile4
	+ ~RandomNum(8,5)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile5
	+ ~RandomNum(8,6)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile6
	+ ~RandomNum(8,7)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile7
	+ ~RandomNum(8,8)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtEarlySmile8
	+ ~RandomNum(8,1)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose1
	+ ~RandomNum(8,2)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose2
	+ ~RandomNum(8,3)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose3
	+ ~RandomNum(8,4)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose4
	+ ~RandomNum(8,5)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose5
	+ ~RandomNum(8,6)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose6
	+ ~RandomNum(8,7)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose7
	+ ~RandomNum(8,8)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtEarlyPose8
	+ ~RandomNum(8,1)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair1
	+ ~RandomNum(8,2)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair2
	+ ~RandomNum(8,3)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair3
	+ ~RandomNum(8,4)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair4
	+ ~RandomNum(8,5)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair5
	+ ~RandomNum(8,6)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair6
	+ ~RandomNum(8,7)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair7
	+ ~RandomNum(8,8)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtEarlyHair8
	+ ~RandomNum(8,1)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage1
	+ ~RandomNum(8,2)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage2
	+ ~RandomNum(8,3)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage3
	+ ~RandomNum(8,4)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage4
	+ ~RandomNum(8,5)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage5
	+ ~RandomNum(8,6)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage6
	+ ~RandomNum(8,7)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage7
	+ ~RandomNum(8,8)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtEarlyMassage8
	++ @3326 /* (Leave him alone.) */ EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLate
@3327 /* (Adrian glances at you, his expression relatively unguarded.) */
END 
	+ ~RandomNum(3,1) OR(11) AreaCheck("AR0021") AreaCheck("AR0313") AreaCheck("AR0406") AreaCheck("AR0509") AreaCheck("AR0513") AreaCheck("AR0522") AreaCheck("AR0704") AreaCheck("AR0709") AreaCheck("AR185") AreaCheck("AR1602") AreaCheck("AR208")~ + @3328 /* Dance with me, Adrian. */ + rh#AdrianFlirtLateDance1
 	+ ~RandomNum(3,2) OR(11) AreaCheck("AR0021") AreaCheck("AR0313") AreaCheck("AR0406") AreaCheck("AR0509") AreaCheck("AR0513") AreaCheck("AR0522") AreaCheck("AR0704") AreaCheck("AR0709") AreaCheck("AR185") AreaCheck("AR1602") AreaCheck("AR208")~ + @3328 /* Dance with me, Adrian. */ + rh#AdrianFlirtLateDance2
 	+ ~RandomNum(3,3) OR(11) AreaCheck("AR0021") AreaCheck("AR0313") AreaCheck("AR0406") AreaCheck("AR0509") AreaCheck("AR0513") AreaCheck("AR0522") AreaCheck("AR0704") AreaCheck("AR0709") AreaCheck("AR185") AreaCheck("AR1602") AreaCheck("AR208")~ + @3328 /* Dance with me, Adrian. */ + rh#AdrianFlirtLateDance3
	+ ~RandomNum(8,1)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch1
	+ ~RandomNum(8,2)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch2
	+ ~RandomNum(8,3)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch3
	+ ~RandomNum(8,4)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch4
	+ ~RandomNum(8,5)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch5
	+ ~RandomNum(8,6)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch6
	+ ~RandomNum(8,7)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch7
	+ ~RandomNum(8,8)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtLateWatch8
	+ ~RandomNum(8,1)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand1
	+ ~RandomNum(8,2)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand2
	+ ~RandomNum(8,3)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand3
	+ ~RandomNum(8,4)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand4
	+ ~RandomNum(8,5)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand5
	+ ~RandomNum(8,6)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand6
	+ ~RandomNum(8,7)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand7
	+ ~RandomNum(8,8)~ + @3321 /* (Take his hand.) */ + rh#AdrianFlirtLateHand8
	+ ~RandomNum(8,1)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile1
	+ ~RandomNum(8,2)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile2
	+ ~RandomNum(8,3)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile3
	+ ~RandomNum(8,4)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile4
	+ ~RandomNum(8,5)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile5
	+ ~RandomNum(8,6)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile6
	+ ~RandomNum(8,7)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile7
	+ ~RandomNum(8,8)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtLateSmile8
	+ ~RandomNum(8,1)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose1
	+ ~RandomNum(8,2)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose2
	+ ~RandomNum(8,3)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose3
	+ ~RandomNum(8,4)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose4
	+ ~RandomNum(8,5)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose5
	+ ~RandomNum(8,6)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose6
	+ ~RandomNum(8,7)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose7
	+ ~RandomNum(8,8)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtLatePose8
	+ ~RandomNum(8,1)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair1
	+ ~RandomNum(8,2)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair2
	+ ~RandomNum(8,3)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair3
	+ ~RandomNum(8,4)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair4
	+ ~RandomNum(8,5)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair5
	+ ~RandomNum(8,6)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair6
	+ ~RandomNum(8,7)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair7
	+ ~RandomNum(8,8)~ + @3324 /* (Play with his hair.) */ + rh#AdrianFlirtLateHair8
	+ ~RandomNum(8,1)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace1
	+ ~RandomNum(8,2)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace2
	+ ~RandomNum(8,3)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace3
	+ ~RandomNum(8,4)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace4
	+ ~RandomNum(8,5)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace5
	+ ~RandomNum(8,6)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace6
	+ ~RandomNum(8,7)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace7
	+ ~RandomNum(8,8)~ + @3329 /* (Touch his face.) */ + rh#AdrianFlirtLateFace8
	+ ~RandomNum(8,1)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug1
	+ ~RandomNum(8,2)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug2
	+ ~RandomNum(8,3)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug3
	+ ~RandomNum(8,4)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug4
	+ ~RandomNum(8,5)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug5
	+ ~RandomNum(8,6)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug6
	+ ~RandomNum(8,7)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug7
	+ ~RandomNum(8,8)~ + @3330 /* (Hug him.) */ + rh#AdrianFlirtLateHug8	
	+ ~RandomNum(8,1)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage1
	+ ~RandomNum(8,2)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage2
	+ ~RandomNum(8,3)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage3
	+ ~RandomNum(8,4)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage4
	+ ~RandomNum(8,5)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage5
	+ ~RandomNum(8,6)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage6
	+ ~RandomNum(8,7)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage7
	+ ~RandomNum(8,8)~ + @3325 /* (Massage his shoulders.) */ + rh#AdrianFlirtLateMassage8
	+ ~RandomNum(8,1)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress1
	+ ~RandomNum(8,2)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress2
	+ ~RandomNum(8,3)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress3
	+ ~RandomNum(8,4)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress4
	+ ~RandomNum(8,5)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress5
	+ ~RandomNum(8,6)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress6
	+ ~RandomNum(8,7)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress7
	+ ~RandomNum(8,8)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtLateCaress8
	+ ~RandomNum(8,1)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss1
	+ ~RandomNum(8,2)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss2
	+ ~RandomNum(8,3)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss3
	+ ~RandomNum(8,4)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss4
	+ ~RandomNum(8,5)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss5
	+ ~RandomNum(8,6)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss6
	+ ~RandomNum(8,7)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss7
	+ ~RandomNum(8,8)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtLateKiss8
	++ @3326 /* (Leave him alone.) */ EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUD
@2685 /* Veldrin? */
END
	+ ~Global("rh#AdrSex","GLOBAL",1) Global("rh#AdrianFlirtLustChambers","GLOBAL",0) OR(2) AreaCheck("AR2202") AreaCheck("AR2203")~ + @3333 /* I require your services in the Lust Chambers, jaluk. */ + rh#AdrianFlirtLustChambers1
	+ ~Global("rh#AdrianFlirtLustChambers","GLOBAL",1) OR(2) AreaCheck("AR2202") AreaCheck("AR2203") RandomNum(2,1) ~ + @3333 /* I require your services in the Lust Chambers, jaluk. */ + rh#AdrianFlirtLustChambers2
	+ ~Global("rh#AdrianFlirtLustChambers","GLOBAL",1) OR(2) AreaCheck("AR2202") AreaCheck("AR2203") RandomNum(2,2)~ + @3333 /* I require your services in the Lust Chambers, jaluk. */ + rh#AdrianFlirtLustChambers3
	+ ~RandomNum(4,1)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtUDWatch1
	+ ~RandomNum(4,2)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtUDWatch2
	+ ~RandomNum(4,3)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtUDWatch3
	+ ~RandomNum(4,4)~ + @3320 /* (Watch him.) */ + rh#AdrianFlirtUDWatch4
	+ ~RandomNum(2,1)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtUDSmile1
	+ ~RandomNum(2,2)~ + @3322 /* (Smile at him.) */ + rh#AdrianFlirtUDSmile2
	+ ~RandomNum(3,1)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtUDPose1
	+ ~RandomNum(3,2)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtUDPose2
	+ ~RandomNum(3,3)~ + @3323 /* (Pose for him.) */ + rh#AdrianFlirtUDPose3
	+ ~RandomNum(3,1)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtUDCaress1
	+ ~RandomNum(3,2)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtUDCaress2
	+ ~RandomNum(3,3)~ + @3331 /* (Caress him.) */ + rh#AdrianFlirtUDCaress3
	+ ~RandomNum(3,1)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtUDKiss1
	+ ~RandomNum(3,2)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtUDKiss2
	+ ~RandomNum(3,3)~ + @3332 /* (Kiss him.) */ + rh#AdrianFlirtUDKiss3
	++ @3326 /* (Leave him alone.) */ EXIT

// early flirts

CHAIN RH#ADRJ rh#AdrianFlirtEarlyDance1
@3334 /* In this pathetic little hovel? That bard can't carry a tune to save his life. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyDance2
@3335 /* Your old Harper taught you how to dance, did he? I suppose that's not terribly surprising. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyDance3
@3336 /* I'm a mage, <CHARNAME>, not an entertainer, and this doesn't qualify as a social event. */
EXIT
 
CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch1
@3337 /* (There's a dangerous edge to Adrian's features to<DAYNIGHT>, and you can tell that he is likely to pick a fight at the slightest of provocations. It is unclear what exactly is bothering him, but you know by now that it could be anything or literally nothing at all.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch2
@3338 /* (You find him humming to himself, apparently unconsciously. The tune is foreign, noticeably so, and his voice is pure and clear -- perhaps a legacy of his elven heritage.) */
= @3339 /* (Adrian eventually catches you watching and falls silent. He doesn't say anything, but his eyes linger on you for a long moment afterwards.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch3
@3340 /* (You glance at Adrian and find him playing with his own hair, tugging at it angrily as if he isn't used to wearing it this long. It occurs to you that he probably isn't: people have gone to far greater lengths than this to avoid being recognized, and Adrian has as much need of such strategies as anyone.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch4
@3341 /* (You glance at Adrian and find him already watching you, his gaze thoughtful and perhaps slightly appreciative. His eyes slip away as soon as he realizes that you have noticed, but he neither blushes nor looks uncomfortable. A slight smile may curve his upper lip, but it is hard to tell for certain.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch5
@3342 /* (Despite being a practitioner of innate magic, Adrian is as obsessed with texts as any wizard, and to<DAYNIGHT> you find him engrossed in the study of a scroll. He barely avoids stumbling once or twice, but continues on in his reading, undeterred.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch6
@3343 /* (You turn to find Adrian staring at you, his expression clouded and vaguely angry. He seems about to snarl something unpleasant at you, but at the last minute, turns to pick a fight with someone else instead.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch7
@3344 /* (Adrian is perched nearby, casually chewing on an apple. His attention, however, is focused on you, and there's a glint in his eyes that isn't quite professional. As soon as he realizes that you're watching him, however, he tosses the apple onto the ground and busies himself in another task.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyWatch8
@3345 /* (You find Adrian walking close beside you - far more so than is usual for him. Lost in thought, he doesn't seem to notice the proximity until his arm brushes against yours. He comes to himself with a start and quickly moves away from you.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand1
@3346 /* (Adrian slips away from your grasp, pretending not to notice.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand2
@3347 /* (Adrian watches you thoughtfully as you grab his hand, but he doesn't try to stop you. His skin is slightly warm to the touch and you notice that his pulse is perhaps a touch quicker than it should be. With a reluctant sigh, the half-elf finally pulls his hand away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand3
@3348 /* (Adrian twists his hand free and glowers at you. Despite the forbidding look, there is a strange note in his expression - part fear, part longing, part something indescribable - that almost says more than the glare.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand4
@3349 /* (For a mage, Adrian's hand is surprisingly calloused, and as his sleeve falls away, you notice the slight silver scars that wrap around his wrists: testament to his own time spent in captivity. He frowns but doesn't comment.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand5
@3350 /* (It's a moment before Adrian even notices that your fingers are entwined in his own. He freezes for an instant, uncertain, before pulling away.) */ 
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand6
@3351 /* (Adrian folds his arms as soon as you try to grab his hand. He doesn't meet your eye for a long time afterwards.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand7
@3352 /* (As you reach out to grab his hand, you find it slick and darkened by some spell component. He raises an eyebrow at you as if challenging you to take his hand anyway.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHand8
@3353 /* I need that for spellcasting, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile1
@3354 /* (While Adrian doesn't quite smile back, the sullen scowl that had previously been decorating his face drops away, and he shakes his head, bemused.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile2
@3355 /* What do I look like, <CHARNAME>, a portrait artist? Save it for someone who cares. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile3
@3356 /* (You've seldom quite seen Adrian blush before, but a slight tinge of color reddens his cheeks as he notices your smile.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile4
@3357 /* (The half-elf sighs as he notices your attention, and a small but sincere smile dances briefly across his lips.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile5
@3358 /* (Slowly, slightly reluctantly, Adrian smiles back.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile6
@3359 /* You needn't smile at me like a common barmaid, my dear. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile7
@3360 /* (His eyes bright with too much wine, Adrian grins back at you, the expression less predatory than you might have expected.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlySmile8
@3361 /* (Adrian smothers a yawn behind his hand before tossing a sleepy smile back at you.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose1
@3362 /* (Adrian quickly busies himself with some other task, but you can sense that his attention remains fixed on you.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose2
@3363 /* (He raises an eyebrow at you, not even bothering to pretend to look away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose3
@3364 /* Playing the seductress, my lady? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose4
@3365 /* Lovely as always, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose5
@3366 /* (Flushing slightly, Adrian quickly turns away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose6
@3367 /* I'm no painter, my lady. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose7
@3368 /* (Adrian chews on his lip nervously, though he seems incapable of tearing his gaze away from you.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyPose8
@3369 /* (Adrian watches you with a slight smile on his face, and more than once you feel his eyes returning to you throughout the rest of the hour.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair1
@3370 /* (As the group stops to rest for a few minutes, you find yourself walking over to where Adrian is sitting, engrossed in the study of a book you took off of a mage. You take advantage of his distraction to run your fingers through a portion of his black hair.) */
= @3371 /* (Almost surprisingly, he seems to enjoy the attention, and he leans back against your leg as you begin to casually weave the strands together. When he speaks, however, his voice is gently mocking.) */
= @3372 /* Shall I braid yours next, my lady? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair2
@3373 /* (Adrian is usually fastidious about his appearance, but you notice to<DAYNIGHT> that his hair is in complete disarray, as if he can't be bothered to fix it. You reach out to untangle some of the knots, but Adrian angrily slaps your hand away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair3
@3374 /* (As you reach out to play with Adrian's hair, he skitters away, slightly nervously. He stays away from you for the next hour, and though you can feel his eyes on you from time to time afterwards, when you turn to address him, he is always looking away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair4
@3375 /* I don't think so, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair5
@3376 /* (A quick break has stretched into a longer one, and you find your mage a short distance away, half asleep, his hair in disarray. As you reach out to fix it for him, he mumbles something in Damaran but doesn't push you away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair6
@3377 /* Take another step and you'll lose that hand, my dear. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair7
@3378 /* (He jerks in surprise as your fingers close around his hair, and you accidentally pull it. Adrian yelps in pain, and his eyes follow you accusingly for the rest of the hour.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyHair8
@3379 /* I'm beginning to think that I should invest in a hat. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage1
@3380 /* No thank you, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage2
@3381 /* (As soon as you call a halt, Adrian settles unceremoniously on the ground, drags off one of his boots, and angrily fishes a stone out of it. He freezes as your hands land on his shoulders, but slowly relaxes as you massage the tension away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage3
@3382 /* Mm, you're quite good at that, <CHARNAME>. Ever considered giving up on adventuring and joining a harem instead? I dare say we could get a fine price for you, my lady. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage4
@3383 /* (The half-elf murmurs softly with pleasure as you begin to massage the knots out of his muscles. He doesn't pull away for a long moment.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage5
@3384 /* (Adrian bats your hands away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage6
@3385 /* Don't we have places to be and people to kill, my lady? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage7
@3386 /* (Adrian frowns at you as if he thinks you might just bite him.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtEarlyMassage8
@3387 /* I think I'll survive without it, <CHARNAME>. */
EXIT

// late flirts

CHAIN RH#ADRJ rh#AdrianFlirtLateDance1
@3388 /* (The music to<DAYNIGHT> is dreadful, but Adrian relents to your request with a helpless shrug. You attempt to dance for a few moments before he loses patience entirely and draws you into a corner instead. He presses you gently against a wall, eager to distract himself from the terrible music.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateDance2
@3389 /* (He smiles at the request, clearly enjoying to<DAYNIGHT>'s entertainment despite himself, and lets you pull him away from his table and onto the floor. He holds you somewhat closer than is appropriate, clearly paying more attention to you than to the steps, and in his distraction, barely keeps from tripping over himself.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateDance3
@3390 /* (Adrian sneers a bit at the request, gesturing dismissively at the already crowded floor, before drawing you into his arms instead. His lips brushing against your ear, he begins to whisper demeaning comments about the various dancers on the floor as he works his hands beneath your clothing.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateWatch1
@3391 /* (Your half-elven lover is in a poor mood to<DAYNIGHT>, his eyes downcast and his jaw set angrily. You've learned by now to steer clear of him when he is in tempers such as this, but he notices your regard all the same. He flashes you a quick, weak smile before focusing his attention elsewhere.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateWatch2
@3392 /* (Adrian is perched nearby, casually chewing on an apple. His attention, however, is focused on you, and there's a glint in his eyes that isn't remotely professional.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateWatch3
@3393 /* (Adrian seems to be in good spirits to<DAYNIGHT>, and he walks with the easy, practiced gait of someone who is certain of his place in the world, perhaps even believes the world would crumble and burn without his presence. He glances up at you, a smile gracing his face.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateWatch4
@3394 /* (You turn to look at Adrian and find him already studying you. Shrugging casually at having been found out, he walks closer to you and wraps an arm around your waist.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateWatch5
@3338 /* (You find him humming to himself, apparently unconsciously. The tune is foreign, noticeably so, and his voice is pure and clear -- perhaps a legacy of his elven heritage.) */
= @3395 /* (Adrian eventually catches you watching and falls silent, shrugging slightly.) */
EXIT
 
CHAIN RH#ADRJ rh#AdrianFlirtLateWatch6
@3396 /* (Adrian catches you watching and doesn't have the courtesy to look away. His gaze meet yours, and there's a distinctive gleam of challenge in his eyes. You stare at each other for a long moment, and the contest would seem meaningful if it weren't so childish. He finally laughs, slightly wildly, shattering your concentration.) */
= @3397 /* (When you look at him again, he's thoughtfully examining a tear in his sleeve as if the bizarre competition never happened at all.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateWatch7
@3398 /* (Adrian is notedly distracted to<DAYNIGHT>, his attention likely hundreds of miles away. Lost in thought, he barely avoids tripping over his own feet, and he blushes slightly once he realizes that you saw.) */
EXIT 

CHAIN RH#ADRJ rh#AdrianFlirtLateWatch8
@3342 /* (Despite being a practitioner of innate magic, Adrian is as obsessed with texts as any wizard, and to<DAYNIGHT> you find him engrossed in the study of a scroll. He barely avoids stumbling once or twice, but continues on in his reading, undeterred.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand1
@3399 /* (Adrian drops his arm over your shoulder instead, drawing you closer.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand2
@3400 /* Hand holding, my dear? What are we, peasants? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand3
@3401 /* (He smiles at you and takes your hand in return, gently massaging your wrist.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand4
@3402 /* (Adrian catches your hand loosely as you reach for him, and he tugs it closer to his face, not quite sharply enough to unbalance you.) */
= @3403 /* Shall I kiss it like a southern princeling or a lord from Waterdeep, my lady? Well, I suppose the courtesies must be observed, empty or otherwise. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand5
@3404 /* (For a mage, Adrian's hand is surprisingly calloused, and as his sleeve falls away, you notice the slight silver scars that wrap around his wrists: testament to his own time spent in captivity. He smiles weakly but doesn't pull away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand6
@3405 /* I need that for spellcasting, my dear. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand7
@3406 /* (Adrian smiles at you as you reach for his hand. It's several moments before he finally draws away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHand8
@3407 /* You do enjoy public displays, don't you? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile1
@3354 /* (While Adrian doesn't quite smile back, the sullen scowl that had previously been decorating his face drops away, and he shakes his head, bemused.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile2
@3361 /* (Adrian smothers a yawn behind his hand before tossing a sleepy smile back at you.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile3
@3356 /* (You've seldom quite seen Adrian blush before, but a slight tinge of color reddens his cheeks as he notices your smile.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile4
@3408 /* (The half-elf sighs softly, a small but sincere smile dancing briefly across his lips.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile5
@3409 /* My dear, you really are absolutely exquisite. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile6
@3360 /* (His eyes bright with too much wine, Adrian grins back at you, the expression less predatory than you might have expected.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile7
@3410 /* (His eyes bright with too much wine, Adrian grins back at you, the expression slightly manic.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateSmile8
@3411 /* (Adrian raises an eyebrow at you, his eyes dancing.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose1
@3412 /* No games, please, my dear. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose2
@3369 /* (Adrian watches you with a slight smile on his face, and more than once you feel his eyes returning to you throughout the rest of the hour.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose3
@3365 /* Lovely as always, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose4
@3413 /* Playing the seductress again, my lady? Be careful what you ask for. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose5
@3363 /* (He raises an eyebrow at you, not even bothering to pretend to look away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose6
@3414 /* (Adrian is openly enjoying the display, his eyes traveling across your body and his thoughts quite obviously less than pure.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose7
@3415 /* (He smiles at you halfheartedly, clearly not in the mood to<DAYNIGHT>.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLatePose8
@3416 /* (He interprets your attention as invitation, closing the distance between you and taking you into his arms.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair1
@3417 /* (When you stop to rest for a few moments, you half pull Adrian into your lap, running your fingers through his hair. He hisses briefly, relaxing only when he feels your fingers against his scalp.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair2
@3418 /* Having fun there, my dear? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair3
@3419 /* Tangle it up, <CHARNAME>, and I may just have to cut it all off. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair4
@3420 /* (He pulls away from you, somewhat moodily, biting down on his lip as if he's physically keeping himself from making an unpleasant comment.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair5
@3421 /* (As the group stops to rest for a few minutes, you find yourself walking over to where Adrian is sitting, engrossed in the study of a book you took off of a mage.) */
= @3422 /* (You take advantage of his distraction to run your fingers through a portion of his black hair. He seems to enjoy the attention, and he leans back against your leg as you begin to casually weave the strands together.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair6
@3423 /* (A quick break has stretched into a longer one, and you find Adrian a short distance away, half asleep, his hair in disarray. As you reach out to fix it for him, he mumbles something in Damaran but doesn't push you away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair7
@3424 /* (Adrian is usually fastidious about his appearance, but you notice to<DAYNIGHT> that his hair is in complete disarray, as if he can't be bothered to fix it. He grudgingly allows you to reach out to untangle some of the knots.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHair8
@3379 /* I'm beginning to think that I should invest in a hat. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace1
@3425 /* (He draws you closer as you stroke his face, gently massaging the small of your back.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace2
@3426 /* (For a brief moment, you feel his smile against your palm, and then he drags your hands away, holding them loosely at your sides as he kisses you.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace3
@3427 /* (He pushes your hand away, shaking his head in mild annoyance, before returning his attention to his bottle of mead.) */
= @3428 /* (A few moments later, he comes up beside you, pressing his lips against the side of your throat in unspoken apology.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace4
@2755 /* Not right now, <CHARNAME>. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace5
@3429 /* (Smiling, he takes your hands and presses them briefly against his lips.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace6
@3430 /* You shouldn't let me distract you so, my dear. We have things to do. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace7
@3431 /* Yes, I know. There's only so much time even a half-elf can go without shaving. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateFace8
@3432 /* (He glances at you quizzically for a moment before laughing and brushing your hand away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug1
@3433 /* (Adrian tenses up when you hug him, and several heartbeats pass before he brings his own arms up to awkwardly hold you in return.) */ 
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug2
@3434 /* Could we not do this in public, <CHARNAME>? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug3
@3435 /* I've never understood this custom. It seems perfectly suited to stabbing somebody in the back. Literally. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug4
@3436 /* (Adrian has to force himself to relax when you embrace him.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug5
@3437 /* (He hisses at you softly, struggling halfheartedly to get away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug6
@3438 /* (Adrian jumps when you suddenly embrace him from behind, and the words of defensive spell die on his lips. He reaches out, awkwardly patting your arm.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug7
@3439 /* (Sighing softly, he rests his hands awkwardly on your waist.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateHug8
@3440 /* <CHARNAME>, stop it. Please. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage1
@3441 /* (Adrian shrugs his shoulders luxuriously beneath your hands, and it is unclear whether he's enjoying the massage or your presence more.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage2
@3442 /* (As you call a short break, you move over to Adrian, resting your hands on his shoulders to give him one of the massages he so enjoys. He slips free and pulls you into his lap instead, kneading his fingers into your own shoulders.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage3
@3443 /* Mmm, you're quite good at that, <CHARNAME>. Ever considered giving up on adventuring and joining a harem instead, my lady? Though I dare say I'd rather keep you for myself. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage4
@3444 /* (The half-elf murmurs softly with pleasure as you massage the knots out of his muscles.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage5
@3445 /* Don't we have places to be and people to kill, my dear? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage6
@3446 /* (As soon as you call a halt, Adrian settles unceremoniously on the ground, drags off one of his boots, and angrily fishes a stone out of it. He jumps slightly when your hands land on his shoulders, but slowly relaxes as you massage the tension away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage7
@3447 /* Mmm, one of the advantages of simply wearing robes. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateMassage8
@3448 /* Yes, yes. I already know that I'm tense. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress1
@3449 /* (He smiles, loosening his robes enough that you can slip your hands beneath.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress2
@3450 /* (He shuts his eyes for a moment, indulging in the attention.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress3
@3447 /* Mmm, one of the advantages of simply wearing robes. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress4
@3451 /* (He draws you closer and kisses you, clearly enjoying the shameless indulgence.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress5
@3452 /* (He catches your hands, pressing them to his lips for a brief moment before pushing you away with a wry smile.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress6
@3453 /* (Smiling, he catches you by the shoulders and turns you around, holding you close as his own hands roam across your body.) */
= @3454 /* Turnabout, my dear? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress7
@3455 /* Mmm, even for me, this is... somewhat exhibitionistic. Could we indulge later, my lady? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateCaress8
@3456 /* You shouldn't let me distract you so, my love. We have things to do. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss1
@3457 /* (He holds you close as you kiss him, finally pulling away with a reluctant smile.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss2
@3458 /* (His hands travel slowly up the front of your body as you kiss, his fingers brushing lightly against the undersides of your breasts before he withdraws them and pulls away.) */
= @3459 /* Best not to get too carried away, my dear. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss3
@3460 /* Mmm, if you're hoping to turn me into a fair prince with this... mmm. Never mind. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss4
@3461 /* (He's reading through a tome when you approach him, and shakes his head when he realizes your intent, clearly not interested at the moment.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss5
@3430 /* You shouldn't let me distract you so, my dear. We have things to do. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss6
@3462 /* (He shuts his eyes and holds you close, shamelessly indulging in the attention.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss7
@3463 /* Careful, my lady. I don't think we have the time to properly indulge right now. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLateKiss8
@3464 /* (The kiss is all too short, and he shakes his head afterwards, indicating that this is neither the time nor the place.) */
EXIT

// Underdark

CHAIN RH#ADRJ rh#AdrianFlirtLustChambers1
@3465 /* (He quirks an eyebrow briefly, but you know him well enough to sense the intrigue lurking beneath his annoyance.) */
 = @3466 /* ...as you command, jabress. */
DO ~SetGlobal("rh#AdrianFlirtLustChambers","GLOBAL",1) RestParty()~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLustChambers2
@3467 /* ...I'm sure you do, jabress. */
DO ~RestParty()~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtLustChambers3
@3468 /* I obviously live to serve, jabress. */
DO ~RestParty()~
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDWatch1
@3469 /* (Adrian is somewhat more comfortable in his new skin than he perhaps should be, and you notice that almost every reflective surface grabs his attention. He catches you watching and tosses a self-satisfied smile at you.) */
 = @3470 /* We're entitled to our vanity, jabress. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDWatch2
@3471 /* Do you like what you see, Malla Veldrin? Well, how could you not? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDWatch3
@3472 /* (He likely won't admit it, but you can tell from the angry set of Adrian's jaw that he is not enjoying his role as a male drow.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDWatch4
@3473 /* (You catch his eye, and his lips twitch into a slight, short-lived smile. He turns away quickly, clearly uncomfortable showing any affection in this environment.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDSmile1
@3474 /* Did you require something, jabress? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDSmile2
@3475 /* (Adrian smiles in return, the gesture markedly arrogant on his dark elven face.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDPose1
@3476 /* (His eyes linger on your very revealing drow clothing for far longer than what would normally be appropriate. Shaking his head helplessly, he finally turns away.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDPose2
@3477 /* (He smiles slightly, but his eyes are vaguely troubled as he watches you. You get the distinct impression that he misses your true from.) */ 
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDPose3
@3478 /* (He raises an eyebrow at you as if challenging you to do more than simply tease.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDCaress1
@3479 /* (Adrian leans against you submissively, his smile somewhat wry, as you run your hands across his body.) */
 = @3480 /* How may I please you to<DAYNIGHT>, jabress? */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDCaress2
@3481 /* (He sighs with pleasure, clearly appreciating the attention.) */
 = @3482 /* You treat me too well sometimes, mistress. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDCaress3
@3483 /* (sigh) At least I needn't worry about any other female attempting to lay claim to me, Veldrin. */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDKiss1
@3484 /* (Adrian submits to your kiss with only a touch of resistance, and he makes no complaint when you push him aside afterward.) */
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDKiss2
@3485 /* (He presses his body against yours, indulging in the kiss as he attempts to remain at least visibly submissive.) */ 
EXIT

CHAIN RH#ADRJ rh#AdrianFlirtUDKiss3
@3486 /* (Adrian tenses slightly when you kiss him, and moves away as soon as you release him. He glances at you briefly, and it is obvious that he isn't enjoying these roles to<DAYNIGHT>.) */ 
EXIT
