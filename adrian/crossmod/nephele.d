// 1.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Nephele",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianNepheleBanter1","GLOBAL",0)~ THEN BLK#NEP AdrianNepheleBanter#1.1
@326 /* My, <CHARNAME>, this one's handsome. Where did you find him? */
DO ~SetGlobal("G#XB.AdrianNepheleBanter1","GLOBAL",1)~
== BRH#ADR @327 /* In an archmage's dungeon, as it so happens, making wands for his blasted pet duergar. */
== BLK#NEP @328 /* Dear me. That  doesn't sound terribly pleasant. You know, I once studied the art of wandmaking, but could never really get the knack of it for some reason. */
== BRH#ADR @329 /* That's hardly surprising. It isn't the sort of thing a cleric normally masters. */
== BLK#NEP @330 /* Yes, well, I learned much of the theory behind the process... it was fascinating. */
== BRH#ADR @331 /* ...I'm sure it was. You don't *dabble* in something like wandcraft, halfling. */
== BLK#NEP @332 /* I don't know about that. I've dabbled in all manner of things you wouldn't expect throughout my life! I even tried my hand at smithing once, though that didn't end terribly well. */
= @333 /* I'm glad there's someone around with a little more expertise on the subject, though, you never know when you might need a wand to whip up a little magic! */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Nephele",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianNepheleBanter1","GLOBAL",1)
Global("G#XB.AdrianNepheleBanter2","GLOBAL",0)~ THEN BLK#NEP AdrianNepheleBanter#2.1
@334 /* Adrian? Adrian, dear, I just asked you a question. */
DO ~SetGlobal("G#XB.AdrianNepheleBanter1","GLOBAL",2)~
== BRH#ADR @335 /* Fancy that. */
== BLK#NEP @190 /* Well? */
== BRH#ADR @336 /* Frankly, halfling, I don't see it as any of your business, and I intend to keep it that way. */
== BLK#NEP @337 /* There's nothing to be ashamed of here, child. Really, I've been through this hundreds of times. It won't hurt. */
== BRH#ADR @338 /* I'd really rather not-- */
= @339 /* Hey! Watch your hands, woman! */
== BLK#NEP @340 /* Stand still, and don't be ridiculous. */
= @341 /* There, was that so difficult? Those pants really do need to be taken in, dear. You really should eat a little better... you're beginning to look unhealthy. */
== BRH#ADR @342 /* And here I thought you ate enough for both of us. */
EXIT