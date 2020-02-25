CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("O#Tiax",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianTiaxBanter1","GLOBAL",0)~ THEN BO#TIAX AdrianTiaxBanter#1.1
@403 /* You! Mage! Tiax finds your colors offensive to his eyes! Come tomorrow morning, you will exchange them for purple robes -- the proper colors of a Cyricist wizard! */
= @404 /* On second thought, tomorrow is not soon enough. You will remove them at once, mage! Off with them! Now! */
DO ~SetGlobal("G#XB.AdrianTiaxBanter1","GLOBAL",1)~
== BRH#ADR @405 /* I... what? */
== BO#TIAX @406 /* Questioning orders! The Great Tiax will remember this once his reign begins. But he is a merciful ruler and-- */
== BRH#ADR @407 /* You know, I can't say I thought too highly of the Mad God's standards before, but this... hells, I don't know what to make of this at all. */
== BO#TIAX @408 /* You dare mock the Great Tiax?! */
== BRH#ADR @409 /* I should think that rather obvious. */
= @410 /* Your madness must be contagious, Cyricist. I can't imagine why else I haven't killed you yet. */
== BO#TIAX @411 /* Bah! Tiax cannot be killed! His great destiny precludes such a trifling fate! */
== BRH#ADR @412 /* ...I'd be happy to test that theory. */
END
	++ @413 /* Adrian, calm down. Can't you tell that he's insane? */ EXTERN BRH#ADR AdrianTiaxBanter#1.2
	++ @414 /* That's enough. Both of you. */ EXTERN BRH#ADR AdrianTiaxBanter#1.2
	++ @415 /* Tiax, understanding cannot be forced upon someone. You would be wise to give him some time. */ EXTERN BRH#ADR AdrianTiaxBanter#1.3

CHAIN BRH#ADR AdrianTiaxBanter#1.2
@416 /* Fine. Keep your pet lunatic away from me and I'll leave him alone, but if he spits anymore of his Cyricist filth at me, don't think I won't choke him with it. */
EXIT

CHAIN BRH#ADR AdrianTiaxBanter#1.3
@417 /* You too, <CHARNAME>? */
= @416 /* Fine. Keep your pet lunatic away from me and I'll leave him alone, but if he spits anymore of his Cyricist filth at me, don't think I won't choke him with it. */
EXIT