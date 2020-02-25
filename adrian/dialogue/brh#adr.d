BEGIN BRH#ADR

// Adrian initiated

// Jaheira #1
CHAIN IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
!Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianJaheira2","GLOBAL",0)~ THEN BRH#ADR rh#AdrianJaheira2
@0 /* Have you found any interesting windows to spy into yet? I hear the Amnish leave them wide open this time of year. */
DO ~SetGlobal("rh#AdrianJaheira2","GLOBAL",1)~
== BJAHEIR @1 /* I am in no mood for your drunken attempts at wit, Adrian. */
== BRH#ADR @2 /* No? We could visit an inn and find a table for you to crawl under, if you'd prefer. Perhaps you'll learn something scandalous and irrelevant about the local clientele. */
== BJAHEIR @3 /* Hmph. I take it you disapprove of my career choice? */
== BRH#ADR @4 /* I disapprove of oh, so very many different things, my lady. You shouldn't be so surprised. */
== BJAHEIR @5 /* I am not surprised in the slightest. I would not be astounded to learn that you had crossed my kin in the past. */
== BRH#ADR @6 /* Yes, because everyone who doesn't like the Harpers is suddenly their enemy. How very convenient for you. */
== BJAHEIR IF ~Class("rh#Adrian",SORCERER)~ THEN @7 /* You are better at lying when you are sober, sorcerer. Perhaps you should consider getting rid of that bottle of mead. */
== BJAHEIR IF ~!Class("rh#Adrian",SORCERER)~ THEN @8 /* You are better at lying when you are sober, wizard. Perhaps you should consider getting rid of that bottle of mead. */
== BRH#ADR @9 /* Ah, but where would be the fun in that? */
EXIT

// Minsc #1
CHAIN IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianMinsc","GLOBAL",0)~ THEN BRH#ADR rh#AdrianMinsc1
@10 /* What... is that? */
DO ~SetGlobal("rh#AdrianMinsc","GLOBAL",1)~
== BMINSC @11 /* Ah, you have met Boo, I see. */
== BRH#ADR @12 /* Your... familiar? I had one once, never bothered to replace him. An odious freak of an imp who insisted upon being called the Dark Lord of All and refused to speak in any language but Infernal. I never quite understood that. */
== BMINSC @13 /* Boo is no familiar. He is a miniature giant space hamster. */
== BRH#ADR @14 /* But what does it... do? */
== BMINSC @15 /* Boo may look small, but his heart is as large as a house, and his commitment to the fight against evil is unshakable! */
== BRH#ADR @16 /* I... see. Well, with such champions amongst us, I suppose I'll sleep just a little more easily at night. */
EXIT

// Edwina
CHAIN IF ~InParty("Edwin")
See("Edwin")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Gender("Edwin",FEMALE)
Global("rh#AdrianEdwina","GLOBAL",0)~ THEN BRH#ADR rh#AdrianEdwina
@17 /* Well I suppose it isn't quite lichdom, but I've heard it said that we achieve immortality through our children. You're certainly shapely enough to attract a capable man, if you're so inclined. Shame about the personality, of course. */
DO ~SetGlobal("rh#AdrianEdwina","GLOBAL",1)~
== BEDWIN @18 /* You disgusting...! (Calm down, calm down.) The depths of your depravity never cease to amaze me. */
== BRH#ADR @19 /* I'm just getting started, darling. Though I must admit, I've always enjoyed ruthless and grasping women... */
== BEDWIN @20 /* Enough! You perverted... */
== BRH#ADR @21 /* Oh, I won't deny it. I was briefly involved with a Loviatan in my youth, you know. It gives new meaning to your claims of gasping concubines, if you're interested in something a bit...sharper, my lady. */
== BEDWIN IF ~Global("rh#AdrianZhent","GLOBAL",1)~ THEN @22 /* You... you...! (Oh, I just dare you to sleep tonight, Zhent.) */
== BEDWIN IF ~!Global("rh#AdrianZhent","GLOBAL",1)~ THEN @23 /* You... you...! (Oh, I just dare you to sleep tonight.) */
EXIT

// Keldorn #1
CHAIN IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianKeldorn","GLOBAL",0)~ THEN BRH#ADR rh#AdrianKeldorn1
@24 /* Azuth. */
DO ~SetGlobal("rh#AdrianKeldorn","GLOBAL",1)~
== BKELDOR @25 /* I beg your pardon? */
== BRH#ADR @26 /* Don't think that I can't feel your eyes on me, paladin. My patron god is Azuth. Not Shar, not Loviatar, not Xvim, and certainly not Cyric. If you have an issue with the Lord of Spells, take it up with his church. */
== BKELDOR @27 /* I did not mean to give offense. I am most glad to hear that you are not affiliated with the dark pantheon. */
== BRH#ADR @28 /* Wonderful. Then I take it you'll charge heroically at someone else? */
== BKELDOR @29 /* I do not appreciate your tone, Adrian, nor your blasphemous remark on my faith. I would suggest you look to your own. */
== BRH#ADR @30 /* And what exactly is that supposed to mean? */
== BKELDOR @31 /* For one whose god teaches calm and caution, you are surprisingly capricious. See to it that this attitude does not bleed into your approach to magic. */
== BRH#ADR IF ~!Class("rh#Adrian",CLERIC_MAGE)~ THEN @32 /* My faith is my own concern, Tormite. Stick to your own. */
== BKELDOR IF ~!Class("rh#Adrian",CLERIC_MAGE)~ THEN @33 /* Torm requires constant vigilance. I suggest you remember that. */
== BRH#ADR IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @34 /* Funny. He hasn't abandoned me yet. I would hope that you had noticed that. */
== BKELDOR IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @35 /* Aye, I have. Yet Torm requires constant vigilance. I suggest you remember that. */
EXIT

// Viconia #2
CHAIN IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianViconia2","GLOBAL",0)~ THEN BRH#ADR rh#AdrianViconia2
@36 /* I can only wonder how warm the Underdark is if the Amnish heat doesn't keep you from wearing that hood. */
DO ~SetGlobal("rh#AdrianViconia2","GLOBAL",1)~
== BVICONI @37 /* Hmph. It is a small price to pay to be spared the constant stares of the rivvil. Your people disgust me, jaluk. */
== BRH#ADR @38 /* Yes, well. I'm afraid mob lynching is a long established surface tradition. The goodly folk of the Realms enjoy nothing more than the burning or public dismemberment of an unsuspecting enemy caught in their midst. */
= @39 /* Perhaps we can find you some sort of magical disguise in time, but-- */
== BVICONI @40 /* Enough of this nonsense. You may bridge two cultures as if uncertain of where you truly stand, tu'rilthiir, but I will not pretend to be other than what I am. */
== BRH#ADR @41 /* I'll be sure to note that in your eulogy. */
== BVICONI @42 /* You lack the longevity such an undertaking would require. */
EXIT

// Aerie #1
CHAIN IF ~InParty("Aerie")
See("Aerie")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianAerie","GLOBAL",0)~ THEN BRH#ADR rh#AdrianAerie1
@43 /* It would seem that the elven predilection for magic takes root even in the most... unlikely of soils. */
DO ~SetGlobal("rh#AdrianAerie","GLOBAL",1)~
== BAERIE @44 /* What... what are you talking about? */
== BRH#ADR @45 /* You, girl. Where did you find the discipline to take up the study? You're certainly lacking in it now. */
== BAERIE @46 /* Back in the circus, Quayle-- */
== BRH#ADR @47 /* The gnome? Really? Imagine that, a-- */
== BAERIE @48 /* Don't talk about him! You'll only say horrible things! I... I can see it in your face! */
== BRH#ADR @49 /* Why, a trace of fire! How very impressive. Fine. I'll leave your precious mentor alone, though I dare say you would benefit from the tutelage of a more knowledgeable instructor. */
== BAERIE @50 /* You? But I... I don't-- */
== BRH#ADR @51 /* Me? Don't be ridiculous. I'd snap and murder you before the week was out. I still might, but-- */
== BAERIE @52 /* Just... stay away from me! */
EXIT

// Edwin #4
CHAIN IF ~InParty("Edwin")
See("Edwin")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("TalkedDegardan","GLOBAL",0) 
Global("rh#AdrianEdwin3","GLOBAL",3) 
Global("rh#AdrianEdwin4","GLOBAL",0)~ THEN BRH#ADR rh#AdrianEdwin4
@53 /* I have been wondering something, Edwin. Did they throw you out? */
DO ~SetGlobal("rh#AdrianEdwin4","GLOBAL",1)~
== BEDWIN @54 /* What? */
== BRH#ADR @55 /* The Red Wizards. Your ilk doesn't normally resort to seeking out foreigners for protection... much less courting rivals. Offering your services to whomever is most convenient so that when the sword falls, and fall it shall, you won't be alone. That is what this is, isn't it? */
== BEDWIN @56 /* Protection? You monkeys are fortunate that I have lowered myself to traveling with such lesser beings. Keeping you alive is a time consuming prospect, even for one of my prodigious talents. */
= @57 /* (Protection...! This half-breed pseudo-mage need only look in the mirror if he wants to find someone needing protection!) */
EXIT

// Anomen #4
CHAIN IF ~InParty("Anomen")
See("Anomen")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("Anomen",LAWFUL_NEUTRAL)
Global("rh#AdrianAnomen","GLOBAL",3)
Global("rh#AdrianAnomen4","GLOBAL",0)~ THEN BRH#ADR rh#AdrianAnomen4
@58 /* Delryn, if you don't stop staring at me like that, I'll have to assume that your tastes don't lie entirely with the fairer sex. */
DO ~SetGlobal("rh#AdrianAnomen4","GLOBAL",1)~
== BANOMEN @59 /* What are you-- */
== BANOMEN IF ~Class("rh#Adrian",SORCERER)~ THEN @60 /* I have no interest in you, sorcerer. You are simply... not as I would have expected. */
== BANOMEN IF ~!Class("rh#Adrian",SORCERER)~ THEN @61 /* I have no interest in you, wizard. You are simply... not as I would have expected. */
== BRH#ADR @62 /* What, would you rather I had claws and fangs? Would that make you more comfortable? */
== BANOMEN @63 /* I... I dare say it would. */
== BRH#ADR @64 /* Well, too damn bad. */
== BANOMEN @65 /* You frighten me, truly. In you I see the mirror of my own bitterness-- */
== BRH#ADR @66 /* Don't you *dare* compare our situations, Delryn. You know *nothing* of me. */
== BANOMEN @67 /* Aye, because you refuse to share. */
= @68 /* I do not wish to become like you, my lord, and I... truly, I can envision such a future if I do not guard against the darkness within my own heart. If you ever require help-- */
== BRH#ADR @69 /* So you would scorn me and then hold out a helping hand? You've outdone yourself for arrogance, priest. */
== BANOMEN @70 /* As you wish. I shall leave you be. */
EXIT

// Mazzy #1
CHAIN IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianMazzy1","GLOBAL",0)~ THEN BRH#ADR rh#AdrianMazzy1
@71 /* You must have some interests aside from this pointless and never-ending crusade against evil, Mazzy. */
DO ~SetGlobal("rh#AdrianMazzy1","GLOBAL",1)~
== BMAZZY @72 /* Pointless? Not so, my friend. Never-ending it may be indeed, yet even a single candle lit against the darkness bears light. */
== BRH#ADR @73 /* Hardly enough to make a difference. */
== BMAZZY @74 /* Perhaps in the grander scheme of things, that might seem to be true, but a difference was made for one person, one family... one village, perhaps. There is value enough in that. */
== BRH#ADR @75 /* So one person is saved and the rest of the world burns. Some victory. */
== BMAZZY @76 /* 'Tis no victory, merely a beginning. You are very cynical, Adrian. Might I ask why? */
== BRH#ADR @77 /* Because I've seen precious few of these magical candles of yours, except, I suppose, when people are trying to set me afire. But I was asking: what do you do when you're not busy failing to save the world? */
== BMAZZY @78 /* I do take some pleasure in worthwhile pursuits. For example, I enjoy games of strategy. */
== BRH#ADR @79 /* The littlest knight, playing war with toy soldiers. It's fitting, in a way. */
== BMAZZY @80 /* That was cruel and uncalled for, Adrian. I shall forgive you this once, but I expect that the slight will not be repeated. */
EXIT

// Valygar #1
CHAIN IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Dead("Lavok02")
Global("rh#AdrianValygar","GLOBAL",0)~ THEN BRH#ADR rh#AdrianValygar1
@81 /* Stop glowering, Corthala. It does nothing for you. */
DO ~SetGlobal("rh#AdrianValygar","GLOBAL",1)~
== BVALYGA @82 /* Throw your barbs elsewhere. I know you for what you are. */
== BRH#ADR @83 /* Do you? Well, you might as well share. */
== BVALYGA IF ~Class("rh#Adrian",SORCERER)~ THEN @84 /* Sorcery... I've heard it said that it's even worse than more conventional forms of magic, that it is instinctive, a part of its user rather than something learned. */
== BRH#ADR IF ~Class("rh#Adrian",SORCERER)~ THEN @85 /* If you're expecting me to grow wings and a tail, I'm afraid I'm going to have to disappoint you. */
== BVALYGA IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @86 /* You do not simply practice magic... you worship it. I can think of few things more dangerous. */
== BRH#ADR IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @87 /* And yet you goad me anyway. */
== BVALYGA IF ~!Class("rh#Adrian",SORCERER) !Class("rh#Adrian",CLERIC_MAGE)~ THEN @88 /* You are volatile, wizard. I can think of few things more dangerous than an unstable mage. */
== BRH#ADR @89 /* I'm not one of your mad relatives, Valygar. It may well be that there was a weakness in the Corthala blood, but not all practitioners are so susceptible. */
== BVALYGA @90 /* Aye, perhaps not, but some are, and I would count you amongst that unhappy number. There's an arrogance to your approach to magic. */
= @91 /* You already teeter at the edge of the cliff that claims so many of your kind. Take care lest your magic drive you over entirely. */
== BRH#ADR @92 /* There's no cliff I haven't already seen the bottom of, ranger. Go find another mage to harass pointlessly. */
EXIT

// Cernd #1
CHAIN IF ~InParty("Cernd")
See("Cernd")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Cernd",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianCernd1","GLOBAL",0)~ THEN BRH#ADR rh#AdrianCernd1
@93 /* It's been much too long since I last kept the company of a decent druid. */
DO ~SetGlobal("rh#AdrianCernd1","GLOBAL",1)~
== BRH#ADR IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @94 /* Well, one who wasn't also a Harper, that is. */
== BCERND @95 /* Your tone of voice tells me that I may not enjoy the path this conversation takes. */
== BRH#ADR @96 /* Have some faith, Cernd. I take it you are as skilled with herbs and spices as the rest of your order? */
== BCERND @97 /* One man cannot hope to uncover all of nature's secrets, but as the squirrel gathers nuts for the coming winter, so have I gathered the knowledge that she sees fit to bestow upon me. If you would like some instruction in the finer aspects of plant lore-- */
== BRH#ADR @98 /* What? No, no. Nothing like that. I suppose it's unlikely that anything particularly exotic can be found within the boundaries of this useless country, but you would know more about the... various manners in which plants can be combined, and the... effects that can be produced. */
== BCERND @99 /* Adrian, is there something you would like to tell me? */
== BRH#ADR @100 /* Excuse me? */
== BCERND @101 /* If you are suffering from an addiction, my friend, I would be happy to provide you with a concoction useful in fighting withdrawal symptoms. */
== BRH#ADR @102 /* Not for myself, you fool. I'm not... I'm not addicted to anything. Fine. Forget it. */
EXIT

// Imoen #1
CHAIN IF ~InParty("Imoen2")
See("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianImoen","GLOBAL",0)~ THEN BRH#ADR rh#AdrianImoen1
@103 /* I take it you only recently started practicing magic? */
DO ~SetGlobal("rh#AdrianImoen","GLOBAL",1)~
== BIMOEN2 IF ~OR(7) Class(Player1,MAGE_ALL) Class(Player1,7) Class(Player1,10) Class(Player1,13) Class(Player1,14) Class(Player1,17) Class(Player1,BARD_ALL)~ THEN @104 /* Yup. About the time we ended up in Baldur's Gate. I guess what with watching <CHARNAME> casting spells all the time, it was kind of inevitable. How'd you guess? */
== BIMOEN2 IF ~!Class(Player1,MAGE_ALL) !Class(Player1,7) !Class(Player1,10) !Class(Player1,13) !Class(Player1,14) !Class(Player1,17) !Class(Player1,BARD_ALL)~ THEN @105 /* Yup. About the time we ended up in Baldur's Gate. I guess after seeing enough of it, it was kind of inevitable. How'd you guess? */
== BRH#ADR @106 /* You lack the... theoretical bent I'd have expected of a lifelong practitioner. */
== BIMOEN2 @107 /* You mean the stuffiness? Haha, yeah. That's never gonna happen. */
== BRH#ADR @108 /* Stuffiness, discipline, call it what you will... still, I suppose that you took to it rather quickly. That's quite impressive. */
== BIMOEN2 @109 /* Nah, I'm just that great. */
== BRH#ADR @110 /* I... see. */
= @111 /* I do still wonder if there's a spark of sorcery inside of you, driving that magical talent. You're the daughter of a god, so the origin is obvious enough. */
== BIMOEN2 @112 /* Eh... I'd like to think that I didn't get anything more than my good looks from my father. */
== BRH#ADR @113 /* A trace of copper dragon, then? You certainly have the temperament. */
== BIMOEN2 @114 /* Ha! That'd be something, wouldn't it? */
EXIT

// Viconia #4
CHAIN IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianViconia2","GLOBAL",1)
Global("rh#AdrianViconia4","GLOBAL",0)~ THEN BRH#ADR rh#AdrianViconia4
@115 /* I would not have expected a dark elf to take up the worship of a human goddess, Viconia. Might I ask why? */
DO ~SetGlobal("rh#AdrianViconia4","GLOBAL",1)~
== BVICONI @116 /* I do not care for such presumptuous questions, male. */
== BRH#ADR @117 /* Hmm. She does appeal to the exiled, I suppose. */
== BVICONI @118 /* Shall I assume that you are a follower of the Lady of Loss as well? */
== BRH#ADR @119 /* No. I've almost drifted in that direction once or twice, but... no. I am not given over to her completely. */
== BVICONI @120 /* Your struggle against her message is hopeless. You would be better served by accepting and embracing the worship of the Dark Goddess. */
== BRH#ADR @121 /* No conversion attempts, please, Viconia. I don't react well to them. Come, let's speak of something else. */
EXIT

// Anomen #6.1: (succeeding at his test)
CHAIN IF ~InParty("Anomen")
See("Anomen")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("Anomen",LAWFUL_GOOD) 
Global("rh#AdrianAnomen","GLOBAL",3)
Global("rh#AdrianAnomen6","GLOBAL",0)~ THEN BRH#ADR rh#AdrianAnomen6a
@122 /* Well, I suppose that's your life goal accomplished. If you'd like to end it all now and avoid inevitable disappointment, I'd be happy to lend a hand. */
DO ~SetGlobal("rh#AdrianAnomen6","GLOBAL",1)~
== BANOMEN @123 /* I shall have to reject your... kind offer, mage. */
= @124 /* My recent instatement into the Order offends you, I see. I am not surprised. Tell me: be it jealousy that motivates your harsh words? */
== BRH#ADR @125 /* Don't flatter yourself, knight. */
== BANOMEN @126 /* You are correct, of course. No doubt you have had prodigious success in all of your own endeavors. */
== BRH#ADR @127 /* My endeavors are none of your concern, Anomen. I suggest you mind your own affairs. */
== BANOMEN @128 /* Aye, I thought as much. */
EXIT

// Anomen #6.2:  (failing his test)
CHAIN IF ~InParty("Anomen")
See("Anomen")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("Anomen",CHAOTIC_NEUTRAL)
Global("rh#AdrianAnomen","GLOBAL",3)
Global("rh#AdrianAnomen6","GLOBAL",0)~ THEN BRH#ADR rh#AdrianAnomen6b
@129 /* You shouldn't be so hard on yourself, Anomen. */
DO ~SetGlobal("rh#AdrianAnomen6","GLOBAL",1)~
== BANOMEN @130 /* Hard on myself? Sudden concern from one such as you, mage? If you think to drag me into the darkness entirely-- */
== BRH#ADR @131 /* I have better things to do, Helmite. */
= @132 /* ...actually, come to think of it, I suppose I don't, but I've never had much of a taste for corruption. */
== BANOMEN @133 /* I find that difficult to believe. */
== BRH#ADR @134 /* If you dropped that mindless paladin mentality entirely, you'd find a great many things less difficult, Anomen. */
== BANOMEN @135 /* I did not ask for your advice. */
== BRH#ADR @136 /* Then consider it a gift freely given. I don't make many of those. */
== BANOMEN @137 /* That is fortunate for the would-be recipients. */
EXIT

// Yoshimo #3
CHAIN IF ~InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianYoshimo3","GLOBAL",0)~ THEN BRH#ADR rh#AdrianYoshimo3
@138 /* Kara-Tur. I can't say I understand it, Yoshimo. I'm perhaps half a continent from home and it often feels too far. */
DO ~SetGlobal("rh#AdrianYoshimo3","GLOBAL",1)~
== BYOSHIM @139 /* Ahh, but I have come to feel that the road is my home, friend Adrian. The places in between merely scenery to enjoy. */
== BRH#ADR @140 /* And people to deceive, no doubt. */
== BYOSHIM @141 /* Blessed are the unwary, my friend. */
== BRH#ADR @142 /* Yes, well. They do make the job easier, don't they? */
== BYOSHIM @143 /* Souvenirs. */
== BRH#ADR @54 /* What? */
== BYOSHIM @144 /* Souvenirs, friend. To help you feel closer to home. A bottle of strong sake, a finely wrought katana... ah, there is nothing more important to those of us in exile. */
== BRH#ADR @145 /* If I bought a child's toy castle, froze it in ice, and smashed it on the ground, it might be appropriate. */
== BYOSHIM @146 /* Ah. I suppose souvenirs are healthier for some than for others. */
EXIT

// Edwin #5
CHAIN IF ~InParty("Edwin")
See("Edwin")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY]) 
!Gender("Edwin",FEMALE)
Global("rh#AdrianEdwin3","GLOBAL",3) 
Global("rh#AdrianEdwin5","GLOBAL",0)~ THEN BRH#ADR rh#AdrianEdwin5
@147 /* You don't look particularly good, Edwin. Did you catch something from that whore the other night? */
DO ~SetGlobal("rh#AdrianEdwin5","GLOBAL",1)~
== BEDWIN @148 /* Bah! As if a man of my talents would need to resort to propositioning harlots. The wench was willing and eager, and who can blame her? */
== BRH#ADR @149 /* I suppose enough coin can make anyone attractive. */ 
== BEDWIN @150 /* You would know, wouldn't you? */
== BRH#ADR @151 /* I should tell you, I used to have a rival who liked to frequent a certain festhall back home... at least until I slipped a courtesan a knife and a generous handful of gold. Needless to say, I didn't have a rival after that. */
== BEDWIN @152 /* Is that a threat? */
== BRH#ADR @153 /* Don't flatter yourself. If it were, I wouldn't have shared it. Consider it professional advice. */
== BEDWIN @154 /* Hmph. I have no need of advice from a second rate charlatan. */
== BRH#ADR @155 /* Then by all means, get yourself killed. */
EXIT

// Haer'dalis #2
CHAIN IF ~InParty("Haerdalis")
See("Haerdalis")
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianHaerDalis1","GLOBAL",1)
Global("rh#AdrianHaerDalis2","GLOBAL",0)~ THEN BRH#ADR rh#AdrianHaerDalis2
@156 /* Hells, bard! Could you tune that damn thing somewhere else? */
DO ~SetGlobal("rh#AdrianHaerDalis2","GLOBAL",1)~
== BHAERDA IF ~Class("rh#Adrian",SORCERER)~ THEN @157 /* Why, 'twould seem there be a musician hiding beneath yonder sharp beaked sorcerer! Perfect pitch, my shrike? */
== BHAERDA IF ~!Class("rh#Adrian",SORCERER)~ THEN @158 /* Why, 'twould seem there be a musician hiding beneath yonder sharp beaked wizard! Perfect pitch, my shrike? */
== BRH#ADR @159 /* Unfortunately so. */
== BHAERDA @160 /* Shall we buy you a harp, then? Teach you how to sing? */
== BRH#ADR @161 /* Buy me a harp, tiefling, and I'll break it over your forehead. */
== BHAERDA @162 /* Ha! A sight to see, I am sure. Mayhaps a flute. */  
EXIT

// Valygar #2
CHAIN IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Dead("Lavok02")
Global("rh#AdrianValygar","GLOBAL",1)~ THEN BRH#ADR rh#AdrianValygar2
@163 /* I wonder, ranger, is it yourself you are so afraid of? */
DO ~SetGlobal("rh#AdrianValygar","GLOBAL",2)~
== BVALYGA IF ~Class("rh#Adrian",SORCERER)~ THEN @164 /* Your words are as senseless as ever, sorcerer. */
== BVALYGA IF ~!Class("rh#Adrian",SORCERER)~ THEN @165 /* Your words are as senseless as ever, wizard. */
== BRH#ADR @166 /* Magic runs through your veins, Valygar. Very much as it does through mine. You could be more than what you are... infinitely so. Yet you hide away in the woods, ignoring power, wealth, prestige... everything due to you. */
== BVALYGA @167 /* I've no interest in such things. */
== BRH#ADR @168 /* But it's more than that, isn't it? You're afraid. Afraid of yourself, of what you might become if you take up your birthright. You might as well admit it, Corthala. */
== BVALYGA @169 /* I will *never* be like Lavok. Or like you. */
== BRH#ADR @170 /* If you refuse to even run the risk of it, you'll never be much of anything at all. But perhaps you like hiding away from reality. */
== BVALYGA @171 /* I am content with what I have. Unlike you, I don't need to grasp until I topple to my doom. */
EXIT

// Mazzy #3
CHAIN IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianMazzy1","GLOBAL",1)
Global("rh#AdrianMazzy3","GLOBAL",0)~ THEN BRH#ADR rh#AdrianMazzy3
@172 /* Dammit, I forget how much I hate walking everywhere. */
DO ~SetGlobal("rh#AdrianMazzy3","GLOBAL",1)~
== BMAZZY IF ~Class("rh#Adrian",SORCERER)~ THEN @173 /* Your complaints will not shave hours off of the journey, sorcerer. */
== BMAZZY IF ~!Class("rh#Adrian",SORCERER)~ THEN @174 /* Your complaints will not shave hours off of the journey, wizard. */
== BRH#ADR @175 /* You don't say. Really, though. You'd think some horses would be within our budget. */
== BMAZZY @176 /* You can ride? */
== BRH#ADR @177 /* I was a Zhentarim skymage. Of course I can ride. */
== BMAZZY @178 /* Some hideous flying fiend, no doubt. Adrian, you know full well that unless your gesture be one of repentance, I do not wish to hear of your time spent with that organization. */
== BRH#ADR @179 /* Yes, because we all know that the mere thought of my wicked ways will stain your shiny halo black. */
== BMAZZY @180 /* It is not my "halo," as you put it, that worries me, so much as your continued existence, and the likelihood thereof. */
== BRH#ADR @181 /* Ah. Point taken. */
EXIT

// Aerie #2
CHAIN IF ~InParty("Aerie")
See("Aerie")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianAerie","GLOBAL",1)~ THEN BRH#ADR rh#AdrianAerie2
@182 /* Here. */
DO ~SetGlobal("rh#AdrianAerie","GLOBAL",2)~
== BAERIE @183 /* What... what is this stack of books? */
== BRH#ADR @184 /* Hopefully my solution to the problem that is *you*. Levitation. Overland flight. Alter self. You'll need to be a lot more powerful to make them permanent, of course, but something is better than nothing. */
= @185 /* Magical beasts are an option too... I'd suggest pegasi. Useful creatures when you can keep them from biting you... though they'd probably like you. They tend to appreciate the pure, virginal, helpless, and pathetic. */
== BVICONI IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @186 /* Why do you even bother, jaluk? The poor little bird is determined to be miserable. */
== BAERIE @187 /* But... none of these things would restore my wings. */
== BRH#ADR @188 /* So what? Flight is still flight. Trust me, I know. */
== BAERIE @189 /* You've flown before? */
== BRH#ADR @190 /* Aforementioned pegasus. */
== BAERIE @191 /* Then you don't know! It's not the same! To have to rely on magic, where I once... can't you see that it isn't the same? */
= @192 /* To... to be able to fly again for a moment and then lose it... I... in some ways, that might be worse than never flying again at all! */
== BRH#ADR @193 /* Fine, then. Wallow in your self-pity. I only hope that you'll still be able to see our enemies through your tears. */
= @194 /* Or not. */
== BJAHEIR IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @195 /* Must you ruin every kind gesture with such viciousness? */
== BRH#ADR IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @196 /* Apparently so. */
EXIT

// Nalia #3 
CHAIN IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianNalia","GLOBAL",2)~ THEN BRH#ADR rh#AdrianNalia3
@197 /* Has anyone seen that ivory rimmed mirror I bought from that Chessentan merchant? */
DO ~SetGlobal("rh#AdrianNalia","GLOBAL",3)~
== BNALIA @198 /* I gave it away. */
== BRH#ADR @199 /* You... what? */
== BNALIA @200 /* Are your ears not working, Adrian? I gave it away. What are you, some debutante attending her first ball? You didn't need it. If you care that much, you can buy a more practical one at the next inn. */
== BRH#ADR @201 /* You can't just... That was mine! */
== BNALIA @202 /* So what? It was fine enough work to feed a homeless family for a week, and now it will. */
== BRH#ADR @203 /* ...it's more likely to feed an addiction to black lotus. */
== BNALIA @204 /* Such callousness is most unbecoming, Adrian. Think of how you would feel if the situations were reversed. */
== BRH#ADR @205 /* You really are an insufferably pretentious little bitch, aren't you? Touch my things again, princess, and you'll lose your fingers. Don't think I won't trap them. */
== BNALIA @206 /* Oh, grow up, my lord. Now you're just being petty. */
EXIT

// Minsc #2
CHAIN IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianMinsc","GLOBAL",1)~ THEN BRH#ADR rh#AdrianMinsc2
@207 /* I always thought it was Rashemaar custom to leave one's hair long. To better distinguish oneself from the bald freaks of Thay, I'd imagine. */
DO ~SetGlobal("rh#AdrianMinsc","GLOBAL",2)~
== BMINSC @208 /* You have been to Rashemen, little elf? */
== BRH#ADR @209 /* Ah, no. I once overheard several Thayvians in Mulmaster ridiculing the... hairy northern barbarians, as they put it, too brainless to wield a razor. Their words, not mine. */
== BMINSC @210 /* You should have slain the nasty wizards for their insults! */
== BRH#ADR @211 /* That would have gone over very well, I'm sure. But your hair? */
== BMINSC @212 /* Dyna... my witch used to take care of it, before I...I failed her. There was a battle, and... I was hit on the head! My hair could not be saved. Health hazard, Boo says. He would know. */
== BRH#ADR @213 /* I... see. That actually explains a great many things. My thanks. */
EXIT

// Keldorn #5
CHAIN IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianKeldorn","GLOBAL",4)~ THEN BRH#ADR rh#AdrianKeldorn5
@214 /* Sir Keldorn, could I speak with you for a moment? */
DO ~SetGlobal("rh#AdrianKeldorn","GLOBAL",5) IncrementGlobal("rh#Adfyfyriad","GLOBAL",1)~
== BKELDOR @215 /* Aye, I would be glad to give counsel. */
== BRH#ADR @216 /* Desired or otherwise... yes, I've noticed. And you needn't look so eager, I just-- */
= @217 /* You paladin types are honor-bound not to manipulate, exploit, or otherwise betray confidences, aren't you? */
== BKELDOR @218 /* Even were it otherwise, I would not stoop to such methods. */
== BRH#ADR @219 /* Right. Of course not. */
= @220 /* I... suppose I've just been thinking about some of the things you've said of late. And you're right, you know. About quite a bit of it. As much as I hate to admit that. */
== BKELDOR @221 /* Acknowledging one's own mistakes is often the most difficult thing a man can do. */
== BRH#ADR @222 /* I can't really deny that I've made enough of those these past two years. */
== BKELDOR @223 /* And before that? */
== BRH#ADR @224 /* ...you won't like what you hear, paladin. If you expect me to repudiate my entire past, I'm going to have to disappoint you. */
== BKELDOR @225 /* Repudiate? Nay. You will need to bear the burden of your past crimes, Adrian. None can relieve you of that weight, but 'twould be wiser to accept the truth of things. */
== BRH#ADR @226 /* A burden, is it? You might be surprised, old man, but I've never seen the point in arguing with a paladin. */
= @227 /* No offense intended, my lord. Let's just... drop this conversation before it gets out of hand. */
EXIT

// Korgan #2
CHAIN IF ~InParty("Korgan")
See("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianKorgan","GLOBAL",1)~ THEN BRH#ADR rh#AdrianKorgan2
@228 /* Stop hoarding the mead, Korgan. It's my money you used to buy it. */
DO ~SetGlobal("rh#AdrianKorgan","GLOBAL",2)
RealSetGlobalTimer("rh#AdrianKorganTalkTimer","GLOBAL",3600)~
== BKORGAN @229 /* Consider it a service to yer dainty constitution, elf. Isn't yer lot supposed to be sipping them finer drinks anyway? */
== BRH#ADR @230 /* It... has occurred to you by now that I'm half human, I hope. Though I should not be surprised if it hasn't. */
== BKORGAN @231 /* Half human? Are ye now? I guess that'd explain yer whimsies. Some days I think ye a kindred spirit, an' others yer just another prissy, arrogant elfling. */
== BRH#ADR @232 /* As opposed to you, my dear dwarf, who, while irritating, repulsive, and small-minded, at least has the grace to be so consistently. */ 
== BKORGAN @233 /* Yer insults would go over better if ye used a few less words, ye know. */
== BRH#ADR @234 /* You're a disgusting imp, a poor excuse for a dwarf, and if I'm not mistaken, a small family of rats has taken up residence in that unkempt mess you have the audacity to call a beard. I'd check for you if I didn't want to catch a disease. */
== BKORGAN @235 /* Aye, that's more like it, boy! Though I think yer elf blood still be obvious. If we spilt a bit, mayhap ye'd finally be good company. */
EXIT

// Cernd #3
CHAIN IF ~InParty("Cernd")
See("Cernd")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Cernd",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
TimeOfDay(NIGHT)
OR(8) AreaCheck("AR0020") AreaCheck("AR0300") AreaCheck("AR0500") AreaCheck("AR0700") AreaCheck("AR0900") AreaCheck("AR1000") AreaCheck("AR1600") AreaCheck("AR2000")
Global("rh#AdrianCernd3","GLOBAL",0)~ THEN BRH#ADR rh#AdrianCernd3
@236 /* So, are you ready for a bit of moon howling tonight, Cernd? It's just about full. */
DO ~SetGlobal("rh#AdrianCernd3","GLOBAL",1)~
== BCERND @237 /* In the middle of the city? I am surprised that you do not find even the suggestion too undignified. */
== BRH#ADR @238 /* I wasn't volunteering. I just want to watch. It isn't as if half the city can't tell that you're not quite right. */
== BCERND @239 /* In the greater scheme of things, the opinions of city-dwellers are of little importance. Their words are but the rustle of wind on-- */
== BRH#ADR @240 /* Yes, yes. Insert metaphor here. So no moon howling? */
== BCERND @241 /* No moon howling. Unless... */
== BRH#ADR @242 /* Unless? */
== BCERND @243 /* Unless you were to join me. */
== BRH#ADR @244 /* Really? I... ah, am not sure <CHARNAME> would appreciate such a display... */
END
	++ @245 /* Oh, I think it's a marvelous idea. */ EXTERN BRH#ADR rh#AdrianCernd3a
	++ @246 /* I'm not helping you out of this one, Adrian. */ EXTERN BRH#ADR rh#AdrianCernd3a
	++ @247 /* Grow up already. Both of you. */ EXTERN BRH#ADR rh#AdrianCernd3a

CHAIN BRH#ADR rh#AdrianCernd3a
@248 /* Beseiged on all sides! Heh, maybe next month. */ 
EXIT

// NPC initiated

// Aerie

// 3.
CHAIN IF WEIGHT #30 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianAerie","GLOBAL",2) ~ THEN BAERIE rh#AdrianAerie3
@249 /* I... um... Adrian, I wanted to know... */
DO ~SetGlobal("rh#AdrianAerie","GLOBAL",3)~
== BRH#ADR @250 /* Unless you wanted to know exactly how much frightened stammering it takes to drive me to homicide, I suggest you stop now. */
== BAERIE @251 /* I-I'm sorry! I just thought that we were somewhat similar... that... */
== BRH#ADR @252 /* That what? That being enslaved to a sadistic archmage is remotely like being a circus attraction? */
== BAERIE @253 /* But you were only there for a f-few weeks! I was enslaved for years! Of all people, you should understand what I'm going through! */
== BRH#ADR @254 /* Do you want me to commiserate, then? To tell you I still think you're beautiful despite the mutilation, to indulge you in your fantasies, to whine at the world for being such a cruel place? */
= @255 /* I don't give a damn what you're going through, Aerie. You're still a slave. You haven't the strength to be anything else. And I'm not you, girl. I'm *not*, and I won't let you pretend that I am. */
== BAERIE @256 /* You're a cruel, cruel man, Adrian! Just b-because you can't handle your own problems d-doesn't mean you get to take them out on me! */
EXIT

// Anomen

// 1.
CHAIN IF WEIGHT #30 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianAnomen","GLOBAL",0)~ THEN BANOMEN rh#AdrianAnomen1
@257 /* 'Tis a good thing that <CHARNAME> thought to include a spellcaster amongst <PRO_HISHER> allies, though I would do well to remind you to stay well away from the melee fighting. I will protect you as best I am able, of course, but the battlefield is often a chaotic place. */
DO ~SetGlobal("rh#AdrianAnomen","GLOBAL",1)~
== BRH#ADR @258 /* I have been in combat before, Anomen. */
== BANOMEN @259 /* I am glad to hear it. An experienced comrade is worth a dozen recruits. I myself have been in battle more often than not these past few years. It is no small undertaking to prove one's worth to the Order of the Radiant Heart. */
== BRH#ADR @260 /* So I have heard. At length. */
== BANOMEN @261 /* Your tone is light but your words are cold, sir. If you would prefer to continue in silence, I shall not distract you from the pressing nature of your thoughts. */
EXIT

// 2.
CHAIN IF WEIGHT #40 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianAnomen","GLOBAL",1)~ THEN BANOMEN rh#AdrianAnomen2
@262 /* Adrian, your scorn is unwarranted, and I do not appreciate your thinly veiled disdain. You would do better to admire and even attempt to emulate my righteous conduct. */
DO ~SetGlobal("rh#AdrianAnomen","GLOBAL",2)~
== BRH#ADR @263 /* I'd admire it more from a distance, Helmite. Don't ask me to emulate it, though. */
== BANOMEN @264 /* I do not care for such contempt, wizard. I shall ask you but once: What problem do you have with me? */
== BRH#ADR @265 /* What problem? I try not to think about you at all, Anomen. Now, if you would wander off and harangue someone else, I assure you, we would both be happier. */
== BANOMEN @266 /* You will not brush me off so easily, warlock. */
== BRH#ADR @267 /* No? Apparently not. */
= @268 /* You know, I thought I had seen the last of self-important, sanctimonious knights when I was thrown out of Cormyr, but it seems that I was wrong. I can't quite decide which order is more annoying, but you're making a fairly strong argument for the Radiant Heart. */
== BANOMEN @269 /* You had best watch your tongue, mage. I shall not stand here and allow you to besmirch the honor of my order. */
== BRH#ADR @270 /* Then find someone else to regale with your heroic stories. */
EXIT

// 3.
CHAIN IF WEIGHT #50 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianAnomen","GLOBAL",2)~ THEN BANOMEN rh#AdrianAnomen3
@271 /* ...come morning, we awoke to discover ourselves surrounded by a band of ogres. Sir Randal had been called away on urgent matters the night before and had left me in command of the small company. 'Twas a great responsibility for a lowly squire, but naturally I-- */
DO ~SetGlobal("rh#AdrianAnomen","GLOBAL",3)~
== BRH#ADR @272 /* Oh, hells. I wander off for a minute and this is what I come back to? */
== BANOMEN @273 /* You are welcome to wander off again, warlock. */
== BRH#ADR @274 /* Tell me, oh courageous one. Have you ever fought an army of dragons? */
== BANOMEN @275 /* Of course not. Surely you realize that there has not been a full flight of dragons sighted in Amn within the last-- */
== BRH#ADR @276 /* No, I didn't think so. I can't really say I have either, I suppose. I might have aimed a fireball or two at one of the winged beasts, but I didn't stay around to see where they landed. */
== BANOMEN @277 /* Do you mean to imply that you are a deserter? */
== BRH#ADR @278 /* Well, it wasn't quite desertion, but I suppose it was close. I doubt Torm would have been thrilled with my conduct, but I was a bit too preoccupied with not getting blasted into ice to put much thought into it. */
= @279 /* It would have been nice to have such a brave squire at my back. */
== BANOMEN @280 /* Surely you cannot believe that-- */
== BRH#ADR @281 /* Of course, I suppose the nearest paladins were likely considering taking advantage of the debacle and attacking as well. Not that there was much of anything left to attack by that point. */
== BANOMEN @282 /* A city such as yours surely brought such disaster upon itself. */
== BRH#ADR @283 /* So I've heard. More than once. Funny, that doesn't make the memory any easier. */
EXIT

// Cernd

// 2.
CHAIN IF WEIGHT #15 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Cernd",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianCernd2","GLOBAL",0) Global("CerndBaby","GLOBAL",1)~ THEN BCERND rh#AdrianCernd2
@284 /* You have been watching me carefully for the past hour, Adrian. Do you too intend to offer unwanted advice concerning how I should raise my son? */
DO ~SetGlobal("rh#AdrianCernd2","GLOBAL",1)~
== BRH#ADR @285 /* What? No. I could care less if you drowned the thing. If you want some advice, though, I'd say make a decision and keep it: either go be a proper father or abandon him entirely. Preferably the latter. I suspect he would be better off by far without an obsessive woodsman for a father anyway. */
== BCERND @286 /* Shall I assume that your father was a druid? */
== BRH#ADR @287 /* Elven ranger. */
== BCERND @288 /* He must be very proud of you. */
== BRH#ADR @289 /* I'm sure he'd be horrified. Is that it, or did you want advice on proper hygiene and wardrobe choices? You could probably use it. */
== BCERND @290 /* No, thank you. But if you had no interest in Ahsdale, why have you been watching me? */
== BRH#ADR @291 /* I guess I've been replaying that scene back at the house in my mind. "Rip your throat out, drain your lifeblood," and whatever other entertaining imagery you managed to throw in. Hells, I'm not certain how I kept from laughing. */
== BCERND @292 /* Ah. Yes. Fortunately, as the sea returns to calm even after the most violent of storms, the rage seems to have passed for now. */
== BRH#ADR @293 /* Typical. I almost liked you for once. */
EXIT

// Edwin

// 1.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianEdwin1","GLOBAL",0)~ THEN BEDWIN rh#AdrianEdwin1
@294 /* Adrian, is it? I see now that <CHARNAME> can't even pick companions properly without my expert input. */
DO ~SetGlobal("rh#AdrianEdwin1","GLOBAL",1)~
== BEDWIN IF ~Class("rh#Adrian",SORCERER)~ THEN @295 /* Well, sorcerer, even one as lowly as you will no doubt benefit at least somewhat from my superior experience, skill, and understanding. */
== BEDWIN IF ~!Class("rh#Adrian",SORCERER)~ THEN @296 /* Well, even one as lowly as you will no doubt benefit at least somewhat from my superior experience, skill, and understanding. */
== BRH#ADR @297 /* And what superior experience, skill, and understanding would that be, Red Wizard? */
== BEDWIN @298 /* I will take that as a request to fill the woeful gaps in your evidently deficient education. */

== BEDWIN IF ~Class("rh#Adrian",SORCERER)~ THEN @299 /* Were you not so obviously ignorant of the ways of magic, you would know that a true mage makes full study of the powers that a charlatan such as yourself only brushes against, as if by accident. */
== BRH#ADR IF ~Class("rh#Adrian",SORCERER)~ THEN @300 /* And there it is. The typical Thayvian fear of any magic that can't be distilled, analyzed, possessed, and controlled. You can keep your spellbooks and your circle magic, and preferably your own company, wizard. I'm not interested. */

== BEDWIN IF ~!Class("rh#Adrian",SORCERER)~ THEN @301 /* Were you not so obviously ignorant of the ways of magic, you would know that the Thayvian education surpasses all others. */
== BRH#ADR IF ~!Class("rh#Adrian",SORCERER)~ THEN @302 /* Thayvian arrogance, at its very best. You can keep your spellbooks and your circle magic, and preferably your own company. I'm not interested. */

== BEDWIN @303 /* Bah! You no doubt lack the intellectual capacity to even appreciate such company. (<CHARNAME>'s taste in traveling companions continues to deteriorate, I see.) */
EXIT

// 2. 
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
!Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianEdwin1","GLOBAL",1)
Global("rh#AdrianEdwin2","GLOBAL",0)~ THEN BEDWIN rh#AdrianEdwin2
@304 /* I take it from your barely coherent comments earlier that you have some familiarity with my culture. Perhaps you have even had the illustrious privilege of meeting those of my order before. (Pity they couldn't teach the fool respect.) */
DO ~SetGlobal("rh#AdrianEdwin2","GLOBAL",1)~
== BRH#ADR @305 /* I have had that dubious pleasure, yes. */ 
== BEDWIN @306 /* Interesting. Interesting. Deplorable company though you may be, you remain preferable to the rest of these idiots. */
= @307 /* Make yourself useful and grab us some wine so that we may speak of more interesting matters than the endless dungeon crawls that <CHARNAME> seems to take such mindless pleasure in. */
== BRH#ADR @308 /* I've been upgraded from blundering fool to junior wizard, have I? What do you want, Edwin? */
== BEDWIN @309 /* Bah! Why do you assume that I want anything? */
== BRH#ADR @310 /* I honestly cannot believe you just said that. */
== BEDWIN @311 /* Hmph. Very well. If I am to be denied the support of a competent junior mage, I shall have to make do with what is available. */
== BEDWIN IF ~Class("rh#Adrian",SORCERER)~ THEN @312 /* Sorcerer though you may be, you are at least not whispering platitudes to Torm or Sune every hour of the day and night, which is more than can be said for most inhabitants of this idiotic country. I shall therefore be gracious enough to forgive you your past trespasses, heinous though they were. (There. That should do it.) */
== BEDWIN IF ~!Class("rh#Adrian",SORCERER)~ THEN @313 /* I may question your dedication to the Art, but you are at least not whispering platitudes to Torm or Sune every hour of the day and night, which is more than can be said for most inhabitants of this idiotic country. I shall therefore be gracious enough to forgive you your past trespasses, heinous though they were. (There. That should do it.) */
== BRH#ADR @110 /* I... see. */
== BEDWIN @314 /* (Pity the fool is incapable of anything approaching eloquence.) */
EXIT

// 6.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianEdwin3","GLOBAL",3)
OR(2) Global("rh#AdrianEdwin4","GLOBAL",1) GlobalGT("TalkedDegardan","GLOBAL",0)
Global("rh#AdrianEdwin6","GLOBAL",0)~ 
THEN BEDWIN rh#AdrianEdwin6
@315 /* I have heard it said that your own god deserted you. He must have given up in disgust. Inconceivable to rely so upon a deity when you have access to magic, but then you fools always were second rate conquerors. (And third rate mages, if that.) */
DO ~SetGlobal("rh#AdrianEdwin6","GLOBAL",1)~
== BRH#ADR @316 /* How's the war against Rashemen and Aglarond coming? */
== BEDWIN @317 /* Bah! More worthy foes by far than the fearsome and untameable Daleland hicks. Are you incapable of burning down their fields quickly enough? Do their chickens attack you in the middle of the night? */
== BRH#ADR @318 /* I don't see you conquering those fields and chickens. Right, because all of the might of Thay can't get past a single sorceress. */
== BRH#ADR IF ~Class("rh#Adrian",SORCERER)~ THEN @319 /* I thought we were... what was it again? Ah, yes. Undisciplined charlatans without experience, skill, or understanding. */
== BRH#ADR IF ~!Class("rh#Adrian",SORCERER)~ THEN @320 /* I thought they were... how do you people put it? Ah, yes. Undisciplined charlatans without experience, skill, or understanding. */
== BEDWIN @321 /* The Simbul hardly qualifies a single sorceress-- */
== BRH#ADR @322 /* It must be treason to speak well of her. Though I suppose you've already committed that-- */  
== BJAHEIR IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @323 /* This constant bickering is enough to try anyone's nerves. Would the pair of you like some medals? A commendation from a world leader and perhaps a life sentence to go with it? */
== BEDWIN @324 /* Bah! This conversation is going nowhere. (No surprise, given the ape's intellect, or lack thereof.) */
EXIT

// 7.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("Edwin",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianEdwin5","GLOBAL",1)
Global("rh#AdrianEdwin6","GLOBAL",1)
Global("rh#AdrianEdwin7","GLOBAL",0)~ THEN BEDWIN rh#AdrianEdwin7
@325 /* Tell me, Zhent, what is it like to be sold into slavery? I've seen it happen to the worthless masses so often, but to one with a taste for power... what is it like to serve where you had expected to rule? */
DO ~SetGlobal("rh#AdrianEdwin7","GLOBAL",1)~
== BRH#ADR @326 /* ...are you considering a career change? You could walk down any street in Thay if you want advice. */
== BEDWIN @327 /* (Aha, see him flinch! That one hit a nerve!) Still, how could you stomach it? If you had had any sense of shame at all, you would have made them kill you. Better to die a wolf than let yourself become just another pitiful sheep for the slaughter. */
== BEDWIN IF ~Class("rh#Adrian",SORCERER)~ THEN @328 /* Nothing clever to say this time, sorcerer? Not that you've ever been particularly clever. Wait, what are you-- Is that a scroll of Feeblemind? YOU PUT THAT DOWN! */
== BEDWIN IF ~!Class("rh#Adrian",SORCERER)~ THEN @329 /* Nothing clever to say this time? Not that you've ever been particularly clever. Wait, what are you-- Is that a scroll of Feeblemind? YOU PUT THAT DOWN! */
END
	++ @330 /* If you don't shut up now, Edwin, that scroll is going to be the least of your problems. */ EXTERN BEDWIN rh#AdrianEdwin7.1
	++ @331 /* I won't have you wasting our scrolls on these petty squabbles, Adrian. */ EXTERN BRH#ADR rh#AdrianEdwin7.2
	++ @332 /* Enough! If you two can't get along, just stay away from each other. */ EXTERN BRH#ADR rh#AdrianEdwin7.2
	++ @333 /* This should be good. */ EXTERN BRH#ADR rh#AdrianEdwin7.3

CHAIN BEDWIN rh#AdrianEdwin7.1
@334 /* Bah! I am surrounded by imbeciles! */
= @335 /* Hide behind <CHARNAME>, you toothless worm. I doubt you have ever had the courage to stand on your own. */ 
EXIT

CHAIN BRH#ADR rh#AdrianEdwin7.2
@336 /* ...fine. */
= @337 /* You're no wolf, Edwin. You're a pathetic shadow of a man hoping that the color of his robes will hide the fact that they conceal nothing of worth or substance beneath. */
== BEDWIN @335 /* Hide behind <CHARNAME>, you toothless worm. I doubt you have ever had the courage to stand on your own. */ 
EXIT

CHAIN BRH#ADR rh#AdrianEdwin7.3
@338 /* ...I'm not here to entertain you, <CHARNAME>. */
= @337 /* You're no wolf, Edwin. You're a pathetic shadow of a man hoping that the color of his robes will hide the fact that they conceal nothing of worth or substance beneath. */
== BEDWIN @335 /* Hide behind <CHARNAME>, you toothless worm. I doubt you have ever had the courage to stand on your own. */ 
EXIT

// Haer'dalis

// 1. 
CHAIN IF WEIGHT #5 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianHaerDalis1","GLOBAL",0)~ THEN BHAERDA rh#AdrianHaerDalis1
@339 /* Well, my ebon feathered friend, 'twould seem that we twain are birds of a feather: each enslaved by an evil, sewer dwelling wizard, each rescued by yonder raven. Only you, I think, still carry with you the chains of your various servitudes. */
DO ~SetGlobal("rh#AdrianHaerDalis1","GLOBAL",1)~
== BRH#ADR @340 /* Take your wordplay elsewhere, bard. I'm not interested. */
== BHAERDA @341 /* For one with chaos in his soul, you are remarkably lacking in wit. */
== BRH#ADR IF ~Class("rh#Adrian",SORCERER)~ THEN @342 /* Whatever the origin of my sorcery may be, tiefling, I assure you, the chaos was stamped out of me long ago. */
== BRH#ADR IF ~!Class("rh#Adrian",SORCERER)~ THEN @343 /* Chaotic these days, am I? Don't think it's something I celebrate. */
== BHAERDA @344 /* Aye, and more's the pity. */
EXIT

// 3. 
CHAIN IF WEIGHT #15 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianHaerDalis2","GLOBAL",1)
Global("rh#AdrianHaerDalis3","GLOBAL",0)~ THEN BHAERDA rh#AdrianHaerDalis3
@345 /* You have gone quiet again, Adrian. What wretched demons haunt your thoughts today to make you so grim, I wonder? */
DO ~SetGlobal("rh#AdrianHaerDalis3","GLOBAL",1)~
== BRH#ADR @346 /* If I required counsel, bard, I wouldn't seek it from you. */
== BHAERDA @347 /* Aye, you would crawl on hand and knee to those who would tell you what you must be rather than what you might be. */
== BRH#ADR @348 /* If I bore you, you may take your attentions elsewhere, Planewalker. */
== BHAERDA @349 /* Boredom? Nay, you are many things, my shrike, but boring is not one of them. You have the bearing of a consummate actor, the ear of a musician, and there is a sense of ruin that clings to you like a fine mist. A fine study for any Doomguard, methinks. */
== BRH#ADR @350 /* Unless you'd like to explore a closer relationship with oblivion, I suggest you study me from afar, bard. */
== BHAERDA @351 /* Such fierce words and yet so little weight behind them! */
= @352 /* So be it. I shall leave you to your sullenness. */
EXIT

// Imoen

// 2.
CHAIN IF WEIGHT #5 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianImoen","GLOBAL",1)~ THEN BIMOEN2 rh#AdrianImoen2
@353 /* Jeeze, Adrian. Stop being so grumpy all the time. It's not like I didn't give you back your silly ring. */
DO ~SetGlobal("rh#AdrianImoen","GLOBAL",2)~
== BRH#ADR @354 /* I'm hardly being grumpy. */
== BIMOEN2 @355 /* Yeah, I suppose you'd use another name for it. Surly, maybe. Or piqued... that's a good one. You're a bit too young to be a crotchety old man yet, but maybe-- */
== BRH#ADR @356 /* Hells, Imoen. Don't you take *anything* seriously? */
== BIMOEN2 @357 /* Do you really want the answer to that? */
== BRH#ADR @358 /* Ah. No... of course. */
= @359 /* Still, couldn't you approach the Art with just a touch more dignity? */
== BIMOEN2 IF ~Class("rh#Adrian",SORCERER)~ THEN @360 /* Oh, come on. We can't all be mighty sorcerers, you know. */
== BIMOEN2 IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @361 /* Oh, come on. You don't have to be the mouthpiece for your god *all* the time, you know. */
== BIMOEN2 IF ~!Class("rh#Adrian",CLERIC_MAGE) !Class("rh#Adrian",SORCERER)~ THEN @362 /* Oh, come on. It's not like you don't pull the same tricks I do whenever you want. */
EXIT

// 3.
CHAIN IF WEIGHT #10 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianImoen","GLOBAL",2)~ THEN BIMOEN2 rh#AdrianImoen3
@363 /* So I hear you're an evil tyrant monster from the Moonsea. */
DO ~SetGlobal("rh#AdrianImoen","GLOBAL",3)~
== BRH#ADR @364 /* ...would you like to see my fangs? */
== BIMOEN2 @365 /* Ha! I remember old Gorion talking about your people a couple times. Memorable stories, especially considering how boring the normal ones were. */
== BRH#ADR @366 /* Nothing good, I hope. */
== BIMOEN2 @367 /* Nope. So I guess this is just another day on the job for you, isn't it? Vampires, evil wizards, drow, and everything else. */
== BRH#ADR @368 /* The soul stealing is a bit new. */
== BIMOEN2 @369 /* Yeah, I... I guess that's good to hear. Right, let's just... move on now. */
EXIT

// 4.
CHAIN IF WEIGHT #15 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianRomanceActive","GLOBAL",2)
Global("rh#AdrianImoen","GLOBAL",3)~ THEN BIMOEN2 rh#AdrianImoen4
@370 /* So what's going on with you and <CHARNAME> anyway? I guess I shouldn't be surprised she'd go for something a bit darker after everything, but-- */
DO ~SetGlobal("rh#AdrianImoen","GLOBAL",4)~
== BRH#ADR @371 /* That's a private matter, Imoen. */
== BIMOEN2 @372 /* Oh, come on! I'm family. I just want to make sure you don't hurt or betray her, or else-- */
== BRH#ADR @373 /* Or else there's a fireball with my name on it, I know. Don't worry, I intend no such thing. */
== BIMOEN2 @374 /* Good. I kind of like you, and I'd hate to have to go the holy vengeance route. Maybe you'll be good for each other. I hope so, at least. Anyway, carry on, tyrant monster. */
EXIT

// Jaheira

// 1.
CHAIN IF WEIGHT #46 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
!Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianJaheira1","GLOBAL",0)~ THEN BJAHEIR rh#AdrianJaheira1
@375 /* Speak your mind and be done with it, Adrian. I shall not have you stealing awkward glances at me. */
DO ~SetGlobal("rh#AdrianJaheira1","GLOBAL",1)~
== BRH#ADR @376 /* My apologies. I, ah... meant no disrespect by it. It's just that I... ah, well, hmm. It has been years since I had substantial contact with any of my elven kin. You're something of a novelty, I'm afraid. */
== BJAHEIR @377 /* That is unfortunate. I am, however, a poor substitute for half of your heritage. It would do you well to seek out elven company at some point. */
== BRH#ADR @378 /* I'm sure that would go over marvelously. */
== BJAHEIR @379 /* You sneer at the suggestion, I see. Do not be foolish; such anger is misplaced and will only hurt you. */
EXIT

// Jan 

// 1.
CHAIN IF WEIGHT #5 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianJan","GLOBAL",0)~ THEN BJan rh#AdrianJan1
@380 /* You know, Adrian, you remind me of my uncle. */
DO ~SetGlobal("rh#AdrianJan","GLOBAL",1)~
== BRH#ADR @381 /* Oh, not this again. */ 
== BJAN @382 /* I mean, the touch of blue in his hair was from dye, not from moon elven blood. At least, as far as I know, it wasn't. Never really heard of a successful elf and gnome marriage, though my Aunt Agnes did try for years. */
= @383 /* One of every type she could find... of course, that led to a bit of hide and seek, which she enjoyed well enough until this one dark elf decided to skip on the hiding part-- */
== BRH#ADR @384 /* I thought this story was about your uncle. */
== BJAN @385 /* Yes, and I'm glad you mentioned him! Uncle Elmer. Sad, sad fate. Always so focused on catching his reflection in the windows that he kept on walking into walls. Tried it once with a puddle in the middle of the street and, well, there was an incident with a horse and carriage... */
== BJAN IF ~Class("rh#Adrian",SORCERER)~ THEN @386 /* Anyway, that's beside the point. He was a mage, you see. Until he miscast Feeblemind and spent the rest of his life convinced he was a sorcerer. I mean, I know you really are a sorcerer... */
== BJAN IF ~!Class("rh#Adrian",SORCERER)~ THEN @387 /* Anyway, that's beside the point. He was a mage, you see. Until he miscast Feeblemind and spent the rest of his life convinced he was a sorcerer. */
== BRH#ADR @388 /* I honestly don't know why I put up with this. */
== BJAN @389 /* I'd say it's because of your generous nature and capacity for forgiveness, Annie. */
EXIT

// 2.
CHAIN IF WEIGHT #15 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianJan2","GLOBAL",0)~ THEN BJan rh#AdrianJan2
@390 /* You know, Annie, I've never spoken much with a Zhent before... */
DO ~SetGlobal("rh#AdrianJan2","GLOBAL",1)~
== BRH#ADR @391 /* You probably have. */
== BJAN @392 /* Well, that's true, I guess. But what I'm really itching to know... have you ever conquered anyplace before? I mean, personally. */
== BRH#ADR @100 /* Excuse me? */
== BJAN @393 /* Isn't that what you folk like to do? Take over cities, summon monsters, frighten small children? Well, frighten large children too. Plot, scheme, extort, scheme, enslave, scheme, conquer. Scheme. Scheme. C'mon, Annie, what's the point of keeping you around if you won't talk about it? */
== BRH#ADR @394 /* Stop calling me that! */
== BJAN @395 /* Sure, if you'll answer the question. */
== BRH#ADR @396 /* Maybe for an hour, and then you'll start annoying me again. */
== BJAN @397 /* Well, we can't have everything. Though I guess your people haven't quite figured that one out yet. */
= @398 /* Annie? Hey, watch it! You might trip! */
EXIT

// 3.
CHAIN IF WEIGHT #25 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianJan2","GLOBAL",1)~ THEN BJan rh#AdrianJan3
@399 /* I should tell you, Annie, there's this lovely town just outside of Eshpurta where we could set you up if you're ever feeling particularly tyrannical. */ 
DO ~SetGlobal("rh#AdrianJan2","GLOBAL",2)~
== BJAN IF ~InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @400 /* We could drop off red robes over there too... two mad wizards for the price of one, the tourists would come from all around. */
== BEDWIN IF ~InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @401 /* I am not listening to this idiocy. (Though I will note down the location for future reference...) */
== BRH#ADR @402 /* Will you shut up if I tell you a damn story? */
== BJAN @403 /* Why... you wound me, Annie! It would obviously depend upon how good the story is. */
== BRH#ADR @404 /* I... fine. Fine. */
== BRH#ADR IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @405 /* You'll enjoy this one, Harper. */
== BJAHEIR IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @406 /* I very much doubt that. */
== BRH#ADR @407 /* Hm. Recruitment tactics back home are a bit... mm, cutthroat. They enjoy assigning suicide missions and evaluating how prospective members go about accomplishing them. "Kill Elminster" has always been a popular one, for example. Before you ask... no, that wasn't my assignment. Though if it had been, I... well, no. Never mind. */
= @408 /* No... I was ordered to infiltrate the Cult of the Dragon. Not the sort of thing you'd expect, I imagine, but some of the psychopaths had been trying to win over one of the lizards back home. With their promises of undeath and world domination... honestly, if I were a dragon, I'd laugh one of the lunatics right out of my lair. Or eat him. */
= @409 /* It's not as hard to infiltrate the Cult as you might think... they tend to be so obsessed with their dracolich paradise that they don't bother to check credentials. "All shall fall in the face of our overwhelming insanity." Well, it might be harder for someone on a mission of love and peace, but that wasn't me. Also, I was half mad back then, so I fit in pretty well-- */
== BJAN @410 /* Sorry to break it to you, Annie, but you're still sounding pretty half mad here. */
== BRH#ADR @411 /* Very funny. Well, if you're going to interrupt, I'll just skip straight to the end. Two cells turned against each other and destroyed, and one very amused green dragon. It was as much luck as skill, I admit, but my superiors were quite happy. I can only hope you are too, gnome. */ 
== BJAN @412 /* Well, your presentation could use a bit of work, if you ask me, but I'll give it a 7 out of 10. */
EXIT

// Keldorn

// 2. 
CHAIN IF WEIGHT #9 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianKeldorn","GLOBAL",1)~ THEN BKELDOR rh#AdrianKeldorn2
@413 /* I have held my peace thus far, Adrian, but in good conscience, I can do so no longer. The robes you wear speak loudly for those who know where you once lived: red and black, the colors of Bane. */
DO ~SetGlobal("rh#AdrianKeldorn","GLOBAL",2)~
== BRH#ADR @414 /* Bane is dead, paladin. You should know that better than anyone. */
== BKELDOR @415 /* Aye, at Torm's hand during the Time of Troubles. But it is well known that more than a few of his followers refused to accept the truth of his death. Despite your claim to worship Azuth, I begin to suspect that you may be one of them. */
== BRH#ADR IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @416 /* Wouldn't that be lovely? A deluded priest of Bane beneath your very eyes. */
== BRH#ADR @417 /* I don't follow dead gods, Tormite, and you know full well that no true Banite would ever claim to worship anyone else at all. If I wear his colors, it's out of defiance, so you can take your witch hunt elsewhere. */
== BKELDOR @418 /* There are more productive ways of declaring one's opposition to Cyric than adopting even the symbolism of the Black Hand. */
== BRH#ADR @419 /* I don't care. Are we done yet, or do you plan on murdering me for a faith I may or may not have espoused ten years ago? */
== BKELDOR @420 /* I shall not hold the crimes of a church you have foresworn against you, Adrian. Commit no evil in my company and there need be no violence between us. Perhaps such an exercise in restraint will teach you the lessons in morality that life thus far has not. I can only pray that it is so. */
== BRH#ADR @421 /* Well, I was going to go burn down the Temple District, but when you put it that way... */
== BKELDOR @422 /* Adrian, your sarcasm is unbecoming and betrays more of your emotional state than you might like. Such defenses may have served you well in the past, but they now only hinder your growth-- */
== BRH#ADR @423 /* I may share a party with you, paladin, but you're welcome to keep your so-called wisdom to yourself. */
EXIT

// 3.
CHAIN IF WEIGHT #15 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianKeldorn","GLOBAL",2)~ THEN BKELDOR rh#AdrianKeldorn3
@424 /* I have put considerable thought into your current situation, and I must comment, whether you would have it or not. */
DO ~SetGlobal("rh#AdrianKeldorn","GLOBAL",3)~
== BRH#ADR @425 /* Wonderful. */
== BKELDOR @426 /* I am merely trying to help you, Adrian. You fell afoul of the Melvauntian slave trade, did you not? */
== BRH#ADR @427 /* If you intend to laugh at the irony, I don't want to hear it. */
== BKELDOR @428 /* I intend no such thing. Slavery is a vile crime, no matter the victim, but has it truly taught you nothing about how precious freedom is? How despicable are those who place no value on human dignity? */
== BRH#ADR @429 /* Those who do not successfully accumulate power will inevitable fall victim to those who have, Sir Keldorn. It's a fact of life, not a lesson to be learned. The rest is incidental. */
== BKELDOR @430 /* There is not enough conviction in your voice for me to think that you truly still believe that. No matter how much personal power one accumulates, there will always be another with more power, more contacts, or simply more luck. */
= @431 /* If you truly hope to safeguard yourself against harm, opposing those who commit evil is not only more effective, but will also prove more rewarding. */
== BRH#ADR @432 /* Yes, because a sword through the chest in the service of those too weak to defend themselves is a fine reward indeed. */
== BKELDOR @433 /* Death is inevitable regardless, but 'tis better to die for a righteous cause than an evil one. I only ask that you consider the full ramifications of your experiences, Adrian. I pray that you turn your life around whilst you still have the chance. */
EXIT

// 4.
CHAIN IF WEIGHT #18 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianKeldorn","GLOBAL",3)~ THEN BKELDOR rh#AdrianKeldorn4
@434 /* I would like to discuss your future, Adrian. */
DO ~SetGlobal("rh#AdrianKeldorn","GLOBAL",4)~
== BRH#ADR @435 /* Unless you intend to cut it short, I'm not interested. */
== BKELDOR @436 /* I shall ignore that. The path you are currently walking is more limited than you realize, and by all accounts, you have already followed it to its ultimate end: defeat. The question remains: what do you intend to do with your life once <CHARNAME>'s quest is finished? */
== BRH#ADR @437 /* Well, I keep on having these strange dreams about dracolichs. Perhaps the Cult of the Dragon-- */
== BKELDOR @438 /* Adrian. */
== BRH#ADR @439 /* I don't know, Keldorn. I haven't thought that far ahead. When I do, I assure you, you'll be the last to know. */
== BKELDOR @440 /* That you would instinctively mention a rival organization speaks for itself, I think. You are not a solitary creature, Adrian. You need purpose in your life. */
= @441 /* Will you spend your days moving between organizations, wasting yourself in the service of others' petty ambitions and cruelties until the lifestyle finally kills you? I don't believe you foolish enough to think that your masters or compatriots would mourn your passing. */
== BRH#ADR @442 /* I... enough, Tormite. Go bother someone who cares. */
== BKELDOR @443 /* If you persist in your current course, you may well find that your own pool of listeners has grown thin. */
EXIT

// Korgan

// 1.
CHAIN IF WEIGHT #3 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianKorgan","GLOBAL",0)~ THEN BKORGAN rh#AdrianKorgan1
@444 /* Bah! Another o' ye prancing magic types to try to keep breathin'. And a pansy elf at that to make it all the better! */
DO ~SetGlobal("rh#AdrianKorgan","GLOBAL",1)~
== BRH#ADR @445 /* You don't care for magic, dwarf? Have you ever heard a Wail of the Banshee in the middle of a pitched battle? One terrible scream, and everyone just drops like so many discarded marionettes. No swords, no wounds, no blood... just death itself. */
== BKORGAN @446 /* Har! Har! Ye've got an eye fer imagery, elf, I'll give ye that, even if ye do look a bit peaked. Still, a fine weapon, and the blood and gore ta go with it... Aye, that's livin'. */
== BRH#ADR @447 /* I almost never use magic when it's personal, Korgan. */
== BKORGAN @448 /* Aye, ye've got the right of it there, elfling. Ye've just got to learn that it's always personal. Always. */
EXIT

// Mazzy

// 2.
CHAIN IF WEIGHT #5 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianMazzy1","GLOBAL",1)
Global("rh#AdrianMazzy2","GLOBAL",0)~ THEN BMAZZY rh#AdrianMazzy2
@449 /* Come. Walk with me awhile. */
DO ~SetGlobal("rh#AdrianMazzy2","GLOBAL",1)
RealSetGlobalTimer("rh#AdrianMazzyTalkTimer","GLOBAL",3600)~
== BRH#ADR @450 /* As the lady doth command. */
== BMAZZY @451 /* I have done nothing to earn your scorn, Adrian. I wished merely to discuss your reasons for joining <CHARNAME>'s quest. */
== BRH#ADR @452 /* I have made no secret of them. */
== BMAZZY @453 /* And yet they remain ambiguous. Do you remain out of honor, to repay the debt you owe <CHARNAME> for your rescue? Or is it primarily personal vengeance that you seek? */
== BRH#ADR @454 /* ...obviously my only concern is that the insipid masses can sleep just a bit more soundly at night. */
= @455 /* One never knows what foul creature may one day slip into a maiden's bedchamber and slit her dainty throat. */
== BMAZZY @456 /* Must you always be so difficult? */
== BRH#ADR @457 /* Yes. I don't care for sanctimonious paladin nonsense, and you lay it on stronger than most... with less of a right to it. */
== BMAZZY @458 /* Why is it that you refuse to take me seriously, Adrian? I would expect that one of mixed heritage would be more sensitive to racial prejudices. */
== BRH#ADR @459 /* People who insult my heritage more than once tend to end up dead, halfling. You just hand out lectures. */
== BMAZZY @460 /* Should I challenge you to a duel of honor, then, my lord? */
== BRH#ADR @461 /* I don't fight fair, little paladin. You may well just die of shock and horror. */
== BMAZZY IF ~Class("rh#Adrian",SORCERER)~ THEN @462 /* I have seen you in combat before, sorcerer. Very well, I shall let the subject drop. For now. */
== BMAZZY IF ~!Class("rh#Adrian",SORCERER)~ THEN @463 /* I have seen you in combat before, wizard. Very well, I shall let the subject drop. For now. */
EXIT

// Minsc

// 3.
CHAIN IF WEIGHT #5 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianMinsc","GLOBAL",2)~ THEN BMINSC rh#AdrianMinsc3
@464 /* Boo does not understand. You do not look evil, you do not smell evil. Boo says that you do not taste evil... */
DO ~SetGlobal("rh#AdrianMinsc","GLOBAL",3)~
== BRH#ADR @465 /* Taste? Oh, I don't even want to know. */
== BMINSC @466 /* And yet everyone is saying such horrible things about you. That you... no. It is too awful to repeat. I cannot believe that you truly deserve a kick from the boots of goodness, but... how is it possible that everyone else is lying? I do not like puzzles. Neither does Boo... he does not have thumbs. */
== BRH#ADR @467 /* They speak of the past, Minsc. I was... mmm, ensorcelled. Terrible magics, but I have since been released. */
== BMINSC @468 /* Ensorcelled? Then you are not evil? */
== BRH#ADR @469 /* Nay, my soul is as pure as... as a very pure thing. */
== BMINSC @470 /* Ah, Minsc understands now. Boo says you are being... facetious, but we must give the little elf the benefit of the doubt. */
EXIT

// Nalia

// 1.
CHAIN IF WEIGHT #3 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianNalia","GLOBAL",0)~ THEN BNALIA rh#AdrianNalia1
@471 /* You have the bearing of a nobleman, Adrian, as well as the arrogance and indifference that all too often accompany such breeding. Do I judge you correctly? */
DO ~SetGlobal("rh#AdrianNalia","GLOBAL",1)~
== BRH#ADR @472 /* Once upon a time. */
== BNALIA @473 /* Then you should recognize that while you take your luxuries for granted, others less fortunate resort to selling themselves on the street and other, equally unpleasant tasks merely to keep from starving. Your birth does not make you better. */
== BRH#ADR @474 /* Nalia. Have you actually ever known hunger? */
== BNALIA @475 /* I... no. Of course not. */
== BRH#ADR @476 /* I have, so don't you dare throw that at me. As for the rest... unlike yours, the patriarch of my family clawed his way out of the middle class, perhaps half a century ago. */
== BNALIA @477 /* Really? How did he manage that? */
== BRH#ADR @478 /* By trampling down anyone who would challenge him. By winning the favor of powerful patrons. He had a collection of dead wives also, that might have been where some of the money came from. */
== BNALIA @479 /* I... I see. I will have to think on this further... excuse me. */
EXIT

// 2.
CHAIN IF WEIGHT #9 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianNalia","GLOBAL",1)~ THEN BNALIA rh#AdrianNalia2
@480 /* I have been thinking on what you said, Adrian. I cannot deny that there are places worse than Amn, but-- */
DO ~SetGlobal("rh#AdrianNalia","GLOBAL",2)~
== BRH#ADR @481 /* More idealistic drivel, princess? */
== BNALIA @482 /* ...but it is *rude* to interrupt. I don't understand your callousness. You were once sold into slavery, were you not? You should understand better than anyone how difficult it is for the lower classes to survive. */
== BRH#ADR @483 /* Yes, well, if they fight amongst themselves, the strongest will win, and those are the ones who might make something of themselves anyway. */
= @484 /* Myself, I would rather succeed through my own skill than rely upon the charity of some self-absorbed Amnish princess, so forgive me for thinking that the people who deserve success ought to also have the self-respect to get themselves out of trouble. Are we done here yet? */
== BNALIA @485 /* Like you got yourself out of trouble when that wizard imprisoned you? */
== BRH#ADR @486 /* I... I owe my life and loyalty to <CHARNAME>. I've never denied that. */
== BNALIA @487 /* I wasn't speaking of debts or pledges, my lord, but of common decency. Something with which you apparently have no familiarity. */
EXIT

// 4.
CHAIN IF WEIGHT #18 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianNalia","GLOBAL",3)~ THEN BNALIA rh#AdrianNalia4
@488 /* I don't know how <CHARNAME> puts up with you, Adrian. But I guess you're all sugar and sweetness to whatever few people meet your insane, incomprehensible criteria, and to the hells with anyone who doesn't. */
DO ~SetGlobal("rh#AdrianNalia","GLOBAL",4)~
== BRH#ADR @489 /* You obviously fall into the latter category, princess. */
== BNALIA @490 /* That's it, isn't it? I'm a threat to your disgusting worldview. You hate me because I like to help the less fortunate. You would rather sell them into slavery, wouldn't you? */
== BRH#ADR @491 /* Well, it does get them off the streets. */
== BNALIA @492 /* That's the most despicable thing I have ever heard. <CHARNAME> should have thrown you out as soon as <PRO_HESHE> found out what you were. Not that it wasn't distinctively obvious even beforehand. */
== BRH#ADR @493 /* It's no wonder <CHARNAME> appreciates my magical talents when the alternatives are so clearly lacking. */
== BNALIA IF ~Class("rh#Adrian",SORCERER)~ THEN @494 /* Your vile sorcery interests me even less than the rest of you. */
== BNALIA IF ~!Class("rh#Adrian",SORCERER)~ THEN @495 /* You haven't the slightest idea what you're talking about. */
== BNALIA @496 /* You're petty, arrogant, prejudiced, and altogether unpleasant company. The sooner <CHARNAME> recognizes that, the happier I will be. */
EXIT

// Valygar

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Dead("Lavok02")
Global("rh#AdrianValygar","GLOBAL",2)~ THEN BVALYGA rh#AdrianValygar3
@497 /* I have been thinking about Lavok again, wondering if-- */
DO ~SetGlobal("rh#AdrianValygar","GLOBAL",3)~
== BRH#ADR @498 /* Your obsession over your circus show of a family grows tedious, ranger. I won't deny that the story has a certain grotesquerie to it, but the endless self-indulgence is nauseating. */
== BVALYGA IF ~Class("rh#Adrian",SORCERER)~ THEN @499 /* And your lack of empathy borders on sociopathic, sorcerer. Are you done yet, or would you like to further display your ignorance? */
== BVALYGA IF ~!Class("rh#Adrian",SORCERER)~ THEN @500 /* And your lack of empathy borders on sociopathic, wizard. Are you done yet, or would you like to further display your ignorance? */
== BRH#ADR @501 /* ...that was almost funny. Tell me, Valygar, how long did it take you to think up that retort? A month? */
== BVALYGA @502 /* I spend less time thinking about you than you'd care to believe. Go bother someone else. */
EXIT

// Viconia

// 1.
CHAIN IF WEIGHT #46 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianViconia1","GLOBAL",0)~ THEN BVICONI rh#AdrianViconia1
@503 /* Direct your gaze elsewhere, male. I grow tired of your stare. */
DO ~SetGlobal("rh#AdrianViconia1","GLOBAL",1)~
== BRH#ADR @504 /* I'm hardly staring at you, Viconia. */
== BVICONI @505 /* Yet your eyes continue to settle upon me. Do not think me blind, surfacer. Does the sight of a drow evoke such dread in you that you forget all thought of courtesy... or is it perhaps lust that moves you? */  
== BRH#ADR @506 /* Don't flatter yourself. I've had dealings with your people before. Often enough to have learned not to trust a drow out of sight. */
== BVICONI @507 /* Then you are as foolish as the rest of your surfacer kin. It would seem that the blind stupidity of the rivvil and the endless prejudice of the darthiir have been perfectly united within you, half-breed. */
== BRH#ADR @508 /* Call me that again, elg'caress, and you may soon wish you were left upon that stake. */
== BVICONI @509 /* You speak the language of my people? */
== BRH#ADR @510 /* A few words. As I said, I've had dealings with them before. */
== BVICONI @511 /* Clearly not enough to improve your accent, jaluk. We shall speak further of this later. */
EXIT

// 3.
CHAIN IF WEIGHT #56 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Class("rh#Adrian",SORCERER)
Global("rh#AdrianViconia1","GLOBAL",1)
Global("rh#AdrianViconia3","GLOBAL",0)~ THEN BVICONI rh#AdrianViconia3a
@512 /* In the Underdark, we prize our sorcerers highly. There is a certain... vitality to your kind lacking in your more studious kindred. */
= @513 /* I sometimes wonder how much effort it would take to shatter your self-control, such as it is, jaluk... to break you and leave you begging beneath me. */
END
IF ~~ EXTERN BRH#ADR rh#AdrianViconia3c

CHAIN IF WEIGHT #57 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
!Class("rh#Adrian",SORCERER)
Global("rh#AdrianViconia1","GLOBAL",1)
Global("rh#AdrianViconia3","GLOBAL",0)~ THEN BVICONI rh#AdrianViconia3b
@513 /* I sometimes wonder how much effort it would take to shatter your self-control, such as it is, jaluk... to break you and leave you begging beneath me. */
END
IF ~~ EXTERN BRH#ADR rh#AdrianViconia3c

CHAIN BRH#ADR rh#AdrianViconia3c
@514 /* Take your advances elsewhere, Viconia. I'm not interested. */
DO ~SetGlobal("rh#AdrianViconia3","GLOBAL",1)
RealSetGlobalTimer("rh#AdrianViconiaTalkTimer","GLOBAL",3600)~
== BVICONI @515 /* The fight only serves to make the victory that much sweeter. */
= @516 /* Perhaps you would even enjoy the cruel pleasures that I would inflict upon you... so many ultimately do. And do not think the night would end until you pleaded for mercy. A mercy I might or might not extend. */
== BRH#ADR IF ~!Global("ViconiaRomanceActive","GLOBAL",1) !Global("ViconiaRomanceActive","GLOBAL",2)~ THEN @517 /* I... um, excuse me. */
== BRH#ADR IF ~OR(2) Global("ViconiaRomanceActive","GLOBAL",1) Global("ViconiaRomanceActive","GLOBAL",2)~ THEN @518 /* ...if you're trying to goad a reaction out of <CHARNAME>, don't come to me. I don't appreciate being used. */
== BVICONI IF ~OR(2) Global("ViconiaRomanceActive","GLOBAL",1) Global("ViconiaRomanceActive","GLOBAL",2)~ THEN @519 /* You are of little enough use regardless, wael. */
EXIT

// 6.
CHAIN IF WEIGHT #65 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianViconia3","GLOBAL",1)
Global("rh#AdrianViconia4","GLOBAL",1)
Global("rh#AdrianViconia6","GLOBAL",0)~ THEN BVICONI rh#AdrianViconia6
@520 /* So you are from Zhentil Keep. Even in Menzoberranzan, that name is not unknown. */
DO ~SetGlobal("rh#AdrianViconia6","GLOBAL",1)~
== BRH#ADR @521 /* We do have a knack for infamy. */
== BVICONI @522 /* I believe we acquired some of our more valuable surfacer goods through trade with your people. Tell me, jaluk, were the alleged dealings you had with my people of a mercantile nature? */
== BRH#ADR @523 /* Yes. */
== BVICONI @524 /* Such a flat tone. I wonder, did you find the mere thought of trading with drow repulsive? You have only barely won the smallest part of my respect, male. Do not test my patience. */
== BRH#ADR @525 /* And while I have come to appreciate your manner, jalil, do not mistake tolerance for submission. */
== BVICONI @526 /* You forget your place, male. */
== BRH#ADR @527 /* Hardly. This isn't the Underdark, Viconia. You'll need more than breasts and a deity's favor to make your mark here. */ 
== BVICONI @528 /* And do you find me lacking in other attributes? */
== BRH#ADR @529 /* Viconia, you're beautiful, intelligent, and resourceful. You've survived more than most people have the creativity to imagine possible, and you've done so with your dignity intact. You know full well that you have my respect. */
== BVICONI @530 /* And you are silver-tongued when you wish to be, jaluk. If not for your pride, you would do well in the Underdark. */
== BRH#ADR @531 /* Hells, what a terrible thought. */
EXIT

// Yoshimo

// 1.
CHAIN IF WEIGHT #5 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianYoshimo1","GLOBAL",0)~ THEN BYOSHIM rh#AdrianYoshimo1
@532 /* Adrian, Adrian, come, would you care for another game of cards when next our leader calls for a break? */
DO ~SetGlobal("rh#AdrianYoshimo1","GLOBAL",1)~
== BRH#ADR @533 /* I don't see why not, though I may need to find a deck of my own. I wouldn't trust anything that comes from you. */
== BYOSHIM @534 /* Ah, you wound me with such words! */
== BRH#ADR @535 /* You're a compulsive cheater, Yoshimo. I noticed that the last time we played. */
== BYOSHIM @536 /* Mercy! Such cruel slander, my friend! */
== BRH#ADR @537 /* Speaking of cruelty... when we played cards to alleviate the boredom of long, dreary journeys back home, we had a... system, I should say, to discourage cheating. */
= @538 /* The first offense led to additional guard duty at night. The second offense... suffice to say, I rather like fear spells. No harm done, just mindless terror. Truly beautiful. The third offense, however... alas. */
== BYOSHIM @539 /* I, ah... */
== BRH#ADR @540 /* Now, then. May I see your deck? */
EXIT

// 4.
CHAIN IF WEIGHT #10 ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("rh#AdrianYoshimo4","GLOBAL",0)~ THEN BYOSHIM rh#AdrianYoshimo4
@541 /* Friend Adrian! I think it high time you share some more stories about your own colorful past. To<DAYNIGHT> I find myself in the mood for tales of dark deeds committed and survived. */
DO ~SetGlobal("rh#AdrianYoshimo4","GLOBAL",1)~
== BRH#ADR @542 /* Good for you, Yoshimo. */
== BYOSHIM @543 /* Perhaps some sake will loosen your tongue, yes? */
== BRH#ADR @544 /* Give that here. */
= @545 /* Mmm, where do you find this stuff? I assume it's authentic? */
== BYOSHIM @546 /* Traveling merchants, my friend. Where else? */
== BRH#ADR @547 /* I meant where within Athkatla, Yoshimo. I'd like to pay it a visit. But if you want dark stories, I've got quite a few from my teenage years concerning the merchants my uncle used to lure to their deaths. */
= @548 /* I've got a couple about treachery and retribution also, of course. I had a good friend in Sembia who betrayed me a few years back. I suppose you could find his body somewhere at the bottom of the Inner Sea if you-- */
== BYOSHIM @549 /* Ahh... perhaps some secrets are best kept in the dark. */
EXIT

// Scripted

// Anomen #5
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianAnomen5","GLOBAL",1)~ THEN ANOMENJ rh#AdrianAnomen5   
@550 /* Adrian. I see that again you order wine. This seems to be becoming a nightly ritual for you. With your head so clouded with spirits, I am astonished that you are able to remember your spells from one day to the next. */ 
DO ~SetGlobal("rh#AdrianAnomen5","GLOBAL",2)~
== RH#ADRJ IF ~Class("rh#Adrian",SORCERER)~ THEN @551 /* Sorcerer, not mage. I don't need to memorize anything, so I can drink whenever I wish and get away with it. Now go away. */
== RH#ADRJ IF ~!Class("rh#Adrian",SORCERER)~ THEN @552 /* I'm sure it also astonishes you to know that some people are simply more intellectually capable than others. Now go away. */
== ANOMENJ @553 /* I shall not. My drunken father has been a plague upon me all my life; I will not tolerate such excesses in my companions as well. */
== RH#ADRJ @554 /* If this is about your father issues, go bother <CHARNAME>. I don't care. */
== ANOMENJ @555 /* Your preference is of no importance. It is my duty as a candidate for knighthood to keep those around me from sinking to such vile behavior. */
== RH#ADRJ @556 /* You have five seconds to get out of my face, Delryn. */
== ANOMENJ @557 /* Very well, but I shall take your wine with... AUGH! */
= @558 /* You... such infantile barbarism is unwarranted! */
== RH#ADRJ @559 /* Be glad you even got the warning, knight. */
= @560 /* Don't you have somewhere better to be? A bathhouse, perhaps? */
EXIT

// Edwin #3
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianEdwin3","GLOBAL",2)~ THEN EDWINJ rh#AdrianEdwin3
@561 /* You... quit? The moment I attribute the slightest degree of backbone to you, I find out that you ran away? Why would you even do that? */
DO ~SetGlobal("rh#AdrianEdwin3","GLOBAL",3)~
== RH#ADRJ @562 /* What, were you hoping for a recommendation? */
== EDWINJ @563 /* What!? As if I, a Red Wizard of Thay, would ever stoop to associate with such an upstart, incompetent organization! You must be mad, Zhent, as mad as your pathetic leaders, to even make such an... an *absurd* suggestion! */
== RH#ADRJ @564 /* Methinks thou dost protest just a little too much there. */
= @565 /* Regardless, you'd never have gotten one from me. I tend to pick my friends very carefully, and you, Red Wizard, would be near the bottom of the list. Loyalty is not among your... admittedly scant good features. */
== EDWINJ @566 /* Bah! You of all people would suddenly turn sanctimonious on me? You are apparently as hypocritical as the rest of these fools. More so! Very well, wallow in the mud with the pigs, if you so desire. You are of no further use to me. */
EXIT

// Haer'dalis #4
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianHaerdalis4","GLOBAL",1)~ THEN HAERDAJ rh#AdrianHaerDalis4
@567 /* Ah, my shrike. I have more than once heard you humming to yourself: soft, secretive melodies that you hide away from the world. Perhaps now-- */ 
DO ~SetGlobal("rh#AdrianHaerdalis4","GLOBAL",2)~
== RH#ADRJ @568 /* Back, fiend, ere I banish thee to the darker planes. */
== HAERDAJ @569 /* 'Tis a grand gesture, yon flicking of wine, albeit one woefully lacking in effect. */
== RH#ADRJ @570 /* ...I may be slightly drunk. */
== HAERDAJ @571 /* Aye, and a man's true nature is oft best demonstrated whilst in his cups. There is a spark of the dramatic within your withered soul... I confess I had not expected that. */
== RH#ADRJ @572 /* Do you intend to take me under your wing, then, bard? */
== HAERDAJ @573 /* Nay, I dare say you would drain the very lifeblood from me were I to make the attempt. */
EXIT

// Jaheira #3
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheira3","GLOBAL",2)~ THEN JAHEIRAJ rh#AdrianJaheira3
@574 /* Adrian Vasiliev. I would have expected you to choose an alias with more care. */
DO ~SetGlobal("rh#AdrianJaheira3","GLOBAL",3)
RealSetGlobalTimer("rh#AdrianJaheiraTalkTimer","GLOBAL",3600)~
== RH#ADRJ @575 /* I wasn't exactly in my right mind at the time. */
== JAHEIRAJ @576 /* No, I suppose you were not. */
= @577 /* Still, you are remarkably easy to place, Zhent. Half-elven, black hair, time spent in Sembia. I may recall a song or two once sung about you by Harpers in that country. */
== HAERDAJ IF ~InParty("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @578 /* Songs about yonder shrike? Shall I assume that the more suitable subjects were otherwise engaged? */
== JAHEIRAJ IF ~InParty("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @579 /* Worry not, bard. Vasiliev would satisfy even your taste for wanton self-destruction. */
== RH#ADRJ @580 /* It's been almost two years, Harper. I know you meddlers are obsessed with history, but there's a point at which it shifts from mildly charming into pathetic. */
== JAHEIRAJ @581 /* Perhaps. But newer songs could be written as well. Some might enjoy the tale of a Zhentarim mage sold into slavery-- */
== RH#ADRJ @582 /* Some might enjoy the tale of a Harper laid open upon-- */
= @583 /* Ow! You hit me! That *hurt*! */
== JAHEIRAJ @584 /* It was meant to, Zhent. You do not speak of him. Do you understand that? Say his name but once and I will kill you. */
EXIT

// Jaheira #4
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheira3","GLOBAL",4)~ THEN JAHEIRAJ rh#AdrianJaheira4
@585 /* You do not look so well today, Vasiliev. Do the faces of all those you have no doubt destroyed over the years rob you of sleep at night? */
DO ~SetGlobal("rh#AdrianJaheira3","GLOBAL",5)~
== RH#ADRJ @586 /* How quixotic of you to think I even remember the faces. Or that I care. */
== JAHEIRAJ @587 /* True. I suppose I am mistaking you for someone possessed of more integrity than your ilk is known for. Perhaps it is the thought of vengeance that haunts your dreams. */
== RH#ADRJ @588 /* Vengeance? I haven't actually spent the last ten years murdering every Harper I could find, so I'd appreciate it if you didn't try to slit my throat in the middle of the night. */
== JAHEIRAJ @589 /* I had no intention of doing any such thing. <CHARNAME> has made the decision, poor though I think it may be, to retain your services, and I shall not gainsay that. */ 
= @590 /* I will, however, tolerate no attempt at manipulation, no sign of disloyalty or ulterior motives. Know that if you give me reason to doubt your sincerity or believe you pose a threat, I will eliminate you. */
== RH#ADRJ @591 /* Rest assured, Harper, were I not completely sincere, I wouldn't have stayed around to enjoy the so-called pleasure of your company. */
EXIT

// Jaheira #5
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheira3","GLOBAL",7)~ THEN RH#ADRJ rh#AdrianJaheira5
@592 /* How ironic. I would have hoped that you would be shielding us from Harpers, Jaheira, not drawing them after us. */
DO ~SetGlobal("rh#AdrianJaheira3","GLOBAL",8)
RealSetGlobalTimer("rh#AdrianJaheiraTalkTimer","GLOBAL",7200)~
== JAHEIRAJ @593 /* I am glad that my situation amuses you, Vasiliev. Perhaps I should have handed you over as a gesture of good faith. */
== RH#ADRJ @594 /* Me? I dare say I'm an afterthought, my lady. Still, I guess it doesn't matter which side you're on, once you're on the run. It's the same damn thing. You have my sympathy-- */
== JAHEIRAJ @595 /* Your sympathy means nothing to me. If anything, it is a badge of shame. */
== RH#ADRJ @596 /* ...that necromancer wasn't joking when he called you a heartless Harper wench, was he? Though the Harper part is no longer accurate. But then perhaps it never truly was. You do lack the courtesy that distinguishes the rest of your former kin. */
== JAHEIRAJ @597 /* You will watch your tongue, Zhent. */
== RH#ADRJ @598 /* Why? Do you still plan to tell your Harper friends where I am? Ah, but I forgot: "Traitors must die, for freedom to live," as I recall. */
== JAHEIRAJ @599 /* You will not quote things you do not understand at me, Vasiliev. You soil the very words with your tongue. We are done here. */
EXIT

// Jaheira #6
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheira3","GLOBAL",9)~ THEN JAHEIRAJ rh#AdrianJaheira6
@600 /* I apologize for my earlier words. They were harsh, unnecessarily so. You were trying to be kind, strange as it may have seemed, and did not deserve my scorn for it. */
DO ~SetGlobal("rh#AdrianJaheira3","GLOBAL",10)~
== RH#ADRJ @601 /* If you expect me to apologize in turn, we can just sit here in silence and wait out the Blood War. */
== JAHEIRAJ @602 /* I expect no such thing. */
== RH#ADRJ @603 /* Good. */
== JAHEIRAJ @604 /* Well? Are you going to sulk like a child or will you accept my apology? */
== RH#ADRJ @605 /* I haven't decided yet. */
== JAHEIRAJ @606 /* It is a wonder you have survived as long as you have, Vasiliev. You are absolutely impossible. */
EXIT

// Jaheira #7
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheira7","GLOBAL",2)~ THEN RH#ADRJ rh#AdrianJaheira7
@607 /* If all you wanted was a shiny silver pin, you should have just asked. */
DO ~SetGlobal("rh#AdrianJaheira7","GLOBAL",3)~
== JAHEIRAJ @608 /* Are you implying that-- */
== RH#ADRJ @609 /* I'm implying nothing at all, Harper. */
== JAHEIRAJ @610 /* Hmph. You did not need to hide behind <CHARNAME>, Vasiliev. Was the presence of one so renown truly so frightening for you? */
== RH#ADRJ @611 /* ...I wasn't hiding. */
== JAHEIRAJ @612 /* Yes, you were. */
EXIT

// Jaheira #8
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheira8","GLOBAL",1)~ THEN JAHEIRAJ rh#AdrianJaheira8
@613 /* Hold still, Vasiliev. Let me look at that. */
DO ~SetGlobal("rh#AdrianJaheira8","GLOBAL",2)~
== RH#ADRJ @614 /* Ow! <CHARNAME>, your Harper's trying to kill me! */
== JAHEIRAJ @615 /* Do not be foolish. How did you even get hurt? You are a spellcaster. You are not supposed to *be* in melee combat. */
== RH#ADRJ @616 /* Tell that to the enemies who go for wizards first. You know, anyone with half a brain. */
= @617 /* Ow! Nine Hells, druid! We're supposed to be on the same side! */
== JAHEIRAJ @618 /* I am not going to harm you... though you are giving me little enough reason to be gentle. */
DO ~ReallyForceSpell("rh#Adrian",CLERIC_CURE_SERIOUS_WOUNDS)~ 
EXIT

CHAIN IF WEIGHT #-1 ~Global("rh#AdrianJaheira9","GLOBAL",2)~ THEN RH#ADRJ rh#AdrianJaheira9
@619 /* Well, Harper. What do they say again about coming full circle? You must feel right at home. */
DO ~SetGlobal("rh#AdrianJaheira9","GLOBAL",3)
IncrementGlobal("rh#Adfyfyriad","GLOBAL",1)~
== JAHEIRAJ @620 /* Hmph. You are as elven as I. */
== RH#ADRJ @621 /* I wouldn't be so sure of that. */
== JAHEIRAJ @622 /* You are a fool to hate them so, Vasiliev. Did you not once tell <CHARNAME> that you originally came from Shadowdale? */ 
== RH#ADRJ @623 /* As impressed as I am by your mastery of useless trivia, I fail to see how that makes a difference. */
== JAHEIRAJ @624 /* I am more familiar with your stories than you realize. It should not surprise you to know that I visited Shadowdale when I first became a Harper. */
== RH#ADRJ @625 /* Not at all. You no doubt frolicked in the forest with the rest of-- */
== JAHEIRAJ @626 /* Do not interrupt. I recall one of the local rangers: a moon elf with a troubled past. I remember him as a reclusive figure. I understand that more now than I did then. */
= @627 /* He spent his days waging private war upon the Zhentarim. Oddly, he would spare any half-elven agents he encountered. Do you not find that interesting? */
== RH#ADRJ @628 /* Shut up, Harper. I don't care. */
== JAHEIRAJ @629 /* No? You seem to have adopted his name as of late. */
EXIT

// Korgan #3
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianKorgan","GLOBAL",3)~ THEN KORGANJ rh#AdrianKorgan3
@630 /* A game o' cards, elf. Ye may be a sad excuse for a madman, but at least ye don't cheat me out of me gold like the rest o' these pansies. */
DO ~SetGlobal("rh#AdrianKorgan","GLOBAL",4)~
== RH#ADRJ @631 /* As eloquent as ever, I see. */
== KORGANJ @632 /* O' course. Now, are ye goin' to shuffle or do ye need some wine for yer dainty tongue? */
== RH#ADRJ @633 /* I wouldn't refuse the offer. It's your turn to buy, I believe. */
== KORGANJ @634 /* Bah! Yer extorting me again, ye good fer nothing Zhent! */
== RH#ADRJ @635 /* Extorting? I'd be shocked if you even knew what that word meant. */
== KORGANJ @636 /* Pfeh. I may be uncouth, but I ain't stupid. Now, go on an' deal before I cut ye open. */
== RH#ADRJ @637 /* Terrified, as always. */
DO ~RestParty()~ EXIT

// Mazzy #4
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianMazzy4","GLOBAL",1)~ THEN RH#ADRJ rh#AdrianMazzy4
@638 /* Mazzy, my dear, come. The board is unfolded, the pieces in place. I need only an opponent of sufficient skill to make this <DAYNIGHT> complete. */
DO ~SetGlobal("rh#AdrianMazzy4","GLOBAL",2)~
== RH#ADRJ @639 /* Since one is nowhere to be found, I suppose I shall have to make do with you instead. */
== MAZZYJ @640 /* I shall not share your table with your wine, Adrian. If you desire my companionship, you will have to forego your customary entertainment to<DAYNIGHT>. */
== RH#ADRJ @641 /* Very well. I shall give it to a beggar on the street... it will be my one good deed for the tenday. */
== MAZZYJ @642 /* That is no good deed at all, Adrian. Hand it over here. */
= @643 /* Thank you. Now, are you playing as black or white? */
== RH#ADRJ @644 /* Black, I think. I would hate to steal your shining white knights from you. */
== MAZZYJ @645 /* Enough, Adrian. If you will not behave yourself, you will have neither wine nor company to<DAYNIGHT>. */
== RH#ADRJ @646 /* Oh, very well. If you insist. Just start the game. */
DO ~RestParty()~ EXIT

// Nalia #5 
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianNalia5","GLOBAL",2)~ THEN RH#ADRJ rh#AdrianNalia5
@647 /* Well, that was pathetic, princess. Even for you. */
DO ~SetGlobal("rh#AdrianNalia5","GLOBAL",3)~
== NALIAJ @648 /* I'm sorry. What imagined slight have I committed now? */
== RH#ADRJ @649 /* The slight of having lived down to what little expectations I had. You're a wizard, girl. You're far from powerless, and yet you refuse to fight for what is yours. Your lands, your title, your people... if not for <CHARNAME>, I dare say your very self. */
== NALIAJ IF ~Global("rh#AdrianZhent","GLOBAL",1)~ THEN @650 /* This is Amn, not the barbaric Moonsea. Overwhelming force may rule in Zhentil Keep, but here, custom is more important. My gender prevents me from inheriting. */
== NALIAJ IF ~!Global("rh#AdrianZhent", "GLOBAL",1)~ THEN @651 /* This is Amn. I do not know how things are handled in whatever barbaric corner of the world you call home, but here, my gender prevents me from inheriting. */
== RH#ADRJ @652 /* Only because you let it. You fight for everybody but yourself, Nalia. You spend every piece of gold you have on the wretched and useless, but as soon as you yourself are challenged, you crumble and give in. You run and beg for help. What an astounding show of commitment, my lady. */
== NALIAJ @653 /* Oh, do shut up, my lord. You don't know enough about Amnish culture and history to tell me to declare war on the nobility. Why don't you read a book or three? */ 
== RH#ADRJ @654 /* No doubt that will prove more interesting than listening to your bleating a moment longer. */
== NALIAJ @655 /* If you need help making sense of the letters, don't hesitate to ask. I make it a point of helping the less fortunate. Socially, economically. Intellectually. */
== RH#ADRJ @656 /* Ha! Go study your spellbooks, princess, if you can tear yourself away from your crusade against reality long enough to learn something new. */ 
== NALIAJ @657 /* Fine. I might as well study a few spells I may well want to use on you one day. */
== RH#ADRJ @658 /* Why, my lady! Don't make promises you're too prim and proper to keep. */
== NALIAJ @659 /* Ohh, you are impossible! */
EXIT

//  Viconia #5
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianViconia5","GLOBAL",1)~ THEN VICONIJ rh#AdrianViconia5
@660 /* Miserable though this establishment is, I suppose it shall have to suffice. Male, I require that water be drawn for my bath. */
DO ~SetGlobal("rh#AdrianViconia5","GLOBAL",2)~
== RH#ADRJ @661 /* Good for you, Viconia. */
= @662 /* Hmm. There was a Calishite wizard back home who couldn't handle the weather and built a bath house over one of our rare hot springs. This far south, we should be able to find a more authentic one. */
== VICONIJ @663 /* I know little of petty surfacer customs. Would these baths be public or private? */
== RH#ADRJ @664 /* Private, of course. Well... both, most likely, but I doubt that scheming Amnish merchants could survive on public baths alone. Shall I assume that you're interested? */
== VICONIJ @665 /* Perhaps. I shall judge whether this bath house is suitable, but know that we will be bathing separately. */
== RH#ADRJ @666 /* I wouldn't have it any other way, my lady. */
DO ~RestParty()~ EXIT

// Yoshimo #2
CHAIN IF WEIGHT #-1 ~Global("rh#AdrianYoshimo2","GLOBAL",2)~ THEN YOSHJ rh#AdrianYoshimo2
@667 /* Ah... my friend. Could I interest you in a cup of sake? */ 
DO ~SetGlobal("rh#AdrianYoshimo2","GLOBAL",3)~
== RH#ADRJ @668 /* If you think to dull my wits with drink, you're in for painful disappointment, Yoshimo. */
== YOSHJ @669 /* You are ever so guarded, Adrian. You will not live a long, fulfilling life if you do not learn to trust, yes? */
== RH#ADRJ @670 /* I've never found a knife in the back to be particularly conducive to a long life. */
== YOSHJ @671 /* A knife in the back? Yoshimo? I would do no such thing! */
== RH#ADRJ @672 /* With 20,000 gold on the line, I suppose we are a bit of an investment. */
== YOSHJ @673 /* Ah. */
= @674 /* You are a crafty one, my friend. I deny your accusation, of course. */
== RH#ADRJ @675 /* Of course. */
== YOSHJ @676 /* You... have nothing further to say? */
== RH#ADRJ @677 /* Better an enemy in the light than one in the shadows. */
== YOSHJ @678 /* You might like it amidst the shadows, Adrian. There is... what is the saying? Honor amongst thieves? */
== RH#ADRJ @679 /* I'd rather not remain in Amn long enough for the investment to pay off. */
== YOSHJ @680 /* Ah, that is a pity, my friend. */
EXIT