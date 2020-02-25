// SoA

// 1.
CHAIN IF ~InParty("ADAngel")
See("ADAngel")
!StateCheck("ADAngel",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianAngeloBanter1","GLOBAL",0)~ THEN BRH#ADR AdrianAngeloBanter#1.1
@0 /* That ridiculous old adage about keeping one's foes close... I don't think I've ever seen it performed quite so literally before. I'm not sure which of you is madder; I certainly can't imagine running to an old enemy for aid. */
DO ~SetGlobal("G#XB.AdrianAngeloBanter1","GLOBAL",1)~
== BADANGEL @1 /* Hmph. Only the gods hold grudges forever, my friend. Life is changeable...as is the man who wishes to keep his. I'm only glad our chief saw matters in the same light. If not, I happily admit, I'd have looked a right fool. */
== BRH#ADR @2 /* As far as I'm concerned, you look a right fool all the same. Especially considering how much of a step down for you this must be. Once Sarevok's right hand... now capering around Amn. How very impressive. */
== BADANGEL @3 /* Happen being the right hand of a man like Sarevok was akin to being a farmer's prize hog. That is to say, the glory of it was fleeting. */
== BRH#ADR @4 /* A prize hog, was it? I suppose I can't argue with that. Still, I'd never willingly flee to this wretched city. Myself... if I had the option, I'd happily run back to Sembia instead. */
== BADANGEL @5 /* What's stopping you? */
== BRH#ADR @6 /* The same thing that's stopping you from returning to Baldur's Gate, I suspect. */
== BADANGEL @7 /* So the shadow of the noose compels us all. Ha! Life is fine. Fine like wine. Speaking of which, have you got a bottle handy? */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("ADAngel",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianAngeloBanter1","GLOBAL",1)
Global("G#XB.AdrianAngeloBanter2","GLOBAL",0)~ THEN BADANGEL AdrianAngeloBanter#2.1
@8 /* You know, Adrian, my captain in the Sembian corps was a Calimshan man; Esim the name. The strictures of his religion kept the taste of liquor from e'er passing his lips, but he had to humor us boys after a day's march. To split the difference, we'd go to the Salty Hump in ol' Selgaunt, operated by a few of his more liberal countrymen, and he'd sit there glowering at us. I suppose you've heard of the place? */
DO ~SetGlobal("G#XB.AdrianAngeloBanter2","GLOBAL",1)~
== BRH#ADR @9 /* Not that I can remember. But I certainly had enough of a taste of Calimshan at home to never need to go out for it. */
== BADANGEL @10 /*  'A taste,' eh? Are we still talking liquor...or perhaps something fairer? Heh. Anyway, how about Bend Sinister in the merchant's quarter? They served a mean, hard grog if I recall; "salted with the tears of maidens" they said... */
== BRH#ADR @11 /* I was in the service of a merchant prince, Angelo. I really couldn't have afforded to be seen in any of the... establishments you likely frequented. */
== BADANGEL @12 /*  On the contrary, I'd think a man of your *ahem* stature could well afford it. The more gold to be spent on doodads and perfumes, eh? */
== BRH#ADR @13 /* There was rather more to it than doodads and perfumes, Angelo. A night in a place like your Bend Sinister and I'd have been facing unfortunate questions come morning. */
== BADANGEL @14 /*  Ah! I comprehend you. I was lucky to live a dog's life in Sembia. Rise out of the gutter, though, and whispered words cut like blades. I'd much prefer a bleary evening at the Bend Sinister to any riches Mother Selgaunt could offer. */
== BRH#ADR @15 /* If that's *luck*, perhaps I should be glad to have been so lacking in it. Still... there was an art to intrigue in Sembia. The stakes were high, but the game was fair. Well, relatively so. */
== BADANGEL @16 /*  Aye, it rewarded a strong hand. Yet to be strong every cussed day, and then, when you slip, collapse into total weakness all at once...you're a bigger gambler than I am, my friend. Sembian treachery is more honest than some, but I'd still balk at presenting the fates a stationary target. */
EXIT

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("ADAngel",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("G#XB.AdrianAngeloBanter3","GLOBAL",0)~ THEN BADANGEL AdrianAngeloBanter#3.1
@17 /* Holla, Adrian! D'you know how many Zhents it takes to light a lamp? */
DO ~SetGlobal("G#XB.AdrianAngeloBanter3","GLOBAL",1)~
== BRH#ADR @18 /* I suspect I'm about to find out. */
== BADANGEL @19 /* Two. One to light it, and another to kill him for knowing too much. */
== BRH#ADR @20 /* ...I hope you're not expecting a round of applause. */
== BADANGEL @21 /* How do you know a Zhent is deceiving you? ...His lips are moving. */
== BRH#ADR @22 /* Answer me this, Angelo: how do you tell the difference between a true Kara-Turan and half-bred mercenary scum? */
= @23 /* The former is expected to commit ritualistic suicide after his hopeless bid for power fails. The latter... well, I should think it rather obvious. */
== BADANGEL @24 /* Fair enough; the wit's matched for the round. */
== BRH#ADR @25 /* Next time you feel like joking about the Black Network, perhaps you ought to go spend a week or two in Zhentil Keep first. You might still be laughing afterwards, but I doubt it would be from humor. */
== BADANGEL @26 /* Come now, can we jest about death, but not those who deal it? I often find laughter quickened by the approaching blade. */
== BRH#ADR @27 /* I take it you find an awful lot to laugh about. */
EXIT

// ToB

// 1.
CHAIN IF ~InParty("ADAngel")
See("ADAngel")
!StateCheck("ADAngel",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianAngeloToBBanter1","GLOBAL",0)~ THEN BRH#AD25 AdrianAngeloToBBanter#1.1
@28 /* Angelo, you-- ah. I take it that isn't pipeweed. */
DO ~SetGlobal("G#XB.AdrianAngeloToBBanter1","GLOBAL",1)~
== BADANG25 @29 /*  Adrian? S'at you..? Can't...hear so good. Gone to t'other place. Hey, can ya...see these ripples in the air? Like someone dropped a big, ripe stone in the middle o' all creation...is that you? Say somethin' if it is you. */
== BRH#AD25 @30 /* ...gone to the other place indeed. I can't say I blame you. The whole blasted world seems to be afire these days. A small dose of oblivion... hmm. */
== BADANG25 @31 /* Say Adrian, would ya...come over with me? Just...take my hand n' step over. Happen it's cold here, and more lonesome than I ever thought. Take it. There's a fella. */
== BRH#AD25 @32 /* You know, that black powder must have been my best friend about a year and a half ago. I had precious few others at the time, so I guess that makes sense. */
= @33 /* A cleric I was working for found me one morning on a caravan run... forced a potion down my throat before having his guards-- well, needless to say, it made an impact. */
== BADANG25 @34 /* Forced it...down yer throat? S'not safe, is it...always someone trying to force somethin' down yer throat. You got to run, and keep running. I'm safe here, Adrian. Safe, but I'm all alone... */
== BRH#AD25 @35 /* I swore I'd never touch the stuff again. You can do as you'd like, of course, so long as you pass me that sake you've been hiding away. */
== BADANG25 @36 /* Sake...? Sake. Oh gods, should've stayed on the sake. Nice n' warm on the sake. Gods, man. T-take this cussed pipe...toss it over yonder. Hell with it. The jug's in my p-pack. Bring it over here. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("ADAngel",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
ReputationGT(Player1,9)
Global("G#XB.AdrianAngeloToBBanter2","GLOBAL",0)~ THEN BADANG25 AdrianAngeloToBBanter#2.1
@37 /* Ye gods, this pack is heavy... */
DO ~SetGlobal("G#XB.AdrianAngeloToBBanter2","GLOBAL",1)~
== BRH#AD25 @38 /* Straggling along, are we? So much for all of your boasts, oh universal soldier. */
== BADANG25 @39 /* I dye my hair, Adrian...I'm no spring chicken. */
== BRH#AD25 @40 /* Heh. I had noticed the hair, yes. */
== BADANG25 @41 /* Shh! Keep it down please. Anyhow, I'm weary, my friend. Deep in the bones. But it's not all badness. Happen there is a touch of...satisfaction in it. */
== BRH#AD25 @42 /* I'm quite sure you could find a touch of satisfaction anywhere. */
== BADANG25 @43 /* Well, I only mean that, if I had never met the chief, and...well, present company...there would be precious little to redeem this nasty husk of a life. Not that I am redeemed...whatever that may mean. But there will, perhaps, be a weight on the other side of Kelemvor's scales. However small. */
END
IF ~!Alignment("rh#Adrian",MASK_EVIL)~ EXTERN BRH#AD25 AdrianAngeloToBBanter#2.2
IF ~Alignment("rh#Adrian",MASK_EVIL)~ EXTERN BRH#AD25 AdrianAngeloToBBanter#2.3

CHAIN BRH#AD25 AdrianAngeloToBBanter#2.2
@44 /* I... think I know what you mean. */
== BADANG25 @45 /* Truly? */
== BRH#AD25 @46 /* You're hardly the only one who's ever made... stupid mistakes, Angelo. */
== BADANG25 @47 /* Ha! Ha. Then, though the road is long, mayhap we will not find what lies at the end entirely against our liking... */
EXIT

CHAIN BRH#AD25 AdrianAngeloToBBanter#2.3
@48 /* How very amusing... is that a trace of religiosity from you in your old age? */
EXIT
