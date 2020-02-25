// J FILE

// 1. Tracked dialogue
// 2. Plot related dialogue
// 3. Interjections
// 4. Flirts
// 5. Player initiated dialogue

BEGIN RH#AD25J

// TRACKED DIALOGUE

// 1.
CHAIN IF ~Global("rh#AdrianTalksTOB","GLOBAL",2)~ THEN RH#AD25J rh#tob1
@0 /* With so much going on, we haven't had much of a chance simply to talk. I'll pour you a glass of wine and we can try to forget about this madness for a short time. */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",3)
RealSetGlobalTimer("rh#AdrianTalksTOBTimer","GLOBAL",2700)~
END
	++ @1 /* Forget? If only. */ + rh#tob1_forget
	++ @2 /* I haven't heard a better idea this tenday. */ + rh#tob1_wine
	+ ~Global("rh#AdrSex","GLOBAL",1)~ + @3 /* I hardly need the *wine* to forget, my dear. (smile) */ + rh#tob1_smile
	+ ~!Global("rh#AdrSex","GLOBAL",1)~ + @4 /* I don't need the wine, but I'd love to talk. */ + rh#tob1_talk
	++ @5 /* I really don't have the time to talk right now. */ + rh#tob1_time

APPEND RH#AD25J

IF ~~ rh#tob1_forget
 SAY @6 /* I know. It isn't particularly easy. And for you... */
IF ~~ + rh#tob1_main1
END

IF ~~ rh#tob1_wine
 SAY @7 /* Some elven wine, a gift from dear, sweet Ellesime. I think she could sense how much I still hated her, and hoped to reach out to estranged kindred, half-human or otherwise. Better late than never, I suppose. */
 = @8 /* But I didn't want to talk about Suldanessellar to<DAYNIGHT>. Or ever, preferably. */
IF ~~ + rh#tob1_main1
END

IF ~~ rh#tob1_smile
 SAY @9 /* Mmm, you are far too skilled at distracting me. Perhaps I can help you *forget* later, but for now... I really did want to talk. */
IF ~~ + rh#tob1_main1
END

IF ~~ rh#tob1_talk
 SAY @10 /* Then dear, sweet Ellesime's wine will have to wait until another day. But I didn't want to talk about Suldanessellar to<DAYNIGHT>. Or ever, preferably. */
IF ~~ + rh#tob1_main1
END

IF ~~ rh#tob1_time
 SAY @11 /* We never have the time to talk, I've noticed. That doesn't change anything. I am worried about you, <CHARNAME>. */
IF ~~ + rh#tob1_main1
END

IF ~~ rh#tob1_main1
 SAY @12 /* How are you holding up in the wake of everything? Irenicus, finally defeated after such a chase, your soul returned at last, and now... hells, I'm not even certain what's going on anymore. */
 	++ @13 /* I'm just glad that Irenicus is finally dead. Whatever comes next, I needed that closure. */ + rh#tob1_closure
 	++ @14 /* Neither am I... it's a bit exciting in its own way, isn't it? */ + rh#tob1_exciting
 	++ @15 /* I could almost thank Irenicus for what he did to me. I find myself savoring every emotion in a way I never would have before, and that's almost worth the pain. */ + rh#tob1_worth
	++ @16 /* I thought that after Irenicus, I would finally be able to live my own life. I should have known better. */ + rh#tob1_destiny
	++ @17 /* Tearing a man like Irenicus from power... things will only get bigger from here. */ + rh#tob1_bigger
	++ @18 /* My soul's return is more a curse than a blessing. I can feel something dark growing in me, and it's terrifying. */ + rh#tob1_corrupt
END

IF ~~ rh#tob1_closure
 SAY @19 /* Closure, is it? It was such a godsdamned mess at the end, I'm not sure that closure is even possible. */
IF ~~ + rh#tob1_main2
END

IF ~~ rh#tob1_exciting
 SAY @20 /* Heh. My dear, I'm sure that standing in the midst of a hurricane would be exciting in its own way. */
IF ~~ + rh#tob1_main2
END

IF ~~ rh#tob1_worth
 SAY @21 /* He taught you things he never intended to teach, did he? I can't say I'm surprised to hear it. I wish I could share your gratitude. */ 
IF ~~ + rh#tob1_main2
END

IF ~~ rh#tob1_destiny
 SAY @22 /* I'm sure you realize that whether you're a peasant farmer or the daughter of a god, there's always going to be someone pulling the strings. */
IF ~~ + rh#tob1_main2
END

IF ~~ rh#tob1_bigger
 SAY @23 /* The thrill of victory over a superior opponent, of taking everything he had as your own... it is somewhat exhilarating. */ 
IF ~~ + rh#tob1_main2b
END

IF ~~ rh#tob1_corrupt
 SAY @24 /* Bhaal's essence, returned... I don't like the sound of that. Whatever you're feeling, <CHARNAME>, you have to fight it. */
IF ~~ + rh#tob1_main2b
END

IF ~~ rh#tob1_main2
 SAY @25 /* Still, I suppose having something new to focus on is as much a blessing as a curse. */
	++ @26 /* At least it keeps us from spending too much time thinking about the past. */ + rh#tob1_past
	++ @27 /* Speak for yourself. I'd much prefer the chance to focus upon a cup of coffee and a good book. */ + rh#tob1_coffee
	++ @28 /* I'd rather concentrate on my own plans, not the schemes of every other Bhaalspawn in the Realms. */ + rh#tob1_scheme
	+ ~!Alignment(Player1,MASK_EVIL)~ + @29 /* I don't consider it a curse at all. The prophesy notwithstanding, we really are needed here. */ + rh#tob1_needed
	++ @30 /* If the prophesy is finally coming true, I can only hope that this will all be over soon, one way or another. */ + rh#tob1_over
END

IF ~~ rh#tob1_main2b
 SAY @31 /* I suppose having something new to focus on is as much a blessing as a curse. */
	++ @26 /* At least it keeps us from spending too much time thinking about the past. */ + rh#tob1_past
	++ @32 /* Speak for yourself. I'd much prefer the chance to focus on a cup of coffee and a good book. */ + rh#tob1_coffee
	++ @28 /* I'd rather concentrate on my own plans, not the schemes of every other Bhaalspawn in the Realms. */ + rh#tob1_scheme
	+ ~!Alignment(Player1,MASK_EVIL)~ + @29 /* I don't consider it a curse at all. The prophesy notwithstanding, we really are needed here. */ + rh#tob1_needed
	++ @33 /* If the prophesy is finally coming true, I can only hope that this will all be over soon. */ + rh#tob1_over
END

IF ~~ rh#tob1_past
 SAY @34 /* Theoretically, at least. In practice, though... */
IF ~~ + rh#tob1_main3
END

IF ~~ rh#tob1_coffee
 SAY @35 /* No, there is that, I admit. */
IF ~~ + rh#tob1_main3
END

IF ~~ rh#tob1_scheme
 SAY @36 /* Well, you had best get used to taking enemies' schemes into consideration as well. */
IF ~~ + rh#tob1_main3
END

IF ~~ rh#tob1_needed
 SAY @37 /* We are, are we? Someone else could fit in just as well, I think. */
IF ~~ + rh#tob1_main3
END

IF ~~ rh#tob1_over
 SAY @38 /* One way or another, I expect it will be. */
IF ~~ + rh#tob1_main3
END

IF ~~ rh#tob1_main3
 SAY @39 /* Hmm. */
	++ @40 /* And what about you? I can tell when you're not happy about something, you know. */ + rh#tob1_happy
	++ @41 /* You had enough at stake yourself. How does it feel to finally obtain vengeance? */ + rh#tob1_venge
	+ ~!Alignment("rh#Adrian",MASK_EVIL)~ + @42 /* Enough about me. You've seemed somewhat quieter as of late. */ + rh#tob1_sudden
	+ ~Alignment("rh#Adrian",MASK_EVIL)~ + @43 /* Enough about me. You've seemed somewhat angrier as of late. */ + rh#tob1_sudden
	++ @44 /* I can't imagine you would be asking me about Irenicus if you were not thinking about him yourself. */ + rh#tob1_irenicus
	++ @45 /* If that's it, we really ought to be moving on now. */ + rh#tob1_moveon
END

IF ~~ rh#tob1_sudden
 SAY @46 /* Do I? Well, that's not overly surprising. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4b
END

IF ~~ rh#tob1_happy
 SAY @47 /* (smile) Yes, I've noticed. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4b
END

IF ~~ rh#tob1_venge
 SAY @48 /* Truth be told... I hardly feel anything at all. Well, nothing good, at least. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4b
END

IF ~~ rh#tob1_irenicus
 SAY @49 /* I have been, I'll admit. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob1_main4b
END

IF ~~ rh#tob1_moveon
 SAY @50 /* Of course. Let's go. */
IF ~~ EXIT
END

IF ~~ rh#tob1_main4a
 SAY @51 /* It's just... hard. Harder than I ever thought it would be. */
 = @52 /* I'm still so angry about everything... about those blasted elves in particular, too caught up in the illusion of perfection to admit to their own mistakes. */
 = @53 /* Every instinct I have just screams to lash out at something... it's a hard habit to break, especially when it's warranted. */
 	++ @54 /* You're allowed to be angry at them, Adrian. I certainly still am. */ + rh#tob1_angry
 	++ @55 /* Not every instinct, apparently. You should trust yourself more. */ + rh#tob1_trust
 	++ @56 /* Well, I'd suggest that you don't lash out at me. */ + rh#tob1_lash
 	++ @57 /* Why don't you go punch Cespenar? We'd both feel better. */ + rh#tob1_cespenar
	++ @58 /* It was never going to be easy. If it were, there would be significantly less evil in the world. */ + rh#tob1_lessevil
END

IF ~~ rh#tob1_main4b
 SAY @59 /* You would think that with Irenicus's death, I wouldn't care anymore, but I'm still so angry about everything... */
 = @60 /* About those blasted elves in particular, too caught up in the illusion of perfection to admit to their own mistakes. */
 = @61 /* I honestly wish we'd let that damn tree die. */
 	++ @62 /* I'm still angry at them as well, but you can't let it rule your life. */ + rh#tob1_rule
 	++ @63 /* You don't really mean that. */ + rh#tob1_mean
    ++ @64 /* You're angry, I know. Why don't you go punch Cespenar? We'd both feel better. */ + rh#tob1_cespenar
 	++ @65 /* I certainly would have considered it acceptable collateral damage myself. */ + rh#tob1_damage
 	++ @66 /* Focus on the task at hand. Once this is over, perhaps we can pay precious Suldanessellar an even less pleasant visit. */ + rh#tob1_visit
END 
 
IF ~~ rh#tob1_angry
 SAY @67 /* Am I? I've always tended to do idiotic things when I'm angry. */
IF ~~ + rh#tob1_finish
END

IF ~~ rh#tob1_trust
 SAY @68 /* Trust myself... how delightfully naive of you. (sigh) */
IF ~~ + rh#tob1_finish
END

IF ~~ rh#tob1_lash
 SAY @69 /* I wouldn't dream of it, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ rh#tob1_cespenar
 SAY @70 /* Ha! A rewarding task if ever there was one. I'll have to keep that in mind. */ 
IF ~~ EXIT
END

IF ~~ rh#tob1_lessevil
 SAY @71 /* It's easier to fall than to climb back out... I'm beginning to understand that now. */
IF ~~ + rh#tob1_finish
END

IF ~~ rh#tob1_rule
 SAY @72 /* No... that's what Irenicus did, and look where it got him. In the end, perhaps I can't help but understand. */
IF ~~ + rh#tob1_finish
END

IF ~~ rh#tob1_mean
 SAY @73 /* Don't I? You might be surprised. */
IF ~~ + rh#tob1_finish
END

IF ~~ rh#tob1_damage
 SAY @74 /* More than acceptable, I should think. */
IF ~~ + rh#tob1_finish
END

IF ~~ rh#tob1_visit
 SAY @75 /* Hmm. I think I might even enjoy that. */
IF ~~ EXIT
END

IF ~~ rh#tob1_finish
 SAY @76 /* Enough of this, <CHARNAME>. I didn't mean for this conversation to take such a strange turn. */
IF ~~ EXIT
END
END

// 2.
CHAIN IF ~Global("rh#AdrianTalksTOB","GLOBAL",4)~ THEN RH#AD25J rh#tob2
@77 /* I should congratulate you, <CHARNAME>. Usually there's a point at which people run out of even more powerful enemies to hunt down. */
= @78 /* With you, though, it just keeps on getting better, doesn't it? */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",5)
RealSetGlobalTimer("rh#AdrianTalksTOBTimer","GLOBAL",2700)~
END
	++ @79 /* If you run out of powerful enemies, usually it's because the last one killed you. */ + rh#tob2_killed
	++ @80 /* Stop laughing. It's really not that funny. */ + rh#tob2_funny
	++ @81 /* Don't they say that a <PRO_MANWOMAN> is only as good as <PRO_HISHER> best enemy? I should be glad for the validation. */ + rh#tob2_validation
	++ @82 /* Don't make me remind you who your old friends are. */ + rh#tob2_friends
	++ @83 /* Yes, it does. I really don't want to talk about it, Adrian. */ + rh#tob2_notalk
	
APPEND RH#AD25J

IF ~~ rh#tob2_killed
 SAY @84 /* You do have a point, I suppose. After all, most people never get quite this far. Failure tends to be epidemic, and at the very top... */
IF ~~ + rh#tob2_main1
END

IF ~~ rh#tob2_funny
 SAY @85 /* No, I suppose not. And in a way, it does make sense... after all, most people never get quite this far. Failure tends to be epidemic, and at the very top... */
IF ~~ + rh#tob2_main1
END

IF ~~ rh#tob2_validation
 SAY @86 /* Powerful people attract powerful opponents, do they? I suppose that's true enough, and most people never get quite this far. Failure tends to be epidemic, and at the very top... */
IF ~~ + rh#tob2_main1
END

IF ~~ rh#tob2_friends
 SAY @87 /* My old friends are hardly demigods, <CHARNAME>. To the best of my knowledge, at least. Granted, the highest levels of that delightful hierarchy... */
IF ~~ + rh#tob2_main1
END

IF ~~ rh#tob2_notalk
 SAY @88 /* Blessed silence, is it? If you insist. */
IF ~~ EXIT
END

IF ~~ rh#tob2_main1
 SAY @89 /* Well, I've never been at the very top before. Intellectually, I think I understood what the stakes must look like, but to actually live it... well. */ 
 = @90 /* That's something very different. */
	++ @91 /* Do you think it's actually worth it? */ + rh#tob2_worth
	++ @92 /* I hope you're enjoying yourself. I most certainly am not. */ + rh#tob2_enjoy
	++ @93 /* It's funny that with so many people seeking greatness, the ones who succeed seem to do so as if by accident. */ + rh#tob2_hilarious
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @94 /* At least it isn't quite as lonely at the top as I'd been told to believe. */ + rh#tob2_lonely
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @94 /* At least it isn't quite as lonely at the top as I'd been told to believe. */ + rh#tob2_lonely2
	++ @95 /* Success comes to those who deserve it. I'm glad to be in that minority, despite the drawbacks. */ + rh#tob2_success
END

IF ~~ rh#tob2_worth
 SAY @96 /* As much as I'd like to say "yes", I haven't really decided yet. I think it's slightly ironic, at least. */
IF ~~ + rh#tob2_main2
END

IF ~~ rh#tob2_enjoy
 SAY @97 /* I'm enjoying the irony, at least. */
IF ~~ + rh#tob2_main2
END

IF ~~ rh#tob2_hilarious
 SAY @98 /* Hilarious, I'm sure, though true in your case. I should appreciate the irony, at least. */
IF ~~ + rh#tob2_main2
END

IF ~~ rh#tob2_lonely
 SAY @99 /* (smile) No, I suppose not. And I should appreciate the irony, at least. */
IF ~~ + rh#tob2_main2
END

IF ~~ rh#tob2_lonely2
 SAY @100 /* Perhaps not. Still, I should appreciate the irony, at least. */
IF ~~ + rh#tob2_main2
END

IF ~~ rh#tob2_success
 SAY @101 /* And what the drawbacks they are. Still, I should appreciate the irony, at least. */
IF ~~ + rh#tob2_main2
END

IF ~~ rh#tob2_main2
 SAY @102 /* When it comes to finding a safe place to hide, at this point my chances of survival would probably be better if I ran back home. Absurd, isn't it? */
 = @103 /* I'm not quite sure what to make of that. */
	++ @104 /* If you were looking for a place to hide, I'm afraid you went about it the wrong way entirely. */ + rh#tob2_safe
	+ ~Kit(Player1,MAGESCHOOL_DIVINER)~ + @105 /* Nothing is going to happen to you, Adrian. */ + rh#tob2_happen
	+ ~!Kit(Player1,MAGESCHOOL_DIVINER)~ + @105 /* Nothing is going to happen to you, Adrian. */ + rh#tob2_happen2
	++ @106 /* You're not considering running away now, are you? */ + rh#tob2_ridiculous
	++ @107 /* Oh, come now. It's not quite as bad as that. */ + rh#tob2_bad
	++ @108 /* Suddenly frightened, are we? */ + rh#tob2_frightened
END

IF ~~ rh#tob2_safe
 SAY @109 /* Heh. No, hunting archmages doesn't quite qualify as lying low. In any case, I don't mean to complain. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3b
END

IF ~~ rh#tob2_happen
 SAY @110 /* Well, you do have a talent for predicting the future, so I suppose you may be right. Ah, no matter. */
IF ~~ + rh#tob2_main3b
END

IF ~~ rh#tob2_happen2
 SAY @111 /* Are you suddenly a diviner now, <CHARNAME>? Ah, no matter. */
IF ~~ + rh#tob2_main3b
END

IF ~~ rh#tob2_ridiculous
 SAY @112 /* Don't be ridiculous, <CHARNAME>. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3b
END

IF ~~ rh#tob2_bad
 SAY @113 /* No? Well, perhaps I underestimate how dangerous the Keep is these days. In any case, I don't mean to complain. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3b
END

IF ~~ rh#tob2_frightened
 SAY @114 /* Not overly so. In any case, I certainly don't mean to complain. */
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3a
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + rh#tob2_main3b
END

IF ~~ rh#tob2_main3a
 SAY @115 /* You know damn well I have no intention of leaving you now, the dangers notwithstanding. And I suppose I actually appreciate the front row seat to... well, whatever happens next. I know as well as anyone that when gods walk the Realms, safety is a fantasy anyway. */
IF ~~ + rh#tob2_main3
END

IF ~~ rh#tob2_main3b
 SAY @116 /* The dangers notwithstanding, I do appreciate the front row seat to... well, whatever happens next. I know as well as anyone that when gods walk the Realms, safety is a fantasy anyway. */
IF ~~ + rh#tob2_main3
END

IF ~~ rh#tob2_main3
 SAY @117 /* At least we'll have some control over this madness... even if it's just the illusion of control. */
	++ @118 /* True enough. With the stakes this high, it's better to be involved than ignorant of the situation. */ + rh#tob2_ignorant
	++ @119 /* Stop defining everything in terms of control, Adrian. Fixing a broken country is more important than power. */ + rh#tob2_broken
	++ @120 /* Control? I had more control over what I was doing back in Amn. */ + rh#tob2_smoke
	++ @121 /* 'When gods walk the Realms?' As bad as this is, it's not quite the Time of Troubles. */ + rh#tob2_troubles
	++ @122 /* I think you underestimate my grasp on the situation. */ + rh#tob2_grasp
END

IF ~~ rh#tob2_ignorant
 SAY @123 /* Yes. Speaking of which, I'm sure that by now, I don't have to warn you not to trust anybody. */
IF ~~ + rh#tob2_main4
END

IF ~~ rh#tob2_broken
 SAY @124 /* Is it? You may be the only person in Tethyr who thinks that, <CHARNAME>. I'm sure that by now, I don't have to warn you not to trust anybody. */
IF ~~ + rh#tob2_main4
END

IF ~~ rh#tob2_smoke
 SAY @125 /* Well, I'd best get used to the smoke and mirrors, then. But with so many other potential interests in play... I'm sure that by now, I don't have to warn you not to trust anybody. */
IF ~~ + rh#tob2_main4
END

IF ~~ rh#tob2_troubles
 SAY @126 /* No, but it's nearly as confusing. Speaking of which, I'm sure that by now, I don't have to warn you not to trust anybody. */
IF ~~ + rh#tob2_main4
END

IF ~~ rh#tob2_grasp
 SAY @127 /* Don't get overconfident, <CHARNAME>. Speaking of which, I'm sure that by now, I don't have to warn you not to trust anybody. */
IF ~~ + rh#tob2_main4
END

IF ~~ rh#tob2_main4
 SAY @128 /* I feel like we've been thrown into this mess in the middle, and that makes determining motives even more difficult. */
	++ @129 /* It is a bit like walking into a theater in the middle of a performance and trying to figure out what's going on. */ + rh#tob2_theater
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @130 /* Stop being so paranoid. If you expect a knife in the back, you're likely to get it. */ + rh#tob2_paranoid1
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @130 /* Stop being so paranoid. If you expect a knife in the back, you're likely to get it. */ + rh#tob2_paranoid2
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @131 /* Don't trust anyone... tell me, does that include you? */ + rh#tob2_trust1
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2) Alignment("rh#Adrian",MASK_EVIL)~ + @131 /* Don't trust anyone... tell me, does that include you? */ + rh#tob2_trust2
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2) !Alignment("rh#Adrian",MASK_EVIL)~ + @131 /* Don't trust anyone... tell me, does that include you? */ + rh#tob2_trust3
	++ @132 /* When have I ever succeeded by trusting anyone? I don't intend to start now. */ + rh#tob2_start
END

IF ~~ rh#tob2_theater
 SAY @133 /* Not necessarily the metaphor I would have used, but... yes. I suppose so. Still, we won't figure things out by simply standing around and talking about them. */
IF ~~ EXIT
END

IF ~~ rh#tob2_paranoid1
 SAY @134 /* Very funny, my dear. Please, just keep it in mind. */
IF ~~ EXIT
END

IF ~~ rh#tob2_paranoid2
 SAY @135 /* I'm not quite paranoid enough to take that as a threat, but... fine. I won't bring it up again. */
IF ~~ EXIT
END

IF ~~ rh#tob2_trust1
 SAY @136 /* Mmm, I suppose that depends on what you expect from me, my dear. Regardless, we won't figure things out by simply standing around and talking about them. */
IF ~~ EXIT
END

IF ~~ rh#tob2_trust2
 SAY @137 /* I dare say I have too much invested in this to betray you now. */
IF ~~ EXIT
END

IF ~~ rh#tob2_trust3
 SAY @137 /* I dare say I have too much invested in this to betray you now. */
 = @138 /* You're teasing me, aren't you? Of all the foolish-- let's just move on, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ rh#tob2_start
 SAY @139 /* Good. I expected nothing less. */
IF ~~ EXIT
END
END

// 3. upon rest
CHAIN IF ~Global("rh#AdrianTalksTOB","GLOBAL",6)~ THEN RH#AD25J rh#tob3
@140 /* Could you leave that lamp a moment longer, <CHARNAME>? I'm just about finished reading this. */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",7)
RealSetGlobalTimer("rh#AdrianTalksTOBTimer","GLOBAL",2700)~
END
	++ @141 /* What is it this time? Another treatise on enchantment? */ + rh#tob3_enchant
	++ @142 /* I wish you'd spend more time researching spells and less time fixating on theory. */ + rh#tob3_theory
	++ @143 /* You can finish it in the morning, can't you? */ + rh#tob3_morn
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrSex","GLOBAL",1)~ + @144 /* Here I am, ready for bed... and all he wants to do is read. */ + rh#tob3_bed
	++ @145 /* If that's a lady's romance novel masquerading as an arcane tome, you're never going to live it down. */ + rh#tob3_novel
	++ @146 /* Take it elsewhere if you want to read it. I'm going to sleep. */ + rh#tob3_sleep

APPEND RH#AD25J

IF ~~ rh#tob3_enchant
 SAY @147 /* No... this one is actually necromancy. Shocking, I know. I suppose that after all of this chaos, developing a bit of a morbid fascination with death is as much as can be expected. */
IF ~~ + rh#tob3_main1
END

IF ~~ rh#tob3_theory
 SAY @148 /* The two do bleed together, my <PRO_LADYLORD>, and what can be found in a dusty tome on necromancy can often enough be used against our undead foes. */
IF ~~ + rh#tob3_main1
END

IF ~~ rh#tob3_morn
 SAY @149 /* (smile) I've heard that there are books out there that turn into dust and mist when left overnight... but a tome of necromancy is usually not one of them. */
IF ~~ + rh#tob3_main1
END

IF ~~ rh#tob3_bed
 SAY @150 /* Mmm, my love, if you had that in mind, you probably should have warned me away from the necromantic theory some time ago. My thoughts are... fairly dark right now. */
IF ~~ + rh#tob3_main1
END

IF ~~ rh#tob3_novel
 SAY @151 /* Heavens forfend. No, I dare say a tome devoted to necromantic theory is about the furthest thing *from*. */
IF ~~ + rh#tob3_main1
END

IF ~~ rh#tob3_sleep
 SAY @152 /* As you insist. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_main1
 SAY @153 /* Don't go hunting for my phylactery just yet, but I guess I can't help but find the subject somewhat intriguing. Eternal life... a mage's one true obsession. */
 = @154 /* You know, they say that all lichs are insane. */
	++ @155 /* Then it's a good thing that I won't have to resort to that method of obtaining immortality. */ + rh#tob3_immortal
	++ @156 /* I hope you're not dreaming of being Faerun's first sane one. */ + rh#tob3_first
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @157 /* This isn't still about what Bodhi did to you, is it? */ + rh#tob3_bodhi
	++ @158 /* Anyone who'd embrace lichdom was probably mad to begin with. */ + rh#tob3_lichdom
	++ @159 /* If I were ice cold and decaying from within, I'd be insane as well. */ + rh#tob3_insane
	++ @160 /* Who needs sanity when you can have power like that? */ + rh#tob3_power
END

IF ~~ rh#tob3_immortal
 SAY @161 /* Yes, I can't deny that you have... other options. Better ones, maybe, though I'm not entirely certain that worse ones even exist. */
 = @162 /* It's a terrible thought, isn't it? Perhaps they're still themselves, somewhere beneath the madness and decay, and perhaps... perhaps it would be better if they were not. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2b
END

IF ~~ rh#tob3_first
 SAY @163 /* Hells, no. Even if I were interested in cold, dead flesh... well, it's a terrible thought, isn't it? Perhaps they're still themselves, somewhere beneath the madness and decay, and perhaps... perhaps it would be better if they were not. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2b
END

IF ~~ rh#tob3_bodhi
 SAY @164 /* My own brief brush with undeath... yes, I suppose that's part of the fascination. Bad enough to be forced into it, but to do it willingly... I don't know. */
 = @165 /* But it's a terrible thought, isn't it? Perhaps they're still themselves, somewhere beneath the madness and decay, and perhaps... perhaps it would be better if they were not. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2b
END

IF ~~ rh#tob3_lichdom
 SAY @166 /* That may well be part of it. Otherwise... well, it's a terrible thought, isn't it? Perhaps they're still themselves, underneath the madness and decay, and perhaps... perhaps it would be better if they were not. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2b
END

IF ~~ rh#tob3_insane
 SAY @167 /* Indeed. I must admit that I share your priorities, <CHARNAME>. And even if a lich didn't always look his age... well, it's a terrible thought, isn't it? */
 = @168 /* Perhaps they're still themselves, somewhere beneath the madness and decay, and perhaps... perhaps it would be better if they were not. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2b
END

IF ~~ rh#tob3_power
 SAY @169 /* Who indeed? Though sometimes I wonder if it's more than mere sanity that they've lost. Perhaps they're still themselves, somewhere beneath the madness and decay, and perhaps... perhaps it would be better if they were not. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tob3_main2b
END

IF ~~ rh#tob3_main2a
 SAY @170 /* I can't help but imagine some helpless shred of a mortal soul, trapped within a monster's dead mind for all of eternity. Screaming... knowing in the end that he did it to himself. */
	++ @171 /* Even for you, this is morbid. Where is this coming from? */ + rh#tob3_morbid
	++ @172 /* Don't be ridiculous. If we let every premonition of dread stand between where we want to be, we'd never get anywhere at all. */ + rh#tob3_ridiculous
	++ @173 /* Is it ghost story time? I've got a couple good ones I've been meaning to share. */ + rh#tob3_ghost
	++ @174 /* Enough necromantic bedtime reading for you. It's my enemies who are supposed to give me nightmares, not my allies. */ + rh#tob3_nightmare
	++ @175 /* A <PRO_MANWOMAN> evil enough to tempt fate like that deserves whatever <PRO_HESHE> gets. */ + rh#tob3_desserts
END

IF ~~ rh#tob3_main2b
 SAY @176 /* I can't help but imagine some helpless shred of a mortal soul, trapped within a monster's dead mind for all of eternity. Screaming... knowing in the end that he did it to himself. Heh. */
	++ @171 /* Even for you, this is morbid. Where is this coming from? */ + rh#tob3_morbid2
	++ @172 /* Don't be ridiculous. If we let every premonition of dread stand between where we want to be, we'd never get anywhere at all. */ + rh#tob3_ridiculous2
	++ @173 /* Is it ghost story time? I've got a couple good ones I've been meaning to share. */ + rh#tob3_ghost2
	++ @174 /* Enough necromantic bedtime reading for you. It's my enemies who are supposed to give me nightmares, not my allies. */ + rh#tob3_nightmare2
	++ @177 /* A person evil enough to tempt fate like that deserves whatever they get. */ + rh#tob3_desserts2
END

IF ~~ rh#tob3_morbid
 SAY @178 /* Morbid? Perhaps. I tend to keep my darker thoughts to myself, <CHARNAME>. */
IF ~~ + rh#tob3_main3
END

IF ~~ rh#tob3_ridiculous
 SAY @179 /* Don't mistake caution for cowardice, <CHARNAME>. There are only a handful of truly great people in the Realms... that isn't by accident. */
IF ~~ + rh#tob3_main3
END

IF ~~ rh#tob3_ghost
 SAY @180 /* Heh. Make light of it, if you wish. */
IF ~~ + rh#tob3_main3
END

IF ~~ rh#tob3_nightmare
 SAY @181 /* Heh. That's hardly my intention, <CHARNAME>. */
IF ~~ + rh#tob3_main3
END

IF ~~ rh#tob3_desserts
 SAY @182 /* Does <PRO_HESHE>? Perhaps. Still, eternity is a long time to pay. */ 
IF ~~ + rh#tob3_main3
END

IF ~~ rh#tob3_morbid2
 SAY @183 /* I tend to keep my darker thoughts to myself, <CHARNAME>. But tonight... well. They seem to be creeping back in. */
IF ~~ + rh#tob3_main4
END

IF ~~ rh#tob3_ridiculous2
 SAY @184 /* There are worse places to be than nowhere... or so I've been told. I tend to keep my darker thoughts to myself, but tonight... well. They seem to be creeping back in. */
IF ~~ + rh#tob3_main4
END

IF ~~ rh#tob3_ghost2
 SAY @185 /* Unless it ends horrifically, I'm not interested. I tend to keep my darker thoughts to myself, but tonight... well. They seem to be creeping back in. */
IF ~~ + rh#tob3_main4
END

IF ~~ rh#tob3_nightmare2
 SAY @186 /* Yes, and I dare say your enemies have had that honor for far too long as it is.  I tend to keep my darker thoughts to myself, but tonight... well. They seem to be creeping back in. */
IF ~~ + rh#tob3_main4
END

IF ~~ rh#tob3_desserts2
 SAY @187 /* Mmm, and eternity is quite a long time to pay. I tend to keep my darker thoughts to myself, but tonight... well. They seem to be creeping back in. */
IF ~~ + rh#tob3_main4
END

IF ~~ rh#tob3_main3
 SAY @188 /* I suppose I've just learned too much to take things like this for granted anymore. In situations where you can't really know what you're getting into until it's much too late to get out again... */
 = @189 /* Well, I would be very careful about wagering everything. */
	++ @190 /* We always wager everything. I haven't lost yet. */ + rh#tob3_wager
	++ @191 /* You're not talking about lichs anymore, I gather. */ + rh#tob3_lich
	++ @192 /* I'd be wary of wagering anything at all if I could help it. */ + rh#tob3_gambler
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrSex","GLOBAL",1)~ + @193 /* Enough talk, Adrian... I had more in mind for tonight than arcane philosophy. */ + rh#tob3_more
	++ @194 /* No more theoretically treatises if they're just going to make you cryptic. */ + rh#tob3_cryptic
	++ @195 /* I'm not the one here researching lichdom, you know. Go lecture yourself instead. */ + rh#tob3_lecture
END

IF ~~ rh#tob3_wager
 SAY @196 /* No, so far you've been lucky. If that means that you always will be... I guess we can only wait and hope. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_lich
 SAY @197 /* No, I don't suppose I am. Whatever happens next, <CHARNAME>, whatever comes... just be careful. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_gambler
 SAY @198 /* Heh. No, I suppose you've never been much of a gambler, have you? Maybe that's for the best. */
IF ~~ DO ~RestParty()~ EXIT
END	

IF ~~ rh#tob3_more
 SAY @199 /* Mmm, at this point, I dare say that would be a most welcome distraction anyway, my dear. Not that it isn't always. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_cryptic
 SAY @200 /* Cryptic, is it? I guess I can only say that whatever happens next, whatever comes... just be careful. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_lecture
 SAY @201 /* There's more to it than just lichdom, <CHARNAME>. Whatever happens next, whatever comes... just be careful. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_main4
 SAY @202 /* He... deserved it, you know. Irenicus. Whatever it was that the Seldarine did to him... he deserved it. I can only pray that his afterlife is as... pleasant as his former one was. */
	++ @203 /* He wasn't quite an undead thing. That was his sister. */ + rh#tob3_sister
	++ @204 /* You really need to let this go, Adrian. */ + rh#tob3_letgo
	++ @205 /* A sentiment I heartily agree with. */ + rh#tob3_sentiment
	++ @206 /* I think we need to keep you away from the theoretically treatises in the future. */ + rh#tob3_treatises
	++ @207 /* Couldn't you focus on our Bhaalspawn adversaries instead for once? */ + rh#tob3_adversaries
END

IF ~~ rh#tob3_sister
 SAY @208 /* So it was. But nevermind the rest of my superstitious nonsense, <CHARNAME>. I... suppose you eventually get to a point where there's nowhere left to go but forward. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_letgo
 SAY @209 /* Hmm, perhaps. But nevermind the rest of my superstitious nonsense, <CHARNAME>. I... suppose you eventually get to a point where there's nowhere left to go but forward. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_sentiment
 SAY @210 /* I thought you would. But nevermind the rest of my superstitious nonsense, <CHARNAME>. I... suppose you eventually get to a point where there's nowhere left to go but forward. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_treatises
 SAY @209 /* Hmm, perhaps. But nevermind the rest of my superstitious nonsense, <CHARNAME>. I... suppose you eventually get to a point where there's nowhere left to go but forward. */
IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ rh#tob3_adversaries
 SAY @211 /* Hmm, I do try. I... suppose you eventually get to a point where there's nowhere left to go but forward. */
IF ~~ DO ~RestParty()~ EXIT
END
END
	
// 4. in the pocket plane once you get to Amkethran.
CHAIN IF ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianTalksTOB","GLOBAL",8)~ THEN RH#AD25J rh#tob4
@212 /* Hells, this place... I'm glad I converted ten years ago if my eternity would have otherwise looked remotely like this. */
= @213 /* It could do with a bit of redecorating, I dare say. */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",9)
RealSetGlobalTimer("rh#AdrianTalksTOBTimer","GLOBAL",2700)~
END
 	++ @214 /* Very funny. We're a little bit busy for frivolities. */ + rh#tob4_frivolous
 	++ @215 /* That's my divine father's taste you're insulting there. */ + rh#tob4_creepy
 	++ @216 /* Absolutely! Put up a few tapestries, some Chessentan statues, and it's as good as home. */ + rh#tob4_statues
 	++ @217 /* It is kind of creepy, isn't it? */ + rh#tob4_creepy
 	++ @218 /* You're welcome to if you want to, but I really don't have time for this right now. */ + rh#tob4_shoo

APPEND RH#AD25J

IF ~~ rh#tob4_frivolous
 SAY @219 /* Frivolous, am I? By all the gods, <CHARNAME>, if this is a manifestation of your soul, your head must be an even more frightening place than mine. */
IF ~~ + rh#tob4_main1
END

IF ~~ rh#tob4_creepy
 SAY @220 /* So it is. By all the gods, <CHARNAME>, if this is a manifestation of your soul, then your head must be an even more frightening place than mine. */
IF ~~ + rh#tob4_main1
END

IF ~~ rh#tob4_statues
 SAY @221 /* Even a couple of marble sculpture won't fix this. By all the gods, <CHARNAME>, if this is a manifestation of your soul, your head must be an even more frightening place than mine. */
IF ~~ + rh#tob4_main1
END

IF ~~ rh#tob4_shoo
 SAY @222 /* No? If I'm such a pest, I'm not sure why you keep me around at all. */
IF ~~ + rh#tob4_main1
END

IF ~~ rh#tob4_main1
 SAY @223 /* Dammit, would you stop staring at me like that? */
 	++ @224 /* Staring? I was barely glancing at you. */ + rh#tob4_nonsense
 	++ @225 /* You've been acting strange all <DAYNIGHT>, Adrian. What's wrong? */ + rh#tob4_strange
 	++ @226 /* Oh, not this nonsense again. I thought we were over this. */ + rh#tob4_nonsense
 	++ @227 /* Too damn bad. I'll look wherever I want. */ + rh#tob4_look
END

IF ~~ rh#tob4_nonsense
 SAY @228 /* I... hells, just listen to me. */
IF ~~ + rh#tob4_main2
END

IF ~~ rh#tob4_strange
 SAY @229 /* Wrong? Why would anything be wrong? I... hells, just listen to me. */
IF ~~ + rh#tob4_main2
END

IF ~~ rh#tob4_look
 SAY @230 /* Yes, you'll do whatever you damn well please, won't you? I... hells, just listen to me. */
IF ~~ + rh#tob4_main2
END

IF ~~ rh#tob4_main2
 SAY @231 /* I'm sorry, <CHARNAME>. I don't mean to be difficult, but this place... I suppose it's harder to ignore the reality of the situation when the evidence is all around me. */
	++ @232 /* You're forgiven. It's not as if I'm not used to this by now. */ + rh#tob4_forgive
	++ @233 /* For someone so fond of reason, you really are one of the most high-strung men I know. */ + rh#tob4_highstrung
	+ ~!CheckStatGT(Player1,14,WIS) !CheckStatGT(Player1,14,INT)~ + @234 /* The reality of the situation? What exactly are you afraid of? */ + rh#tob4_main3
	+ ~OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + @235 /* The reality of the situation? The unspoken offer, you mean. Maybe we should sit down and discuss this. */ + rh#tob4_offer
	+ ~Global("rh#AdrSex","GLOBAL",1)~ + @236 /* I'm going to have to ask you to make it up to me to<DAYNIGHT>. As creatively as possible. */ + rh#tob4_creative
	++ @237 /* I'm tired of this nonsense, Adrian. I thought it was going to stop after Suldanessellar, but apparently it hasn't. We're done here. */ + rh#tob4_done
END

IF ~~ rh#tob4_forgive
 SAY @238 /* (sigh) You shouldn't have to be. */
IF ~~ + rh#tob4_main3
END

IF ~~ rh#tob4_highstrung
 SAY @239 /* (sigh) I won't bother trying to deny that. */
IF ~~ + rh#tob4_main3
END

IF ~~ rh#tob4_offer
 SAY @240 /* That would probably be a good idea. */
IF ~~ + rh#tob4_main3
END

IF ~~ rh#tob4_creative
 SAY @241 /* Mmm, as glad as I am that you're not angry with me, we really do need to talk. */
IF ~~ + rh#tob4_main3
END

IF ~~ rh#tob4_done
 SAY @242 /* I... see. I'll leave you alone, then. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#tob4_main3
 SAY @243 /* I should have said something quite some time ago, I suppose, but... well, we both know how good I am at that. This damn Solar can only be here for one reason, <CHARNAME>, and... we both know what your future could hold. */
 = @244 /* I don't want to pressure you one way or the other, but I do need to know what you're thinking. I... can't just pretend that this will go away if I ignore it. Obviously I've tried. */
 	++ @245 /* I can't give you certainty. I haven't made a decision myself. */ + rh#tob4_decision
 	++ @246 /* I only hope that I'll have a choice in the matter, one way or the other. */ + rh#tob4_choice
 	++ @247 /* The Solar's promises may never amount to anything. We could all die before this is over. */ + rh#tob4_before
	++ @248 /* You don't know me very well if you think I've any interest in taking up Bhaal's mantle. */ + rh#tob4_mantle
	++ @249 /* If it were Sune or Sharess, I wouldn't refuse, but my father's legacy... no thank you. */ + rh#tob4_sune
 	++ @250 /* With the power I have right now, I'd rather be a force amongst mortals than a weak and fledgling deity. */ + rh#tob4_fledge
 	++ @251 /* You can't honestly expect me to give up the opportunity to become a goddess. */ + rh#tob4_god
 	++ @252 /* Frankly, it's none of your business. */ + rh#tob4_no
END

IF ~~ rh#tob4_decision
 SAY @253 /* You're going to have to, <CHARNAME>, and sooner rather than later. This isn't the sort of decision that you leave to the last moment. */
	++ @254 /* All my best decisions were made at the last moment. When the time comes, I'll choose whatever feels right. */ + rh#tob4_feelsright
	++ @247 /* The Solar's promises may never amount to anything. We could all die before this is over. */ + rh#tob4_before
 	++ @255 /* After everything I've been put through because of this prophesy, it seems unthinkable to ignore the rewards. */ + rh#tob4_god
 	++ @256 /* I'm tired of gods and prophesies. That's as good a reason as any to stay mortal. */ + rh#tob4_stay
END

IF ~~ rh#tob4_feelsright
 SAY @257 /* Please. I need a real answer, even if you don't. */
 	++ @258 /* I can't give you one. I'm sorry. */ + rh#tob4_no
 	++ @259 /* After everything I've been put through because of this prophesy, it does seem unthinkable to ignore the rewards. */ + rh#tob4_god
 	++ @256 /* I'm tired of gods and prophesies. That's as good a reason as any to stay mortal. */ + rh#tob4_stay
END

IF ~~ rh#tob4_choice
 SAY @260 /* You probably will. The gentler gods tend to appreciate free will, and the crueler ones... well, they wouldn't care for a new rival regardless. I don't think it'll be forced upon you. */
  	++ @261 /* I still can't give you certainty. I haven't made a decision myself. */ + rh#tob4_decision
	++ @262 /* If I can turn it down, I will. I have no interest in taking up Bhaal's mantle. */ + rh#tob4_mantle
	++ @263 /* In that case, If it were Sune or Sharess, I wouldn't refuse, but my father's legacy... no thank you. */ + rh#tob4_sune
 	++ @250 /* With the power I have right now, I'd rather be a force amongst mortals than a weak and fledgling deity. */ + rh#tob4_fledge
 	++ @264 /* Regardless, you can't honestly expect me to give up the opportunity to become a goddess. */ + rh#tob4_god
 	++ @252 /* Frankly, it's none of your business. */ + rh#tob4_no
END

IF ~~ rh#tob4_before
 SAY @265 /* I'm fully aware of that. As... comforting a thought as it is, it somehow doesn't help me sleep at night. You must have some thoughts on the matter. */
 	++ @261 /* I still can't give you certainty. I haven't made a decision myself. */ + rh#tob4_decision
	++ @248 /* You don't know me very well if you think I've any interest in taking up Bhaal's mantle. */ + rh#tob4_mantle
	++ @249 /* If it were Sune or Sharess, I wouldn't refuse, but my father's legacy... no thank you. */ + rh#tob4_sune
 	++ @250 /* With the power I have right now, I'd rather be a force amongst mortals than a weak and fledgling deity. */ + rh#tob4_fledge
 	++ @251 /* You can't honestly expect me to give up the opportunity to become a goddess. */ + rh#tob4_god
 	++ @252 /* Frankly, it's none of your business. */ + rh#tob4_no
END

IF ~~ rh#tob4_mantle
 SAY @266 /* No, being a goddess of murder doesn't much sound like you at all, but don't forget that deities do branch out. They say that the reborn Mystra is nothing like the old one, and you're even less like Bhaal. */
IF ~~ + rh#tob4_main4
END

IF ~~ rh#tob4_sune
 SAY @267 /* Mmm, and what a goddess of pleasure and passion you would be, my dear. But don't forget that deities do branch out. They say that the reborn Mystra is nothing like the old one, and you're even less like Bhaal. */
IF ~~ + rh#tob4_main4
END

IF ~~ rh#tob4_fledge
 SAY @268 /* I wouldn't care for having Cyric watching me, waiting for any opportunity to strike either. But I don't believe you incapable of competing in the divine arena. */
IF ~~ + rh#tob4_main4
END

IF ~~ rh#tob4_main4
 SAY @269 /* It's not an opportunity to reject lightly. Many spend their entire lives chasing such dreams. */
  	++ @270 /* I just said no. Are you trying to talk me into accepting godhood? */ + rh#tob4_accept
  	++ @271 /* Many spend their lives foolishly. I don't intend to do so, and I won't spend it anywhere but here. */ + rh#tob4_here
  	++ @272 /* I have more faith in mortals than in gods anyway. I have no desire to become one. */ + rh#tob4_stay
  	++ @273 /* When you put it like that, after everything I've been put through because of this prophesy, it does seem unthinkable to ignore the rewards. */ + rh#tob4_god
END

IF ~~ rh#tob4_accept
 SAY @274 /* No, <CHARNAME>. But I don't want to pretend that this should be an easy decision. */ 
IF ~~ + rh#tob4_main5
END

IF ~~ rh#tob4_here
 SAY @275 /* I hope by 'here', you don't mean Tethyr. I'd hate to spend a moment more than necessary in this gods forsaken corner of Faerun. */
IF ~~ + rh#tob4_main5
END

IF ~~ rh#tob4_stay
 SAY @276 /* After all of this, I can't say I blame you. */
IF ~~ + rh#tob4_main5
END

IF ~~ rh#tob4_main5
 SAY @277 /* And now I feel doubly foolish for not bringing this up earlier... and for practically attacking you at first. I can't promise that it won't happen again, but... I am trying. */
 	++ @278 /* I know you are. I'm not holding it against you, and I wish you wouldn't either. */ + rh#tob4_work
 	++ @279 /* Not hard enough, apparently. Come, let's put this behind us. There's work to be done. */ + rh#tob4_work
 	++ @280 /* If this is how you tried to get information out of people in Sembia, it's no wonder you were chased away. */ + rh#tob4_sembia
 	++ @281 /* I have to make a promise, and he refuses to make one in return. */ + rh#tob4_promise 
END

IF ~~ rh#tob4_work
 SAY @282 /* As my lady wishes. But... thank you. */
IF ~~ EXIT
END

IF ~~ rh#tob4_sembia
 SAY @283 /* I suppose I deserved that. */
IF ~~ EXIT
END

IF ~~ rh#tob4_promise
 SAY @284 /* Suddenly so literal. But I suppose I deserved that. */
IF ~~ EXIT
END

IF ~~ rh#tob4_god
 SAY @285 /* I see. I don't begrudge you that choice. Hells, I can certainly understand it, but... that doesn't change anything. */
 = @286 /* I'm sorry, <CHARNAME>, but I'd rather end this cleanly now than risk poisoning it later. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1)~ EXIT
END

IF ~~ rh#tob4_no
 SAY @287 /* I see. I suppose that alone is all the answer I needed. */
 = @286 /* I'm sorry, <CHARNAME>, but I'd rather end this cleanly now than risk poisoning it later. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1)~ EXIT
END
END

// friendship
CHAIN IF ~Global("rh#AdrianFriendshipActive","GLOBAL",1) Global("rh#AdrianTalksTOB","GLOBAL",8)~ THEN RH#AD25J rh#tobf4
@288 /* We Banites were always more spartan than... grotesque, but if my eternity would have looked remotely like this, I'm glad I finally converted. */
= @289 /* As your future throne room, I dare say it could do with a bit of redecorating. */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",9)~
END
 	++ @214 /* Very funny. We're a little bit busy for frivolities. */ + rh#tobf4_frivolous
 	++ @215 /* That's my divine father's taste you're insulting there. */ + rh#tobf4_taste
 	++ @216 /* Absolutely! Put up a few tapestries, some Chessentan statues, and it's as good as home. */ + rh#tobf4_statues
 	++ @290 /* Future throne room? You honestly think I want this? */ + rh#tobf4_want
 	++ @218 /* You're welcome to if you want to, but I really don't have time for this right now. */ + rh#tobf4_shoo
 	
APPEND RH#AD25J
 
IF ~~ rh#tobf4_frivolous
  SAY @291 /* Indeed. We do, after all, have your future rule to consolidate. */
IF ~~ + rh#tobf4_main1
END

IF ~~ rh#tobf4_taste
  SAY @292 /* And what exquisite taste it is. Well, as long as you don't share it, I shouldn't complain. */
IF ~~ + rh#tobf4_main1
END

IF ~~ rh#tobf4_statues
  SAY @293 /* You could try, but I dare say that would just accentuate the obvious flaws. */
IF ~~ + rh#tobf4_main1
END

IF ~~ rh#tobf4_want
  SAY @294 /* Well, given the exquisitely poor taste involved, I certainly wouldn't. */
IF ~~ + rh#tobf4_main1
END

IF ~~ rh#tobf4_shoo
  SAY @295 /* No, I can't say I find that surprising. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_main1
  SAY @296 /* Forgive me the jests, <CHARNAME>. I suppose I've too long a history with dark gods to react to something like this in a remotely normal fashion. */
	++ @297 /* At least you're not descended from one. */ + rh#tobf4_descend
	+ ~OR(2) !InParty("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @298 /* You once worshipped Bane? */ + rh#tobf4_bane
	+ ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @299 /* You were once a Banite? I hope Keldorn doesn't know. */ + rh#tobf4_keldorn
	++ @300 /* You're going to see quite a bit more of them before this crisis is over. */ + rh#tobf4_crisis
	++ @301 /* I don't think any of us are reacting to this place in a normal fashion. We haven't run away screaming yet. */ + rh#tobf4_scream
END

IF ~~ rh#tobf4_descend
  SAY @302 /* True. I've always had enough problems with my family as it is, but at least we never called places like this home. */
IF ~~ + rh#tobf4_main2
END

IF ~~ rh#tobf4_bane
  SAY @303 /* A long time ago, yes. My city was practically the seat of his worship, so it was somewhat inevitable. This place, though... */
IF ~~ + rh#tobf4_main2
END

IF ~~ rh#tobf4_keldorn
  SAY @304 /* He certainly suspects. I don't think he minds much what happened ten years ago, but I'd rather not test that theory. This place, though... */
IF ~~ + rh#tobf4_main2
END

IF ~~ rh#tobf4_crisis
  SAY @305 /* And afterwards... well, who knows? This place, though... */
IF ~~ + rh#tobf4_main2
END

IF ~~ rh#tobf4_scream
  SAY @306 /* Heh. Yes, that would be the most proper reaction. */
IF ~~ + rh#tobf4_main2
END

IF ~~ rh#tobf4_main2
 SAY @307 /* I suppose there's no real reason to assume that your own future divine realm would be quite so hideous... they say that the reborn Mystra is nothing like the old one, and you're not quite as singleminded as Bhaal was. */
 = @308 /* I assume you've put some thought into the possibility? */
  	++ @309 /* You're rather cavalier about this. Weren't you warning me to be careful earlier? */ + rh#tobf4_cavalier
  	+ ~Gender(Player1,FEMALE)~ + @310 /* I have no interest in taking up Bhaal's mantle. */ + rh#tobf4_mantle1
  	+ ~Gender(Player1,MALE)~ + @310 /* I have no interest in taking up Bhaal's mantle. */ + rh#tobf4_mantle2
  	++ @250 /* With the power I have right now, I'd rather be a force amongst mortals than a weak and fledgling deity. */ + rh#tobf4_fledge
  	++ @311 /* As it so happens, I've already been planning my divine career. */ + rh#tobf4_career
  	+ ~!Alignment("rh#Adrian",MASK_EVIL)~ + @312 /* It's too great an opportunity to refuse. */ + rh#tobf4_refuse1
  	+ ~Alignment("rh#Adrian",MASK_EVIL)~ + @312 /* It's too great an opportunity to refuse. */ + rh#tobf4_refuse2
  	++ @313 /* Whether or not I've put some thought into it is no concern of yours. */ + rh#tobf4_concern
END

IF ~~ rh#tobf4_cavalier
 SAY @314 /* With the lichs? I'd say that the thoughts that haunt us at night disappear come morning, but that wouldn't quite be true. */
 = @315 /* I would be wary, yes, but I won't pretend that the two scenarios are exactly the same. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main3
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main5
END

IF ~~ rh#tobf4_mantle1
  SAY @316 /* No, being a goddess of murder doesn't much sound like you at all, but don't forget that deities do branch out. */
  = @269 /* It's not an opportunity to reject lightly. Many spend their entire lives chasing such dreams. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main3
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main5
END

IF ~~ rh#tobf4_mantle2
  SAY @317 /* No, being a god of murder doesn't much sound like you at all, but don't forget that deities do branch out. */
  = @269 /* It's not an opportunity to reject lightly. Many spend their entire lives chasing such dreams. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main3
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main5
END

IF ~~ rh#tobf4_fledge
  SAY @268 /* I wouldn't care for having Cyric watching me, waiting for any opportunity to strike either. But I don't believe you incapable of competing in the divine arena. */
  = @269 /* It's not an opportunity to reject lightly. Many spend their entire lives chasing such dreams. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main3
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main5
END

IF ~~ rh#tobf4_career
 SAY @318 /* Have you? I'd warn you not to let future possibilities distract you from the reality of the present, but you seem to have things well enough in hand as it is. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main3
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#tobf4_main5
END

IF ~~ rh#tobf4_refuse1
 SAY @319 /* To reject out of hand... yes. To refuse, I'm not quite sure. */
IF ~~ + rh#tobf4_main3
END

IF ~~ rh#tobf4_refuse2
 SAY @320 /* I don't disagree. */
IF ~~ + rh#tobf4_main5
END

IF ~~ rh#tobf4_concern
 SAY @321 /* No, I suppose not. If you don't want counsel, I certainly won't force it upon you. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_main3
 SAY @322 /* I don't mean to sway you one way or the other, <CHARNAME>. Heavens know, if I were offered the option myself, I'm not sure what I would say. */
 	++ @323 /* Don't pretend that you wouldn't agree in a heartbeat. */ + rh#tobf4_heartbeat
 	++ @324 /* I've been offered the option and I still can't make a decision. */ + rh#tobf4_option
 	++ @325 /* If you're not sure, that means the answer is "no". */ + rh#tobf4_answer
 	++ @326 /* I'm sure you'd analyze every possible drawback up until the offer was revoked. */ + rh#tobf4_analyze
 	++ @327 /* Then you're fortunate that it's a choice you'll never have to make. */ + rh#tobf4_fortune
END

IF ~~ rh#tobf4_heartbeat
  SAY @328 /* A heartbeat? No, I'm not quite so impulsive as that these days. And with a decision like this, you probably shouldn't be either. */
IF ~~ + rh#tobf4_main4
END

IF ~~ rh#tobf4_option
 SAY @329 /* I understand that, but you're going to have to, you know, and sooner rather than later. This isn't the sort of decision that you leave to the last moment. */
IF ~~ + rh#tobf4_main4
END

IF ~~ rh#tobf4_answer
 SAY @330 /* You're right, I think. Any doubt in a decision like this... I would hate to spend the rest of eternity with regrets. */
 = @331 /* I take it that you're certain, then? */
	++ @332 /* Completely. */ + rh#tobf4_completely
	++ @333 /* I'm still thinking things through, but I'm getting there. */ + rh#tobf4_completely
	++ @334 /* Certain? The only thing I know for sure is that I don't understand what I'd be getting myself into. */ + rh#tobf4_understand
END

IF ~~ rh#tobf4_analyze
  SAY @335 /* And I doubt that I'd regret it. It's best to be fully aware of the benefits and drawbacks. */
IF ~~ + rh#tobf4_main4
END

IF ~~ rh#tobf4_fortune
  SAY @336 /* Ha! Forgive my idle ruminations then. I only mean to say... well. */
IF ~~ + rh#tobf4_main4
END

IF ~~ rh#tobf4_main4
  SAY @337 /* If and when the time comes, <CHARNAME>, whatever your choice is, make sure that you have no doubts. */
	++ @338 /* I'll keep that in mind, thank you. */ + rh#tobf4_completely
	++ @339 /* You don't need to tell me that this is serious. I'm fully aware of that. */ + rh#tobf4_completely
	++ @340 /* Everyone has doubts. There's no difference between living with them for a mortal lifetime and living with them for eternity. */ + rh#tobf4_doubt
	++ @341 /* Not too long ago, I would have expected you to be hoping for divine handouts instead. This is a pleasant surprise. */ + rh#tobf4_handout
END

IF ~~ rh#tobf4_completely
  SAY @342 /* Good. Odd as it may seem, I don't envy you the choice. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_understand
  SAY @343 /* Gods and mortals interact on different planes entirely... if that's your rationale, <CHARNAME>, you're wiser than most. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_doubt
  SAY @344 /* Only a matter of degree, I suppose. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_handout
  SAY @345 /* Heh. Just keep it in mind. Odd as it may seem, I don't envy you this choice. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_main5
  SAY @346 /* In any case, divinity... hells. I certainly wouldn't mind the chance to leave every mortal care and concern behind. */
 	++ @347 /* That doesn't sound promising. Are you alright? */ + rh#tobf4_angry
 	++ @348 /* I can't imagine that your cares and concerns are anything compared to mine. */ + rh#tobf4_compared
 	++ @349 /* And here I was told that the key feature was the nigh unlimited power. */ + rh#tobf4_feature
 	++ @350 /* I'd rather be myself, with or without the daily strain. */ + rh#tobf4_strain
 	++ @351 /* If you don't stop annoying me, I can certainly have that arranged. */ + rh#tobf4_arranged
END

IF ~~ rh#tobf4_angry
  SAY @352 /* I'm angry. I've been angry since we left Suldanessellar, but it's nothing to worry yourself over. */
IF ~~ + rh#tobf4_main6
END

IF ~~ rh#tobf4_compared
  SAY @353 /* Perhaps not, but I'm still angry. I've been angry since we left Suldanessellar, though it's nothing to worry yourself over. */
IF ~~ + rh#tobf4_main6
END

IF ~~ rh#tobf4_feature
  SAY @354 /* Well, I wouldn't turn that down either. */
  
IF ~~ + rh#tobf4_main6
END

IF ~~ rh#tobf4_strain
  SAY @355 /* And how's that working out for you? */
  
IF ~~ + rh#tobf4_main6
END

IF ~~ rh#tobf4_arranged
  SAY @356 /* How very typical. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_main6
  SAY @357 /* When the time comes... well. Just don't make a decision you'll regret. */
	++ @358 /* I didn't intend to. */ + rh#tobf4_intending
	++ @359 /* What, are you hoping for divine handouts? */ + rh#tobf4_divinehandout
	++ @360 /* Thank you for the advice. I think. */ + rh#tobf4_advice
	++ @361 /* Don't blow me off like that. What's bothering you? */ + rh#tobf4_bothering
	++ @362 /* Well, bad decisions have always been within your purview anyway, not mine. */ + rh#tobf4_decisions
END

IF ~~ rh#tobf4_intending
  SAY @363 /* Most people don't. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_divinehandout
  SAY @364 /* I should hope that I'm not quite as transparent as that. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_advice
  SAY @365 /* My pleasure. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_bothering
  SAY @366 /* I should think you had enough on your mind already. */
IF ~~ EXIT
END

IF ~~ rh#tobf4_decisions
  SAY @367 /* Very clever, <CHARNAME>. */
IF ~~ EXIT
END
END

// Saradush: tossed into the lovetrack to better balance things since he won't want to say anything immediately anyway

CHAIN IF ~Global("rh#AdrianTalksTOB","GLOBAL",10)~ THEN RH#AD25J rh#sara
@368 /* Odd of me to still be so haunted by that cesspit of a Tethyrian city. */
= @369 /* I'd have expected that enough time would dull the wounds... especially when those wounds aren't technically mine. */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",11)
RealSetGlobalTimer("rh#AdrianTalksTOBTimer","GLOBAL",2700)~
END
	++ @370 /* You'd better get used to it. I certainly am. */ + rh#sara1.1
	++ @371 /* All of those people slaughtered... could you at least show some respect? */ + rh#sara1.2
	++ @372 /* I think we're all haunted by what happened in Saradush. */ + rh#sara2
	++ @373 /* So you care after all, do you? I was beginning to wonder. */ + rh#sara2
	++ @374 /* I have no desire to talk about Saradush, now or ever. */ + rh#sara1.3

APPEND RH#AD25J

IF ~~ rh#sara1.1
 SAY @375 /* You'd think that I would be by now also. */
IF ~~ + rh#sara2
END

IF ~~ rh#sara1.2
 SAY @376 /* Respect? Will the dead rest any more easily if I comment politely? */
IF ~~ + rh#sara2
END

IF ~~ rh#sara1.3
 SAY @377 /* I'll leave you alone, then. */
IF ~~ EXIT
END

IF ~~ rh#sara2
 SAY @378 /* This wasn't my first siege. Obviously. After what happened in Zhentil Keep... gods. I can only pray that this will be my last, but I'd be a fool not to expect the worst. */
	++ @379 /* I'm not sure I could handle another sight like Saradush myself. */ + rh#sara2.1
	++ @380 /* At least there's nothing in Amkethran worth razing to the ground. */ + rh#sara2.2
	++ @381 /* This whole country has a way of opening up old wounds. */ + rh#sara2.3
	++ @382 /* It won't happen again. Not if I have anything to say about it. */ + rh#sara2.4
	++ @383 /* You'd be more foolish to abandon all hope entirely. */ + rh#sara2.5
END

IF ~~ rh#sara2.1
 SAY @384 /* You may have to. You have to realize that. I... hells, <CHARNAME>. */
IF ~~ + rh#sara3
END

IF ~~ rh#sara2.2
 SAY @385 /* No? There is *you*, and you're certainly worth an army or two, but... if you're trying to distract me, you haven't quite succeeded.  I... hells, <CHARNAME>. */
IF ~~ + rh#sara3
END

IF ~~ rh#sara2.3
 SAY @386 /* Old? They were barely old enough to have scabbed over in the first place. I... hells, <CHARNAME>. */
IF ~~ + rh#sara3
END

IF ~~ rh#sara2.4
 SAY @387 /* You may not have a say. You have to realize that. I... hells, <CHARNAME>. */
IF ~~ + rh#sara3
END

IF ~~ rh#sara2.5
 SAY @388 /* I'm not talking about hope. I... hells, <CHARNAME>. */
IF ~~ + rh#sara3
END

IF ~~ rh#sara3
 SAY @389 /* I shut my eyes and I see Saradush again, but it's not the Saradush we actually ever saw... and the bodies strewn across the ground, they're...they're not blackened and half burnt anymore, but blasted into ice instead... */
 = @390 /* Gruesome statues frozen forever in their last moments, like...like those crystal sculptures from Calimshan that we used to see in Waukeen's Promenade, I-- */
 	++ @391 /* Stop it! I don't want to hear anymore! */ + rh#sara3.1
 	++ @392 /* Don't do this, Adrian. It's not going to help you. */ + rh#sara3.2
 	++ @393 /* If this has been bothering you so much, why haven't you mentioned anything before? */ + rh#sara3.3
 	++ @394 /* They're two different things entirely! Don't conflate them! */ + rh#sara3.4
 	++ @395 /* Enough. We're a bit too busy right now to deal with your old nightmares. */ + rh#sara3.5
END

IF ~~ rh#sara3.1
 SAY @396 /* I... no, I don't blame you. I'll be alright. Eventually. */
IF ~~ + rh#sara4
END

IF ~~ rh#sara3.2
 SAY @397 /* I... I'll be alright. Eventually. */
IF ~~ + rh#sara4
END

IF ~~ rh#sara3.3
 SAY @398 /* It hasn't been. I mean... no more than anything else has, but... I'll be alright. Eventually. */
IF ~~ + rh#sara4
END

IF ~~ rh#sara3.4
 SAY @399 /* Entirely? Divine conflict is what it is, regardless of the god, but... I'll be alright. Eventually. */
IF ~~ + rh#sara4
END

IF ~~ rh#sara3.5
 SAY @400 /* Right, of course. I'll just... leave you alone, then. */
IF ~~ EXIT
END

IF ~~ rh#sara4
 SAY @401 /* I... never had a chance to mourn properly, I think. Things just went from bad to worse after the siege, and it was months before I was even free again. I... I don't know. I don't want to think about it. */ 
 = @402 /* Just let me hide behind my dispassion, <CHARNAME>. It's the only shield I have. */
IF ~~ EXIT
END
END

// 5. (LT only)
CHAIN IF ~Global("rh#AdrianTalksTOB","GLOBAL",12)~ THEN RH#AD25J rh#tob5
@403 /* There's this lovely spot, just north of the Moonsea, a bit south of Melvaunt if my geography is correct... Point Moonsea, they call it. */
= @404 /* I've never been there myself, and I don't see that changing anytime soon, if ever, but it would have been nice to have been able to take you there. */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",13)
RealSetGlobalTimer("rh#AdrianTalksTOBTimer","GLOBAL",2700)~
END
 	++ @405 /* Then why don't we? We're powerful enough by now that any of your old acquaintances would run and hide if they saw us. */ + rh#tob5_powerful
 	++ @406 /* Bittersweet reminiscence, my love? What was so special about the place? */ + rh#tob5_special
 	++ @407 /* There are lovely spots everywhere, if we're looking for other options. */ + rh#tob5_spots
 	++ @408 /* I'd love to visit Candlekeep again myself, but there's nothing much left for me there. */ + rh#tob5_candlekeep
 	++ @409 /* I don't have the time for this right now. */ + rh#tob5_later

APPEND RH#AD25J

IF ~~ rh#tob5_powerful
 SAY @410 /* As beautiful an image as that is... I don't know. I don't know if I'd want to go back. Even to partake in old traditions. */
IF ~~ + rh#tob5_main1
END

IF ~~ rh#tob5_special
 SAY @411 /* Old traditions, my dear. Not quite old wives' tales, but I suppose the distinction there is negligible. */
IF ~~ + rh#tob5_main1
END

IF ~~ rh#tob5_spots
 SAY @412 /* I won't deny it, <CHARNAME>, but the old traditions... they're somewhat attractive, even now. */
IF ~~ + rh#tob5_main1
END

IF ~~ rh#tob5_candlekeep
 SAY @413 /* All things considered... no, I don't suppose there is. */
 = @414 /* But Point Moonsea... it's less about old memories than old traditions. They're somewhat attractive, even now. */
IF ~~ + rh#tob5_main1
END

IF ~~ rh#tob5_later
 SAY @415 /* We'll talk later, then. */
IF ~~ DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",11)
RealSetGlobalTimer("rh#AdrianTalksTOBTimer","GLOBAL",1800)~ EXIT
END

IF ~~ rh#tob5_main1
 SAY @416 /* Legends say that couples who exchanged vows there during Selune's feast day would have no strife in their marriage. A silly superstition, I know, but as caught up in prophesy as we are, I can't help but think of it. */
 	++ @417 /* It would be a nice thought even without the prophesies. */ + rh#tob5_sweet
 	++ @418 /* It is kind of silly, but I'm glad you told me about it anyway. */ + rh#tob5_silly
 	++ @419 /* No strife? It's more than a bit late for that, I'd say. */ + rh#tob5_strife
 	++ @420 /* I'm surprised you even have legends like that. I thought you people were all trying to conquer the world. */ + rh#tob5_conquer
 	++ @421 /* Do we need to waste time on nonsense like this? */ + rh#tob5_nonsense
END

IF ~~ rh#tob5_sweet
 SAY @422 /* I suppose it would be. We tend to be a superstitious crowd back home in general. */
IF ~~ + rh#tob5_main2
END

IF ~~ rh#tob5_silly
 SAY @423 /* Mmm, we tend to be a superstitious crowd back home in general, I suppose. */
IF ~~ + rh#tob5_main2
END

IF ~~ rh#tob5_strife
 SAY @424 /* Mmm, and perhaps we've had enough divine intervention as it is. Still, I'm entitled to a couple of odd superstitions. */
IF ~~ + rh#tob5_main2
END

IF ~~ rh#tob5_conquer
 SAY @425 /* It isn't as if everyone who lives on the Moonsea is a tyrant. Just the more interesting ones. But we tend to be a superstitious crowd in general, I suppose. */
IF ~~ + rh#tob5_main2
END

IF ~~ rh#tob5_nonsense
 SAY @426 /* I thought... oh, never mind. I won't mention it again. */
IF ~~ EXIT
END

IF ~~ rh#tob5_main2
 SAY @427 /* Be in the right place at the right time and you win a goddess's favor... compared to the curses that seem to follow us, that would be welcome. Heavens know, even the illusion of peace is hard enough to come by these days. */
 = @428 /* If we ever have a chance after this mess is over, I think I'd like to visit a spot like that. */
 	++ @429 /* I think I would like that too. */ + rh#tob5_main3
 	++ @430 /* And exchange vows, perhaps? */ + rh#tob5_vows
 	++ @431 /* Adrian, are you trying to propose to me? */ + rh#tob5_propose
 	++ @432 /* We don't need superstition and ritual to make our relationship work. */ + rh#tob5_super
 	++ @433 /* I'm not sure I like where this is headed. */ + rh#tob5_headed
END

IF ~~ rh#tob5_vows
 SAY @434 /* I would hardly refuse, my dear. */
IF ~~ + rh#tob5_main3
END

IF ~~ rh#tob5_propose
 SAY @435 /* It is something we should probably discuss at some point. */
IF ~~ + rh#tob5_main3
END

IF ~~ rh#tob5_super
 SAY @436 /* No, but it doesn't hurt. */
IF ~~ + rh#tob5_main3
END

IF ~~ rh#tob5_headed
 SAY @437 /* It isn't headed anywhere you don't want it to go, <CHARNAME>. Oh, never mind. */
IF ~~ EXIT
END

IF ~~ rh#tob5_main3
 SAY @438 /* It would be nice, I think, to have a marriage sanctified by a god other than Bane. There are precious few Sunites back home, though, and I can't say I've ever before been in a relationship that the lady Firehair would have cared to recognize anyway. */
 = @439 /* But you... I do love you, <CHARNAME>. If you'd care to head back to Amn after this is over and hunt down one of their priestesses of Sune, I certainly wouldn't complain. */
	++ @440 /* I would like nothing more. */ + rh#tob5_yes
	++ @441 /* As lovely as that sounds, I think I would prefer a different church. */ + rh#tob5_church
	++ @442 /* Proposals aren't supposed to be quite so nonchalant, you know. */ + rh#tob5_nonchalant
	++ @443 /* Hunt down? You make it sound like a chase, not a wedding! */ + rh#tob5_hunt
	++ @444 /* I'm not really interested in marriage. */ + rh#tob5_nomarry
END

IF ~~ rh#tob5_yes
 SAY @445 /* (smile) Then that makes me look foward to the end of this mad adventure even more than I already was. */
IF ~~ DO ~SetGlobal("rh#EpilogueWedding","GLOBAL",1)~ + rh#tob5_main4
END

IF ~~ rh#tob5_church
 SAY @446 /* (smile) Well, I suppose it's somewhat premature to start planning it just yet, but you're welcome to choose whichever church you'd like. */
IF ~~ DO ~SetGlobal("rh#EpilogueWedding","GLOBAL",1)~ + rh#tob5_main4
END

IF ~~ rh#tob5_nonchalant
 SAY @447 /* My lady, we've been through too much as it is to blow something so simple out of proportion. */
IF ~~ + rh#tob5_tellme
END

IF ~~ rh#tob5_hunt
 SAY @448 /* Honestly, my lady, could you focus on the question rather than the wording? */
IF ~~ + rh#tob5_tellme
END

IF ~~ rh#tob5_tellme
 SAY @449 /* Would you like to or not? */
	++ @450 /* I'd like nothing more. */ + rh#tob5_yes
	++ @451 /* Yes, but I think I'd prefer a different church. */ + rh#tob5_church
	++ @452 /* It's a bit... soon, don't you think? */ + rh#tob5_soon
	++ @453 /* I'll need to think about it. */ + rh#tob5_think
	++ @444 /* I'm not really interested in marriage. */ + rh#tob5_nomarry
END

IF ~~ rh#tob5_nomarry
 SAY @454 /* No, I suppose that there's been too much symbolism in your life to welcome anymore. If you'd rather not, I don't mind, but a chance to get away after all of this... that I'd still enjoy. */
IF ~~ + rh#tob5_main4
END

IF ~~ rh#tob5_soon
 SAY @455 /* I'm more used to arranged marriages than something like this, but if you'd rather wait, I won't complain. A chance to get away after all of this, though... that I'd still enjoy. */
IF ~~ + rh#tob5_main4
END

IF ~~ rh#tob5_think
 SAY @456 /* Then take your time. And if it isn't something you want to do, I won't complain. A chance to get away after all of this, though... that I'd still enjoy. */
IF ~~ + rh#tob5_main4
END

IF ~~ rh#tob5_main4
 SAY @457 /* But for now... we can spare at least a couple moments, I hope. */
	++ @458 /* Why, did you have something interesting in mind? */ + rh#tob5_interesting
	++ @459 /* I could spare a good deal more than that. */ + rh#tob5_interesting
	++ @460 /* You've got quite the gleam in your eyes right now, my love. */ + rh#tob5_gleam
	++ @461 /* As much as I wish it were otherwise, we do need to move on. */ + rh#tob5_moveon
END

IF ~~ rh#tob5_interesting
 SAY @462 /* Mmm, well... there's not enough privacy right now to really get carried away, but I'm sure we can think of something. */
IF ~~ EXIT
END

IF ~~ rh#tob5_gleam
 SAY @463 /* Do I? Mmm, well... there's not enough privacy right now to really get carried away, but that doesn't mean we can't think of something. */
IF ~~ EXIT
END

IF ~~ rh#tob5_moveon
 SAY @464 /* Ah, well. A pity. */
IF ~~ EXIT
END
END

// 6. (LT only)
CHAIN IF ~Global("rh#AdrianTalksTOB","GLOBAL",14)~ THEN RH#AD25J rh#tob6
@465 /* Have you given any thought to what you'd like to do when this is all over? */
DO ~SetGlobal("rh#AdrianTalksTOB","GLOBAL",15)~
END
 	++ @466 /* We may not even live to see the end of this. */ + rh#tob6_doom
 	++ @467 /* I'm not sure I'll have much of a choice. I never have before. */ + rh#tob6_nochoice
 	++ @468 /* I think I'd like to settle down somewhere, try for a normal life. */ + rh#tob6_normalcy
 	++ @469 /* I imagine I'll probably just follow the road where it leads me. */ + rh#tob6_road
 	++ @470 /* I hope to finally gain some political power in one of these cities that owe me everything. */ + rh#tob6_political
 	++ @471 /* Conquest is looking better and better. All these countries need my intervention anyway. */ + rh#tob6_conquest

APPEND RH#AD25J

IF ~~ rh#tob6_doom
 SAY @472 /* I won't deny that, but formulating a back-up plan on the off chance that we survive is a pleasant enough diversion, isn't it? */
IF ~~ + rh#tob6_main1
END

IF ~~ rh#tob6_nochoice
 SAY @473 /* Things change, <CHARNAME>, and you're becoming more powerful. Exponentially so. It would be nice to have some sort of plan. */
IF ~~ + rh#tob6_main1
END

IF ~~ rh#tob6_normalcy
 SAY @474 /* A normal life for a daughter of Bhaal... a nice fantasy, though if anyone could turn it into reality, it would be you. */
 = @475 /* We'd best move to Mulhorand or Maztica or somewhere equally barbaric if we want to avoid attention, though. */
IF ~~ + rh#tob6_main1
END

IF ~~ rh#tob6_road
 SAY @476 /* The road leads everywhere, <CHARNAME>. The choice of direction is entirely yours. */
IF ~~ + rh#tob6_main1
END

IF ~~ rh#tob6_political
 SAY @477 /* Couldn't we pick a new city altogether? */
IF ~~ + rh#tob6_main1
END

IF ~~ rh#tob6_conquest
 SAY @478 /* Heh. That's always the answer, isn't it? */
IF ~~ + rh#tob6_main1
END

IF ~~ rh#tob6_main1
 SAY @479 /* Myself, I'm tired of the sun-blasted south. Heading back north... well, I'm not sure I'd be welcome anywhere west of the Inland Sea, but the northern countries... hmm, they haven't had a tyrant in Vaasa in about a decade. */
 = @480 /* (smile) I dare say the country is ripe for new leadership. */
 	+ ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ + @481 /* I do hope you're joking. */ + rh#tob6_rasheminsc
 	+ ~OR(2) !InParty("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID)~ + @481 /* I do hope you're joking. */ + rh#tob6_rashemen
   	+ ~!Alignment(Player1,MASK_EVIL) OR(2) !InParty("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID)~ + @482 /* I'd rather do something productive with my life, Adrian. */ + rh#tob6_rashemen2
 	+ ~!Alignment(Player1,MASK_EVIL) !StateCheck("Minsc",CD_STATE_NOTVALID) InParty("Minsc")~ + @482 /* I'd rather do something productive with my life, Adrian. */ + rh#tob6_rasheminsc2
 	+ ~Class(Player1,MAGE_ALL)~ + @483 /* Witch-Queen of Vaasa. I do like the sound of that. */ + rh#tob6_witchqueen
 	+ ~!Class(Player1,MAGE_ALL)~ + @484 /* To carve out a kingdom in a remote part of the world... I like it. */ + rh#tob6_queen
 	++ @485 /* Could you pick someplace a bit less barbaric? */ + rh#tob6_barbaric
 	++ @486 /* Don't be ridiculous. We'd get torn from power within a decade. */ + rh#tob6_torn
END
 
IF ~~ rh#tob6_rasheminsc
 SAY @487 /* Heh. No, it's an idle fantasy, <CHARNAME>. Nothing more. And probably a bit too close to home for me anyway. Perhaps we could take Minsc back to Rashemen. Cold weather, no Harpers or Zhents. Not many elves either. */
IF ~~ + rh#tob6_rash 
END
  
IF ~~ rh#tob6_rashemen
 SAY @488 /* Heh. No, it's an idle fantasy, <CHARNAME>. Nothing more. And probably a bit too close to home for me anyway. Perhaps we could head out to Rashemen in the far east. Cold weather, no Harpers or Zhents. Not many elves either. */
IF ~~ + rh#tob6_rash
END

IF ~~ rh#tob6_rasheminsc2
 SAY @489 /* Perhaps we could take Minsc back to Rashemen, then. Cold weather, no Harpers or Zhents, and I imagine the country is ethical enough to suit your tastes. Spending your days helping to protect Faerun from the ravages of the Red Wizards... */
IF ~~ + rh#tob6_rash 
END
  
IF ~~ rh#tob6_rashemen2
 SAY @490 /* Perhaps we could head out to Rashemen in the far east, then. Cold weather, no Harpers or Zhents, and I imagine the country is ethical enough to suit your tastes. Spending your days helping to protect Faerun from the ravages of the Red Wizards... */
IF ~~ + rh#tob6_rash
END

IF ~~ rh#tob6_rash  
 SAY @491 /* I doubt the Witches would care much for me, but they're likely to appreciate any competent help in their struggle against Thay, and I do enjoy a good feud. */
	++ @492 /* The exotic east... I think I'd enjoy that. */ + rh#tob6_exotic
	++ @493 /* It's probably a bit too far from home for my tastes. */ + rh#tob6_foreign
	++ @494 /* We could do better than that, my love. Maztica. Kara-tur. If we're very lucky, perhaps we'll find a portal to Sigil. */ + rh#tob6_sigil
	++ @495 /* It might be nice to visit, but to stay there... a settled life just isn't for me. */ + rh#tob6_rover
	++ @496 /* You're sure you don't like Amn? */ + rh#tob6_amn
END

IF ~~ rh#tob6_exotic
 SAY @497 /* I've heard it's a lovely country. Maybe a bit too wild for my tastes, but  what's the harm in dreaming? */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_foreign
 SAY @498 /* In more ways than one. I probably couldn't handle more than a month of it before going mad, but what's the harm in dreaming? */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_sigil
 SAY @499 /* City of cities... I've always wondered. Well, mad as the thought may be, what's the harm in dreaming? */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_rover
 SAY @500 /* A settled life in a place like that probably isn't for me either. Still, there's an entire world of options. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_amn
 SAY @501 /* Completely, love. Ah, mad as the thought may be, what's the harm in dreaming? */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_witchqueen
 SAY @502 /* You are a wizardess not to be trifled with, my love. The title becomes you. */ 
IF ~~ + rh#tob6_queen2
END

IF ~~ rh#tob6_queen
 SAY @503 /* You would, wouldn't you? */ 
IF ~~ + rh#tob6_queen2
END

IF ~~ rh#tob6_queen2
 SAY @504 /* Jests aside, I've mostly lost my taste for tyranny, but I don't think I could deny you anything. */
 	++ @505 /* Darling, I was just joking. I'd think you would have understood that by now. */ + rh#tob6_joke
 	++ @506 /* We don't need to be tyrants. That doesn't mean that a place like that couldn't use a bit more order. */ + rh#tob6_order
 	++ @507 /* You're right. You couldn't. That's one of the things I love most about you. */ + rh#tob6_vaasa
 	++ @508 /* Forget Vaasa, then. You know, I've always wanted to try my hand at the normal games of politics. */ + rh#tob6_politics
END

IF ~~ rh#tob6_barbaric
 SAY @509 /* I think I'd prefer to, actually. I'm sure there's a thieves' guild out east that would take us in. Thesk, perhaps. I heard mention of their Shadowmasters a time or two back in Sembia. */
IF ~~ + rh#tob6_thesk
END

IF ~~ rh#tob6_torn
 SAY @510 /* You're probably right. If you'd prefer something a bit more low-key, I'm sure there's a thieves' guild out east that would take us in. Thesk, perhaps. I heard mention of their Shadowmasters a time or two back in Sembia. */
IF ~~ + rh#tob6_thesk
END

IF ~~ rh#tob6_thesk
 SAY @511 /* You've certainly developed enough skill at dealing with the thugs. */
  	++ @512 /* Forget about thieves. I've always wanted to try my hand at the normal games of politics. */ + rh#tob6_politics
  	++ @513 /* Best not underestimate them, my dear. */ + rh#tob6_underestimate
	++ @493 /* It's probably a bit too far from home for my tastes. */ + rh#tob6_theskfar
	++ @514 /* That sounds wonderfully exotic. */ + rh#tob6_theskexotic
END 

IF ~~ rh#tob6_politics
 SAY @515 /* Politics... closer to conquest than you'd think, especially at the highest levels. I didn't prove that skilled at it, but... well, if once you fail, try again, I suppose. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_order
 SAY @516 /* Perhaps that's true. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_joke
 SAY @517 /* Sometimes it's hard to tell with you, <CHARNAME>. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_vaasa
 SAY @518 /* Mmm, don't push your luck, my dear. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_wrong
 SAY @519 /* That you do. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_underestimate
 SAY @520 /* You needn't worry, my dear. I take them seriously enough. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_theskfar
 SAY @521 /* I can sympathize with that. */
IF ~~ + rh#tob6_main2
END

IF ~~ rh#tob6_theskexotic
 SAY @522 /* It certainly does. */
IF ~~ + rh#tob6_main2
END 

IF ~~ rh#tob6_main2
 SAY @523 /* But I'm getting ahead of myself, I know. It's too soon to talk about this now with your mad prophesy breathing down the back of our necks. */
 	++ @524 /* I like discussing it anyway. I like to think that we'll have a real future, whatever it may be. */ + rh#tob6_discuss
 	++ @525 /* It isn't *my* prophesy, Adrian. I'd rather have nothing to do with it. */ + rh#tob6_myprophesy
 	++ @526 /* I'll take any distraction from these prophesies. */ + rh#tob6_distraction
 	++ @527 /* I enjoy your mad daydreams all the same. */ + rh#tob6_daydreams
 	+ ~Global("rh#AdrSex","GLOBAL",1)~ + @528 /* There are a lot of things that we shouldn't be doing with matters this serious, but that's never stopped us before. */ + rh#tob6_serious
 	++ @529 /* You're right. The whole discussion is pointless. */ + rh#tob6_pointless
END

IF ~~ rh#tob6_discuss
 SAY @530 /* A real future... well, we've as good a chance as getting through this as anyone, and better than most. */
IF ~~ + rh#tob6_main3
END 

IF ~~ rh#tob6_myprophesy
 SAY @531 /* I know, <CHARNAME>. But... it can't last forever, and we've as good a chance as getting through this as anyone. Better than most. */
IF ~~ + rh#tob6_main3
END  
 
IF ~~ rh#tob6_distraction
 SAY @532 /* (smile) Any distraction, you say? I'm glad my fantasies amuse you. */
IF ~~ + rh#tob6_main3
END

IF ~~ rh#tob6_daydreams
 SAY @533 /* (smile) I'm glad to hear it, even if mad daydreams are all they are. */
IF ~~ + rh#tob6_main3
END

IF ~~ rh#tob6_serious
 SAY @534 /* (smile) Matters are never too serious for that. */
IF ~~ + rh#tob6_main3
END

IF ~~ rh#tob6_pointless
 SAY @535 /* Ignore my mad fantasies, then. */
IF ~~ EXIT
END

IF ~~ rh#tob6_main3
 SAY @536 /* With some luck, perhaps we won't even need to flee to the other side of the world afterwards to find someplace we won't be hunted. I'd like that, I think. */
 	++ @537 /* Don't count on it. */ + rh#tob6_dontcount
 	++ @538 /* The Bhaalspawn hysteria will have to die down at some point. */ + rh#tob6_tolerant
 	++ @539 /* But where would be the fun in that? */ + rh#tob6_nofun
 	++ @540 /* I think people will be more tolerant of you than you seem to believe. */ + rh#tob6_tolerant
 	+ ~ReputationGT(Player1,15)~ + @541 /* People will remember the good we've done. That will make a difference in the end. */ + rh#tob6_tolerant
END

IF ~~ rh#tob6_dontcount
 SAY @542 /* I wouldn't rule it out. Power is welcome in quite a few places, and we've certainly accumulated enough of that. With any luck, that will make the difference in the end. */
IF ~~ EXIT
END

IF ~~ rh#tob6_nofun
 SAY @543 /* Heh. My dear, you are incorrigible. */
IF ~~ EXIT
END

IF ~~ rh#tob6_tolerant
 SAY @544 /* Perhaps. Regardless, power is welcome in quite a few places, and we've certainly accumulated enough of that. Maybe that will make the difference in the end. */
IF ~~ EXIT
END
END

// PLOT RELATED DIALOGUE

// Wraith

CHAIN IF ~Global("rh#AdrianWraithTalk","GLOBAL",1)~ THEN RH#AD25J rh#wraith
@545 /* He was right, you know. The only person who ever cared about me when I was younger, and I left him to die. */
DO ~SetGlobal("rh#AdrianWraithTalk","GLOBAL",2)~
END
 	++ @546 /* That thing was just trying to upset you. Let it go. It's over now. */ + rh#wraith1.1
  	++ @547 /* It's not your fault. There was nothing you could have done. */ + rh#wraith1.1
 	++ @548 /* If he really cared about you, he would have been glad that you got out alive. */ + rh#wraith1.1
 	++ @549 /* I must admit, I am surprised that you did nothing at all. */ + rh#wraith1.2

APPEND RH#AD25J

IF ~~ rh#wraith1.1
 SAY @550 /* That hardly matters. */
IF ~~ + rh#wraith2
END

IF ~~ rh#wraith1.2
 SAY @551 /* You shouldn't be. */
IF ~~ + rh#wraith2
END
 
IF ~~ rh#wraith2
 SAY @552 /* I couldn't even run properly... I ran straight into another Cormyrian patrol anyway. Even they recognized that I was useless and let me go quickly enough. */
 	++ @553 /* Adrian, stop it. Whatever happened, it was decades ago. */ + rh#wraith2.1
 	++ @554 /* Snap out of it. You're just letting that creature win. */ + rh#wraith2.2
 	++ @555 /* You were barely more than a child. What were they going to do, murder you because of who your relatives were? */ + rh#wraith2.3
END

IF ~~ rh#wraith2.1
 SAY @556 /* That doesn't change anything. */
IF ~~ + rh#wraith3
END

IF ~~ rh#wraith2.2
 SAY @557 /* It's dead now, <CHARNAME>. It can't win. And don't I know more than a bit about that? */
IF ~~ + rh#wraith3
END

IF ~~ rh#wraith2.3
 SAY @558 /* I wasn't quite as young as that. */
IF ~~ + rh#wraith3
END

IF ~~ rh#wraith3
 SAY @559 /* Everyone I've ever really cared for, I've let down in the end. And it certainly isn't as if there have been that many of them. */
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ + rh#wraith3a
IF ~Alignment("rh#Adrian",MASK_EVIL)~ + rh#wraith3b
END

IF ~~ rh#wraith3a
 SAY @560 /* You... hells, <CHARNAME>, you'll probably be next. Maybe... maybe we should just stop this now, before I hurt you too. */
	++ @561 /* You're not who you were, Adrian. You've learned from your past mistakes. */ + rh#wraith3.1
	++ @562 /* No. You've followed me to the Hells and back. I haven't let your past scare me away before and I'm not going to start now. */ + rh#wraith3.2
	++ @563 /* You're not the only one who's ever let someone down. When Gorion was cut down by Sarevok... I ran too. */ + rh#wraith3.3
	++ @564 /* Don't say such things, Adrian. You're stronger than this. */ + rh#wraith3.4
	++ @565 /* Maybe we should. */ + rh#wraith_end
END

IF ~~ rh#wraith3b
 SAY @560 /* You... hells, <CHARNAME>, you'll probably be next. Maybe... maybe we should just stop this now, before I hurt you too. */
	++ @561 /* You're not who you were, Adrian. You've learned from your past mistakes. */ + rh#wraith3.1b
	++ @562 /* No. You've followed me to the Hells and back. I haven't let your past scare me away before and I'm not going to start now. */ + rh#wraith3.2b
	++ @563 /* You're not the only one who's ever let someone down. When Gorion was cut down by Sarevok... I ran too. */ + rh#wraith3.3b
	++ @564 /* Don't say such things, Adrian. You're stronger than this. */ + rh#wraith3.1b
	++ @565 /* Maybe we should. */ + rh#wraith_end
END

IF ~~ rh#wraith3.1
 SAY @566 /* Have I? Sometimes I'm not so sure. I try... I certainly do, but in the end... I guess I'm still the same wreck of a man I always was. */
IF ~~ + rh#wraith4
END

IF ~~ rh#wraith3.1b
 SAY @567 /* Have I? It certainly doesn't feel like it. */
IF ~~ + rh#wraith4.X
END

IF ~~ rh#wraith3.2
 SAY @568 /* And does it even really matter? Nine Hells or not, in the end, I guess I'm still the same wreck of a man I always was. */
IF ~~ + rh#wraith4
END

IF ~~ rh#wraith3.2b
 SAY @569 /* To the Hells and back... if only that were enough. */
IF ~~ + rh#wraith4.X
END

IF ~~ rh#wraith3.3
 SAY @570 /* You... oh. I didn't know that. At least you've come a ways since then. Me... in the end, I guess I'm still the same wreck of a man I always was. */
IF ~~ + rh#wraith4
END

IF ~~ rh#wraith3.3b
 SAY @571 /* You... it doesn't make any difference. */
IF ~~ + rh#wraith4.X
END

IF ~~ rh#wraith3.4
 SAY @572 /* Am I? I don't know. In the end... I guess I'm still the same wreck of a man I always was. */
IF ~~ + rh#wraith4
END

IF ~~ rh#wraith4.X
 SAY @573 /* I'm sorry, <CHARNAME>. I can't do this right now. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#wraith_end
 SAY @574 /* Right. I'll just... stay away from you, then. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ rh#wraith4
 SAY @575 /* Just listen to me. Sometimes I don't know why you even put up with this at all. */
	++ @576 /* Obviously because I care about you. */ + rh#wraith4.1
	++ @577 /* Honestly, neither do I right now. You need to pull yourself back together. And quickly. */ + rh#wraith4.2
	++ @578 /* Enough. I know that was unpleasant for you, but you need to put it out of your mind. */ + rh#wraith4.2
	++ @579 /* If you need some time to yourself, you're welcome to take it. */ + rh#wraith4.3
	++ @580 /* If a damned wraith can do this to you, you're more pathetic than I thought. */ + rh#wraith_end
END

IF ~~ rh#wraith4.1
 SAY @581 /* (smile) Somehow... somehow that still astounds me. But you're right, I know. There's no point in falling apart over such old memories. */
IF ~~ + rh#wraith4.3
END

IF ~~ rh#wraith4.2
 SAY @582 /* You're right, I know. There's no point in falling apart over such old memories. */
IF ~~ + rh#wraith4.3
END

IF ~~ rh#wraith4.3
 SAY @583 /* I'll be alright, I think. Somehow I'm always alright, but... let's not talk about this again. Please. */
IF ~~ EXIT
END
END

// Post-Oasis

CHAIN IF ~Global("rh#AdrianOasisTalk","GLOBAL",2)~ THEN RH#AD25J rh#Oasis
@584 /* Enemy of the state... well, isn't this a familiar feeling. */
DO ~SetGlobal("rh#AdrianOasisTalk","GLOBAL",3)~
END
	++ @585 /* This isn't funny, Adrian. */ + rh#Oasis1.1
	++ @586 /* We've been wrongfully accused. Doesn't that matter to you? */ + rh#Oasis1.2
	++ @587 /* Welcome to my life. Enjoy the stay. */ + rh#Oasis1.3
	++ @588 /* What do you normally do when the Crown wants you dead? */ + rh#Oasis1.4
	+ ~ReputationLT(Player1,4)~ + @589 /* After Amn, it certainly should be. */ + rh#Oasis1.5
	++ @590 /* Be quiet. I need to concentrate. */ + rh#Oasis1.6

APPEND RH#AD25J

IF ~~ rh#Oasis1.1
 SAY @591 /* No, I didn't say it was. */
IF ~~ + rh#Oasis2
END

IF ~~ rh#Oasis1.2
 SAY @592 /* Rightfully, wrongfully... it all bleeds together in the end. */
IF ~~ + rh#Oasis2
END

IF ~~ rh#Oasis1.3
 SAY @593 /* Yes, you've gotten quite used to this as well, haven't you? */
IF ~~ + rh#Oasis2
END

IF ~~ rh#Oasis1.4
 SAY @594 /* Usually I make myself scarce. Very, very scarce. */
IF ~~ + rh#Oasis2
END

IF ~~ rh#Oasis1.5
 SAY @595 /* Ah, well. I never meant to go back to Amn anyway. */
IF ~~ + rh#Oasis2
END

IF ~~ rh#Oasis1.6
 SAY @596 /* I certainly can't deny that. */
IF ~~ EXIT
END

IF ~~ rh#Oasis2
 SAY @597 /* It's a pity laying low until the Tethyrians lose interest isn't much of an option. Your lovely siblings are... far too talented at tracking you down. */
	++ @598 /* So I've noticed. */ + rh#Oasis2.1
	++ @599 /* I'm not going to run and hide anyway. There's far too much to be done. */ + rh#Oasis2.1
	++ @600 /* We'll just have to be more careful in the future. */ + rh#Oasis2.2
	++ @601 /* They're certainly welcome to try. */ + rh#Oasis2.3
END

IF ~~ rh#Oasis2.1
 SAY @602 /* I shouldn't distract you. I'll just have to get used to the fact that soon I'll probably need both hands to count all the Realms I'm barred from. */
IF ~~ EXIT
END

IF ~~ rh#Oasis2.2
 SAY @603 /* That goes without saying. */
IF ~~ + rh#Oasis3
END

IF ~~ rh#Oasis2.3
 SAY @604 /* And they certainly will. */
IF ~~ + rh#Oasis3
END

IF ~~ rh#Oasis3
 SAY @605 /* But I shouldn't distract you. I'll just have to get used to the fact that soon I'll probably need both hands to count all the Realms I'm barred from. */
IF ~~ EXIT
END
END

// Amkethran

CHAIN IF ~Global("rh#AdrianAmkethranTalk","GLOBAL",1)~ THEN RH#AD25J rh#Amketh
@606 /* What a... delightful man. He's almost as welcoming as the rest of this sad little city of his. */
DO ~SetGlobal("rh#AdrianAmkethranTalk","GLOBAL",2)~
END
	++ @607 /* All things considered, you should be glad we found any welcome at all. */ + rh#Amketh1.1
	++ @608 /* At least it's civilization again. Sort of. */ + rh#Amketh1.1
	++ @609 /* Yes, he was almost as friendly and forthcoming as you tend to be. */ + rh#Amketh1.2
	++ @610 /* Amkethran hardly qualifies as a city, sad and little or otherwise. */ + rh#Amketh1.3
	++ @611 /* Heh. If he were any colder, he'd be made of ice. */ + rh#Amketh1.4
	
APPEND RH#AD25J

IF ~~ rh#Amketh1.1
 SAY @612 /* That is true. Still, I wish I were happier about this entire situation. */
IF ~~ + rh#Amketh2
END

IF ~~ rh#Amketh1.2
 SAY @613 /* Though considerably less expressive. Regardless, I wish I were happier about this entire situation. */
IF ~~ + rh#Amketh2
END

IF ~~ rh#Amketh1.3
 SAY @614 /* It barely qualifies as a village. But the locale notwithstanding, I wish I were happier about this entire situation. */
IF ~~ + rh#Amketh2
END

IF ~~ rh#Amketh1.4
 SAY @615 /* Mmm, this far south, that would be quite unfortunate, wouldn't it? Regardless, I wish I were happier about this entire situation. */
IF ~~ + rh#Amketh2
END

IF ~~ rh#Amketh2
 SAY @616 /* Melissan... call me dependent, but I don't care for her absence. */
 	++ @617 /* Honestly, neither do I. */ + rh#Amketh2.1
 	++ @618 /* We can figure things out on our own. We always have before. */ + rh#Amketh2.2
 	++ @619 /* She seems to be an extremely busy woman. I'm sure she has better places to be. */ + rh#Amketh2.3
 	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @620 /* My, I'm almost tempted to get jealous. */ + rh#Amketh2.2
 	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @621 /* What, you need her to hold your hand through this? */ + rh#Amketh2.2
 	++ @622 /* Yes, I'm sure it's part of some evil plot to save the world. */ + rh#Amketh2.4
END

IF ~~ rh#Amketh2.1
 SAY @623 /* That's... somewhat encouraging, I suppose. Well, no matter. Far be it from me to try to predict the whims of the insipidly righteous. */
IF ~~ + rh#Amketh3
END

IF ~~ rh#Amketh2.2
 SAY @624 /* It isn't that. I... well, never mind. Far be it from me to try to predict the whims of the insipidly righteous. */
IF ~~ + rh#Amketh3
END

IF ~~ rh#Amketh2.3
 SAY @625 /* Yes, I'm sure she does too. I... well, never mind. Far be it from me to try to predict the whims of the insipidly righteous. */
IF ~~ + rh#Amketh3
END

IF ~~ rh#Amketh2.4
 SAY @626 /* I didn't say that. I... well, never mind. Far be it from me to try to predict the whims of the insipidly righteous. */
IF ~~ + rh#Amketh3
END

IF ~~ rh#Amketh3
 SAY @627 /* Whatever else can be said about her, she does have a mind for strategy. These terrible armies of hers... myself, I've never had much use for traditional warfare. */
 = @628 /* You can blame it on the military folk in my family, perhaps, but cut off the head and the rest of the body tends to wither and die. */
 = @629 /* Still, if these two are anything like the last ones... well, I never expected this to be pleasant. */
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @630 /* You don't care for the military? */ + rh#Amketh3.1
	+ ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @630 /* You don't care for the military? */ + rh#Amketh3.2
	++ @631 /* You seem relatively confident. */ + rh#Amketh3.3
	++ @632 /* We'll get through them just as easily as the others. */ + rh#Amketh3.4
	++ @633 /* Knowing my luck, they can only be worse. */ + rh#Amketh3.5
	++ @634 /* Do you have any ideas of your own, or are you just going to repeat everything Melissan already said? */ + rh#Amketh3.6
END

IF ~~ rh#Amketh3.1
 SAY @635 /* No. My uncle was a lieutenant... not Mikail, the other one. And he was enough of an idiot that I can't say I think that highly of armies these days. */
 = @636 /* With any luck, I won't have a reason to reconsider that. */
IF ~~ EXIT
END

IF ~~ rh#Amketh3.2
 SAY @637 /* With our military history back home... no, I can't say I think that highly of armies these days. With any luck, I won't have a reason to reconsider that. */
IF ~~ EXIT
END

IF ~~ rh#Amketh3.3
 SAY @638 /* Perhaps. To be more direct than dear Melissan was... if we treat this like an assassination, we might just succeed. */
IF ~~ EXIT
END

IF ~~ rh#Amketh3.4
 SAY @639 /* I hope you're right. */
IF ~~ EXIT
END

IF ~~ rh#Amketh3.5
 SAY @640 /* That does seem a fairly safe bet. */
IF ~~ EXIT
END

IF ~~ rh#Amketh3.6
 SAY @641 /* Aren't you in a pleasant mood? To be more direct than dear Melissan was... treat it like an assassination, and we might just succeed. */
IF ~~ EXIT
END
END

// 4th challenge

CHAIN IF ~Global("rh#CyricChallengeTalk","GLOBAL",2)~ THEN RH#AD25J rh#cyric1
@642 /* Die... for the Black Sun. I don't care for the sort of attention you're attracting these days, <CHARNAME>. */
DO ~SetGlobal("rh#CyricChallengeTalk","GLOBAL",3)~
END
	++ @643 /* At least he can't do more than send blundering assassins after me. */ + rh#cyric1.1
	++ @644 /* Frankly, neither do I. */ + rh#cyric2
	++ @645 /* It's nothing new, really. At this point, the distinction between powerful Bhaalspawn and a god is academic. */ + rh#cyric1.2
	++ @646 /* All things considered, it was probably inevitable. */ + rh#cyric1.3
	++ @647 /* Well, I can certainly see why you hate him so much. */ + rh#cyric1.4

APPEND RH#AD25J

IF ~~ rh#cyric1.1
 SAY @648 /* Nevertheless, he bends the rules. He always has, and to the hells with the collateral damage. */
IF ~~ + rh#cyric2
END

IF ~~ rh#cyric1.2
 SAY @649 /* I hope you don't actually believe that. The difference is... incomprehensible, for lack of a better word. */
IF ~~ + rh#cyric2
END

IF ~~ rh#cyric1.3
 SAY @650 /* I would tend to agree with that. */
IF ~~ + rh#cyric2
END

IF ~~ rh#cyric1.4
 SAY @651 /* Try living at the center of his worship for a couple of years and you'll really understand. */
IF ~~ + rh#cyric2
END

IF ~~ rh#cyric2
 SAY @652 /* He... I can guess what he wanted with you. The blasted Eclipse doesn't take too kindly to rivals. */
	++ @653 /* But I don't need to be his rival... I want nothing to do with Bhaal's legacy. */ + rh#cyric2.1
	++ @654 /* Eclipse? What is that, a pun? */ + rh#cyric2.2
	++ @655 /* He'd better get used to it, because I'm not going anywhere. */ + rh#cyric2.3
	++ @656 /* I can only hope he won't continue to complicate matters. */ + rh#cyric2.4
	++ @657 /* At least he's forbidden from interfering beyond that. */ + rh#cyric2.5
	++ @658 /* I don't want to talk about what just happened, Adrian. */ + rh#cyric2.6
END

IF ~~ rh#cyric2.1
 SAY @659 /* Don't expect rationality from the God of Madness, <CHARNAME>. He isn't supposed to make sense. */ 
IF ~~ + rh#cyric3
END

IF ~~ rh#cyric2.2
 SAY @660 /* A nickname he earned when he accidentally razed my city to the ground. */
IF ~~ + rh#cyric3
END

IF ~~ rh#cyric2.3
 SAY @661 /* I would say not to tempt him more, but his relative helplessness here really is delicious. */
IF ~~ + rh#cyric3
END

IF ~~ rh#cyric2.4
 SAY @662 /* Yes... complication is what he does best. */
IF ~~ + rh#cyric3
END

IF ~~ rh#cyric2.5
 SAY @663 /* Ah, I was wondering. He used to be... flashier in his idiotic schemes. */
IF ~~ + rh#cyric3
END

IF ~~ rh#cyric2.6
 SAY @664 /* If you expect me to stand by in silence when Cyric himself stops by for a chat... well. */
 = @665 /* I should probably avoid further blasphemy. As it is, he's almost certainly still listening. */
IF ~~ EXIT
END

IF ~~ rh#cyric3
 SAY @666 /* Regardless, I should probably avoid further blasphemy. As it is, he's almost certainly still listening. */
IF ~~ EXIT
END
END

// Final Talk

CHAIN IF ~Global("rh#AdrianFinalTalk","GLOBAL",2)~ THEN RH#AD25J rh#fin
@667 /* And the final test, finished. All that's left... well, we both know what's left. Do we at least have a moment to spare? */
DO ~SetGlobal("rh#AdrianFinalTalk","GLOBAL",3)~
END
	++ @668 /* We have more than a moment. I'm not ready to challenge Melissan just yet. */ + rh#fin_melly
	++ @669 /* Make it brief. This isn't the time for talk. */ + rh#fin_brief
	++ @670 /* We have as long as you need. */ + rh#fin_need
	++ @671 /* There will be time to talk on the other side. I swear it. */ + rh#fin_otherside

APPEND RH#AD25J

IF ~~ rh#fin_melly
 SAY @672 /* No, but... she won't wait forever. We'll have to face her soon enough. */
IF ~~ + rh#fin1
END

IF ~~ rh#fin_brief
 SAY @673 /* No, it isn't, but... there may not be time later. */
IF ~~ + rh#fin1
END

IF ~~ rh#fin_need
 SAY @674 /* As long as I need. Ha. I would happily wait an age or two before meeting Melissan, but... we'll have to face her soon enough. */
IF ~~ + rh#fin1
END

IF ~~ rh#fin_otherside
 SAY @675 /* I hope so. Your confidence has seen us through thus far, so... I'll try to believe it. */
IF ~~ + rh#fin1
END

IF ~~ rh#fin1
 SAY @676 /* With everything coming to a head now... I don't like to leave things unspoken, <CHARNAME>, but it would take a lifetime to go through all of the things I'd like to say. */
	++ @677 /* People always say that sometimes silence speaks louder than words. */ + rh#fin_silence
	++ @678 /* If I wanted an open book, I would have looked elsewhere. You don't need to say anything. */ + rh#fin_silence
 	++ @679 /* It only takes three words, you know. */ + rh#fin_words
 	++ @680 /* Darling, the things you've left unsaid could fill an encyclopedia. */ + rh#fin_darling
 	++ @681 /* We don't have a lifetime at the moment, but you could try to make the next five minutes count for something. */ + rh#fin_fiveminutes
END

IF ~~ rh#fin_silence
 SAY @682 /* For once I'm glad to hear it. */
IF ~~ + rh#fin2
END

IF ~~ rh#fin_words
 SAY @683 /* My love, I'm sure I've said them once or twice. */
IF ~~ + rh#fin2
END

IF ~~ rh#fin_fiveminutes
 SAY @684 /* Five minutes. I suppose it'll have to be enough. */
IF ~~ + rh#fin2
END

IF ~~ rh#fin_darling
 SAY @685 /* I'm sorry for that. Perhaps there will be a chance to set that right someday. */
IF ~~ + rh#fin2
END

IF ~~ rh#fin2
 SAY @686 /* You know, I never really wanted glory before... for my name to be on everybody's lips. I was taught to operate from the shadows, even if I wasn't particularly good at it in the end, but this... to be remembered with you... */
 = @687 /* It'll be a nice tale to replace my old songs, no matter what the bards have to say about us. */
 	+ ~ReputationGT(Player1,15)~ + @688 /* The stories will be positive. When you do well by people, they remember you for it. */ + rh#fin_positive
 	++ @689 /* People can say what they want. We know what was really important. */ + rh#fin_important
 	++ @690 /* So you wait until the very end of things to turn romantic on me? */ + rh#fin_romantic
 	++ @691 /* "A nice tale?" I can only think of one thing in the past few months that has been nice. */ + rh#fin_nice
 	+ ~Class(Player1,BARD_ALL)~ + @692 /* My love, they'll sing whatever I write for them. */ + rh#fin_bard
 	+ ~Global("rh#AdrianVolo","GLOBAL",1)~ + @693 /* You really have been listening to Volo too much, haven't you? */ + rh#fin_volo
	++ @694 /* I didn't realize you cared what anyone had to say about you. */ + rh#fin_surprise
END

IF ~~ rh#fin_positive
 SAY @695 /* If it really matters to you, then for once, I won't bother arguing it. Hmm. */
IF ~~ + rh#fin3
END

IF ~~ rh#fin_important
 SAY @696 /* True enough, and this was. Rather, this *is*. Hmm. */
IF ~~ + rh#fin3
END

IF ~~ rh#fin_romantic
 SAY @697 /* I dare say it doesn't really matter at this point. Hmm. */
IF ~~ + rh#fin3
END

IF ~~ rh#fin_nice
 SAY @698 /* (smile) No, we've been to the hells and back... quite literally, and you... I know full well what you've been through. Hmm. */
IF ~~ + rh#fin3
END

IF ~~ rh#fin_bard
 SAY @699 /* Ha! My dear, I should have expected as much. I never much cared for minstrels before meeting you, but... hmm. */
IF ~~ + rh#fin3
END

IF ~~ rh#fin_volo
 SAY @700 /* Very funny. Still... you may be right. Hmm. */
IF ~~ + rh#fin3
END

IF ~~ rh#fin_surprise
 SAY @701 /* My dear, I tend to like it when people say what I want them to say. Hmm. */ 
IF ~~ + rh#fin3
END

IF ~~ rh#fin3
 SAY @702 /* I think our moment of peace is almost over, but if you could just sit here a while longer, <CHARNAME>... I think I'd like to capture this instant, brief though it may be. */
 = @703 /* A memento to cling to in the face of eternity, if nothing else. And I know it may very well yet come to that. */
 = @704 /* Just... stay here a moment, and then... then we can face tomorrow. */
IF ~~ EXIT
END
END

// Sarevok romance (he'll ignore it unless you sleep with Sarevok)

CHAIN IF ~Global("rh#AdrianSarevokConflict","GLOBAL",2)~ THEN RH#AD25J rh#sarevok
@705 /* If you were really so bored, you could have just told me. */
= @706 /* I take it I'm not quite dark and dangerous enough for you anymore? If you'd now rather bed an old enemy instead... well, so be it. */
DO ~SetGlobal("rh#AdrianSarevokConflict","GLOBAL",3) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)
SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~
EXIT

// Longer Road

CHAIN IF ~Global("rh#AdrianIrenicusTOBTalk","GLOBAL",1)~ THEN RH#AD25J rh#iren
@707 /* You... no. I don't believe this. Whatever you think you owe that vapid elven queen, you can't let this... this *thing* travel with us. */
DO ~SetGlobal("rh#AdrianIrenicusTOBTalk","GLOBAL",2)~
END
	++ @708 /* Can't I? It's about more than Ellesime now. Ilmater is involved. */ EXTERN RH#AD25J rh#iren1
	++ @709 /* You saw what was at stake. Would you rather let Cyric get his hands on Irenicus? */ EXTERN RH#AD25J rh#iren2
	++ @710 /* I know how angry you still are over everything. Facing it may just give you closure. */ EXTERN RH#AD25J rh#iren3
	++ @711 /* I can't exactly let him go, though, can I? */ EXTERN RH#AD25J rh#iren4

APPEND RH#AD25J

IF ~~ rh#iren1
 SAY @712 /* As if I give a damn what whimsies move the Broken God. */
	++ @713 /* This is bigger than you or I. You don't have to like it, but you do have to accept the necessity. */ + rh#iren5
 	++ @714 /* You're not going to be reasonable about this, are you? */ + rh#iren6
	++ @715 /* If you won't accept this... then he has to die again. Right now. */ DO ~SetGlobal("JonNpcFight","GLOBAL",1)~ EXIT
END

IF ~~ rh#iren2
 SAY @716 /* Don't you dare try to manipulate me, <CHARNAME>. */
	++ @713 /* This is bigger than you or I. You don't have to like it, but you do have to accept the necessity. */ + rh#iren5
 	++ @714 /* You're not going to be reasonable about this, are you? */ + rh#iren6
	++ @715 /* If you won't accept this... then he has to die again. Right now. */ DO ~SetGlobal("JonNpcFight","GLOBAL",1)~ EXIT
END

IF ~~ rh#iren3
 SAY @717 /* Killing it again would give me greater closure. Preferably right now, but I'll settle for a couple of misplaced spells later if I have to. */
	++ @713 /* This is bigger than you or I. You don't have to like it, but you do have to accept the necessity. */ + rh#iren5
 	++ @714 /* You're not going to be reasonable about this, are you? */ + rh#iren6
	++ @715 /* If you won't accept this... then he has to die again. Right now. */ DO ~SetGlobal("JonNpcFight","GLOBAL",1)~ EXIT
END

IF ~~ rh#iren4
 SAY @718 /* I don't recall saying anything about letting it go. */
	++ @713 /* This is bigger than you or I. You don't have to like it, but you do have to accept the necessity. */ + rh#iren5
 	++ @714 /* You're not going to be reasonable about this, are you? */ + rh#iren6
	++ @715 /* If you won't accept this... then he has to die again. Right now. */ DO ~SetGlobal("JonNpcFight","GLOBAL",1)~ EXIT
END

IF ~~ rh#iren5
 SAY @719 /* That easy, then? Fine. Do whatever the hells you want. */
IF ~~ EXIT
END

IF ~~ rh#iren6
 SAY @720 /* Unreasonable, am I? Fine. Do whatever the hells you want. */
IF ~~ DO ~SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3) SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END
END

// INTERJECTIONS

I_C_T 25SPELL 13 rh#Lazarus
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@721 /* Heh. I didn't realize there was any such thing as a humble wizard. */
END

I_C_T AMBAR01 35 rh#AdrRafeha
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@722 /* By all the gods, can't these mad dogs *stay* in the Underdark for once? */
END

I_C_T AMELM01 7 rh#ElminsterTOB
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@723 /* But don't expect him to do anything more than that. */
== AMELM01 @724 /* Hmph. Child, perhaps you should consider yourself lucky to still find allies at all. */
END

I_C_T AMGIRL01 0 rh#Amgirl01
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@725 /* Certainly not all wizards. */
END

I_C_T AMLICH01 9 rh#Amlich01
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@726 /* So the idiot makes a bargain he isn't prepared to honor? I shouldn't be surprised. */
END

I_C_T AMMAYOR 5 rh#AdrMayor
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@727 /* Too compassionate to bother hiding the deed afterwards as well, no doubt. */
END

I_C_T AMMERC02 0 rh#AdrSaemonTOB
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@728 /* Hells, will someone finally just shove a knife through this bastard's throat? */
END

I_C_T AMSAEMON 12 rh#AdrSaemonTOB2
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@729 /* I have several myself... though they're increasingly unpleasant. */
== AMSAEMON @730 /* Now, now. There's no need for that. Now, <CHARNAME>, might we talk? */
END 

I_C_T BAZEYE01 10 rh#AdrIycanth
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@731 /* By the gods, could this conversation get any more ludicrous? */
END

I_C_T BAZMONK 12 rh#GeasDragon
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@732 /* And one can only hope that the dragon will be too grateful to try to eat us herself. */
== BAZMONK @733 /* I can make no promises, but I do not expect her to react violently. */
END

I_C_T HGNYA01 13 rh#AdrNyalee
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@734 /* And here I didn't think my opinion of Bhaalists could sink much lower... what a day for surprises. */
END

I_C_T HGNYA01 29 rh#AdrNyalee2
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@735 /* I suppose we should have seen this coming. Best get that wretched heart of hers back again as quickly as possible. */
END

I_C_T JAN25J 7 rh#JanBane
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@736 /* And nobody lies quite as well as a delusional gnome. You were annoying enough before you decided to branch out into blasphemy, Jan. You're lucky I don't care for holy vengeance these days. */
== JAN25J @737 /* Lighten up, Annie. I never said it was your people. I'm sure they were quite happy with the real thing, but your more rustic cousins ended up with me instead. */
END

I_C_T KELDO25J 3 rh#KeldornSaemon
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@738 /* Don't be so grim, Keldorn. The mud will wash off your armor eventually. */
END

I_C_T SARBHA02 1 rh#SARBHA02
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@739 /* So far, you're failing spectacularly at that. */
END

I_C_T SARBUL05 2 rh#SARBUL05
== RH#AD25J IF ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) Alignment("rh#Adrian",LAWFUL_EVIL) InMyArea("rh#Adrian")~ THEN 
@740 /* Beautiful. Please tell me we're going to lend these fine men a hand. */
END

I_C_T SARKIS01 4 rh#Kiser
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@741 /* By the gods, I already want to kill him. */
END

I_C_T SARELF02 0 rh#SARELF02
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@742 /* You'd think that their women were incapable of defending themselves. */
END

I_C_T SARELF06 1 rh#SARELF06
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@743 /* If you're so keen to keep your own company, I'm sure we could find *someone* willing to toss you over the city walls. */
== SARELF06 @744 /* Pfeh! And now I have to endure veiled death threats as well? */
END

I_C_T SARFEM02 1 rh#SARFEM02
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@745 /* Oh, I like this one already. */
END

I_C_T SARMEL01 10 rh#Mel
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@746 /* Another city under seige... I suppose it's too much to hope that this Yaga Shura is a mere disgruntled lordling. */
== SARMEL01 @747 /* I am afraid not. */
END

I_C_T SARMEL01 52 rh#Mel2
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@748 /* Hope? Spare us your tired platitudes, woman. Hope isn't worth much of anything at all against something like this. */
END

I_C_T SARTEM01 4 rh#SARTEM01
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@749 /* If you had any sense, you wouldn't feel pity for him at all, priestess. */
END

I_C_T SARVIE01 5 rh#SARVIE01
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@750 /* It certainly seems more comfortable than staying around to be slaughtered. */
END

EXTEND_BOTTOM SARVOLO 9 #2
+ ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @751 /* Tell me about Adrian. */ + rh#AdrianVolo1
+ ~InParty("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) InMyArea("rh#Adrian") !Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @751 /* Tell me about Adrian. */ + rh#AdrianVolo2
END

CHAIN SARVOLO rh#AdrianVolo1
@752 /* Ah, yes... Adrian Vasiliev, formerly of Zhentil Keep, has grown into one of the most powerful mages that his city has produced. The Realms may yet be grateful that he has put his dark home behind him. */
= @753 /* And for love, as strange as it might seem. We can expect that the songs written for him and <CHARNAME> will far outnumber the less pleasant ones sung about him in the past. */
DO ~SetGlobal("rh#AdrianVolo","GLOBAL",1)~
EXTERN RH#AD25J rh#AdrianVolo3

CHAIN SARVOLO rh#AdrianVolo2
@752 /* Ah, yes... Adrian Vasiliev, formerly of Zhentil Keep, has grown into one of the most powerful mages that his city has produced. The Realms may yet be grateful that he has put his dark home behind him. */
EXTERN RH#AD25J rh#AdrianVolo3

CHAIN RH#AD25J rh#AdrianVolo3
@754 /* Be that as it may, toss those names around, bard, and it'll be a race to see who finds you first. */
EXTERN SARVOLO 9

I_C_T SENBEH01 3 rh#SendaiBeholder
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ THEN 
@755 /* This is absolutely insane. */
END

// Watcher's Keep

I_C_T GORAPP1 6 rh#GORAPP1
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN 
@756 /* By all the gods, the bastard must be insane. */
END

I_C_T GORAPP1 6 rh#GORAPP1
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN 
@756 /* By all the gods, the bastard must be insane. */
END

I_C_T GORAPR 12 rh#GORAPR
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN 
@757 /* Mad *and* stupid. I don't think there's a more dangerous combination on a wizard. */
END

I_C_T GORAPR 12 rh#GORAPR
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN 
@757 /* Mad *and* stupid. I don't think there's a more dangerous combination on a wizard. */
END

I_C_T GORBAT1 4 rh#Baatezu
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN 
@758 /* A poetic devil... I can't say this is something I ever wanted to see at all. */
END

I_C_T GORBAT1 4 rh#Baatezu
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN 
@758 /* A poetic devil... I can't say this is something I ever wanted to see at all. */
END

I_C_T GORCAMB 16 rh#Aesgareth
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN 
@759 /* This would be the proverbial wager with a devil, I take it? */
== GORCAMB @760 /* I share no kinship with such horrid beasts, but you are otherwise not far wrong. */
END

I_C_T GORCAMB 16 rh#Aesgareth
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN 
@759 /* This would be the proverbial wager with a devil, I take it? */
== GORCAMB @760 /* I share no kinship with such horrid beasts, but you are otherwise not far wrong. */
END

I_C_T GORDEMO 18 rh#Demogorgon
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN 
@761 /* As much as I enjoy the irony, bargaining with this thing doesn't seem that wise. */
END

I_C_T GORDEMO 18 rh#Demogorgon
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN 
@761 /* As much as I enjoy the irony, bargaining with this thing doesn't seem that wise. */
END

I_C_T GORODR1 13 rh#Odren
== RH#AD25J IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN 
@762 /* And the knights are no doubt completely useless. */
END

I_C_T GORODR1 13 rh#Odren
== RH#ADRJ IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !StateCheck("rh#Adrian",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN 
@762 /* And the knights are no doubt completely useless. */
END

// Master Wraith

EXTEND_BOTTOM HGWRA01 18
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2) InParty("rh#Adrian") 
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#LovedOne","GLOBAL",1)~ EXTERN HGWRA01 rh#AdrianWraith1
END

CHAIN HGWRA01 rh#AdrianWraith1
@763 /* What of the inevitable pain you must give to the one you love? The mage you name Adrian? */
== RH#AD25J @764 /* You're a fool if you think I have anything left to fear, Harper. */
EXTERN HGWRA01 24

EXTEND_BOTTOM HGWRA01 24
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ 
DO ~ClearAllActions() StartCutSceneMode() StartCutScene("rh#cut4")~ EXIT
END

BEGIN RH#MIKAI

CHAIN IF ~NumTimesTalkedTo(0) InParty("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN RH#MIKAI rh#WraithScene
@765 /* Adrian? It shouldn't surprise me to find you still breathing. */
== RH#AD25J @766 /* I... you're dead. This... this isn't real. */
== RH#MIKAI @767 /* It is as real as it needs to be, nephew. What is true and what is false is inconsequential, mere facts to use as one wishes-- */
== RH#AD25J @768 /* ...it is what one believes that matters. I... remember. */
== RH#MIKAI @769 /* And you repaid my lessons by abandoning me. When the Cormyrian knights closed in around me, you fled. You did not even stay to watch them tear me to pieces, did you? */
== RH#AD25J @770 /* I... what could I have done?! I'd only mastered the most basic of spells, I couldn't-- */
== RH#MIKAI @771 /* You were advanced enough to charm commoners and throw them at the paladins, if nothing else. */
= @772 /* Had you made any attempt to distract them, Adrian, I might have stood a chance. But instead, you ran. You might as well have murdered me yourself. */
== RH#AD25J @773 /* No... no, I-- */
== RH#MIKAI @774 /* My father was right about you, boy. You should have been sold into slavery as soon as my dear sister brought you home. Had I not argued against it, I would still be alive. */
== RH#AD25J @775 /* That's... that's not... <CHARNAME>, make it go away! */ 
END
	++ @776 /* You made your own choices! He isn't responsible for what happened to you! */ EXTERN HGWRA01 25
	++ @777 /* Stop it, Gorion! This isn't right! */ EXTERN HGWRA01 25
	++ @778 /* Enough! I won't let this continue! */ EXTERN HGWRA01 25
	+ ~CheckStatGT(Player1,16,WIS)~ + @779 /* Don't listen to it, Adrian! It isn't real! */ EXTERN HGWRA01 25

// Solar

EXTEND_BOTTOM FINSOL01 27
IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#SolarChoice","GLOBAL",0) !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#SolarChoice","GLOBAL",1)~ EXTERN RH#AD25J rh#SolarChoice
IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") !Alignment("rh#Adrian",MASK_EVIL) !Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#SolarChoice","GLOBAL",0) !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#SolarChoice","GLOBAL",1)~ EXTERN RH#AD25J rh#SolarChoice5
IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Alignment("rh#Adrian",MASK_EVIL) !Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#SolarChoice","GLOBAL",0) !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#SolarChoice","GLOBAL",1)~ EXTERN RH#AD25J rh#SolarChoice6
END

EXTEND_BOTTOM FINSOL01 29
IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#SolarLeave","GLOBAL",0) !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#SolarLeave","GLOBAL",1)~ EXTERN RH#AD25J rh#SolarLeave
END

EXTEND_BOTTOM FINSOL01 30
IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#SolarLeave","GLOBAL",0) !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#SolarLeave","GLOBAL",1)~ EXTERN RH#AD25J rh#SolarLeave
END

EXTEND_BOTTOM FINSOL01 31
IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#SolarLeave","GLOBAL",0) !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#SolarLeave","GLOBAL",1)~ EXTERN RH#AD25J rh#SolarLeave
END

EXTEND_BOTTOM FINSOL01 32
IF ~InParty("rh#Adrian") InMyArea("rh#Adrian") Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#SolarStay","GLOBAL",0) !StateCheck("rh#Adrian",CD_STATE_NOTVALID)~ DO ~SetGlobal("rh#SolarStay","GLOBAL",1)~ EXTERN RH#AD25J rh#SolarStay
END

CHAIN RH#AD25J rh#SolarChoice
@780 /* <CHARNAME>, as much as I want you to stay... this is your decision, not mine. I don't want to hold you here if you've decided you want... more. */
END
	++ @781 /* Do you think I should accept it now? */ + rh#SolarChoice1
	++ @782 /* I still don't want to lose you, Adrian. */ + rh#SolarChoice2
	++ @783 /* The power that the Solar is offering me... I do suddenly want it. */ + rh#SolarChoice3

CHAIN RH#AD25J rh#SolarChoice1
@784 /* No, I don't, but... I don't want you to stay simply because of me. */
END
IF ~~ + rh#SolarChoice4

CHAIN RH#AD25J rh#SolarChoice2
@785 /* Nor I you, but... I don't want you to stay simply because of me. */
END
IF ~~ + rh#SolarChoice4

CHAIN RH#AD25J rh#SolarChoice3
@786 /* I know. I... thought you might. And I don't want you to stay simply because of me. */
END
IF ~~ + rh#SolarChoice4

CHAIN RH#AD25J rh#SolarChoice4
@787 /* If your heart isn't behind it entirely, if you're not completely committed to mortality... I don't want to watch as your doubts tear you apart... tear us apart. */
= @788 /* And there are worse ways for a relationship to end than with one partner ascending to godhood. Heavens know, I've as much experience with that as anyone. I would miss you, <CHARNAME>, but I would survive. I always have before. */
END
COPY_TRANS FINSOL01 27

CHAIN RH#AD25J rh#SolarChoice5
@789 /* It... isn't an opportunity to reject lightly, <CHARNAME>, though godhood seldom seems to do its recipients any great favor. Whatever decision you make... don't regret it. */
END
COPY_TRANS FINSOL01 27

CHAIN RH#AD25J rh#SolarChoice6
@790 /* So this is it. I would tell you that this isn't an opportunity to reject lightly, but I dare say the offer speaks for itself. */
END
COPY_TRANS FINSOL01 27

CHAIN RH#AD25J rh#SolarLeave
@791 /* Then... this is farewell. Good luck, <CHARNAME>, though I pray you won't need it. */
END
COPY_TRANS FINSOL01 29

CHAIN RH#AD25J rh#SolarStay
@792 /* You... you're sure? */
END
	++ @793 /* Shut your mouth, Adrian. You look like a fish. */ + rh#SolarStay1
	++ @794 /* I want to be with you. Is that so hard to believe? */ + rh#SolarStay2
	++ @795 /* I'd better be sure. I can't take it back now. */ + rh#SolarStay3

CHAIN RH#AD25J rh#SolarStay1
@796 /* I'm... feeling a bit like one too right now. */
END
IF ~~ + rh#SolarStay4

CHAIN RH#AD25J rh#SolarStay2
@797 /* You've... put me to shame, <CHARNAME>. */
END
IF ~~ + rh#SolarStay4

CHAIN RH#AD25J rh#SolarStay3
@798 /* And I don't intend to let you regret it, <CHARNAME>. */
END
IF ~~ + rh#SolarStay4

CHAIN RH#AD25J rh#SolarStay4
@799 /* (smile) Enough of this, my love. We have the rest of our lives to make sense of things. I think that Solar still wants you. */
END
COPY_TRANS FINSOL01 32

// NPC INITIATED FLIRTS

APPEND RH#AD25J

IF ~Global("rh#AdrTimeForFlirt","GLOBAL",1)~ rh#TOBStartFlirt
 SAY @800 /* (It is no wonder that Adrian's attention is again focused upon you.) */
 	IF ~RandomNum(9,1)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt1
  	IF ~RandomNum(9,2)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt2
  	IF ~RandomNum(9,3)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt3
  	IF ~RandomNum(9,4)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt4
  	IF ~RandomNum(9,5)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt5
  	IF ~RandomNum(9,6)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt6  	
  	IF ~RandomNum(9,7)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt7
  	IF ~RandomNum(9,8)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt8
    IF ~RandomNum(9,9)~ DO ~SetGlobal("rh#AdrTimeForFlirt","GLOBAL",0) RealSetGlobalTimer("rh#AdrianFlirtTimer","GLOBAL",1800)~ + rh#TOBFlirt9
END
END

CHAIN RH#AD25J rh#TOBFlirt1
@801 /* (Adrian trails his fingers along the length of your jaw before pressing a kiss against the side of your mouth.) */
EXIT

CHAIN RH#AD25J rh#TOBFlirt2
@802 /* A pity there's so much work to be done, <CHARNAME>. I want nothing more than to rent a room somewhere tonight and... keep you entertained until dawn. */
EXIT

CHAIN RH#AD25J rh#TOBFlirt3
@803 /* (Adrian wraps an arm around your shoulders and draws you close. A long moment later, it is only with reluctance that he lets you go.) */
EXIT

CHAIN RH#AD25J rh#TOBFlirt4
@804 /* So much blasted desert, <CHARNAME>... I wonder just how much you'd let me get away with if I blamed it on delirium. */
EXIT

CHAIN RH#AD25J rh#TOBFlirt5
@805 /* (As you look over the group, you find Adrian watching you, his gaze thoughtful and somewhat concerned. He shakes his head and smiles when your eyes meet.) */
EXIT

CHAIN RH#AD25J rh#TOBFlirt6
@806 /* A pity there are so few exotic supplies for sale in this madhouse of a country. I'd meant to buy you some of those exquisite Calishite perfumes back in Athkatla but... never quite got around to it. */
EXIT

CHAIN RH#AD25J rh#TOBFlirt7
@807 /* (Adrian draws close to you, unconsciously taking your hand. He looks down a moment later, finally noticing, and laughs softly to himself.) */
= @808 /* (He doesn't let go.) */
EXIT

CHAIN RH#AD25J rh#TOBFlirt8
@809 /* This far south, my dear, perhaps you ought to consider a bit less clothing. Surely we could find *something* more appropriate. */
END
	++ @810 /* Shall I give you the same advice? */ + rh#TOBFlirt8.1
	++ @811 /* You'd like that, wouldn't you? */ + rh#TOBFlirt8.2
	++ @812 /* We do have a task to focus on, Adrian. */ + rh#TOBFlirt8.3

CHAIN RH#AD25J rh#TOBFlirt8.1
@813 /* Well, we could both strip down to nothing right here and now, but I suppose that would be at least somewhat unseemly. */
EXIT

CHAIN RH#AD25J rh#TOBFlirt8.2
@814 /* More than anything. */
= @815 /* (smile) Well, perhaps not quite. */
EXIT

CHAIN RH#AD25J rh#TOBFlirt8.3
@816 /* Ever so solemn, <CHARNAME>. Well, as you wish. */
EXIT

CHAIN RH#AD25J rh#TOBFlirt9
@817 /* (One hand lands on your shoulder, the other tangling gently in your hair.) */
= @818 /* (You can almost feel him breathe in the scent of it before smiling ruefully and moving away.) */
EXIT

// PLAYER INITIATED DIALOGUE

CHAIN IF ~IsGabber(Player1)~ THEN RH#AD25J rh#pidTOB
@819 /* Did you want something, <CHARNAME>? */
END
	++ @820 /* Could I speak with you? */ + rh#ChatTOB
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @821 /* (Flirt with him.) */ + rh#AdrianFlirtTOB
	++ @822 /* Not at the moment. */ EXIT

CHAIN RH#AD25J rh#ChatTOB
@823 /* If you'd like to. */
END
	+ ~RandomNum(4,1)~ + @824 /* Do you have any advice for me? */ + rh#TOBAdvice1
	+ ~RandomNum(4,2)~ + @824 /* Do you have any advice for me? */ + rh#TOBAdvice2
	+ ~RandomNum(4,3)~ + @824 /* Do you have any advice for me? */ + rh#TOBAdvice3
	+ ~RandomNum(4,4)~ + @824 /* Do you have any advice for me? */ + rh#TOBAdvice4
	+ ~RandomNum(4,1)~ + @825 /* How are you feeling? */ + rh#TOBFeeling1
	+ ~RandomNum(4,2)~ + @825 /* How are you feeling? */ + rh#TOBFeeling2
	+ ~RandomNum(4,3)~ + @825 /* How are you feeling? */ + rh#TOBFeeling3
	+ ~RandomNum(4,4)~ + @825 /* How are you feeling? */ + rh#TOBFeeling4
	+ ~RandomNum(4,1)~ + @826 /* What are you thinking about right now? */ + rh#TOBThink1
	+ ~RandomNum(4,2)~ + @826 /* What are you thinking about right now? */ + rh#TOBThink2
	+ ~RandomNum(4,3)~ + @826 /* What are you thinking about right now? */ + rh#TOBThink3
	+ ~RandomNum(4,4)~ + @826 /* What are you thinking about right now? */ + rh#TOBThink4
	+ ~RandomNum(4,1)~ + @827 /* Care for a glass of wine? */ + rh#TOBWine1
	+ ~RandomNum(4,2)~ + @827 /* Care for a glass of wine? */ + rh#TOBWine2
	+ ~RandomNum(4,3)~ + @827 /* Care for a glass of wine? */ + rh#TOBWine3
	+ ~RandomNum(4,4)~ + @827 /* Care for a glass of wine? */ + rh#TOBWine4
	+ ~RandomNum(4,1)~ + @828 /* How do you think I'm handling things? */ + rh#TOBThings1
	+ ~RandomNum(4,2)~ + @828 /* How do you think I'm handling things? */ + rh#TOBThings2
	+ ~RandomNum(4,3)~ + @828 /* How do you think I'm handling things? */ + rh#TOBThings3
	+ ~RandomNum(4,4)~ + @828 /* How do you think I'm handling things? */ + rh#TOBThings4
	++ @829 /* Do you like Tethyr any better than Amn? */ + rh#TOBTethyr
	+ ~Global("rh#AdrianFriendshipActive","GLOBAL",1)  !Alignment("rh#Adrian",MASK_EVIL) Global("rh#SuldaTOB","GLOBAL",0)~ + @830 /* Are you still upset about Suldanessellar? */ + pid.sulda1
	+ ~Global("rh#AdrianFriendshipActive","GLOBAL",1) Alignment("rh#Adrian",MASK_EVIL) Global("rh#SuldaTOB","GLOBAL",0)~ + @830 /* Are you still upset about Suldanessellar? */ + pid.sulda2
  	++ @831 /* Could I ask you what you think of someone? */ + rh#TOBParty
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianWraithTalk","GLOBAL",2)~ + @832 /* Would you like to talk about your uncle? */ + PID.Mikail
	+ ~Global("SaradushSacked","GLOBAL",1) GlobalLT("rh#AdrianTalksTOB","GLOBAL",10) Global("rh#AdrianRomanceActive","GLOBAL",2) !Alignment(Player1,MASK_EVIL) Global("rh#AdrianSaradushPID","GLOBAL",0)~ + @833 /* I can't stop thinking about Saradush. */ + pid.sara1a
	+ ~Global("SaradushSacked","GLOBAL",1) GlobalLT("rh#AdrianTalksTOB","GLOBAL",10) Global("rh#AdrianRomanceActive","GLOBAL",2) Alignment(Player1,MASK_EVIL) Global("rh#AdrianSaradushPID","GLOBAL",0)~ + @833 /* I can't stop thinking about Saradush. */ + pid.sara1b
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianChildren","GLOBAL",0) GlobalGT("rh#AdrianTalksTOB","GLOBAL",12)~ + @834 /* How do you feel about children? */ + rh#TOBChildren
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) !Global("rh#AdrSex","GLOBAL",1) !Global("rh#AdrAskedSex","GLOBAL",3)~ + @835 /* I think I'd finally like you in my bed tonight. */ + rh#TOBFirstSex
  	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianFlirtsEnabled","GLOBAL",1)~ + @836 /* I appreciate the attention, but could you not flirt with me in public? */ + rh#TOBFlirtDisable
  	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianRomanceActive","GLOBAL",2) Global("rh#AdrianFlirtsEnabled","GLOBAL",0)~ + @837 /* I know it's somewhat exhibitionistic, but I enjoy your attention. Could you flirt with me more? */ + rh#TOBFlirtEnable
	+ ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ + @838 /* I don't think this relationship is working out. I'm sorry. */ + rh#TOBBreakup
	++ @839 /* Never mind. */ EXIT

// Answers

CHAIN RH#AD25J rh#TOBAdvice1
@840 /* I dare say what needs to be done is fairly obvious. The "how", on the other hand... */
EXIT

CHAIN RH#AD25J rh#TOBAdvice2
@841 /* Whatever you've done in the past seems to be working well enough so far. */
EXIT

CHAIN RH#AD25J rh#TOBAdvice3
@842 /* Step carefully and trust no one. */
EXIT

CHAIN RH#AD25J rh#TOBAdvice4
@843 /* Flee to Mulhorand and let your delightful siblings kill each other off. */
EXIT

CHAIN RH#AD25J rh#TOBFeeling1
@844 /* Absolutely spectacular. How else would I feel? */
EXIT

CHAIN RH#AD25J rh#TOBFeeling2
@845 /* Chessentan, Calishite, or Waterdhavian red... hmm. */
= @846 /* I'm sorry, were you saying something? */
EXIT

CHAIN RH#AD25J rh#TOBFeeling3
@847 /* Are adventurers allowed to be anything but nauseatingly cheerful? */
EXIT

CHAIN RH#AD25J rh#TOBFeeling4
@848 /* I'd be better if we could buy some new clothing. There comes a point at which it's almost impossible to wash the blood out. */
EXIT

CHAIN RH#AD25J rh#TOBThink1
@849 /* Suldanessellar, of all things. And not fondly. */
EXIT

CHAIN RH#AD25J rh#TOBThink2
@850 /* I'm trying to figure out why so many people find dungeons so exciting. */
EXIT

CHAIN RH#AD25J rh#TOBThink3
@851 /* Nothing particularly savory. */
EXIT

CHAIN RH#AD25J rh#TOBThink4
@852 /* Why don't you take three guesses? */
EXIT

CHAIN RH#AD25J rh#TOBWine1
@853 /* If you've got a better vintage than the last one I picked up, I'd be happy to trade. */
EXIT

CHAIN RH#AD25J rh#TOBWine2
@854 /* Sometimes I think you don't like to see my sober at all, <CHARNAME>. */
EXIT

CHAIN RH#AD25J rh#TOBWine3
@855 /* I've had wine all week. Now, there's this Moonshae rum that I haven't had in years... */
EXIT

CHAIN RH#AD25J rh#TOBWine4
@856 /* If you offer me some black lotus next, I'll have to turn you down. */
EXIT

CHAIN RH#AD25J rh#TOBThings1
@857 /* As well as anyone could, I think. */
EXIT

CHAIN RH#AD25J rh#TOBThings2
@858 /* I suppose that question is best saved until this madness is over. */
EXIT

CHAIN RH#AD25J rh#TOBThings3
@859 /* My <PRO_LADYLORD>, your leadership skills are sublime. Now, if you could lead me to the nearest tavern, I would be forever grateful. */
EXIT

CHAIN RH#AD25J rh#TOBThings4
@860 /* You've done quite nicely so far, I think. */
EXIT

CHAIN RH#AD25J rh#TOBTethyr
@861 /* As charming as civil unrest tends to be... no, I don't. */
EXIT

// Suldanessellar

CHAIN RH#AD25J pid.sulda1
@862 /* It's that obvious, is it? With everything coming to a head now, you would think I'd be able to simply forget about the whole mess, but... that hasn't happened just yet. */
DO ~SetGlobal("rh#SuldaTOB","GLOBAL",1)~
END
	++ @863 /* That's probably because you think too much. */ + pid.sulda1.1
	++ @864 /* There's nothing wrong with nursing past grievances. */ + pid.sulda1.2
	++ @865 /* Give it time. */ + pid.sulda1.3
	++ @866 /* They were unforgiveably foolish. */ + pid.sulda1.4
	++ @867 /* Hopefully it happens soon. You need to stay focused. */ + pid.sulda1.5

CHAIN RH#AD25J pid.sulda1.1
@868 /* That could very well be true. */
EXIT

CHAIN RH#AD25J pid.sulda1.2
@869 /* No? I've all too often failed to distinguish between when they were warranted and when they weren't. This one... I don't know. */
EXIT

CHAIN RH#AD25J pid.sulda1.3
@870 /* I don't see what else I can do anyway. */
EXIT

CHAIN RH#AD25J pid.sulda1.4
@871 /* I certainly wouldn't refute that. */
EXIT

CHAIN RH#AD25J pid.sulda1.5
@872 /* I think I've enough experience with nursing grievances to be able to do both, <CHARNAME>. */ 
EXIT

CHAIN RH#AD25J pid.sulda2
@873 /* It's that obvious, is it? With everything coming to a head now, you would think I'd be able to simply forget about it, but... */
= @874 /* I can't say I blame Irenicus for wanting to tear the whole damn place down. Self-righteous hypocrites, every last one of them. */
DO ~SetGlobal("rh#SuldaTOB","GLOBAL",1)~
EXIT

// More post Wraith

CHAIN RH#AD25J PID.Mikail
@875 /* Funny. I thought I said I never wanted to speak about that... encounter again. */
DO ~SetGlobal("rh#AdrianWraithTalk","GLOBAL",3)~
END
	++ @876 /* I wasn't asking you to talk about the encounter. */ + PID.Mikail1.1
	++ @877 /* You might feel better if you do. */ + PID.Mikail1.2
	++ @878 /* Come now. Can't you talk to me about someone who obviously meant a lot to you? */ + PID.Mikail1.3
	++ @879 /* If that's what you want, then I won't ask. */ + PID.Mikail1.4

APPEND RH#AD25J 

IF ~~ PID.Mikail1.1
 SAY @880 /* It comes down to the same thing in the end, though, doesn't it? He... you know, I can't even say he taught me well, the years of Zhentarim propaganda notwithstanding. He cared about me in his own way, I think, but he was subtle. Very, very subtle. */
IF ~~ + PID.Mikail2
END

IF ~~ PID.Mikail1.2
 SAY @881 /* I doubt that, but I don't think you'll leave me alone about it if I don't.  He... you know, I can't even say he taught me well, the years of Zhentarim propaganda notwithstanding. He cared about me in his own way, I think, but he was subtle. Very, very subtle. */
IF ~~ + PID.Mikail2
END

IF ~~ PID.Mikail1.3
 SAY @882 /* Apparently you won't leave me alone about it until I do.  He... you know, I can't even say he taught me well, the years of Zhentarim propaganda notwithstanding. He cared about me in his own way, I think, but he was subtle. Very, very subtle. */
IF ~~ + PID.Mikail2
END

IF ~~ PID.Mikail1.4
 SAY @883 /* Thank you, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ PID.Mikail2
 SAY @884 /* More so than I ever was, perhaps. I... honestly can't say that he would have been glad I escaped if it meant his death. */
 	++ @885 /* If he really cared about you at all, he would have been. */ + PID.Mikail2.1
  	++ @886 /* He doesn't sound like he was worth caring for at all. */ + PID.Mikail2.2
  	++ @887 /* He didn't die because of you, you know. */ + PID.Mikail2.3
  	++ @888 /* Don't put that Wraith's words in his mouth, Adrian. */ + PID.Mikail2.4
END

IF ~~ PID.Mikail2.1
 SAY @889 /* Hmm. Perhaps. */
IF ~~ + PID.Mikail3
END

IF ~~ PID.Mikail2.2
 SAY @890 /* Just another cunning Zhent bastard, is it? */
IF ~~ + PID.Mikail3
END

IF ~~ PID.Mikail2.3
 SAY @891 /* No... no. And I don't think he ever would have. */
IF ~~ + PID.Mikail3
END

IF ~~ PID.Mikail2.4
 SAY @892 /* I... honestly wish I were. */
IF ~~ + PID.Mikail3
END

IF ~~ PID.Mikail3
 SAY @893 /* I still love him... as much as I can love anyone who's been dead for a decade and a half. He treated me better than he might have. Better than most masters do. */
 = @894 /* I... only wish that my memory of him weren't twisted now by the things that creature said, though... there's nothing to be done about that. */
IF ~~ EXIT
END
END

// Saradush: it'll take him a while to admit that he cares, so the PC can bring it up earlier

CHAIN RH#AD25J pid.sara1a
@895 /* What happened there... it wasn't your fault, <CHARNAME>. You have to understand that. */
DO ~SetGlobal("rh#AdrianSaradushPID","GLOBAL",1)~
END
	++ @896 /* But he was looking for me. */ + pid.sara1.1
	++ @897 /* Tell that to the dead. They would certainly have thought so. */ + pid.sara1.1
	++ @898 /* That doesn't change what we saw. */ + pid.sara1.2
	++ @899 /* This is just more of the same for you, isn't it? */ + pid.sara1.3
	++ @900 /* I should have been there... we could have stopped him. */ + pid.sara1.4


CHAIN RH#AD25J pid.sara1b
@901 /* Hmm. We're no strangers to terrible things, but that was a bit... excessive. */
DO ~SetGlobal("rh#AdrianSaradushPID","GLOBAL",1)~
END
	++ @902 /* That's all you can say? What is this, just more of the same to you? */ + pid.sara1.3
	++ @900 /* I should have been there... we could have stopped him. */ + pid.sara1.4
	++ @903 /* I wish Gorion had bothered to teach me even half as much as Nyalee taught Yaga-Shura. */ + pid.sara1.5
	++ @904 /* Pity I don't seem capable of raising a decent army of my own. Everyone else seems to have one. */ + pid.sara1.6

CHAIN RH#AD25J pid.sara1.1
@905 /* Regardless, that doesn't shift the blame. You have enough to worry about without martyring yourself over your siblings' crimes as well. */
EXIT

CHAIN RH#AD25J pid.sara1.2
@906 /* No... no, it doesn't. */
EXIT

CHAIN RH#AD25J pid.sara1.3
@907 /* It's... nothing I haven't seen before. But come. There's still work to be done to<DAYNIGHT>. */
EXIT

CHAIN RH#AD25J pid.sara1.4
@908 /* Perhaps, perhaps not. Regardless, that doesn't shift the blame. You have enough to worry about without martyring yourself over your siblings' crimes as well. */
EXIT

CHAIN RH#AD25J pid.sara1.5
@909 /* Heh. I can sympathize with the sentiment, <CHARNAME>, but I for one am glad you still have your heart. */
EXIT

CHAIN RH#AD25J pid.sara1.6
@910 /* Heh. An army would just get in our way, I think. */
EXIT

// Children

CHAIN RH#AD25J rh#TOBChildren
@911 /* I suppose that depends. Why do you ask? */
END
	++ @912 /* I was wondering if you would want some one day. */ + rh#TOBChildren1
	++ @913 /* Because I'd like to have yours someday. */ + rh#TOBChildren2
	++ @914 /* I wanted to make sure you knew I didn't want any. */ + rh#TOBChildren3
	++ @839 /* Never mind. */ EXIT

CHAIN RH#AD25J rh#TOBChildren1
@915 /* I haven't really given it much thought recently. A decade ago, I'd always planned to, but now... I don't know. There's quite the history of bad parenting in my family. I'd hate to perpetuate it. */ 
END
	++ @916 /* You care. If anything, that means that you'll be a great father. */ + rh#TOBChildren4
	++ @917 /* Don't be ridiculous. If we can get through this, we can survive anything. */ + rh#TOBChildren4
	++ @918 /* If you're not comfortable with it, we certainly don't have to. */ + rh#TOBChildren5
	++ @919 /* And then when we throw my heritage into the mix... no, I suppose that isn't a very good idea. */ + rh#TOBChildren5

CHAIN RH#AD25J rh#TOBChildren2
@920 /* I... see. I don't know, <CHARNAME>. I... well, there's quite the history of bad parenting in my family. I'd hate to perpetuate it. */
END
	++ @916 /* You care. If anything, that means that you'll be a great father. */ + rh#TOBChildren4
	++ @917 /* Don't be ridiculous. If we can get through this, we can survive anything. */ + rh#TOBChildren4
	++ @918 /* If you're not comfortable with it, we certainly don't have to. */ + rh#TOBChildren5
	++ @919 /* And then when we throw my heritage into the mix... no, I suppose that isn't a very good idea. */ + rh#TOBChildren5

CHAIN RH#AD25J rh#TOBChildren3
@921 /* They do seem to be more trouble than they're worth, and I... well, there's quite the history of bad parenting in my family. I'd hate to perpetuate it. */
DO ~SetGlobal("rh#AdrianChildren","GLOBAL",1)~
EXIT

CHAIN RH#AD25J rh#TOBChildren4
@922 /* Well... perhaps we could have one. If things ever settle down for us. I doubt that it's going to be an option anytime soon, though. */
DO ~SetGlobal("rh#AdrianChildren","GLOBAL",2)~
EXIT

CHAIN RH#AD25J rh#TOBChildren5
@923 /* Then I'm glad we're agreed. Honestly, my love, they do seem to be more trouble than they're worth. */
DO ~SetGlobal("rh#AdrianChildren","GLOBAL",1)~
EXIT

// Sex

CHAIN RH#AD25J rh#TOBFirstSex
@924 /* Mmm. I think I would like that as well. We'll talk about it tonight, my dear. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",3)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("rh#AdrFirstSex","GLOBAL",1)~ THEN RH#AD25J rh#TOBFirstSex1
@925 /* (Once you settle down for the night, Adrian draws you into his arms and begins to massage the tension out of your shoulders.) */
= @926 /* (A moment before it might seem that this is all he has on his mind, you feel his lips brush against your ear.) */
= @927 /* You haven't changed your mind, I assume? */
END
 	++ @928 /* And if I have? */ + rh#TOBFirstSex1.1
 	++ @929 /* I've never actually done this before. */ + rh#TOBFirstSex1.2
 	++ @930 /* I think I've waited long enough as it is. */ + rh#TOBFirstSex1.3
 	++ @931 /* You're not into anything weird, are you? */ + rh#TOBFirstSex1.4
 	++ @932 /* (turn around and kiss him) */ + rh#TOBFirstSex1.5
 	++ @933 /* I know I said I wanted this, but it's been a long <DAYNIGHT>. */ + rh#TOBFirstSex1.6

CHAIN RH#AD25J rh#TOBFirstSex1.1
@934 /* (sigh) You're quite the tease, aren't you, <CHARNAME>? Well, if you'd rather we wait, I won't complain. Overly. Let's just go to sleep, then. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2) SetGlobal("rh#AdrFirstSex","GLOBAL",0) RestParty()~
EXIT

CHAIN RH#AD25J rh#TOBFirstSex1.2
@935 /* If it makes you feel better, I haven't done it in quite some time myself. */
= @936 /* I'm not going to hurt you, <CHARNAME>. If you'd like to wait, I can accept that. And if you'd rather... hmm, build up to it, that's perfectly acceptable as well. */
END
 	++ @937 /* No, I'm ready. Just be careful. */ + rh#TOBFirstSex1.7
 	++ @938 /* I like that second option. */ + rh#TOBFirstSex1.7
 	++ @939 /* I'm not worried about me. You, however, had best perform. */ + rh#TOBFirstSex1.8
 	++ @940 /* I would rather wait. */ + rh#TOBFirstSex1.9

CHAIN RH#AD25J rh#TOBFirstSex1.3
@941 /* Then we needn't wait any longer. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT

CHAIN RH#AD25J rh#TOBFirstSex1.4
@942 /* Nothing particularly so. You don't need to worry about it. */
END
 	++ @943 /* Interesting. I'll have to remember that. (kiss him) */ + rh#TOBFirstSex1.5
 	++ @944 /* On the contrary, I was very much hoping that the answer would be yes. */ + rh#TOBFirstSex1.10
 	++ @945 /* I'm not worried. I prefer a man who can take a bit of punishment. */ + rh#TOBFirstSex1.11
 	++ @946 /* I see. I know I said I wanted this, but it's been a long <DAYNIGHT>. */ + rh#TOBFirstSex1.6

CHAIN RH#AD25J rh#TOBFirstSex1.5
@947 /* (He returns your kiss eagerly, his hands drifting downward to caress your body through your clothing.) */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT 

CHAIN RH#AD25J rh#TOBFirstSex1.6
@948 /* Ah. I suppose it has. Let's just go to sleep, then. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2) SetGlobal("rh#AdrFirstSex","GLOBAL",0) RestParty()~
EXIT
 
CHAIN RH#AD25J rh#TOBFirstSex1.7
@949 /* If you don't like anything, <CHARNAME>, just tell me. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT 

CHAIN RH#AD25J rh#TOBFirstSex1.8
@950 /* (smile) I'll have to keep that in mind, then. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT 

CHAIN RH#AD25J rh#TOBFirstSex1.9
@951 /* Whenever you're ready, just tell me. */
DO ~SetGlobal("rh#AdrAskedSex","GLOBAL",2) SetGlobal("rh#AdrFirstSex","GLOBAL",0) RestParty()~
EXIT

CHAIN RH#AD25J rh#TOBFirstSex1.10
@952 /* Hmm. I see. */
= @953 /* What shall I do with you, my love? I try not to misuse magic, but this once... */
= @949 /* If you don't like anything, <CHARNAME>, just tell me. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT

CHAIN RH#AD25J rh#TOBFirstSex1.11
@954 /* ...oh, I see. I suppose I'm at your mercy then, my dear. */
DO ~SetGlobal("rh#AdrSex","GLOBAL",1) SetGlobal("rh#AdrAskedSex","GLOBAL",4) SetGlobal("rh#AdrFirstSex","GLOBAL",2) RestParty()~
EXIT

// Flirting

CHAIN RH#AD25J rh#TOBFlirtDisable
@955 /* Hmm? Oh, of course not. */
DO ~SetGlobal("rh#AdrianFlirtsEnabled","GLOBAL",0)~
EXIT

CHAIN RH#AD25J rh#TOBFlirtEnable
@956 /* Getting bored, are we? */
DO ~SetGlobal("rh#AdrianFlirtsEnabled","GLOBAL",1)~
EXIT

// Breakup

CHAIN RH#AD25J rh#TOBBreakup
@957 /* I... see. I'm sorry to hear that. */
DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~
EXIT

// Party

CHAIN RH#AD25J rh#TOBParty
@958 /* I doubt it will be particularly flattering. */
END
	+ ~InParty("Aerie")~ + @959 /* What do you think of Aerie? */ + rh#TOBPartyAerie
	+ ~InParty("ADAngel")~ + @960 /* What do you think of Angelo? */ + rh#TOBPartyAngelo
	+ ~Alignment("Anomen",MASK_LAWFUL) !Alignment("rh#Adrian",MASK_EVIL) InParty("Anomen")~ + @961 /* What do you think of Anomen? */ + rh#TOBPartyAnomenL1
	+ ~Alignment("Anomen",MASK_LAWFUL) Alignment("rh#Adrian",MASK_EVIL) InParty("Anomen")~ + @961 /* What do you think of Anomen? */ + rh#TOBPartyAnomenL2
	+ ~!Alignment("Anomen",MASK_LAWFUL) InParty("Anomen")~ + @961 /* What do you think of Anomen? */ + rh#TOBPartyAnomenCN
	+ ~InParty("c-aran")~ + @962 /* What do you think of Aran? */ + rh#TOBPartyAran
	+ ~InParty("Arath")~ + @963 /* What do you think of Arath? */ + rh#TOBPartyArath
	+ ~InParty("Cernd")~ + @964 /* What do you think of Cernd? */ + rh#TOBPartyCernd
	+ ~InParty("O#Coran")~ + @965 /* What do you think of Coran? */ + rh#TOBPartyCoran
	+ ~InParty("t1dar")~ + @966 /* What do you think of Darian? */ + rh#TOBPartyDarian
	+ ~InParty("p#Deher")~ + @967 /* What do you think of Deheriana? */ + rh#TOBPartyDeheriana
	+ ~InParty("Dorn")~ + @968 /* What do you think of Dorn? */ + rh#TOBPartyDorn
	+ ~InParty("rh#Drys")~ + @969 /* What do you think of Drystan? */ + rh#TOBPartyDrystan
	+ ~InParty("Edwin")~ + @970 /* What do you think of Edwin? */ + rh#TOBPartyEdwin
	+ ~InParty("FHFRN")~ + @971 /* What do you think of Faren? */ + rh#TOBPartyFaren
	+ ~InParty("b!Gavin2")~ + @972 /* What do you think of Gavin? */ + rh#TOBPartyGavin
	+ ~InParty("HaerDalis")~ + @973 /* What do you think of Haer'Dalis? */ + rh#TOBPartyHaerDalis
	+ ~InParty("Hexxat")~ + @974 /* What do you think of Hexxat? */ + rh#TOBPartyHexxat
	+ ~InParty("Imoen2")~ + @975 /* What do you think of Imoen? */ + rh#TOBPartyImoen
	+ ~InParty("rh#Isra2")~ + @976 /* What do you think of Isra? */ + rh#TOBPartyIsra
	+ ~InParty("Iylos")~ + @977 /* What do you think of Iylos? */ + rh#TOBPartyIylos
	+ ~InParty("Jaheira")~ + @978 /* What do you think of Jaheira? */ + rh#TOBPartyJaheira
	+ ~InParty("Jan")~ + @979 /* What do you think of Jan? */ + rh#TOBPartyJan
	+ ~InParty("Keldorn")~ + @980 /* What do you think of Keldorn? */ + rh#TOBPartyKeldorn
	+ ~InParty("p#Kivan")~ + @981 /* What do you think of Kivan? */ + rh#TOBPartyKivan
	+ ~InParty("Korgan")~ + @982 /* What do you think of Korgan? */ + rh#TOBPartyKorgan
	+ ~InParty("rh#Lya")~ + @983 /* What do you think of Lyanna? */ + rh#TOBPartyLyanna
	+ ~InParty("Mazzy")~ + @984 /* What do you think of Mazzy? */ + rh#TOBPartyMazzy
	+ ~InParty("Minsc")~ + @985 /* What do you think of Minsc? */ + rh#TOBPartyMinsc
	+ ~InParty("Nalia")~ + @986 /* What do you think of Nalia? */ + rh#TOBPartyNalia
	+ ~InParty("Neera")~ + @987 /* What do you think of Neera? */ + rh#TOBPartyNeera
	+ ~InParty("Nephele")~ + @988 /* What do you think of Nephele? */ + rh#TOBPartyNephele
	+ ~InParty("Ninde")~ + @989 /* What do you think of Ninde? */ + rh#TOBPartyNinde
	+ ~InParty("Rasaad")~ + @990 /* What do you think of Rasaad? */ + rh#TOBPartyRasaad
	+ ~InParty("Sarevok")~ + @991 /* What do you think of Sarevok? */ + rh#TOBPartySarevok
	+ ~InParty("O#Tiax")~ + @992 /* What do you think of Tiax? */ + rh#TOBPartyTiax
	+ ~InParty("Valygar")~ + @993 /* What do you think of Valygar? */ + rh#TOBPartyValygar
	+ ~InParty("Viconia")~ + @994 /* What do you think of Viconia? */ + rh#TOBPartyViconia
	+ ~InParty("O#Xan")~ + @995 /* What do you think of Xan? */ + rh#TOBPartyXan
	++ @839 /* Never mind. */ EXIT

CHAIN RH#AD25J rh#TOBPartyAerie
@996 /* She's less annoying than she used to be, but I'd rather you didn't tell her. I prefer it when she stays away from me. */
EXIT

CHAIN RH#AD25J rh#TOBPartyAnomenL1
@997 /* I think that in another lifetime... well, neither of us is that skilled at making friends. */
EXIT

CHAIN RH#AD25J rh#TOBPartyAnomenL2
@998 /* I think the Order deserves him. */
EXIT

CHAIN RH#AD25J rh#TOBPartyAnomenCN
@999 /* He's beginning to remind me of myself... I'm not certain I care for that. */
EXIT

CHAIN RH#AD25J rh#TOBPartyCernd
@1000 /* I think he's laughing at me half the time, but he's too damn placid to ever admit it. */
EXIT

CHAIN RH#AD25J rh#TOBPartyDorn
@1001 /* Truth be told, I'm surprised he hasn't gotten himself killed yet. And us with him. */
EXIT

CHAIN RH#AD25J rh#TOBPartyEdwin
@1002 /* The Red Wizard? He's as much of an idiot as he ever was. */
EXIT

CHAIN RH#AD25J rh#TOBPartyHaerDalis
@1003 /* His Doomguard philosophy is getting increasingly annoying. */
EXIT

CHAIN RH#AD25J rh#TOBPartyHexxat
@1004 /* She knows what she's doing. */
EXIT

CHAIN RH#AD25J rh#TOBPartyImoen
@1005 /* If this is what she's like after what happened in Spellhold, I can't imagine how cheerful she must have been before. */
EXIT

CHAIN RH#AD25J rh#TOBPartyJaheira
@1006 /* I would never have expected to find us speaking civilly, but... well, I suppose I'd never have expected much of this at all. */
EXIT

CHAIN RH#AD25J rh#TOBPartyJan
@1007 /* Don't get me started. */
EXIT

CHAIN RH#AD25J rh#TOBPartyKeldorn
@1008 /* I used to be glad for a paladin's rigid ethical code, but I wish he'd loosen his somewhat. He's making things more complicated than they need to be. */
EXIT

CHAIN RH#AD25J rh#TOBPartyKorgan
@1009 /* I've worked with worse. At least he's competent. */
EXIT

CHAIN RH#AD25J rh#TOBPartyMazzy
@1010 /* I like her well enough, but she tries too hard. Hopefully it won't kill her one day. */
EXIT

CHAIN RH#AD25J rh#TOBPartyMinsc
@1011 /* He's a bit simple, isn't he? More than a bit, I suppose. */
EXIT

CHAIN RH#AD25J rh#TOBPartyNalia
@1012 /* Our imminent dark queen of Athkatla? She needs to grow up. */
EXIT

CHAIN RH#AD25J rh#TOBPartyNeera
@1013 /* She has too much power at her command now to still be acting so carelessly. */
EXIT

CHAIN RH#AD25J rh#TOBPartyRasaad
@1014 /* I think he needs to make up his mind about his goddess, and sooner rather than later. */
EXIT

CHAIN RH#AD25J rh#TOBPartySarevok
@1015 /* I've spent most of my life taking orders from men like that. He's... less frightening than I would have expected. For all of his bluster... I don't know. */
EXIT

CHAIN RH#AD25J rh#TOBPartyValygar
@1016 /* I've never met someone so afraid of his own dark shadow. */
EXIT

CHAIN RH#AD25J rh#TOBPartyViconia
@1017 /* I think she'll find her place yet. */
EXIT

CHAIN RH#AD25J rh#TOBPartyAngelo
@1018 /* I like him more than I thought I would. */
EXIT

CHAIN RH#AD25J rh#TOBPartyNinde
@1019 /* Are you sure we can't find another vampire coven that might want her? */
EXIT

CHAIN RH#AD25J rh#TOBPartyXan
@1007 /* Don't get me started. */
EXIT

CHAIN RH#AD25J rh#TOBPartyKivan
@1020 /* We're not particularly close. */
EXIT

CHAIN RH#AD25J rh#TOBPartyDeheriana
@1021 /* She's... not exactly what I would have expected. */
EXIT

CHAIN RH#AD25J rh#TOBPartyGavin
@1022 /* He's not the sort of priest I'm accustomed to. */
EXIT

CHAIN RH#AD25J rh#TOBPartyFaren
@1023 /* I wish he took things a bit more seriously sometimes. */
EXIT

CHAIN RH#AD25J rh#TOBPartyCoran
@1024 /* He's rather entertaining in his own way. */
EXIT

CHAIN RH#AD25J rh#TOBPartyTiax
@1025 /* It's a wonder I haven't snapped and killed him yet. */
EXIT

CHAIN RH#AD25J rh#TOBPartyArath
@1026 /* He's a bit much, isn't he? I suppose I appreciate that in a druid. */
EXIT

CHAIN RH#AD25J rh#TOBPartyAran
@1027 /* I don't care for soldiers, though he's more palatable than what I'm accustomed to. Granted, I doubt he'd find the comparison very flattering. */
EXIT

CHAIN RH#AD25J rh#TOBPartyDarian
@1028 /* Don't expect any apologies between us. */
EXIT

CHAIN RH#AD25J rh#TOBPartyNephele
@1029 /* As long as she leaves me alone, I try not to. */
EXIT

CHAIN RH#AD25J rh#TOBPartyIylos
@1030 /* I think we'd both rather he were back at his precious monastery. */
EXIT

CHAIN RH#AD25J rh#TOBPartyIsra
@1031 /* For a paladin, she's not as terrible company as she could have been. */
EXIT

CHAIN RH#AD25J rh#TOBPartyDrystan
@1032 /* The blasted Cormyrian? I try not to. */
EXIT

CHAIN RH#AD25J rh#TOBPartyLyanna
@1033 /* She's slightly more tolerable than her husband. */
EXIT

// Flirts

CHAIN RH#AD25J rh#AdrianFlirtTOB
@1034 /* (Adrian glances at you, his expression relatively unguarded.) */
END 
	+ ~RandomNum(8,1)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch1
	+ ~RandomNum(8,2)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch2
	+ ~RandomNum(8,3)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch3
	+ ~RandomNum(8,4)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch4
	+ ~RandomNum(8,5)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch5
	+ ~RandomNum(8,6)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch6
	+ ~RandomNum(8,7)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch7
	+ ~RandomNum(8,8)~ + @1035 /* (Watch him.) */ + rh#AdrianFlirtTOBWatch8
	+ ~RandomNum(8,1)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand1
	+ ~RandomNum(8,2)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand2
	+ ~RandomNum(8,3)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand3
	+ ~RandomNum(8,4)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand4
	+ ~RandomNum(8,5)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand5
	+ ~RandomNum(8,6)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand6
	+ ~RandomNum(8,7)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand7
	+ ~RandomNum(8,8)~ + @1036 /* (Take his hand.) */ + rh#AdrianFlirtTOBHand8
	+ ~RandomNum(8,1)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile1
	+ ~RandomNum(8,2)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile2
	+ ~RandomNum(8,3)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile3
	+ ~RandomNum(8,4)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile4
	+ ~RandomNum(8,5)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile5
	+ ~RandomNum(8,6)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile6
	+ ~RandomNum(8,7)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile7
	+ ~RandomNum(8,8)~ + @1037 /* (Smile at him.) */ + rh#AdrianFlirtTOBSmile8
	+ ~RandomNum(8,1)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose1
	+ ~RandomNum(8,2)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose2
	+ ~RandomNum(8,3)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose3
	+ ~RandomNum(8,4)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose4
	+ ~RandomNum(8,5)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose5
	+ ~RandomNum(8,6)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose6
	+ ~RandomNum(8,7)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose7
	+ ~RandomNum(8,8)~ + @1038 /* (Pose for him.) */ + rh#AdrianFlirtTOBPose8
	+ ~RandomNum(8,1)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair1
	+ ~RandomNum(8,2)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair2
	+ ~RandomNum(8,3)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair3
	+ ~RandomNum(8,4)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair4
	+ ~RandomNum(8,5)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair5
	+ ~RandomNum(8,6)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair6
	+ ~RandomNum(8,7)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair7
	+ ~RandomNum(8,8)~ + @1039 /* (Play with his hair.) */ + rh#AdrianFlirtTOBHair8
	+ ~RandomNum(8,1)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace1
	+ ~RandomNum(8,2)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace2
	+ ~RandomNum(8,3)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace3
	+ ~RandomNum(8,4)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace4
	+ ~RandomNum(8,5)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace5
	+ ~RandomNum(8,6)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace6
	+ ~RandomNum(8,7)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace7
	+ ~RandomNum(8,8)~ + @1040 /* (Touch his face.) */ + rh#AdrianFlirtTOBFace8
	+ ~RandomNum(8,1)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug1
	+ ~RandomNum(8,2)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug2
	+ ~RandomNum(8,3)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug3
	+ ~RandomNum(8,4)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug4
	+ ~RandomNum(8,5)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug5
	+ ~RandomNum(8,6)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug6
	+ ~RandomNum(8,7)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug7
	+ ~RandomNum(8,8)~ + @1041 /* (Hug him.) */ + rh#AdrianFlirtTOBHug8	
	+ ~RandomNum(8,1)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage1
	+ ~RandomNum(8,2)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage2
	+ ~RandomNum(8,3)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage3
	+ ~RandomNum(8,4)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage4
	+ ~RandomNum(8,5)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage5
	+ ~RandomNum(8,6)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage6
	+ ~RandomNum(8,7)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage7
	+ ~RandomNum(8,8)~ + @1042 /* (Massage his shoulders.) */ + rh#AdrianFlirtTOBMassage8
	+ ~RandomNum(8,1)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress1
	+ ~RandomNum(8,2)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress2
	+ ~RandomNum(8,3)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress3
	+ ~RandomNum(8,4)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress4
	+ ~RandomNum(8,5)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress5
	+ ~RandomNum(8,6)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress6
	+ ~RandomNum(8,7)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress7
	+ ~RandomNum(8,8)~ + @1043 /* (Caress him.) */ + rh#AdrianFlirtTOBCaress8
	+ ~RandomNum(8,1)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss1
	+ ~RandomNum(8,2)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss2
	+ ~RandomNum(8,3)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss3
	+ ~RandomNum(8,4)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss4
	+ ~RandomNum(8,5)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss5
	+ ~RandomNum(8,6)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss6
	+ ~RandomNum(8,7)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss7
	+ ~RandomNum(8,8)~ + @1044 /* (Kiss him.) */ + rh#AdrianFlirtTOBKiss8
	++ @1045 /* (Leave him alone.) */ EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBWatch1
@1046 /* (Your half-elven lover is in a poor mood to<DAYNIGHT>, his eyes downcast and his jaw set angrily. You've learned by now to steer clear of him when he is in tempers such as this, but he notices your regard all the same. He flashes you a quick, weak smile before focusing his attention elsewhere.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBWatch2
@1047 /* (Adrian is perched nearby, casually chewing on an apple. His attention, however, is focused on you, and there's a glint in his eyes that isn't remotely professional.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBWatch3
@1048 /* (Adrian seems to be in good spirits to<DAYNIGHT>, and he walks with the easy, practiced gait of someone who is certain of his place in the world, perhaps even believes the world would crumble and burn without his presence. He glances up at you, a smile gracing his face.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBWatch4
@1049 /* (You turn to look at Adrian and find him already studying you. Shrugging casually at having been found out, he walks closer to you and wraps an arm around your waist.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBWatch5
@1050 /* (You find him humming to himself, apparently unconsciously. The tune is foreign, noticeably so, and his voice is pure and clear -- perhaps a legacy of his elven heritage.) */
= @1051 /* (Adrian eventually catches you watching and falls silent, shrugging slightly.) */
EXIT
 
CHAIN RH#AD25J rh#AdrianFlirtTOBWatch6
@1052 /* (Adrian catches you watching and doesn't have the courtesy to look away. His gaze meet yours, and there's a distinctive gleam of challenge in his eyes. You stare at each other for a long moment, and the contest would seem meaningful if it weren't so childish. He finally laughs, slightly wildly, shattering your concentration.) */
= @1053 /* (When you look at him again, he's thoughtfully examining a tear in his sleeve as if the bizarre competition never happened at all.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBWatch7
@1054 /* (Adrian is notedly distracted to<DAYNIGHT>, his attention likely hundreds of miles away. Lost in thought, he barely avoids tripping over his own feet, and he blushes slightly once he realizes that you saw.) */
EXIT 

CHAIN RH#AD25J rh#AdrianFlirtTOBWatch8
@1055 /* (Despite being a practitioner of innate magic, Adrian is as obsessed with texts as any wizard, and to<DAYNIGHT> you find him engrossed in the study of a scroll. He barely avoids stumbling once or twice, but continues on in his reading, undeterred.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand1
@1056 /* (Adrian drops his arm over your shoulder instead, drawing you closer.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand2
@1057 /* Hand holding, my dear? What are we, peasants? */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand3
@1058 /* (He smiles at you and takes your hand in return, gently massaging your wrist.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand4
@1059 /* (Adrian catches your hand loosely as you reach for him, and he tugs it closer to his face, not quite sharply enough to unbalance you.) */
= @1060 /* Shall I kiss it like a southern princeling or a lord from Waterdeep, my lady? Well, I suppose the courtesies must be observed, empty or otherwise. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand5
@1061 /* (For a mage, Adrian's hand is surprisingly calloused, and as his sleeve falls away, you notice the slight silver scars that wrap around his wrists: testament to his own time spent in captivity. He smiles weakly but doesn't pull away.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand6
@1062 /* I need that for spellcasting, my dear. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand7
@1063 /* (Adrian smiles at you as you reach for his hand. It's several moments before he finally draws away.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHand8
@1064 /* You do enjoy public displays, don't you? */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile1
@1065 /* (While Adrian doesn't quite smile back, the sullen scowl that had previously been decorating his face drops away, and he shakes his head, bemused.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile2
@1066 /* (Adrian smothers a yawn behind his hand before tossing a sleepy smile back at you.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile3
@1067 /* (You've seldom quite seen Adrian blush before, but a slight tinge of color reddens his cheeks as he notices your smile.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile4
@1068 /* (The half-elf sighs softly, a small but sincere smile dancing briefly across his lips.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile5
@1069 /* My love, you really are absolutely exquisite. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile6
@1070 /* (His eyes bright with too much wine, Adrian grins back at you, the expression less predatory than you might have expected.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile7
@1071 /* (His eyes bright with too much wine, Adrian grins back at you, the expression slightly manic.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBSmile8
@1072 /* (Adrian raises an eyebrow at you, his eyes dancing.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose1
@1073 /* No games, please, my dear. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose2
@1074 /* (Adrian watches you with a slight smile on his face, and more than once you feel his eyes returning to you throughout the rest of the hour.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose3
@1075 /* Lovely as always, <CHARNAME>. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose4
@1076 /* Playing the seductress again, my lady? Be careful what you ask for. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose5
@1077 /* (He raises an eyebrow at you, not even bothering to pretend to look away.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose6
@1078 /* (Adrian is openly enjoying the display, his eyes traveling across your body and his thoughts quite obviously less than pure.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose7
@1079 /* (He smiles at you halfheartedly, clearly not in the mood to<DAYNIGHT>.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBPose8
@1080 /* (He interprets your attention as invitation, closing the distance between you and taking you into his arms.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair1
@1081 /* (When you stop to rest for a few moments, you half pull Adrian into your lap, running your fingers through his hair. He hisses briefly, relaxing only when he feels your fingers against his scalp.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair2
@1082 /* Having fun there, my dear? */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair3
@1083 /* Tangle it up, <CHARNAME>, and I may just have to cut it all off. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair4
@1084 /* (He pulls away from you, somewhat moodily, biting down on his lip as if he's physically keeping himself from making an unpleasant comment.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair5
@1085 /* (As the group stops to rest for a few minutes, you find yourself walking over to where Adrian is sitting, engrossed in the study of a book you took off of a mage.) */
= @1086 /* (You take advantage of his distraction to run your fingers through a portion of his black hair. He seems to enjoy the attention, and he leans back against your leg as you begin to casually weave the strands together.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair6
@1087 /* (A quick break has stretched into a longer one, and you find Adrian a short distance away, half asleep, his hair in disarray. As you reach out to fix it for him, he mumbles something in Damaran but doesn't push you away.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair7
@1088 /* (Adrian is usually fastidious about his appearance, but you notice to<DAYNIGHT> that his hair is in complete disarray, as if he can't be bothered to fix it. He grudgingly allows you to reach out to untangle some of the knots.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHair8
@1089 /* I'm beginning to think that I should invest in a hat. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace1
@1090 /* (He draws you closer as you stroke his face, gently massaging the small of your back.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace2
@1091 /* (For a brief moment, you feel his smile against your palm, and then he drags your hands away, holding them loosely at your sides as he kisses you.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace3
@1092 /* (He pushes your hand away, shaking his head in mild annoyance, before returning his attention to his bottle of mead.) */
 = @1093 /* (A few moments later, he comes up beside you, pressing his lips against the side of your throat in unspoken apology.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace4
@1094 /* Not right now, <CHARNAME>. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace5
@1095 /* (Smiling, he takes your hands and presses them briefly against his lips.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace6
@1096 /* You shouldn't let me distract you so, my dear. We have things to do. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace7
@1097 /* Yes, I know. There's only so much time even a half-elf can go without shaving. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBFace8
@1098 /* (He glances at you quizzically for a moment before laughing and brushing your hand away.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug1
@1099 /* (Adrian tenses up when you hug him, and several heartbeats pass before he brings his own arms up to awkwardly hold you in return.) */ 
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug2
@1100 /* Could we not do this in public, <CHARNAME>? */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug3
@1101 /* I've never understood this custom. It seems perfectly suited to stabbing somebody in the back. Literally. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug4
@1102 /* (Adrian has to force himself to relax when you embrace him.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug5
@1103 /* (He hisses at you softly, struggling halfheartedly to get away.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug6
@1104 /* (Adrian jumps when you suddenly embrace him from behind, and the words of defensive spell die on his lips. He reaches out, awkwardly patting your arm.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug7
@1105 /* (Sighing softly, he rests his hands awkwardly on your waist.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBHug8
@1106 /* <CHARNAME>, stop it. Please. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage1
@1107 /* (Adrian shrugs his shoulders luxuriously beneath your hands, and it is unclear whether he's enjoying the massage or your presence more.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage2
@1108 /* (As you call a short break, you move over to Adrian, resting your hands on his shoulders to give him one of the massages he so enjoys. He slips free and pulls you into his lap instead, kneading his fingers into your own shoulders.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage3
@1109 /* Mmm, you're quite good at that, <CHARNAME>. Ever considered giving up on adventuring and joining a harem instead, my lady? Though I dare say I'd rather keep you for myself. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage4
@1110 /* (The half-elf murmurs softly with pleasure as you massage the knots out of his muscles.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage5
@1111 /* Don't we have places to be and people to kill, my dear? */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage6
@1112 /* (As soon as you call a halt, Adrian settles unceremoniously on the ground, drags off one of his boots, and angrily fishes a stone out of it. He jumps slightly when your hands land on his shoulders, but slowly relaxes as you massage the tension away.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage7
@1113 /* Mmm, one of the advantages of simply wearing robes. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBMassage8
@1114 /* Yes, yes. I already know that I'm tense. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress1
@1115 /* (He smiles, loosening his robes enough that you can slip your hands beneath.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress2
@1116 /* (He shuts his eyes for a moment, indulging in the attention.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress3
@1113 /* Mmm, one of the advantages of simply wearing robes. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress4
@1117 /* (He draws you closer and kisses you, clearly enjoying the shameless indulgence.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress5
@1118 /* (He catches your hands, pressing them to his lips for a brief moment before pushing you away with a wry smile.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress6
@1119 /* (Smiling, he catches you by the shoulders and turns you around, holding you close as his own hands roam across your body.) */
 = @1120 /* Turnabout, my dear? */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress7
@1121 /* Mmm, even for me, this is... somewhat exhibitionistic. Could we indulge later, my lady? */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBCaress8
@1122 /* You shouldn't let me distract you so, my love. We have things to do. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss1
@1123 /* (He holds you close as you kiss him, finally pulling away with a reluctant smile.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss2
@1124 /* (His hands travel slowly up the front of your body as you kiss, his fingers brushing lightly against the undersides of your breasts before he withdraws them and pulls away.) */
= @1125 /* Best not to get too carried away, my love. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss3
@1126 /* Mmm, if you're hoping to turn me into a fair prince with this... mmm. Never mind. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss4
@1127 /* (He's reading through a tome when you approach him, and shakes his head when he realizes your intent, clearly not interested at the moment.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss5
@1096 /* You shouldn't let me distract you so, my dear. We have things to do. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss6
@1128 /* (He shuts his eyes and holds you close, shamelessly indulging in the attention.) */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss7
@1129 /* Careful, my lady. I don't think we have the time to properly indulge right now. */
EXIT

CHAIN RH#AD25J rh#AdrianFlirtTOBKiss8
@1130 /* (The kiss is all too short, and he shakes his head afterwards, indicating that this is neither the time nor the place.) */
EXIT



