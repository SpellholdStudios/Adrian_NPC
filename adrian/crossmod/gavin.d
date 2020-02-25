// SoA

// 1.
CHAIN IF ~InParty("B!Gavin2")
See("B!Gavin2")
!StateCheck("B!Gavin2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianGavinBanter1","GLOBAL",0)~ THEN BRH#ADR AdrianGavinBanter#1.1
@197 /* Aren't you a bit... drab for a Lathandrite? I've always thought that 'clashing and hideous' was the standard wardrobe requirement. */
DO ~SetGlobal("G#XB.AdrianGavinBanter1","GLOBAL",1)~
== ~BB!Gav~ @198 /* It used to be louder. Too much laundering in streams. */
== ~BB!Gav~ IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @199 /* You seem to be missing a few pendant skulls, as well. It looks like we're both underdressed. */
== BRH#ADR IF ~Class("rh#Adrian",CLERIC_MAGE)~ THEN @200 /* How delightfully gauche. No, I'm not quite so dark as that these days. But you... */
== BRH#ADR @201 /* I can't say I've met many of your faith, but I would have expected you to discard something as soon as it went out of fashion, not keep it until it was falling apart. */
== ~BB!Gav~ @202 /* Lathandrites respect beauty in all its forms. Utility has a spare, simple elegance to it, but it is lovely in the eyes of the Morning Lord. */
END
IF ~OR(2) !Global("B!GavRA","GLOBAL",1) !Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN EXTERN BRH#ADR ra0
IF ~Global("B!GavRA","GLOBAL",1) Global("rh#AdrianRomanceActive","GLOBAL",1)~ THEN EXTERN ~BB!Gav~ ra1

CHAIN BRH#ADR ra0
@203 /* Lovelier still in the eyes of an acolyte too cheap to replace worn-out gear, no doubt. */
== ~BB!Gav~ @204 /* Lathander knows how to show his displeasure. Since he doesn't mind, I suggest you stand upwind. */
== BRH#ADR @205 /* Would that you served a more discerning god. */
EXIT

CHAIN ~BB!Gav~ ra1
@206 /* Our leader, now... I wouldn't compare her to the flawed work of mortal hands, but grace she possesses will never go out of style. */
DO ~SetGlobal("G#AdrianGavinConflict","GLOBAL",1)~
== BRH#ADR @207 /* Did you come up with that little piece of flattery all by yourself? */
== ~BB!Gav~ @208 /* They do say that Lathander favors the clever. */
== BRH#ADR @209 /* And yet he seems to like you. */
== ~BB!Gav~ @210 /* Lasting devotion counts, too, I'm told. */
== BRH#ADR @211 /* At least someone's impressed. She hardly even knows you exist. */
== ~BB!Gav~ @212 /* You remind her that you do every three breaths. */
== BRH#ADR @213 /* ...this stopped being entertaining ten seconds ago. I've still got some of that wine from the other night if you'd care to share. */
== ~BB!Gav~ @214 /* I never thought you'd ask. */
EXIT

// 2.
CHAIN IF ~InParty("B!Gavin2")
See("B!Gavin2")
!StateCheck("B!Gavin2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianGavinBanter1","GLOBAL",1)
Global("G#XB.AdrianGavinBanter2","GLOBAL",0)~ THEN BRH#ADR AdrianGavinBanter#2.1
@215 /* Honestly, Gavin, you Heartlanders keep your children so close that it's a wonder you don't smother them. */
DO ~SetGlobal("G#XB.AdrianGavinBanter2","GLOBAL",1)
RealSetGlobalTimer("rh#AdrianGavinTalkTimer","GLOBAL",3600)~
== ~BB!Gav~ @216 /* That's new. Usually, people ask me how I can bear leaving my daughter with strangers. */
== BRH#ADR @217 /* They would, wouldn't they? But you still have to keep her near enough to visit, never mind that there are only a handful of countries worse than Amn for a young sorceress. Hells, send her to some Mystrans in Silverymoon... that lot must be preachy enough for you. */
== ~BB!Gav~ @218 /* You'd send her to another realm to train! Lathander knows, I'd send her to the moon if I thought it would help her in the end - and if she didn't hate me forever because of it - but where's a man supposed to get that kind of coin? */
== BRH#ADR @219 /* What, is your church too busy redecorating to pay you properly, or are you useless to them also? */
== ~BB!Gav~ @220 /* How's the shoulder? By Lathander's grace, I don't think it will scar. */
== BRH#ADR @221 /* Fine, have it your way. Still, you may act like a jumped up peasant, but you're not exactly poor anymore. */
== ~BB!Gav~ @222 /* You're chatty today. Is something on your mind? */
== BRH#ADR @223 /* I've no need for a confessor, priest. Tend to your own flock. */
EXIT

// 3. morning
CHAIN IF WEIGHT #-1 ~Global("G#XB.AdrianGavinBanter3","GLOBAL",1)~ THEN RH#ADRJ AdrianGavinBanter#3.1
@224 /* Ahh, you're awake. Wonderful. I trust you have breakfast ready? */
DO ~SetGlobal("G#XB.AdrianGavinBanter3","GLOBAL",2)~
== ~B!GavJ~ @225 /* No, it's <CHARNAME>'s turn today. */
== RH#ADRJ @226 /* I see. This silly nonsense about passing chores around... it's more a hindrance than a help. Particularly when we have someone so well suited for them. */
== ~B!GavJ~ @227 /* You mean me, I take it? Of course you do. */
== RH#ADRJ @228 /* If you don't want to be taken for a servant, then perhaps you shouldn't act like one. */
== ~B!GavJ~ @229 /* We all serve <CHARNAME> here. You can hold your nose in the air if you like, but you'll do <PRO_HISHER> bidding just as I will. */
== RH#ADRJ @230 /* Oh, I won't deny that I've ever had masters. I just tend not to count every halfway intelligent creature in Faerun among that happy number. */ 
== ~B!GavJ~ @231 /* Aye, chin up, lad. Remember your station. */
= @232 /* By the way, you should probably fetch some water. It's your turn to wash the dishes. */
EXIT

// 4.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("B!Gavin2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
GlobalGT("rh#OrphanSpawn","GLOBAL",1)
Global("G#XB.AdrianGavinBanter4","GLOBAL",0)~ THEN ~BB!Gav~ AdrianGavinBanter#4.1
@233 /* I saw your protege the other day. She had a proper tunic on. */
DO ~SetGlobal("G#XB.AdrianGavinBanter4","GLOBAL",1)~
== BRH#ADR IF ~!Global("rh#AdrianGavinWasThere","GLOBAL",1)~ THEN @234 /* What? Oh, that little half elf. I don't recall you being there, Gavin. */
== ~BB!Gav~ IF ~!Global("rh#AdrianGavinWasThere","GLOBAL",1)~ THEN @235 /* <CHARNAME> pointed her out. */
== BRH#ADR IF ~!Global("rh#AdrianGavinWasThere","GLOBAL",1)~ THEN @236 /* Fine. What of it? */
== BRH#ADR IF ~Global("rh#AdrianGavinWasThere","GLOBAL",1)~ THEN @237 /* What? Oh, that little half elf. What of it? */
== ~BB!Gav~ @238 /* Human nature is a curious thing. */
== BRH#ADR @239 /* Don't make it into something it isn't. Had the situation demanded it, I'd have just as readily slit her throat. */
== ~BB!Gav~ @240 /* Had the situation demanded it, I might have done the same. */
= @241 /* Not every moment is a crisis, Adrian. What we do with our lives in between... It's just another part of what makes us who we are. */
== BRH#ADR @242 /* Trust a Lathandrite to always have a vapid platitude ready. You should count yourself lucky that I have little enough incentive to use that optimism against you. */
== ~BB!Gav~ @243 /* I'm not afraid of you, Adrian. The only thing I have that you want is peace of mind. */
== BRH#ADR @244 /* Call it peace or call it complacency... it's always been the undoing of the foolish and the weak. */
EXIT

// ToB

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("B!Gavin2",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianGavinToBBanter1","GLOBAL",0)~ THEN ~BB!Gav25~ AdrianGavinToBBanter#1.1
@245 /* I knew a Zhent once. His name was Xzar. An incredibly... interesting... fellow. */
DO ~SetGlobal("G#XB.AdrianGavinToBBanter1","GLOBAL",1)~
== BRH#AD25 @246 /* Associating with Zhents can be a rather dangerous habit to indulge. I hope I don't have to point that out to you. */
== ~BB!Gav25~ @247 /* I have never heard it said that associating with any adventurer was good for the health. Looks are deceptive, but he seemed harmless. He liked to collect bits of things in jars. */
== BRH#AD25 @248 /* Bits of things? */
== ~BB!Gav25~ @249 /* People, mostly. He was a necromancer. His presence in our group should have thrown me into a rage, but I had a hard time hating him. He was too mad for aught but pity. */
== BRH#AD25 @250 /* And yet I've never known a mad wizard to be anything but exceptionally dangerous... that's doubly true for the type back home. */
== ~BB!Gav25~ @251 /* Everyone is dangerous. You are dangerous. I am dangerous. Would you consider the peril of conviction less lethal than the threat posed by insanity? */
== BRH#AD25 @252 /* Heh. No. But when one's convictions include world conquest, it becomes somewhat more difficult to tell the two apart. */
== ~BB!Gav25~ @253 /* Knowledge of oneself does factor into it. I would harbor more fear toward a man who knew his powers - and limitations - than toward a maniac whose larger scheme includes "get lucky". I do not discredit your warning, but familiarity with a snake does not pull its fangs. */
== BRH#AD25 @254 /* Ah. *That* type of madman, then. We have more than a few of those back home these days too. */
EXIT