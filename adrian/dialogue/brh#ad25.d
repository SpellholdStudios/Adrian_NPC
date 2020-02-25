BEGIN BRH#AD25

// Adrian initiated

// Sarevok #1

CHAIN IF ~InParty("Sarevok")
See("Sarevok")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianSarevokTOB1","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianSarevokTOB1
@0 /* I should congratulate you, Sarevok. That was quite well played. I do appreciate a competent attempt at blackmail. */
DO ~SetGlobal("rh#AdrianSarevokTOB1","GLOBAL",1)~
== BSAREV25 @1 /* I am not here to amuse you, half-elf. */
== BRH#AD25 @2 /* No? Well, you're not particularly amusing, so perhaps that's for the best. */
= @3 /* In any case, my congratulations may be a bit premature. Using whatever leverage you can isn't that novel a concept, and anyone with half a brain knows that there are few weapons more powerful than information. */
== BRH#AD25 IF ~!Global("SarevokOath","GLOBAL",1)~ THEN @4 /* I would have expected a more diabolical endgame from the infamous villain of Baldur's Gate as well, but these things can't be helped. */
== BRH#AD25 IF ~Global("SarevokOath","GLOBAL",1)~ THEN @5 /* A shame about the geas, but these things can't be helped. */
== BSAREV25 @6 /* Keep your poisoned words to yourself, fool. I serve <CHARNAME> now, and I have far more to offer <PRO_HIMHER> than the so-called clever taunts that are your sole contribution. */
END
IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ EXTERN BRH#AD25 rh#AdrianSarevokTOB1.2
IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ EXTERN BRH#AD25 rh#AdrianSarevokTOB1.3

CHAIN BRH#AD25 rh#AdrianSarevokTOB1.2
@7 /* Yes... you do serve her. I certainly hope you'll remember that. */
== BSAREV25 @8 /* Ah. Do you play the role of the concerned lover now, mage? Will you try to strike me down at the first untoward gesture? Do not make me laugh. */
== BRH#AD25 @9 /* (smile) Step out of line, and I dare say she'll strike you down herself. */
== BSAREV25 @10 /* That is between <CHARNAME> and myself. */
== BRH#AD25 @11 /* Then consider it a friendly reminder. */
EXIT

CHAIN BRH#AD25 rh#AdrianSarevokTOB1.3
@12 /* Ah, yes... you're such a big, strong man, aren't you? A pity that didn't help you the last time. */
== BSAREV25 @13 /* I have had enough of your insolence, mage. Desist, lest you discover firsthand exactly how strong I am. */
== BRH#AD25 @14 /* Mindless obedience, is it? Well, I've grown bored of this conversation anyway. */
EXIT

// Aerie 

CHAIN IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
AreaCheck("AR4500")
Global("rh#AdrianAerieTOB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianAerieTOB
@15 /* You needn't look so uncomfortable, Aerie. The walls aren't exactly going to walk over and eat you. */
= @16 /* I'm not sure I can say the same for that bizarre sky, but-- */
DO ~SetGlobal("rh#AdrianAerieTOB","GLOBAL",1)~
== BAERIE25 @17 /* But without my wings, I can't reach it anymore? */
= @18 /* You can't still hurt me with that, Adrian. I'm not the same foolish child I used to be. And I am NOT uncomfortable. */
== BRH#AD25 @19 /* Well, I stand corrected. I suppose I'll have to blame your paleness on the lighting, then. */
== BAERIE25 @20 /* Ohh, just stop it! As if you like this place any better! */
EXIT

// Anomen

// Anomen #1.2
CHAIN IF ~InParty("Anomen")
See("Anomen")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("Anomen",CHAOTIC_NEUTRAL)
Global("rh#AdrianAnomenTOB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianAnomenTOB1.2
@21 /* What's wrong with you to<DAYNIGHT>, Delryn? You look more sullen than usual. */
DO ~SetGlobal("rh#AdrianAnomenTOB","GLOBAL",1)~
== BANOME25 @22 /* If you want sullen, mage, perhaps I should find you a mirror. */
== BRH#AD25 @23 /* Suit yourself. */
END
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ EXTERN BANOME25 rh#AdrianAnomenTOB1.3
IF ~Alignment("rh#Adrian",MASK_EVIL)~ EXIT

CHAIN BANOME25 rh#AdrianAnomenTOB1.3
@24 /* Tell me... why? Why would you even try? */
== BRH#AD25 @25 /* You're making about as much sense as you ever do, Helmite. Try what precisely? */
== BANOME25 @26 /* Your show of hostility does not fool me, Adrian. I am familiar enough with struggle to sense it in others. You have lived in darkness for so long, and now... I would know what has changed. */
== BRH#AD25 @27 /* Oh. You... honestly, you wouldn't understand. */
== BANOME25 @28 /* I may be no knight, but I shall not tolerate your condescension. */
== BRH#AD25 @29 /* It wasn't condescension, Anomen. You'll have to find your own answers. Mine don't exactly apply to your situation. I'm... not sure I ever even had a life's dream to shatter. */
== BANOME25 @30 /* Every fall is personal? */
== BRH#AD25 @31 /* Something of the sort. */
EXIT

// Edwin #1

CHAIN IF ~InParty("Edwin")
See("Edwin")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianEdwinTOB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianEdwinTOB1
@32 /* I understand patriotism, but there's a point at which you should probably set those old robes aside. */
DO ~SetGlobal("rh#AdrianEdwinTOB","GLOBAL",1)
RealSetGlobalTimer("rh#AdrianEdwinTOBTalkTimer","GLOBAL",3600)~
== BEDWIN25 @33 /* Pfah. As if I would ever lower myself to don clothing produced in a lesser country. What idiotic suggestion will you dream up next? */
== BRH#AD25 @34 /* The great Edwin Odesseiron... lesser tailors tremble in dread, no doubt. As do all people with a sense of smell. */
== BEDWIN25 @35 /* You can keep your tedious insinuations to yourself, Zhent. */ 
== BRH#AD25 @36 /* The odor notwithstanding, you do realize that we've enough problems right now without your colors drawing attention as well. */
== BEDWIN25 @37 /* You are most welcome to skulk in the shadows like a particularly dimwitted rat, but a man of my stature will stand out regardless of the clothing he wears. I cannot expect you to understand such simple logic, of course. */
== BRH#AD25 @38 /* If you'd care for a bullseye on the back to complete the effect, I'd be happy to oblige. */
== BEDWIN25 @39 /* Hmph. You'd like that, wouldn't you? */
EXIT

// Valygar 

CHAIN IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianValygarTOB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianValygarTOB
@40 /* Your sour looks are growing irritating, ranger. I don't give a damn whether you want to talk to me or not, but continue staring at me like that and you may well find yourself curiously blind. */
DO ~SetGlobal("rh#AdrianValygarTOB","GLOBAL",1)~
== BVALYG25 IF ~Class("rh#Adrian",SORCERER)~ THEN @41 /* I do not care for the way you obsess over every piece of magical lore we come across, sorcerer. Did you not say that your particular... gifts exempted you from the need to do research? */
== BRH#AD25 IF ~Class("rh#Adrian",SORCERER)~ THEN @42 /* Indeed. If I indulge in the lore, it's because the study itself is rewarding. */
== BVALYG25 IF ~!Class("rh#Adrian",SORCERER)~ THEN @43 /* I do not care for the way you obsess over every piece of magical lore we come across, wizard. */
== BRH#AD25 IF ~!Class("rh#Adrian",SORCERER)~ THEN @44 /* You'd best not expect me to stop. */
== BRH#AD25 @45 /* I have no intention of embracing lichdom or whatever other nonsense disturbs you so much, so you can take your suspicions elsewhere. */
EXIT

// Cernd

CHAIN IF ~InParty("Cernd")
See("Cernd")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Cernd",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianCerndTOB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianCerndTOB
@46 /* You mentioned that your old grove was in Cormyr? */
DO ~SetGlobal("rh#AdrianCerndTOB","GLOBAL",1)~
== BCERND25 @47 /* It was. A beautiful glade just west of the river that cuts the King's Forest in twain. My time in the country was fascinating and worthwhile, if not completely to my liking. */
== BRH#AD25 @48 /* Well, it was Cormyr. What did you expect? Did you need the permission of the king to plant a single flower? */
== BCERND25 @49 /* My, my, but we're angry to<DAYNIGHT>. Is something troubling you, Adrian? Do you need me to proscribe you a remedy for a particularly embarrassing rash, perhaps? */
== BRH#AD25 @50 /* Careful, druid, or you may need to proscribe yourself a remedy for first degree burns. */
== BCERND25 @51 /* I am merely trying to be helpful, my friend. */
== BRH#AD25 @52 /* ...I'm sure you were. But if you'd rather go commune with the daffodils than engage in intelligent conversation, I would hate to get in your way. */
EXIT

//  Keldorn #2

CHAIN IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Keldorn",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("rh#Adrian",LAWFUL_NEUTRAL)
Global("rh#AdrianKeldornTOB","GLOBAL",2)~ THEN BRH#AD25 rh#AdrianKeldornTOB2
@53 /* I was... somewhat brusque the other night, Sir Keldorn. More so than I should have been, perhaps. */
DO ~SetGlobal("rh#AdrianKeldornTOB","GLOBAL",3)~
== BKELDO25 @54 /* Apology accepted. */
== BRH#AD25 @55 /* You've... been good to me. Certainly better than I expected. Probably better than I deserved. */
== BKELDO25 @56 /* I have many years behind me, Adrian. I have been tested often and sorely enough to sense when others face their own trials. */
== BRH#AD25 @57 /* (smile) And a paladin of Torm, no less, to fret over my immortal soul... to think, in another lifetime, we might have even been friends. */
== BKELDO25 @58 /* We might still be friends. */
== BRH#AD25 @59 /* Until some knights from Sembia or Cormyr come baying for my blood, and you suddenly decide that justice must be done after all. */
= @60 /* I don't think I can afford that type of friendship, Keldorn. */
== BKELDO25 @61 /* I am sorry that you feel that way. */
== BRH#AD25 @62 /* Truth be told, so am I. */
EXIT

// Minsc

CHAIN IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianMinscTOB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianMinscTOB
@63 /* Minsc, could you try to be a little... quieter before battles? And during battles? And perhaps after battles? */
DO ~SetGlobal("rh#AdrianMinscTOB","GLOBAL",1)~
== BMINSC25 @64 /* Minsc does not fight evil in silence, my friend! Evil must know that the end is near! */
== BRH#AD25 @65 /* Yes, and I can assure you that evil is quite gratified by your constant warnings, but making a habit of practicing discipline might help you conquer your rages before you start attacking the wrong people. */
== BMINSC25 @66 /* I do not know... silence is not the way of the true champion of goodness-- */
== BRH#AD25 @67 /* ...it's a wonder there are any left. */ 
= @68 /* Think of Boo, then. You wouldn't want to accidentally hurt him when you lose control, would you? He is much too vulnerable to be able to get out of the way in time. */
== BMINSC25 @69 /* What you say makes sense but... this is troubling, my friend. I shall have to think on it. */
EXIT

// Jan

CHAIN IF ~InParty("Jan")
See("Jan")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Jan",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianJanTOB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianJanTOB
@70 /* Jan, if you open your mouth, I swear-- */
DO ~SetGlobal("rh#AdrianJanTOB","GLOBAL",1)~
== BJAN25 @71 /* You're not going to try to turn me into a toad, are you? My Aunt Bethema did that once... oh, let me tell you, Annie. There's a reason we gnomes stick to our illusions. I must've spent about a week hopping around on the ground as Aunt Beth tried to find a proper scroll of dispel. I met a nice lady frog while I was polymorphed, though, and we-- */
== BJAN25 @72 /* ... */
== BRH#AD25 @73 /* Oh, sweet silence. */
= @74 /* I wasted a scroll on that, but even a moment's peace is worth the cost. */
= @75 /* ...I suppose I probably should have walked away thirty seconds ago. */
== BJAN25 @76 /* Hmph. See if I help you next time it's your turn to cook, Annie. */
EXIT

// NPC initiated

// Anomen #1.1

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("Anomen",MASK_LAWFUL)
Global("rh#AdrianAnomenTOB","GLOBAL",0)~ THEN BANOME25 rh#AdrianAnomenTOB1.1
@77 /* Adrian, you look particularly grim. Dare I ask how deep in your cups you are to<DAYNIGHT>? */
DO ~SetGlobal("rh#AdrianAnomenTOB","GLOBAL",1)~
== BRH#AD25 @78 /* Not as much as you might think. Granted, not as far from it as you no doubt are. */
== BANOME25 @79 /* I see. Wine will not solve your problems. */
== BRH#AD25 @80 /* Well, it's never made them worse. */
= @81 /* ...why are you still here, Anomen? */
== BANOME25 @82 /* It has occurred to me that we have not spoken a great deal as of late, you and I. */
== BRH#AD25 @83 /* I hope it has also occurred to you that there's never been much of anything to say. */
== BANOME25 @84 /* Hmph. I am not sure that I believe that, though I shall leave you be if that is what you desire. */
EXIT

// Anomen #2

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("rh#Adrian",LAWFUL_NEUTRAL)
Global("rh#AdrianAnomenTOB","GLOBAL",1)~ THEN BANOME25 rh#AdrianAnomenTOB2
@85 /* I shall ask you only once to stop smirking at me, Adrian. */
DO ~SetGlobal("rh#AdrianAnomenTOB","GLOBAL",2)~
== BRH#AD25 @86 /* My apologies. I was imagining-- well, I suppose you wouldn't be particularly interested. */
== BANOME25 @87 /* Aye, I have no wish to hear whatever disparaging remark you would fling at me to<DAYNIGHT>. */
== BRH#AD25 @88 /* Nothing so entertaining, my lord. I was merely imagining what it would have been like had our places been reversed. */
== BANOME25 @89 /* Verily? I would not wish Lord Cor upon anyone, Adrian. Even you. */
== BRH#AD25 @90 /* Oddly enough, I was thinking the same. */
== BANOME25 @91 /* Ah. You are lighthearted to<DAYNIGHT>. I shall never learn to predict your moods. */
== BRH#AD25 @92 /* Well, I'd hate to overburden your intellect. */
== BANOME25 @93 /* I assure you, there is little chance of that. */
= @94 /* Alas, the time for frivolity has long since passed. Come, let us move on. */
EXIT

// Haer'dalis 

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianHaerDalisTOB","GLOBAL",0)~ THEN BHAERD25 rh#AdrianHaerDalisTOB
@95 /* 'Twould appear that something in your manner has shifted, my shrike. */
DO ~SetGlobal("rh#AdrianHaerDalisTOB","GLOBAL",1)~

== BHAERD25 IF ~!Alignment("rh#Adrian",MASK_EVIL)~ THEN @96 /* Fascinating though that may be, I am not altogether convinced that I care for it. */
== BRH#AD25 IF ~!Alignment("rh#Adrian",MASK_EVIL)~ THEN @97 /* It's a pity nobody asked you, bard. */
== BHAERD25 IF ~!Alignment("rh#Adrian",MASK_EVIL)~ THEN @98 /* Hah! His tongue is as forked as ever, even if his moods be tempered and muted. This sparrow had hoped for a fittingly dramatic finale, but 'twould seem that I am to be disappointed. */

== BRH#AD25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @99 /* Little enough in yours has, unfortunately. */
== BHAERD25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @100 /* Aye, 'tis a most pleasing paradox, is it not? */
== BRH#AD25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @101 /* If you say so. */
== BHAERD25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @102 /* Ahh, such fierce commitment he displays. But perhaps he is too consumed by the thought of those who wronged him to put his mind to such simple puzzles. */  
== BHAERD25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @103 /* It shall end in fire and ruin, methinks, but for whom... this sparrow can but watch and wait as that story unfolds. */

== BRH#AD25 @104 /* You... oh, I see. */
= @105 /* I don't give a damn about your philosophy one way or the other, tiefling, but if you want to see it reflected in life, you hardly need to look at me. */ 
== BHAERD25 @106 /* Reflected, my shrike? Nay, 'tis no reflection. Look about you and I dare say you shall see the truth of that. */
== BRH#AD25 @107 /* I have enough on my mind without worrying about your bizarre Sigilian superstitions as well, Haer'dalis. Leave me be. */
== BHAERD25 @108 /* The way you spit and sneer, my hound, I think I should like nothing better. */
EXIT

// Imoen

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Imoen2",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianImoenTOB","GLOBAL",0)~ THEN BIMOEN25 rh#AdrianImoenTOB
@109 /* So Adrian, what do you plan to do once this is over? I don't suppose going home is much of an option. */
DO ~SetGlobal("rh#AdrianImoenTOB","GLOBAL",1)~
== BRH#AD25 @110 /* You don't say. */
== BIMOEN25 @111 /* Though I don't know. We're pretty powerful these days... you probably could hold your own. Heh. */
== BRH#AD25 @112 /* Perhaps. Still, I seem to be becoming somewhat more risk averse in my old age. Though I suspect it's hardly possible to be *less*. */
== BIMOEN25 @113 /* Ha ha, come on. Old age? You can't be more than... */
= @114 /* Huh. It's a bit hard to tell with all that elven blood, isn't it? I mean, for all I know, you could be over fifty. */
== BRH#AD25 @115 /* A horrifying thought, I'm sure. */
== BIMOEN25 @116 /* Well, a girl's got to have standards. */
= @117 /* Oh, don't look so grumpy all the time. I'm just teasing you. You could be a hundred for all I care. */
== BRH#AD25 @118 /* Heh. How <CHARNAME> puts up with this, I'll never know. */
== BIMOEN25 @119 /* I'd say long experience, but really, I'm just that awesome. (grin) */
EXIT

// Korgan 

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianKorganTOB","GLOBAL",0)~ THEN BKORGA25 RH#AdrianKorganTOB
@120 /* Ye gonna bury yer head in that bloody book all day, elfling, or do ye want a swig o' this dwarven ale? */
DO ~SetGlobal("rh#AdrianKorganTOB","GLOBAL",1)~
== BRH#AD25 @121 /* I don't normally care for ale... */
== BKORGA25 @122 /* Bah! Yer all the same, ye pointy eared freaks! */
== BRH#AD25 @123 /* Pointy eared freak? I've heard that one three times this week, Korgan. You need new material. */
== BKORGA25 @124 /* Aye, then pour yerself a tankard an' we'll get to work! Har har! */
EXIT

// Mazzy

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianMazzyTOB","GLOBAL",0)~ THEN BMAZZY25 rh#AdrianMazzyTOB1.1
@125 /* Forgive me for being forward, my friend, but I have put some thought into what you said in Suldanessellar. */
DO ~SetGlobal("rh#AdrianMazzyTOB","GLOBAL",1)~
== BRH#AD25 @126 /* I said quite a few things in Suldanessellar. Any number of them would likely have gotten me exiled in better times. */
END
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ EXTERN BMAZZY25 rh#AdrianMazzyTOB1.2
IF ~Alignment("rh#Adrian",MASK_EVIL)~ EXTERN BMAZZY25 rh#AdrianMazzyTOB1.3

CHAIN BMAZZY25 rh#AdrianMazzyTOB1.2
@127 /* Some things are slow to change, 'tis true, but you behaved more admirably than I would have expected. It gives me hope that you may yet choose a better path. */
== BRH#AD25 @128 /* Don't overexcite yourself. I hardly see any crusades in my future. */
== BMAZZY25 @129 /* Time will tell. If you ever wish counsel or aid, Adrian, know that I would be willing to listen. */
== BRH#AD25 @130 /* I've treated you horrifically, Mazzy. You don't owe me anything. */
== BMAZZY25 @131 /* Is that an apology? */
== BRH#AD25 @132 /* I don't apologize. Ever. */
== BMAZZY25 @133 /* I do not believe that. But very well, I have said my piece. Know that my aid is not contingent upon your apology or lack thereof. */
== BRH#AD25 @134 /* How swe-- fine. Thank you, Mazzy. */
== BMAZZY25 @135 /* Good. You are learning. Come, let us move on. */
EXIT

CHAIN BMAZZY25 rh#AdrianMazzyTOB1.3
@136 /* I had hoped-- no. 'Tis of no importance. */
== BRH#AD25 @137 /* You might as well just tell me. */
== BMAZZY25 @138 /* Very well. I had hoped that contact with your elven kindred would prove beneficial, but it would seem that I was mistaken. */
== BRH#AD25 @139 /* Funny, that. How <CHARNAME> puts up with this cloying naivete, I'll never know. */
EXIT

// Nalia

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianNaliaTOB","GLOBAL",0)~ THEN BNALIA25 rh#AdrianNaliaTOB
@140 /* Adrian, you mentioned that you had once had political aspirations, did you not? */
DO ~SetGlobal("rh#AdrianNaliaTOB","GLOBAL",1)~
== BRH#AD25 @141 /* What of it? */
== BNALIA25 @142 /* Tell me, how exactly did you intend to scheme your way into power? */
== BRH#AD25 @143 /* That's an... interesting question. Are you considering a future career in tyranny, princess? You just might like it. */
== BNALIA25 @144 /* Don't be ridiculous. My goals have not changed, but a life spent on the fringe of society, helping each individual person... it's a fool's dream. I see that now. If I want to truly make a difference, I must weigh my options more carefully than that. */
== BRH#AD25 @145 /* You'd fight fire with fire, then? */
== BNALIA25 @146 /* There is nothing inherently wrong in pursuing a political career. */
== BRH#AD25 @147 /* No, but it takes far more discipline and pragmatism than you possess, Nalia. If you don't learn to bend, you may well break instead. Don't be surprised if you find the goodly folk of the Realms hunting you in a decade or so. */
== BNALIA25 @148 /* I asked for your history, not your advice. You may keep your insinuations to yourself. You don't know the first thing about me. */
== BRH#AD25 @149 /* No? You may have grown in power and arrogance, princess, but you're still the same self-important spoiled brat you always were. */
== BNALIA25 @150 /* And you, my lord, haven't grown at all. */
EXIT

// Sarevok #2

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianSarevokTOB2","GLOBAL",0)~ THEN BSAREV25 rh#AdrianSarevokTOB2
@151 /* I have had enough of your stares, half-elf. Say your piece or-- */
DO ~SetGlobal("rh#AdrianSarevokTOB2","GLOBAL",1)~
== BRH#AD25 @152 /* Or you will tear out my eyes and feed them to me, no doubt. Yes, I've heard the rhetoric. It's somewhat... desperate, wouldn't you say? */
== BSAREV25 IF ~Class("rh#Adrian",SORCERER)~ THEN @153 /* You are a brave man or a fool to speak to me thus, sorcerer. */
== BSAREV25 IF ~!Class("rh#Adrian",SORCERER)~ THEN @154 /* You are a brave man or a fool to speak to me thus, wizard. */
== BRH#AD25 @155 /* You don't particularly frighten me, Sarevok. Nor do you impress me. The only thing about you that interests me at all is your nature. */
= @156 /* I admit, I've been trying to figure out exactly what you are. Not quite alive, not quite dead. Not undead, nor exactly resurrected. It's a fascinating paradox. */
== BSAREV25 @157 /* Bah! Take your theoretical musings elsewhere. I live. The specifics of it are irrelevant. */
EXIT

// Viconia

// 1.
CHAIN IF
~InParty("Viconia")
InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianViconiaTOB","GLOBAL",0)~ THEN BVICON25 rh#AdrianViconiaTOB1
@158 /* Tell me, jaluk. Are you familiar with the ways of the surface goddess Loviatar? */
DO ~SetGlobal("rh#AdrianViconiaTOB","GLOBAL",1)~
== BRH#AD25 @159 /* Somewhat. Branching out, are we? Even a drow priestess might have a thing or two to learn from the Maiden of Pain. */
== BVICON25 @160 /* I doubt that. Still, surfacer males tend to be less... appreciative of sharper pleasures. */
== BRH#AD25 @161 /* While drow males are, without exemption, eager, I'm sure. Look elsewhere, Viconia. I won't deny that I've a taste for some of Loviatar's pleasures, but I doubt it compares to yours. */ 
== BVICON25 @162 /* Very few things do. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianViconiaTOB","GLOBAL",1)~ THEN BVICON25 rh#AdrianViconiaTOB2
@163 /* I have noticed that you spend more time with your books of lore than you did in Amn, jaluk. I cannot believe that the study of the arcane has made such leaps in so short a time. */
DO ~SetGlobal("rh#AdrianViconiaTOB","GLOBAL",2)~
== BRH#AD25 @164 /* It hasn't, no. */
== BVICON25 @165 /* Then why do you persist? */
== BRH#AD25 @166 /* No doubt for the same reason that you've taken to propositioning every male in sight. */
== BVICON25 @167 /* What do you imply, wael? */
== BRH#AD25 @168 /* These are stressful times, Viconia. We cope however we can. */
== BVICON25 @169 /* I see. You think that I am unaccustomed to stress? */
== BRH#AD25 @170 /* No more than I am. Do you honestly have nothing better to do, or shall we snarl at each other about this all <DAYNIGHT>? */
== BVICON25 @171 /* Hmph. You are not worth the effort, jaluk. */
EXIT

// scripted

// Edwin #2

CHAIN IF WEIGHT #-1 ~Global("rh#AdrianEdwinTOB","GLOBAL",2)~ THEN EDWIN25J rh#AdrianEdwinTOB2
@172 /* What are you doing? */
DO ~SetGlobal("rh#AdrianEdwinTOB","GLOBAL",3)~
== RH#AD25J @173 /* Reading. */
== EDWIN25J @174 /* Yes, obviously, but why here? Are you too blind to see that I am in the process of preparing my spells? */
END
IF ~Class("rh#Adrian",SORCERER)~ EXTERN RH#AD25J rh#AdrianEdwinTOB2.2
IF ~!Class("rh#Adrian",SORCERER)~ EXTERN RH#AD25J rh#AdrianEdwinTOB2.3

CHAIN RH#AD25J rh#AdrianEdwinTOB2.2
@175 /* That explains the look of frustation on your face. It must be... difficult to have to redo those preparations, <DAYNIGHT> after <DAYNIGHT>. Particularly for one who considers magic his birthright. */
== EDWIN25J @176 /* Is that how you see it, you arrogant slug? */
== RH#AD25J @177 /* Ha! */
== EDWIN25J @178 /* You, sorcerer, are an amateur, without the skill or discipline to fully develop what meager talent you have accidentally received. You are a mere force of nature, mindless, aimless, without subtlety or finesse. You are nothing compared to a true master, you ignorant pup. */
== RH#AD25J @179 /* Does it still trouble you so much that I can channel magic as simply as I breathe, while you, a so-called master of the art, must instead rely upon long and tedious study? You know, I can feel the magic singing through my veins sometimes, it's-- */ 
== EDWIN25J @180 /* If it tells you to jump off a bridge someday, do me a favor and listen. */
EXIT

CHAIN RH#AD25J rh#AdrianEdwinTOB2.3
@181 /* That explains the look of frustration on your face. */
== EDWIN25J @182 /* So the fool can't even distinguish between frustration and illumination. How terribly surprising. Begone, you insolent-- */
= @183 /* Wait. That is one of *my* tomes you're soiling with your greasy hands, isn't it? */
== RH#AD25J @184 /* According to you, every tome in Faerun is yours. */
== EDWIN25J @185 /* Exactly! Now give it to me! */
== RH#AD25J @186 /* Or what? You'll spend the next hour preparing a fireball and then cast it at me? */
== EDWIN25J @187 /* Bah! (Just you wait... just you wait...) */
EXIT

// Jaheira

// 1.
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheiraTOB","GLOBAL",2)~ THEN RH#AD25J rh#AdrianJaheiraTOB1
@188 /* Harper, this is getting stupid. */
DO ~SetGlobal("rh#AdrianJaheiraTOB","GLOBAL",3)
RealSetGlobalTimer("rh#AdrianJaheiraTOBTalkTimer","GLOBAL",3600)~
== JAHEI25J @189 /* If you take issue with <CHARNAME>'s current plight-- */
== RH#AD25J @190 /* What? No. I'm talking about you, Jaheira. And me. And this damn feud that we've been playing out as if the mere thought of putting it aside is too frightening. */
== JAHEI25J @191 /* I have nothing against you, Vasiliev. */
== RH#AD25J IF ~InParty("Haerdalis")~ THEN @192 /* No? You could put the tiefling's acting to shame, then. */
== RH#AD25J IF ~!InParty("Haerdalis")~ THEN @193 /* No? You could put a bard's acting to shame, then. */
== JAHEI25J @194 /* You have changed. Not as much as one might like, perhaps, but more than I had thought possible. I have no quarrel with you. */
== RH#AD25J @195 /* I... see. Good. I look forward to being able to sleep again. */
= @196 /* Hells, you're not going to start lecturing me like you do the others, are you? */
== JAHEI25J @197 /* Do not look so horrified. A lecture, no doubt, would be wasted upon you. */
EXIT

// 2.
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheiraTOB","GLOBAL",4)~ THEN RH#AD25J rh#AdrianJaheiraTOB2
@198 /* I never did offer you condolences on the loss of your husband, Jaheira. I'm sorry about that. And about him. */
DO ~SetGlobal("rh#AdrianJaheiraTOB","GLOBAL",5)
RealSetGlobalTimer("rh#AdrianJaheiraTOBTalkTimer","GLOBAL",3600)~
== JAHEI25J @199 /* You were too busy insulting his memory, as I recall. */
== RH#AD25J @200 /* Don't lay the blame entirely at my feet. */
== JAHEI25J @201 /* No, we were both... ill-equipped to handle one another's company. */
== RH#AD25J @202 /* I always respected you, you know. Even when I still hated you. */
== JAHEI25J @203 /* I cannot say the same. */
= @204 /* My thanks, however, for your condolences, belated though they may be. My time of mourning has passed, but the grief... */
== RH#AD25J @205 /* It never quite goes away. */
== JAHEI25J @206 /* No, it does not. */
EXIT

// 3.
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheiraTOB","GLOBAL",6)~ THEN JAHEI25J rh#AdrianJaheiraTOB3
@207 /* You look thoughtful to<DAYNIGHT>, Adrian. Might I ask why? */
DO ~SetGlobal("rh#AdrianJaheiraTOB","GLOBAL",7)
RealSetGlobalTimer("rh#AdrianJaheiraTOBTalkTimer","GLOBAL",3600)~
== RH#AD25J @208 /* Hmm. It's funny, I suppose. The things I could do today, the degree to which my mastery has grown... I feel like I've spent the last ten years running in place. It's... somewhat humbling. */
== JAHEI25J @209 /* You could do with being humbled further, I think. We have more pressing concerns than personal power. */
== RH#AD25J @210 /* Really. I didn't notice. If you don't care for the nature of my thoughts, Jaheira, kindly don't ask about them. */
== JAHEI25J @211 /* Hmm. Even when angered, you are gentler than you once were. */
== RH#AD25J @212 /* I'm hardly angry, Harper, though you're beginning to push me in that direction. */
== JAHEI25J @213 /* I quiver with fear, Zhent. */
== RH#AD25J @214 /* Laughter, more likely. */
EXIT

// 4.
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheiraTOB","GLOBAL",8)~ THEN RH#AD25J rh#AdrianJaheiraTOB4
@215 /* You're going back to the Harpers when this is over, I assume? */
DO ~SetGlobal("rh#AdrianJaheiraTOB","GLOBAL",9)~
== JAHEI25J @216 /* I expect so. Why do you ask? */
== RH#AD25J @217 /* I think I'd like to drop by Shadowdale at some point. I don't really want to do it alone. */
== JAHEI25J IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN @218 /* You have <CHARNAME>, do you not? */
== RH#AD25J IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN @219 /* Yes, who also tends to elicit violent reactions from random Harpers. */
== JAHEI25J @220 /* I see. Is this about your father? */
== RH#AD25J @221 /* Yes. I've been so... so convinced that everything that's ever gone wrong was his fault, elven perfection be damned, that... no, it never did occur to me that he was a normal person who made mistakes and lost his family because of it. */
= @222 /* Granted, he might prefer it if I stayed lost. */
== JAHEI25J @223 /* I doubt that. */
== RH#AD25J @224 /* Then will you come? */
== JAHEI25J @225 /* I never said I would not. */
== RH#AD25J @226 /* I... thank you, Jaheira. */
EXIT

// Keldorn #1

CHAIN IF WEIGHT #-1 ~Global("rh#AdrianKeldornTOB","GLOBAL",1)~ THEN RH#AD25J rh#AdrianKeldornTOB1
@227 /* Keldorn, could you hand me that quill? */
= @228 /* Thank you. */
DO ~SetGlobal("rh#AdrianKeldornTOB","GLOBAL",2)~
== KELDO25J @229 /* Might I ask what you are working on, Adrian? */
== RH#AD25J @230 /* Hmm? Oh, I'm trying to disprove a piece of arcane theory. There's something wrong with it, but I can't put my finger on what exactly. */
== KELDO25J @231 /* I cannot believe you incapable of finding a more significant problem with which to occupy yourself. */
== RH#AD25J @232 /* What do I look like, a Mystran? I could go plot the conquest of Calimport, if you'd prefer something a bit bigger. */
== KELDO25J @233 /* I see that I have offended you. That was not my intent. */
== RH#AD25J @234 /* (sigh) I know that. */
= @235 /* There's certainty here, Sir Keldorn. The rest of my life may have become a confused, chaotic mess, but this... it's a problem I know I can solve if I put enough work into it. That's relaxing, I suppose. */
== KELDO25J @236 /* I see. And your god commands such study, does he not? */
== RH#AD25J @237 /* There is that also. */
== KELDO25J @238 /* I once doubted that you truly had the discipline and care required of your deity's followers. I begin to believe that I may have been mistaken. */
== RH#AD25J @239 /* That's remarkably backhanded of you. */
== KELDO25J @240 /* It was a compliment, Adrian. Take it as you will. */
DO ~RestParty()~ EXIT
