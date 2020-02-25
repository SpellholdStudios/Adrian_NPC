// SoA

// 1.
CHAIN IF ~InParty("O#Coran")
See("O#Coran")
!StateCheck("O#Coran",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianCoranBanter1","GLOBAL",0)~ THEN BRH#ADR AdrianCoranBanter#1.1
@92 /* Hells, elf. Don't tell me that you're sighing over that damn Calishite of yours again. */
DO ~SetGlobal("G#XB.AdrianCoranBanter1","GLOBAL",1)~
== BO#CORAN @93 /* That Calishite has a name, Adrian. */
== BRH#ADR @94 /* Yes, Sa-- Safana. */
= @95 /* Frankly, you're lucky that she only robbed you blind. */
== BO#CORAN @96 /* A broken heart is no ailment at all to you, I take it. */
== BRH#ADR @97 /* You? That's your pride, Coran. Not your heart. You're both still alive, at least... as much as I might sometimes wish otherwise. */
== BO#CORAN @98 /* You're absolutely charming, Adrian. I hope you know that. */
== BRH#ADR @99 /* I certainly try. */
= @100 /* ...by all the gods, are we really having this conversation? */
== BO#CORAN @101 /* I'm afraid so. (grin) I won't tell anybody if you don't. */
== BRH#ADR @102 /* I... think I'd appreciate that. */
EXIT

// 2.
CHAIN IF ~InParty("O#Coran")
See("O#Coran")
!StateCheck("O#Coran",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianCoranBanter2","GLOBAL",0)~ THEN BRH#ADR AdrianCoranBanter#2.1
@103 /* Perhaps I should put some effort into researching a basilisk-styled spell: stare at the wizard long enough, and your eyes turn to stone and simply fall out of your head. Beautiful. */
= @104 /* Wouldn't that be nice, Coran? */
DO ~SetGlobal("G#XB.AdrianCoranBanter2","GLOBAL",1)~
== BO#CORAN @105 /* ...marvelous imagery, as always. I do believe you've surpassed yourself. And I wasn't staring, as it so happens. */
== BRH#ADR @106 /* Close enough. I didn't grow wings overnight, did I? I can't imagine what else could have been so fascinating. */
== BO#CORAN @107 /* (grin) As much as I might like to watch you fly away... no, I was trying to remember how recently I last visited Cormanthor and the surrounding lands. */
== BRH#ADR @108 /* ...I'm afraid you've lost me. */
== BO#CORAN @109 /* An idle fancy, nothing more. And quite impossible, I think. */
== BRH#ADR @110 /* You-- oh. */
= @111 /* Coran, if you find yourself mulling over the paternity of every half-elf you've ever met, you might want to consider... cutting back a bit. */
== BO#CORAN @112 /* Don't be such a spoilsport, Adrian. As I said, just a passing fancy. */
== BRH#ADR @113 /* I do hope you extend these passing fancies of yours to half-elven women as well. Preferably before you bed them. */
== BO#CORAN @114 /* ...that actually wouldn't be a bad idea. */
EXIT

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("O#Coran",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("G#XB.AdrianCoranBanter3","GLOBAL",0)~ THEN BO#CORAN AdrianCoranBanter#3.1
@115 /* I've been wondering something, Adrian. For quite some time, actually, but it isn't a question I've ever had the opportunity to ask before. */
DO ~SetGlobal("G#XB.AdrianCoranBanter3","GLOBAL",1)~
== BRH#ADR @116 /* This should be good. */
== BO#CORAN @117 /* I'm sure you've heard what they say about women and rogues? */
== BRH#ADR @118 /* I hear more than 'what they say', Coran. Especially when renting a room next to yours. */
== BO#CORAN @119 /* (grin) You're welcome. Still, for every story about dashing rogues, there are several about spies... your delightfully wicked kind in particular. */
= @120 /* So tell me: is there any truth behind rumors like that? */
== BRH#ADR @121 /* ...are you planning on signing up if the answer is yes? */
== BO#CORAN @122 /* That's not quite the life for me, I'm afraid. */
== BRH#ADR @123 /* No, it really isn't. */
= @124 /* As for the stories... they're exaggerated. Either that or they cut off before the messy conclusion. There are easier ways than that for an agent to commit suicide. */
== BO#CORAN @125 /* But none quite so worthwhile. */
== BRH#ADR @126 /* It's a beautiful world you live in, Coran. I suppose I ought to give you that much. */
EXIT

// ToB

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("O#Coran",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("rh#Adrian",LAWFUL_NEUTRAL)
Global("G#XB.AdrianCoranToBBanter1","GLOBAL",0)~ THEN BO#COR25 AdrianCoranToBBanter#1.1
@127 /* I don't think I've ever seen someone so eager to be gone from Suldanessellar. Honestly, Adrian, you could have at least tried to be friendly. */
DO ~SetGlobal("G#XB.AdrianCoranToBBanter1","GLOBAL",1)~
== BRH#AD25 @128 /* I didn't start any fights. As far as I'm concerned, that's close enough. */
== BO#COR25 @129 /* I take it we're not counting that bladesinger who lunged at you. */
== BRH#AD25 @130 /* ...that wasn't entirely my fault. */
== BO#COR25 @131 /* Ha! From where I was standing, it certainly looked like it was. */
= @132 /* Still, it's a pity we weren't able to stay even a couple of weeks longer. The place seemed to be growing on you at least a little bit. Why, the last time we saw Queen Ellesime, you barely even scowled at all! */
== BRH#AD25 @133 /* They gave me Elverquisst. Quite a bit of it, in fact. That might have softened my mood somewhat. */
== BO#COR25 @134 /* Yes, and I still haven't forgiven you for drinking so much of it without me. But had I guessed that you would prove so easy to bribe-- */
== BRH#AD25 @135 /* You may well be the only man in Faerun who wouldn't have guessed that. */
== BO#COR25 @136 /* Give yourself at least some credit, Adrian. Most would assume that you set your price fairly high. You are technically nobility, after all. */
== BRH#AD25 @137 /* True enough. Well, I suppose if I ever again find myself in Suldanessellar, I'll just have to make up for that particular failing. */
== BO#COR25 @138 /* Somehow, my friend, I doubt that the opportunity will ever present itself. */
EXIT