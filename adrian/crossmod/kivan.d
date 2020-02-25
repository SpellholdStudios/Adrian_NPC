// SoA

// 1.
CHAIN IF ~InParty("P#Kivan")
See("P#Kivan")
!StateCheck("P#Kivan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianKivanBanter1","GLOBAL",0)~ THEN BRH#ADR AdrianKivanBanter#1.1
@262 /* <CHARNAME> won't fall apart the second you stop watching <PRO_HIMHER>, elf. I do hope you realize that. */
DO ~SetGlobal("G#XB.AdrianKivanBanter1","GLOBAL",1)~
== BP#KIV @263 /* I am concerned for the wellbeing of a friend. Is such a concept so foreign to you? */
== BRH#ADR @264 /* Not at all. Still, I suppose I ought to congratulate you on your  almost timely rescue. Had you arrived any sooner, you might have actually had to do something. */
== BP#KIV IF ~Class("rh#Adrian",SORCERER)~ THEN @265 /* I pull my own weight, sorcerer. It is you whose only contribution to this party is an endless litany of complaints. */
== BP#KIV IF ~!Class("rh#Adrian",SORCERER)~ THEN @266 /* I pull my own weight, wizard. It is you whose only contribution to this party is an endless litany of complaints. */
== BRH#ADR @267 /* I suppose I'll have to cross "appreciation for the arcane" off of the list of elven virtues, then. Pity that leaves so few remaining. */
== BP#KIV @268 /* The only thing less appealing than your racism is your sense of entitlement, Adrian. */
= @269 /* There are thousands of mages, many more powerful than yourself. As a spellcaster, you are easily replaceable. Perhaps you should keep that in mind the next time you seek to avoid honest work. */
== BRH#ADR @270 /* Tell me -- if I deigned to cook you a meal, would you actually eat it? */
== BP#KIV @157 /* No. */
== BRH#ADR @271 /* Then why bother wasting either of our time? I'm sure that yours would be better spent frolicking about in the forest... or whatever it is that you do. */
== BP#KIV @272 /* Find someone else to harass, Adrian. Before I lose patience with you entirely. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("P#Kivan",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianKivanBanter1","GLOBAL",1)
Global("G#XB.AdrianKivanBanter2","GLOBAL",0)~ THEN P#KIVAN AdrianKivanBanter#2.1
@273 /* Continue to scowl at the ground, Adrian, and you will find yourself unprepared if we are ambushed. */
DO ~SetGlobal("G#XB.AdrianKivanBanter2","GLOBAL",1)
RealSetGlobalTimer("rh#AdrianKivanTalkTimer","GLOBAL",3600)~
== BRH#ADR @274 /* Continue to shove your nose into my affairs, elf, and you may well find it on fire. */
== BP#KIV @275 /* You are a member of a party. Act like it. */
== BRH#ADR @276 /* Listen to this! I already have one useless elven ranger for a father; I hardly need a second one. */
== BP#KIV @277 /* I see. If he did poorly by you-- */
== BRH#ADR @278 /* Don't make assumptions, elf. You'll only embarrass yourself. */
== BP#KIV @279 /* You are far too old to be acting so young. Only a child or a fool blames the entire world for his own-- */
== BRH#ADR @280 /* Stick to your own troubled past and spare me the condescension. I don't want to hear it. */
EXIT

// 3.
CHAIN IF WEIGHT #-1 ~Global("G#XB.AdrianKivanBanter3","GLOBAL",1)~ THEN RH#ADRJ AdrianKivanBanter#3.1
@281 /* Nine Hells, Kivan, you needn't scowl at me like that. I'm not about to leap across the fire and bite you. */
= @282 /* As entertaining as that would be, I might catch something. */
DO ~SetGlobal("G#XB.AdrianKivanBanter3","GLOBAL",2)~
== P#KIVJ @283 /* I am not in the mood for your games, Adrian. */
== RH#ADRJ @284 /* No, I can see that. Well, if you're so eager to indulge in your misery, I'd hate to distract you. */
= @285 /* Now, could you hand me that bottle of Elverquisst? */
== P#KIVJ @286 /* You have hands. Pick it up yourself. */
== RH#ADRJ @287 /* As you wish. */
= @288 /* ...you know, contrary to what you seem to believe, I've never spent my nights torturing elven maidens to death. Or anyone, for that matter, so you can direct your dark glares elsewhere. */
== P#KIVJ @289 /* (sigh) I may not condone your former lifestyle, but neither do I hold you responsible for my own grief. If you believe otherwise, Adrian, perhaps it is your own heart that bears examining. */
== RH#ADRJ @290 /* How kind of you to even think that I even have one. */
== P#KIVJ @291 /* I do not understand you. Do you fear rejection so much that you seek it out, or are you truly so ashamed of your elven heritage-- */
== RH#ADRJ @292 /* I'm ashamed of nothing, Kivan. Nothing. */
== P#KIVJ @293 /* As you say. But I will not be your scapegoat anymore. Remember that. */
DO ~RestParty()~
EXIT

// 4.
CHAIN IF ~InParty("P#Kivan")
See("P#Kivan")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("P#Kivan",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
OR(2) AreaType(FOREST) Global("Chapter","GLOBAL",%bg2_chapter_7%)
Global("G#XB.AdrianKivanBanter3","GLOBAL",2)
Global("G#XB.AdrianKivanBanter4","GLOBAL",0)~ THEN BRH#ADR AdrianKivanBanter#4.1
@294 /* You look somewhat happier than usual, Kivan. */
DO ~SetGlobal("G#XB.AdrianKivanBanter4","GLOBAL",1)
IncrementGlobal("rh#Adfyfyriad","GLOBAL",1)~
== BP#KIV @295 /* My heart is lighter away from human cities. */
== BRH#ADR @296 /* And above ground, no doubt. */
== BP#KIV @297 /* Yes. */
== BRH#ADR @298 /* It isn't much of a forest, though, is it? Compared to old Cormanthor... Step away from the Moonsea Ride and those blasted trees will blot out the sun. Magnificent, even if-- */
== BP#KIV @299 /* What do you want, Adrian? */
== BRH#ADR @300 /* From you? Nothing. But if you'd rather go talk to a rock-- */
== BP#KIV @301 /* I begin to wonder if those of human blood speak so much so that they need not listen to what they are saying. If this is a gesture of good will, it is remarkably inept. */ 
== BRH#ADR @302 /* Examine a thing too closely, elf, and it'll evaporate like the morning mist you're so fond of. */
== BP#KIV @303 /* Mayhap it would be wisest to end this conversation here. */
== BRH#ADR @304 /* I... fine. Perhaps it would. */
EXIT

// ToB

CHAIN IF ~InParty("P#Kivan")
See("P#Kivan")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("P#Kivan",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("rh#Adrian",LAWFUL_NEUTRAL)
Global("G#XB.AdrianKivanToBBanter1","GLOBAL",0)~ THEN BRH#AD25 AdrianKivanToBBanter#1.1
@305 /* Shevarash, Shevarash... dark and dour Shevarash. I wouldn't have expected him to have such a following amongst the elves. */
DO ~SetGlobal("G#XB.AdrianKivanToBBanter1","GLOBAL",1)~
== BP#KIV25 @306 /* I will only warn you once not to mock my deity, mage. */
== BRH#AD25 @307 /* Were my intent mockery, I assure you, you would know. In any case, I don't particularly care for blasphemy anyway. I've had enough problems with gods without encouraging them. */
= @308 /* But you... you haven't always been a follower of the Black Archer, have you? Vengeance is all fine and good, but still rather unbecoming for an elf. */
== BP#KIV25 IF ~Class("rh#Adrian",SORCERER)~ THEN @309 /* You are hardly fit to judge what is and is not becoming, sorcerer. */
== BP#KIV25 IF ~!Class("rh#Adrian",SORCERER)~ THEN @310 /* You are hardly fit to judge what is and is not becoming, wizard. */
== BRH#AD25 @311 /* No? I suppose that's your prerogative. */
= @312 /* (sigh) Truth be told, I'm getting somewhat tired of always fighting with you, Kivan. */
== BP#KIV25 @313 /* Perhaps you should have considered that ten years ago. */
== BRH#AD25 @314 /* Ah. */
= @315 /* It's been a bit longer than ten years, elf, but I doubt you'd care for the subtleties. */
EXIT

CHAIN IF ~InParty("P#Deher")
See("P#Deher")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("P#Deher",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Alignment("rh#Adrian",LAWFUL_NEUTRAL)
Global("G#XB.AdrianKivanToBBanter2","GLOBAL",0)~ THEN BRH#AD25 AdrianKivanToBBanter#2.1
@316 /* You know, any but the darkest of human cities would have shied away from even this most benevolent use of necromancy. */
DO ~SetGlobal("G#XB.AdrianKivanToBBanter2","GLOBAL",1)~
== BP#DEH25 @317 /* Not including your own, I assume. */
== BRH#AD25 @318 /* Naturally. A trait it shares with Suldanessellar, apparently. I'm not entirely sure what to make of that. */
== BP#DEH25 @319 /* Why make anything of it at all? */
== BRH#AD25 @320 /* Why indeed? You may like to play the role of the lighthearted elven maid, Deheriana, but it doesn't quite fit. */
== BP#DEH25 @321 /* All things in their place, Adrian. I've put more thought into my situation than you might believe, but I would not wish to end my contemplation one day and find that my entire life has passed me by. */
== BRH#AD25 @322 /* Particularly when it's a chance at life you never expected to have. */
== BP#DEH25 @323 /* Just so. */
== BRH#AD25 @324 /* Well then, my lady. I suppose I shall have to simply refrain from comparing you to any lich or vampire we happen across. */
== BP#DEH25 @325 /* (laugh) Yes, I think I would appreciate that. */
EXIT
