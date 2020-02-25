BEGIN RH#ADR

// 0. if you sneak around the duergar to talk to him or wander blithely through battle just because

CHAIN IF ~NumTimesTalkedTo(0) !Dead("duergar1")~ THEN RH#ADR rh#Adrian0
@0 /* What are you doing over here? Take care of those damned dwarves before you get us both killed! */
DO ~SetNumTimesTalkedTo(0)~ EXIT


// 1. shouted out as soon as the dwarves are all dead

CHAIN IF ~NumTimesTalkedTo(0) Dead("duergar1")~ THEN RH#ADR rh#Adrian1
@1 /* Oh, thank all the gods... or most of them, at least. I never thought-- */
= @2 /* No matter. There's a key on the dwarf over there... please, if you could just bring it to me? */
DO ~SetGlobal("rh#AdrianInitiate","GLOBAL",2)~
== JAHEIRAJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @3 /* It is unlikely that a servant of Irenicus would be found in chains, but not impossible. Still, I am reluctant to abandon another prisoner to the mage's mercy. */
== RH#ADR IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @4 /* I'm hardly a threat to you, my lady, and... certainly not in this state. Please, the key. */
END
 	+ ~!PartyHasItem("rh#key")~ + @5 /* Of course. One moment. */ + rh#Adrian1_key1
 	+ ~PartyHasItem("rh#key")~ + @6 /* I believe I've already found it. */ + rh#Adrian1_key2
 	++ @7 /* As if I'd trust anything in this dungeon! */ + rh#Adrian1_trust
 	++ @8 /* Not so quickly. Tell me who you are first. */ + rh#Adrian1_sianodel
 	++ @9 /* I don't think so. I rather enjoy seeing a man in chains. */ + rh#Adrian1_slave
 	++ @10 /* I'm not falling for this. You can die with the rest of your friends. */ + rh#Adrian1_die

CHAIN RH#ADR rh#Adrian1_key1
@11 /* Thank you! Quickly, please. */
DO ~SetGlobal("rh#AdrianKey","GLOBAL",1) AddJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */,QUEST)~ 
EXIT

CHAIN RH#ADR rh#Adrian1_key2
@13 /* You have? Please, hand it here before more of that damned mage's creatures arrive! */
END
 	++ @14 /* Of course. Here you are. */ + rh#Adrian1_free
 	++ @8 /* Not so quickly. Tell me who you are first. */ + rh#Adrian1_sianodel
 	++ @15 /* Why should I trust you? */ + rh#Adrian1_trust
 	++ @9 /* I don't think so. I rather enjoy seeing a man in chains. */ + rh#Adrian1_slave
 	++ @10 /* I'm not falling for this. You can die with the rest of your friends. */ + rh#Adrian1_die

CHAIN RH#ADR rh#Adrian1_trust
@16 /* I'm not here by choice, my <PRO_LADYLORD>, I can assure you of that much. My name... */
END
IF ~~ + rh#Adrian1_sianodel

CHAIN RH#ADR rh#Adrian1_sianodel
@17 /* Adrian. Adrian Sianodel. I'm one of the master's... pets, purchased from slavers in Athkatla a week, perhaps two weeks ago. He seemed displeased that my blood was less than pure, but beyond that... I don't know. */
DO ~SetGlobal("rh#AdrianEarlyExpo","GLOBAL",1)~
== RH#ADR IF ~Class("rh#Adrian",SORCERER)~ THEN @18 /* My sorcery was of brief interest to him, though he... tired of me quickly regardless. I'd have likely ended up like his other failed experiments, but my skill at crafting wands made me... useful. */
== RH#ADR IF ~!Class("rh#Adrian",SORCERER)~ THEN @19 /* I can't imagine that my magic would have been of much interest to a man like that, and he... tired of me quickly enough. I'd have likely ended up like his other failed experiments, but my skill at crafting wands made me... useful. */
== RH#ADR @20 /* A miserable existence, but better than the alternatives. */
== IMOENJ IF ~InParty("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN @21 /* I guess that would explain all those wands in the other room. */
== RH#ADR IF ~InParty("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN @22 /* Not exactly my best work, but under the circumstances... */
END
 	+ ~!PartyHasItem("rh#key")~ + @23 /* I see. Give me a moment and I'll find you your key. */ + rh#Adrian1_key1
 	+ ~PartyHasItem("rh#key")~ + @24 /* I see. I'll release you immediately. */ + rh#Adrian1_free
 	++ @25 /* A slave, is it? Perhaps you belong in chains. */ + rh#Adrian1_slave
 	++ @26 /* What can you tell me about Irenicus? */ + rh#Adrian1_irenicus
 	++ @27 /* You've wasted enough of my time. Good luck. */ + rh#Adrian1_leave
 	++ @28 /* I'm not making the mistake of trusting anything in this dungeon. Sorry. */ + rh#Adrian1_leave

CHAIN RH#ADR rh#Adrian1_irenicus
@29 /* I am-- was his slave, not his confidant. He's probably the most potent wizard I've ever seen, and I... well, suffice to say, I run in powerful circles. */
END
  	+ ~!PartyHasItem("rh#key")~ + @30 /* I see. I'll find you your key. */ + rh#Adrian1_key1
 	+ ~PartyHasItem("rh#key")~ + @24 /* I see. I'll release you immediately. */ + rh#Adrian1_free
 	++ @31 /* As a slave, perhaps you belong in chains. */ + rh#Adrian1_slave
 	++ @27 /* You've wasted enough of my time. Good luck. */ + rh#Adrian1_leave
 	++ @28 /* I'm not making the mistake of trusting anything in this dungeon. Sorry. */ + rh#Adrian1_leave

CHAIN RH#ADR rh#Adrian1_slave
@32 /* I hardly look like the only one present who's fallen upon hard times, my <PRO_LADYLORD>, but if you free me, I could be of use to you. */
= @33 /* That mage... Irenicus... you'll need all of the arcane talent you can muster if he's taken an interest in you, and I have more than a bit. That isn't an asset to throw away lightly. */
END	
 	+ ~!PartyHasItem("rh#key")~ + @34 /* I suppose not. I'll look for your key. */ + rh#Adrian1_key1
 	+ ~PartyHasItem("rh#key")~ + @35 /* I suppose not. I'll release you immediately. */ + rh#Adrian1_free
 	++ @36 /* Perhaps not. Who are you? */ + rh#Adrian1_sianodel
 	++ @28 /* I'm not making the mistake of trusting anything in this dungeon. Sorry. */ + rh#Adrian1_leave
 	++ @37 /* Given your current predicament, I'm unimpressed. Good luck. */ + rh#Adrian1_leave
  	++ @38 /* I can't decide if your desperation or arrogance is more irritating, but I think I'd rather just kill you. */ + rh#Adrian1_die

CHAIN RH#ADR rh#Adrian1_die
@39 /* What!? You... damn you! May you find your grave in this hell also! */ 
DO ~Enemy()~ 
EXIT

CHAIN RH#ADR rh#Adrian1_leave
@40 /* You... you'll just leave me here, then? Damn you! May you find your grave in this hell also! */
DO ~SetGlobal("rh#AdrianRefused","GLOBAL",1)~
EXIT

CHAIN RH#ADR rh#Adrian1_free
@41 /* My thanks. */
DO ~SetGlobal("rh#FirstTalk","GLOBAL",1) TakePartyItem("rh#key") DestroyItem("rh#key")~
END
IF ~!Global("rh#AdrianEarlyExpo","GLOBAL",1)~ + rh#Adrian4_sianodel2
IF ~Global("rh#AdrianEarlyExpo","GLOBAL",1)~ + rh#Adrian4_hero

// 2. if you laugh in his face and then come back to talk to him again

CHAIN IF ~Global("rh#AdrianRefused","GLOBAL",1) !PartyHasItem("rh#key")~ THEN RH#ADR rh#Adrian2
@42 /* Fine. Stay here and taunt me. If Irenicus returns, perhaps I'll still have the pleasure of watching him butcher you. */
EXIT

// 3. if you still haven't bothered to search the duergar

CHAIN IF ~Global("rh#AdrianKey","GLOBAL",1) !PartyHasItem("rh#key") !Global("rh#FirstTalk","GLOBAL",1)~ THEN RH#ADR rh#Adrian3
@43 /* Quickly! It should be on that duergar over there. */
EXIT

// 4. shouted out once you have the key

CHAIN IF ~Global("rh#AdrianInitiate","GLOBAL",2) PartyHasItem("rh#key") !Global("rh#AdrianRefused","GLOBAL",1) !Global("rh#FirstTalk","GLOBAL",1)~ THEN RH#ADR rh#Adrian4
@44 /* You've found it! Please, hand it here before more of that damned mage's creatures arrive! */
DO ~SetGlobal("rh#FirstTalk","GLOBAL",1)~
END
 	++ @45 /* Of course. Here you go. */ + rh#Adrian4_free
 	++ @46 /* Calm down. Hold on a moment, and I'll release you. */ + rh#Adrian4_free
	++ @47 /* Very well, but you had better make it worth my time. */ + rh#Adrian4_time
 	+ ~!Global("rh#AdrianEarlyExpo","GLOBAL",1)~ + @48 /* First tell me who you are. */ + rh#Adrian4_sianodel1
 	++ @49 /* On second thought, I'd rather just leave you here. */ + rh#Adrian4_taunt

CHAIN RH#ADR rh#Adrian4_free
@41 /* My thanks. */
DO ~TakePartyItem("rh#key") DestroyItem("rh#key")~
END
IF ~!Global("rh#AdrianEarlyExpo","GLOBAL",1)~ + rh#Adrian4_sianodel2
IF ~Global("rh#AdrianEarlyExpo","GLOBAL",1)~ + rh#Adrian4_hero

CHAIN RH#ADR rh#Adrian4_time
@50 /* You can have my services for as long as you require them. */
DO ~TakePartyItem("rh#key") DestroyItem("rh#key")~
END
IF ~!Global("rh#AdrianEarlyExpo","GLOBAL",1)~ + rh#Adrian4_sianodel2
IF ~Global("rh#AdrianEarlyExpo","GLOBAL",1)~ + rh#Adrian4_hero

CHAIN RH#ADR rh#Adrian4_sianodel1
@51 /* Of course. Adrian. Adrian Sianodel. That damned mage had his agents purchase me from slavers in Athkatla a week, perhaps two weeks ago. He seemed displeased that my blood was less than pure, but beyond that... I don't know. */
DO ~SetGlobal("rh#AdrianEarlyExpo","GLOBAL",1)~
== RH#ADR IF ~Class("rh#Adrian",SORCERER)~ THEN @18 /* My sorcery was of brief interest to him, though he... tired of me quickly regardless. I'd have likely ended up like his other failed experiments, but my skill at crafting wands made me... useful. */
== RH#ADR IF ~!Class("rh#Adrian",SORCERER)~ THEN @19 /* I can't imagine that my magic would have been of much interest to a man like that, and he... tired of me quickly enough. I'd have likely ended up like his other failed experiments, but my skill at crafting wands made me... useful. */
== IMOENJ IF ~InParty("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN @21 /* I guess that would explain all those wands in the other room. */
== RH#ADR IF ~InParty("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN @22 /* Not exactly my best work, but under the circumstances... */
== RH#ADR @52 /* Please, if you could release me now? */
END
 	++ @45 /* Of course. Here you go. */ + rh#Adrian4_free
 	++ @46 /* Calm down. Hold on a moment, and I'll release you. */ + rh#Adrian4_free
	++ @47 /* Very well, but you had better make it worth my time. */ + rh#Adrian4_time
 	++ @49 /* On second thought, I'd rather just leave you here. */ + rh#Adrian4_taunt
 	
CHAIN RH#ADR rh#Adrian4_sianodel2
@53 /* My name, by the way. Adrian. Adrian Sianodel. That damned mage had his agents purchase me from slavers in Athkatla a week, perhaps two weeks ago. He seemed displeased that my blood was less than pure, but beyond that... I don't know. */
== RH#ADR IF ~Class("rh#Adrian",SORCERER)~ THEN @18 /* My sorcery was of brief interest to him, though he... tired of me quickly regardless. I'd have likely ended up like his other failed experiments, but my skill at crafting wands made me... useful. */
== RH#ADR IF ~!Class("rh#Adrian",SORCERER)~ THEN @19 /* I can't imagine that my magic would have been of much interest to a man like that, and he... tired of me quickly enough. I'd have likely ended up like his other failed experiments, but my skill at crafting wands made me... useful. */
== RH#ADR @20 /* A miserable existence, but better than the alternatives. */
== IMOENJ IF ~InParty("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN @21 /* I guess that would explain all those wands in the other room. */
== RH#ADR IF ~InParty("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN @22 /* Not exactly my best work, but under the circumstances... */
END
IF ~~ + rh#Adrian4_hero

CHAIN RH#ADR rh#Adrian4_hero
@54 /* You're... <CHARNAME>, was it? From Baldur's Gate? The duergar might have mentioned you a time or two when they weren't... otherwise engaged. */
END
	++ @55 /* I am. It's a pleasure to meet you. */ + rh#Adrian4_likewise
	++ @56 /* Could we save the pleasantries for later? We need to get out of this dungeon. */ + rh#Adrian4_dungeon
	++ @57 /* What do you know about me? */ + rh#Adrian4_know
	++ @58 /* Enchanted, I'm sure. I released you but I'm not interested in your company. Find your own way out. */ + rh#Adrian4_enchanted

CHAIN RH#ADR rh#Adrian4_likewise
@59 /* Likewise. Regardless, we'd best find a way out of this dungeon before the mage or more of his creatures show up. */
END
	++ @60 /* Of course. Let's go. */ DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@61 /* Find the key.

Adrian, the mage I discovered in Irenicus' dungeon, was all too happy to remain in my company upon being freed from his chains. Hopefully he will not make a habit of being kidnapped. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",1) AddexperienceParty(3000) JoinParty()~
EXIT

	++ @62 /* I haven't heard a better idea all <DAYNIGHT>. */
	DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@61 /* Find the key.

Adrian, the mage I discovered in Irenicus' dungeon, was all too happy to remain in my company upon being freed from his chains. Hopefully he will not make a habit of being kidnapped. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",1) AddexperienceParty(3000) JoinParty()~
EXIT

	++ @63 /* You'd best remember who is in command here. */ + rh#Adrian4_command
	++ @64 /* I released you but I'm not interested in your company. Find your own way out. */ + rh#Adrian4_enchanted

CHAIN RH#ADR rh#Adrian4_know
@65 /* Aside from the fact that you were Irenicus' newest test subject? Very little. Regardless, we'd best find a way out of this dungeon before the mage or more of his creatures show up. */
END
	++ @60 /* Of course. Let's go. */ DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@61 /* Find the key.

Adrian, the mage I discovered in Irenicus' dungeon, was all too happy to remain in my company upon being freed from his chains. Hopefully he will not make a habit of being kidnapped. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",1) AddexperienceParty(3000) JoinParty()~
EXIT

	++ @62 /* I haven't heard a better idea all <DAYNIGHT>. */
	DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@61 /* Find the key.

Adrian, the mage I discovered in Irenicus' dungeon, was all too happy to remain in my company upon being freed from his chains. Hopefully he will not make a habit of being kidnapped. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",1) AddexperienceParty(3000) JoinParty()~
EXIT

	++ @63 /* You'd best remember who is in command here. */ + rh#Adrian4_command
	++ @64 /* I released you but I'm not interested in your company. Find your own way out. */ + rh#Adrian4_enchanted

CHAIN RH#ADR rh#Adrian4_dungeon
@66 /* True enough. After you. */
DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@61 /* Find the key.

Adrian, the mage I discovered in Irenicus' dungeon, was all too happy to remain in my company upon being freed from his chains. Hopefully he will not make a habit of being kidnapped. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",1) AddexperienceParty(3000) JoinParty()~
EXIT

CHAIN RH#ADR rh#Adrian4_command
@67 /* My <PRO_LADYLORD>, I assure you, it's quite obvious. */
DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@61 /* Find the key.

Adrian, the mage I discovered in Irenicus' dungeon, was all too happy to remain in my company upon being freed from his chains. Hopefully he will not make a habit of being kidnapped. */,QUEST_DONE)

SetGlobal("rh#AdrianJoined","GLOBAL",1) AddexperienceParty(3000) JoinParty()~
EXIT

CHAIN RH#ADR rh#Adrian4_enchanted
@68 /* I see. Forge ahead and I'll follow in your wake, then. We won't meet again. */
DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@69 /* Find the key.

While I freed Adrian from his chains, I decided that it was best if we continued separately. He can attempt to escape this dungeon on his own. */,QUEST_DONE)
ForceSpell(Myself,WIZARD_INVISIBILITY) AddexperienceParty(3000) EscapeArea()~
EXIT

CHAIN RH#ADR rh#Adrian4_taunt
@70 /* You... you would taunt me with hope and then take it away? Fine. We may yet meet in the Nine Hells, my <PRO_LADYLORD>. Sooner rather than later if any of my prayers are answered. */
DO ~SetGlobal("rh#AdrianRefused","GLOBAL",1)~
EXIT

// 5. if you laugh in his face and then come back to talk to him again

CHAIN IF ~Global("rh#AdrianRefused","GLOBAL",1) PartyHasItem("rh#key")~ THEN RH#ADR rh#Adrian5
@71 /* Back again, then? Do you intend to help me or have you simply come to taunt? By all means, waste your time. Perhaps we can yet die together. */
END
 	++ @72 /* Here's your key. */ + rh#Adrian5_key
 	++ @73 /* I was going to free you, but I doubt you'd even appreciate it. */ + rh#Adrian5_appreciate
 	++ @74 /* I enjoy taunting. */ + rh#Adrian5_bite
 	++ @75 /* Actually, I'm here to kill you. */ + rh#Adrian5_kill

CHAIN RH#ADR rh#Adrian5_key
@76 /* You have my gratitude if not my friendship. We won't meet again. */
DO ~EraseJournalEntry(@12 /* Find the key.

I have discovered another prisoner in Irenicus' dungeon: a half-elven spellcaster. He claims that the key to his chains is on one of the duergar I just defeated. I should bring it to him once I have found it. */)

AddJournalEntry(@77 /* Find the key.

While I freed Adrian from his chains, he didn't appreciate my earlier taunting and took off by himself. He can attempt to escape this dungeon on his own. */,QUEST_DONE)

TakePartyItem("rh#key") DestroyItem("rh#key") AddexperienceParty(3000) ForceSpell(Myself,WIZARD_INVISIBILITY) EscapeArea()~ EXIT

CHAIN RH#ADR rh#Adrian5_appreciate
@78 /* You... fine, I'm sorry. Please. */
END
	++ @79 /* Very well. Here's your key. */ + rh#Adrian5_key
 	++ @80 /* You beg nicely, don't you? I rather enjoy that. */ + rh#Adrian5_bite

CHAIN RH#ADR rh#Adrian5_bite
@81 /* Come any closer and you may get to see if you enjoy being bitten also. */
EXIT

CHAIN RH#ADR rh#Adrian5_kill
@82 /* You... to the abyss with you, <CHARNAME>! */
DO ~Enemy()~ 
EXIT
