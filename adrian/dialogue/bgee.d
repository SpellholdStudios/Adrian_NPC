// ---------------------------------------------
// Dorn
// ---------------------------------------------

// 1.
CHAIN IF ~InParty("Dorn")
See("Dorn")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianDorn1","GLOBAL",0)~ THEN BRH#ADR rh#AdrianDorn1
@0 /* I've served more than a couple of questionable masters in the past, but I'd like to think that they were all at least halfway sane. This patron of yours, however... I'm beginning to have my doubts. */
DO ~SetGlobal("rh#AdrianDorn1","GLOBAL",1)~
== BDORN @1 /* You dare to question me, half-elf? */
== BRH#ADR @2 /* It's the wisdom of these delightful little tasks that I question. I've no qualms about murdering paladins, but I'm not about to hang for your patron's amusement. */
== BDORN @3 /* Continue to mock me, mage, and you will not live long enough to worry about such a fate! */
== BRH#ADR @4 /* Well, I've never been foolish enough to argue against that. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#DamarovQuest","GLOBAL",10)
Global("rh#AdrianDorn2","GLOBAL",0)~ THEN BDORN rh#AdrianDorn2
@5 /* I had expected more conviction from you, Zhent. */
DO ~SetGlobal("rh#AdrianDorn2","GLOBAL",1)~
== BRH#ADR @6 /* Really. Did I leave too many witnesses for you? */
== BDORN @7 /* No. Your handling of loose ends was... adequate. But callousness is not a mask to be put on and taken off at will. */
== BRH#ADR @8 /* Well, isn't this new. It has been quite some time since I was last told I wasn't dark enough. */
== BDORN @9 /* You are foundering, half-elf. Find your strength and find it quickly. */
== BRH#ADR @10 /* Hmm. Tell me, should I be expecting a swordpoint conversion attempt in the near future? */
== BDORN @11 /* You would not be entirely unworthy of my patron, though you do not revel in bloodshed as you ought. */
== BRH#ADR @12 /* You really do have no concept of restraint, do you? */
== BDORN @13 /* Bah! Restraint is but another word for compromise, and I will have nothing of it. */
EXIT

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianDorn3","GLOBAL",0)~ THEN BDORN rh#AdrianDorn2
@14 /* Your people are rightly feared throughout the Realms, half-elf. */
DO ~SetGlobal("rh#AdrianDorn3","GLOBAL",1)~
== BRH#ADR @15 /* We have developed something of a reputation, yes. */
== BDORN @16 /* I would know more. */
== BRH#ADR @17 /* You're not considering joining, I hope. */
== BDORN @18 /* I've little patience for treachery, mage. Your leaders, they are powerful men, are they not? */
== BRH#ADR @19 /* Ohh, yes. I doubt that you have quite their talent for politics, of course. */
== BDORN @20 /* Hmph. Politics. What is politics compared to raw power? */
== BRH#ADR @21 /* What is raw power compared to both? You will always accomplish more with a network to support you. */
== BDORN @22 /* And yet in the end, you will always find yourself alone. */
EXIT

// ToB

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianDornToB","GLOBAL",0)~ THEN BDORN25 rh#AdrianDornToB1.1
@23 /* There is a fury seething within you. */
DO ~SetGlobal("rh#AdrianDornToB","GLOBAL",1)~
== BRH#AD25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @24 /* I take it you approve. */
== BDORN25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @25 /* Perhaps. */
== BDORN25 IF ~Alignment("rh#Adrian",MASK_EVIL)~ THEN @26 /* You need new purpose, half-elf. Do not deny it. */
== BRH#AD25 IF ~!Alignment("rh#Adrian",MASK_EVIL)~ THEN @27 /* I've never been terribly good at putting things behind me, no. */
== BDORN25 IF ~!Alignment("rh#Adrian",MASK_EVIL)~ THEN @28 /* You are a fool even to try. */
== BRH#AD25 IF ~!Alignment("rh#Adrian",MASK_EVIL)~ THEN @29 /* Perhaps. But I've no small amount of experience with foolishness. */ 
== BDORN25 IF ~!Alignment("rh#Adrian",MASK_EVIL)~ THEN @30 /* You could be more than this, half-elf. */
== BRH#AD25 @31 /* Are you making me an offer? */
== BDORN25 @32 /* I might. */
== BRH#AD25 @33 /* I don't trust a demon's promises, Dorn. Nor do I trust yours. */
== BDORN25 @34 /* Trust is an illusion, mage. It is of no consequence. */
== BRH#AD25 @35 /* And service is still service, whatever the rewards. */
EXIT

// romance conflict

CHAIN IF WEIGHT #-1 ~Global("rh#AdrianDornChallenge","GLOBAL",2)~ THEN DORNJ AdrianDornChallenge
@36 /* You and the Zhent. */
DO ~SetGlobal("rh#AdrianDornChallenge","GLOBAL",3)~
END
	++ @37 /* Adrian? What about him? */ + AdrianDornChallenge1
	++ @38 /* Me and my massive headache, you mean. */ + AdrianDornChallenge1
	++ @39 /* Jealous? */ + AdrianDornChallenge1

APPEND DORNJ

IF ~~ AdrianDornChallenge1
 SAY @40 /* I will tolerate no competition. */
 	++ @41 /* And I will do as I please. */ + AdrianDornChallenge2
 	++ @42 /* I assure you, he isn't competition. */ + AdrianDornChallenge3
END

IF ~~ AdrianDornChallenge2
 SAY @43 /* Then you are a fool, woman. */
 IF ~~ DO ~SetGlobal("DornRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ AdrianDornChallenge3
 SAY @44 /* Good. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END
END

// ---------------------------------------------
// Hexxat
// ---------------------------------------------

// 1.
CHAIN IF ~InParty("Hexxat")
See("Hexxat")
!StateCheck("Hexxat",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianHexxat1","GLOBAL",0)~ THEN BRH#ADR rh#AdrianHexxat1
@45 /* You'd think that with an eternity to work with, Dragomir could have put a bit more effort into making that ragged thing properly. */
DO ~SetGlobal("rh#AdrianHexxat1","GLOBAL",1)~
== BHEXXAT @46 /* Don't sneer so. It serves its purposes, if barely. */
== BRH#ADR @47 /* It looks like it's falling apart, and I doubt it's been washed in over a century. Though perhaps there's a reason for that. You haven't had any problems with it in the rain, have you? */
== BHEXXAT @48 /* No. Its... lapses have been unpredictable. */
== BRH#ADR @49 /* Hmm. Magical artifacts seldom last forever, and this thing has undergone considerable physical decay as it is-- */
== BHEXXAT @50 /* No. */
== BRH#ADR @51 /* What? */
== BHEXXAT @52 /* You cannot borrow it for experimentation. */
== BRH#ADR @53 /* A pity. You might have found the results beneficial. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Hexxat",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#DamarovQuest","GLOBAL",10)
Global("rh#AdrianHexxat2","GLOBAL",0)~ THEN BHEXXAT rh#AdrianHexxat2
@54 /* You are confident that there will be no more conflict with your... former employers. */
DO ~SetGlobal("rh#AdrianHexxat2","GLOBAL",1)~
== BRH#ADR @55 /* Relatively so, at least. */
== BHEXXAT @56 /* I see. */ 
== BRH#ADR @57 /* You disapprove? */
== BHEXXAT @58 /* You should not have left such loose ends at all. */
== BRH#ADR @59 /* If there had been an easier way to leave, I'd have taken it, I assure you. */
== BHEXXAT @60 /* It's unwise to get in so deeply you cannot again get out. */
== BRH#ADR @61 /* ...coming from the woman who accidentally got herself turned into a vampire. */
== BHEXXAT @62 /* Exactly so. */
EXIT

// 3.
CHAIN IF ~InParty("Hexxat")
See("Hexxat")
!StateCheck("Hexxat",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianHexxat3","GLOBAL",0)~ THEN BRH#ADR rh#AdrianHexxat3
@63 /* You know, sanity is not normally a trait I associate with your kind. */
DO ~SetGlobal("rh#AdrianHexxat3","GLOBAL",1)~
== BHEXXAT @64 /* You have known many vampires? */
== BRH#ADR @65 /* A few, though not exactly well. They weren't quite as... self-possessed as you seem to be. */ 
== BHEXXAT @66 /* Perhaps I am more unique. */
== BRH#ADR @67 /* Or perhaps the madness only comes with age. */
== BHEXXAT @68 /* That is not an encouraging thought. */
== BRH#ADR @69 /* No, I don't suppose it is. */
EXIT

// ToB

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Hexxat",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianHexxatToB","GLOBAL",0)~ THEN BHEXXA25 rh#AdrianHexxatToB
@70 /* You still do not trust me. */
DO ~SetGlobal("rh#AdrianHexxatToB","GLOBAL",1)~
== BRH#AD25 @71 /* I don't recall having made any complaints. */
== BHEXXA25 @72 /* No, but I've noticed the way that your eyes seek me out when I walk unseen. */
== BRH#AD25 @73 /* I like you well enough, but I doubt I would trust you even if you were fully human. */
== BHEXXA25 @74 /* Perhaps that is wise. I should be glad that your prejudices are not greater than they are. */
== BRH#AD25 @75 /* Trust is something of a luxury in our line of work anyway. You know that as well as I. */
== BHEXXA25 @76 /* That much is true. */
EXIT

// romance conflict

CHAIN IF WEIGHT #-1 ~Global("rh#AdrianHexxatChallenge","GLOBAL",2)~ THEN RH#ADRJ AdrianHexxatChallenge
@77 /* You know, I've never actually heard tell of a vampire courtship that ended well. */
DO ~SetGlobal("rh#AdrianHexxatChallenge","GLOBAL",3)~
END
	++ @78 /* Nobody asked you, Adrian. */ + AdrianHexxatChallenge1
	++ @79 /* You're talking about Hexxat, aren't you? */ + AdrianHexxatChallenge2

APPEND RH#ADRJ

IF ~~ AdrianHexxatChallenge1
 SAY @80 /* Hmm. I'd warn you to be careful, but it may be more interesting if you're not. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ AdrianHexxatChallenge2
 SAY @81 /* Her regard for you is growing somewhat... intense. */
 	++ @82 /* Mine for her is growing equally so, I assure you. */ + AdrianHexxatChallenge1
 	++ @83 /* It is getting a little bit unnerving. */ + AdrianHexxatChallenge3
 	++ @84 /* She is an intriguing woman, but the vampirism is a bit... much. */ + AdrianHexxatChallenge3
END

IF ~~ AdrianHexxatChallenge3
 SAY @85 /* That's quite the understatement, <CHARNAME>. */
IF ~~ DO ~SetGlobal("HexxatRomanceActive","GLOBAL",3)~ EXIT
END
END

// ---------------------------------------------
// Neera
// ---------------------------------------------

// 1.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianNeera1","GLOBAL",0)~ THEN BNEERA rh#AdrianNeera1
@86 /* So... I take it you're some sort of evil wizard yourself. */
DO ~SetGlobal("rh#AdrianNeera1","GLOBAL",1)~
== BRH#ADR @87 /* What of it? */
== BNEERA @88 /* You aren't -- I mean, I don't know that much about your people. You're not in league with the Red Wizards or something, are you? */
== BRH#ADR @89 /* Do you really think I would admit it if I were? */
== BNEERA @90 /* Well... no, I guess not. */
== BRH#ADR @91 /* Then I suppose you're not entirely a lost cause. */
== BNEERA @92 /* Hey! You may not be a Red Wizard, but you're still a first-class jerk! */
EXIT

// 2.
CHAIN IF ~InParty("Neera")
See("Neera")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
GlobalGT("OHN_PLOT","GLOBAL",5)
Global("rh#AdrianNeera2","GLOBAL",0)~ THEN BRH#ADR rh#AdrianNeera2
@93 /* Sometimes I wonder if you might not be cleverer than you look, Neera. */
DO ~SetGlobal("rh#AdrianNeera2","GLOBAL",1)~
== BNEERA @94 /* Well, aren't you the charmer! */
== BRH#ADR @95 /* There's a reason this country fears mages so much, and here you are, gathering them together. */
== BNEERA @96 /* For all the good that it did us. */
== BRH#ADR @97 /* Life isn't without its setbacks. It's better to learn that sooner, rather than later. */
== BNEERA @98 /* I still don't know what you're trying to say, Adrian. */
== BRH#ADR @99 /* A group of loyal mages is a valuable asset, if you're willing to exploit it. */
== BNEERA @100 /* What...? No. No, it's not like that. */
== BRH#ADR @101 /* If you mean to achieve any of your goals, it damn well should be. */
== BNEERA @102 /* Goals? We don't have any goals besides survival. And revenge. I mean, anything more just sounds exhausting anyway. */
== BRH#ADR @103 /* Survival is a more difficult goal than you seem to realize. */
== BNEERA @104 /* No, I think I got that message loud and clear myself, thanks. */
== BRH#ADR @105 /* Then learn from it. */
== BNEERA @106 /* You know, I never asked for a lecture. If this is you being friendly, I kind of prefer it when you're not. */
EXIT

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianNeera3","GLOBAL",0)~ THEN BNEERA rh#AdrianNeera3
@107 /* You won't bite my head off if I ask you a question, I hope. */
DO ~SetGlobal("rh#AdrianNeera3","GLOBAL",1)~
== BRH#ADR @108 /* That would depend on the question. */
== BNEERA @109 /* Oookay. Well, then. You're a half-elf. */
== BRH#ADR @110 /* Evidently. */
== BNEERA @111 /* I've never really run into trouble with it before. I mean, except for being called an elf all the time, but that's not really *trouble*, you know? */
== BRH#ADR @112 /* It would be in some places. */
== BNEERA @113 /* Like your old home? */
== BRH#ADR @114 /* Less so than you might think, actually. */
== BNEERA @115 /* Hmm. So which parent was which for you, anyway? Or are you a second generation sort of deal? */
== BRH#ADR @116 /* Neera... */
== BNEERA @117 /* Yeesh. Okay, okay, never mind, then. */
EXIT

// ToB

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianNeeraToB","GLOBAL",0)~ THEN BNEERA25 rh#AdrianNeeraToB
@118 /* You're pretty good at leaving stuff behind and not looking back by now, aren't you? */
DO ~SetGlobal("rh#AdrianNeeraToB","GLOBAL",1)~
== BRH#AD25 @119 /* What exactly do you mean? */
== BNEERA25 @120 /* You didn't seem to care about leaving Amn, and then there are the half dozen or so other places you've been... you don't seem to miss them much either. */
== BRH#AD25 @121 /* Most of them haven't actually been worth missing. */
== BNEERA25 @122 /* Well... yeah. I guess you have a point there. It's just... I'm getting pretty good at dropping stuff too. */
== BRH#AD25 @123 /* It's a fairly valuable skill. */
== BNEERA25 @124 /* It can't *always* be the answer, though, can it? Running away? */
== BRH#AD25 @125 /* Only as a last resort. */
== BNEERA25 @126 /* Heh. I guess... well, never mind. I should probably figure this stuff out on my own anyway. */
EXIT

// ---------------------------------------------
// Rasaad
// ---------------------------------------------

// 1.
CHAIN IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianRasaad1","GLOBAL",0)~ THEN BRH#ADR rh#AdrianRasaad1
@127 /* I can't help but think that you have no idea what you're doing, monk. */
DO ~SetGlobal("rh#AdrianRasaad1","GLOBAL",1)~
== BRASAAD @128 /* What do you mean? */
== BRH#ADR @129 /* I mean that this lovely vendetta of yours leaves something to be desired. I'd rather it didn't involve Sharrans, for one. */
== BRASAAD @130 /* I would have thought you more comfortable with the concept of vengeance. */
== BRH#ADR @131 /* Oh, I am intimately comfortable with it, I assure you. I have little interest in another man's grudges, of course. Particularly one who seems to be operating on fury alone. */ 
== BRASAAD @132 /* And you have been operating on something else, mage? I had not noticed. */
== BRH#ADR @133 /* Oh, clever. Very clever. Not clever enough to help you against Alorgoth, of course, but at least it's a start. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianRasaad2","GLOBAL",0)~ THEN BRASAAD rh#AdrianRasaad2
@134 /* You claim to worship Azuth, and yet the colors you wear are not his. */
DO ~SetGlobal("rh#AdrianRasaad2","GLOBAL",1)~
== BRH#ADR @135 /* Observant, for a cloistered monk. What of it? */
== BRASAAD @136 /* May I ask why? */
== BRH#ADR @137 /* Mostly because the best robes I had left by the end of the siege were the Banite dress robes I hadn't touched in a decade. */
== BRASAAD @138 /* I see. I had wondered if your intent had not been to blend in. */
== BRH#ADR @139 /* Hmm. As you're doing now with the Dark Moon, I assume. */
== BRASAAD @140 /* You are perceptive. */
= @141 /* I am no longer certain that this is a mask that will be easily lifted once my goals are met. */
== BRH#ADR @142 /* Few truly good masks are. */
== BRASAAD @143 /* That is disheartening. */
EXIT

// 3.
CHAIN IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianRasaad2","GLOBAL",1)
Global("rh#AdrianRasaad3","GLOBAL",0)~ THEN BRH#ADR rh#AdrianRasaad3
@144 /* You know, Rasaad, a crisis of faith is not altogether a bad thing. */ 
DO ~SetGlobal("rh#AdrianRasaad3","GLOBAL",2)~
== BRASAAD @145 /* I fear that I can see it in no other light. */
== BRH#ADR @146 /* Has it never occurred to you that perhaps Selûne is not the best fit for you? Frankly, I'm surprised that she's the right fit for anyone, but-- */
== BRASAAD @147 /* You would not have me worship Shar instead! */
== BRH#ADR @148 /* Gods forbid. I wouldn't wish *her* on anyone, but they're hardly the only options. */
== BRASAAD @149 /* I have no wish to abandon everything I have ever believed, everything I have ever been. */
== BRH#ADR @150 /* Sometimes there's no other option left. */
== BRASAAD @151 /* Hmm. */
== BRH#ADR @152 /* What? */
== BRASAAD @153 /* I am... unaccustomed to seeing you contemplate the misfortunes of someone who is not yourself, I admit. */ 
== BRH#ADR @154 /* I see. In any case, don't expect me to make a habit of it. */
EXIT

// ToB

CHAIN IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianRasaadToB","GLOBAL",0)~ THEN BRH#AD25 rh#AdrianRasaadToB
@155 /* It's funny, isn't it? This heresy of yours, the thought that Selûne and Shar really are just one mad goddess intent upon waging holy war against herself. */
DO ~SetGlobal("rh#AdrianRasaadToB","GLOBAL",1)~
== BRASAA25 @156 /* I do not find it very funny at all. */
== BRH#AD25 @157 /* You wouldn't. Still, I can't help but want to apply the same heresy to a handful of other holy struggles as well. Mad gods, the lot of them. */
== BRASAA25 IF ~Class("rh#Adrian","CLERIC_MAGE")~ THEN @158 /* I would not have expected such blasphemy from you. */
== BRH#AD25 IF ~Class("rh#Adrian","CLERIC_MAGE")~ THEN @159 /* Oh, Azuth doesn't mind, I'm sure. He likely expects it by now. */
== BRASAA25 @160 /* You are very bitter to<DAYNIGHT>, I think. */
== BRH#AD25 @161 /* I've been bitter for quite some time, though our current struggle isn't helping matters much, I suppose. */
== BRASAA25 @162 /* We fight for scraps of Bhaal's legacy like dogs at their master's table. */
== BRH#AD25 @163 /* An apt analogy. */
== BRASAA25 @164 /* And yet... and yet the darkness must pass eventually. */
== BRH#AD25 @165 /* Careful, Rasaad. That almost sounds like faith. */
== BRASAA25 @166 /* Perhaps it is. */
EXIT

// romance conflict

CHAIN IF WEIGHT #-1 ~Global("rh#AdrianRasaadChallenge","GLOBAL",2)~ THEN RH#ADRJ AdrianRasaadChallenge
@167 /* You can't honestly be enjoying that monk's inept attentions, <CHARNAME>. Though I suppose his clumsiness is almost charming. */
DO ~SetGlobal("rh#AdrianRasaadChallenge","GLOBAL",3)~
END
	++ @168 /* It's certainly more charming than yours. */ + AdrianRasaadChallenge1
	++ @169 /* I haven't really had the heart to turn him away. */ + AdrianRasaadChallenge2
	++ @170 /* It's innocent enough. */ + AdrianRasaadChallenge3
	++ @171 /* I've been meaning to tell him to stop. */ + AdrianRasaadChallenge5

APPEND RH#ADRJ

IF ~~ AdrianRasaadChallenge1
 SAY @172 /* Careful with that sharpened tongue, my lady. I doubt your monk will care much for it. */
 IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3) SetGlobal("rh#AdrianFriendshipActive","GLOBAL",3)~ EXIT
END

IF ~~ AdrianRasaadChallenge2
 SAY @173 /* Perhaps you should find it. As much as I enjoy the drama, he's already unstable enough as it is. */
IF ~~ DO ~SetGlobal("RasaadRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ AdrianRasaadChallenge3
 SAY @174 /* I doubt he'd agree with that assessment. If you're not actually interested... well, you should probably let him know. He's unstable enough as it is. */
 	++ @175 /* Unstable, is he? You'd know a thing or two about that. */ + AdrianRasaadChallenge1
 	++ @176 /* I am interested, actually. Very much so. */ + AdrianRasaadChallenge4
 	++ @177 /* You're right. I'll have to tell him to stop. */ + AdrianRasaadChallenge5
END

IF ~~ AdrianRasaadChallenge4
 SAY @178 /* Are you? I suppose there's no accounting for taste. */
IF ~~ DO ~SetGlobal("rh#AdrianRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ AdrianRasaadChallenge5
 SAY @179 /* That would probably be a good idea. */
IF ~~ DO ~SetGlobal("RasaadRomanceActive","GLOBAL",3)~ EXIT
END
END