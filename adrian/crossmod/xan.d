// SoA

// 1.
CHAIN IF ~InParty("O#Xan")
See("O#Xan")
!StateCheck("O#Xan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianXanBanter1","GLOBAL",0)~ THEN BRH#ADR AdrianXanBanter#1.1
@418 /* I take it that you've known <CHARNAME> for some time now. */
DO ~SetGlobal("G#XB.AdrianXanBanter1","GLOBAL",1)~
== BO#XAN IF ~!Global("O#XanNeverMet","GLOBAL",1)~ THEN @419 /* If you hope to hear about <PRO_HISHER> adventures in the north, know that they were no less desperate than <PRO_HISHER> current quest. How we survived at all, I shall never know. */
== BO#XAN IF ~Global("O#XanNeverMet","GLOBAL",1)~ THEN @420 /* Not as such, no. We met briefly when <PRO_HESHE> freed me from captivity in Nashkel, but we were never formally introduced. I suspect that I shall regret changing that. */
== BO#XAN @421 /* Surely our luck will run dry soon enough -- <CHARNAME> is as reckless now as <PRO_HESHE> was then. This quest can only end in disaster. */
== BRH#ADR @422 /* Perhaps, but there are so many different shades of disaster. If we're very lucky, we might even get to watch Athkatla sink into the Sea of Swords. */
== BO#XAN @423 /* And you would enjoy that, no doubt. */
== BRH#ADR @424 /* That would depend upon the view. */
== BO#XAN @425 /* Madness. */
== BRH#ADR @426 /* It's painfully ironic, though, isn't it? Look at you... the heights of arcane might, the secrets of elven high magic itself... in the hands of one without the ambition to truly appreciate it. */
== BO#XAN @427 /* I doubt that I would ever be privy to my people's greatest secrets in any case. Few are deemed worthy, and my fate... (sigh) My fate lies elsewhere, I fear. */ 
== BRH#ADR @428 /* Of course it does. Hells, is there anything that doesn't fill you with sorrow and dread? */
== BO#XAN @429 /* Not even this conversation, unfortunately. How well do I know <CHARNAME>, how ambitious am I...? Adrian, do you always subject potential rival mages to this subtle interrogation, or do you normally simply... murder them? */
== BRH#ADR @430 /* (smile) I'm not nearly as homicidal as you seem to think I am. */
== BO#XAN @431 /* That leaves room for a great deal of latitude. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("O#Xan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianXanBanter1","GLOBAL",1)
Global("G#XB.AdrianXanBanter2","GLOBAL",0)~ THEN BO#XAN AdrianXanBanter#2.1
@432 /* The more I see of Athkatla, the more I suspect that humankind must be collectively mad. Each city I visit is somehow worse than the one that came before. More corruption, more crime, more filth lying on the streets-- */
DO ~SetGlobal("G#XB.AdrianXanBanter2","GLOBAL",1)~
== BRH#ADR @433 /* Missing Evereska, are we? What's your population these days, Xan? Five? */
== BO#XAN @434 /* I fear that it may soon come to that. */
== BRH#ADR @435 /* It can't be much of a city if you elves are all so eager to run away. */ 
= @436 /* Assuming, of course, that it's even still a city at all. Perhaps it's already as ruined as lovely old Myth Drannor -- nothing left but shattered towers to commemorate a golden age that never actually existed. Meanwhile, its delusional citizens wander about the Realms, insisting that their glorious hidden wonder still stands. Fitting, in a way. Hilariously so. */
== BO#XAN @437 /* Only one who has never experienced Evereska's splendor could make such remarks. */
== BRH#ADR @438 /* I'm afraid my blood isn't pure enough to receive that particular invitation. */
== BO#XAN @439 /* Perhaps that is for the best. I do not doubt that you would find its tranquility... stifling. */
== BRH#ADR @440 /* That's one word for it, I suppose. */
EXIT

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("O#Xan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianXanBanter1","GLOBAL",1)
Global("G#XB.AdrianXanBanter3","GLOBAL",0)~ THEN BO#XAN AdrianXanBanter#3.1
@441 /* I cannot help but wonder if <CHARNAME>'s recent torment affected <PRO_HISHER> senses more profoundly than I had at first thought. Some of <PRO_HISHER> recent decisions leave much to be desired. */
DO ~SetGlobal("G#XB.AdrianXanBanter3","GLOBAL",1)~
== BRH#ADR @442 /* I notice that you look at me when you say that. */
== BO#XAN @443 /* You are not one of <PRO_HISHER> better choices, no. But it makes little difference whether I look at you or I look elsewhere. */
= @444 /* (sigh) Either way, there is nothing to see. */
EXIT

// 4.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("O#Xan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
TimeOfDay(DAY)
Global("G#XB.AdrianXanBanter2","GLOBAL",1)
Global("G#XB.AdrianXanBanter4","GLOBAL",0)~ THEN BO#XAN AdrianXanBanter#4.1
@445 /* The pointlessness of this quest never ceases to amaze me. We hunt a mage who surely has enough arcane might to kill us all multiple times over... we might as well save ourselves the trouble and simply lie down and die. */
DO ~SetGlobal("G#XB.AdrianXanBanter4","GLOBAL",1)~
== BRH#ADR @446 /* Here we go again. */
== BO#XAN @447 /* Roll your eyes, if you must. It will make no difference in the end. This quest is hopeless. */
== BRH#ADR @448 /* I honestly don't understand why you haven't just given up and pledged yourself over to Shar yet. It seems the obvious choice. */
== BO#XAN @449 /* Seldarine, are you mad!? To even suggest such a thing... */
== BRH#ADR @450 /* Oh, don't look so horrified. You might even appreciate her particular... solace. I certainly have from time to time. A couple of words whispered into the darkness when things look their worst... */
== BVICONI IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @451 /* The Nightsinger is not to be taken up and then cast aside again. When you embrace her, tu'rilthiir, you embrace her completely. */
== BRH#ADR IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @452 /* We don't all have your... commitment, Viconia. */
== BRH#ADR @453 /* I wouldn't make a habit of it, but it's surprisingly cathartic. And you could surely use some catharsis, Xan. */
== BO#XAN @454 /* Enough of this. I may speak of doom, but you... (shudder) You invite it. */
EXIT

// 5.
CHAIN IF ~InParty("O#Xan")
See("O#Xan")
!StateCheck("O#Xan",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("G#XB.AdrianXanBanter2","GLOBAL",1)
Global("G#XB.AdrianXanBanter5","GLOBAL",0)~ THEN BRH#ADR AdrianXanBanter#5.1
@455 /* I know, I know... there is no point and we are all doomed regardless, but could you give me back that scroll we found the other day? I wasn't finished looking at it yet. */
DO ~SetGlobal("G#XB.AdrianXanBanter5","GLOBAL",1)~
== BO#XAN @456 /* I did not take your scroll, Adrian. */
== BRH#ADR @457 /* No, of course not. In your mind, no doubt, it already belonged to you. Your ears, after all, are slightly pointier than mine. */
== BO#XAN @458 /* (sigh) It is no wonder that my kin has largely fled these lands. */
== BRH#ADR @459 /* And what exactly is that supposed to mean? */
== BO#XAN @460 /* Precisely what I said. Some amongst us believe that the future of the elven race lies with the half-blood children. A vain delusion -- the blood thins more and more quickly, until even the memory of elven heritage is forgotten. */
= @461 /* But perhaps that is for the best. (sigh) If this is our future, how I grieve for the past. Once, the half-blood were strangers everywhere -- a sad fate, but as much as could be expected. Now it seems that they side with our enemies instead. */
== BRH#ADR @462 /* Don't think that none of your... ever so noble kindred were amongst my associates, elf. */
== BO#XAN @463 /* No, that is hardly surprising. Darkness can lie within the most elven of hearts. Were we truly perfect... */
= @464 /* But you are angry now. If you find the truth so offensive, I suppose I shall not bother to speak it again. */
EXIT

// ToB

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
!StateCheck("O#Xan",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianXanToBBanter1","GLOBAL",0)~ THEN BO#XAN25 AdrianXanToBBanter#1.1
@465 /* No doubt I shall soon regret asking you anything at all, but you seem somewhat pensive to<DAYNIGHT>. */
DO ~SetGlobal("G#XB.AdrianXanToBBanter1","GLOBAL",1)~
== BRH#AD25 @466 /* As opposed to angry? Yes, I suppose I do. */
= @467 /* Have you ever wondered why some peoples rebuild and rebuild and rebuild, while others simply give up and run away? */
== BO#XAN25 @468 /* Collective insanity, I would imagine. In any case, I should warn you that your constant diatribes against my people are becoming somewhat... tired. */
END
IF ~Alignment("rh#Adrian",LAWFUL_NEUTRAL)~ THEN EXTERN BRH#AD25 AdrianXanToBBanter#1.2
IF ~Alignment("rh#Adrian",LAWFUL_EVIL)~ THEN EXTERN BRH#AD25 AdrianXanToBBanter#1.3

CHAIN BRH#AD25 AdrianXanToBBanter#1.2
@469 /* You made the connection, Xan, not I. In any case, Netheril fell too. Knocked out of the sky by... well, who knows what. If we had longer memories, perhaps we would still be bemoaning its loss as well. */
== BO#XAN25 @470 /* You make a short memory sound like a gift rather than a curse. */
= @471 /* (sigh) All things considered, perhaps it is. */
== BRH#AD25 @472 /* Maybe. Still, even short memories stretch back far enough, and back home... at least one of our cities gets knocked over every generation or so. Nobody gives up and flees across the sea. We don't sigh over the glory of the past and refuse to rebuild... */
= @473 /* Not that we have much of anything to sigh over, I suppose. */
== BO#XAN25 @474 /* Ah, yes. The so-called valiant folk of the Moonsea... I can't help but notice that you didn't stay to rebuild your fallen city. */
== BRH#AD25 @475 /* (smile) Well, I suspect I have too much elven blood in me for that. */
== BO#XAN25 @476 /* ...of course. (sigh) You are incorrigible, Adrian. */
== BRH#AD25 @477 /* I certainly hope so. */	
EXIT

CHAIN BRH#AD25 AdrianXanToBBanter#1.3
@478 /* Funny. Myself, the only thing I find more tiring than your self-righteous, hypocritical, entitled elven nonsense would be... well, cleaning up after the constant messes. Or being one of them. */
== BO#XAN25 @479 /* (sigh) I don't know why I even bother. */
== BRH#AD25 @480 /* You certainly don't have to. */
EXIT