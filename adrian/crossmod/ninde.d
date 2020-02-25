// SoA

// 1.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Ninde",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianNindeBanter1","GLOBAL",0)~ THEN BLK#NIND AdrianNindeBanter#1.1
@343 /* Darling, who have you been drinking with? That is *not* how you hold a wineglass. Quite frankly, I'm appalled. I thought you were a nobleman, but apparently I was mistaken. */
DO ~SetGlobal("G#XB.AdrianNindeBanter1","GLOBAL",1)~
== BRH#ADR @344 /* Well, we can't all enjoy the... wonderful company that you keep. */
= @345 /* A necromancer in the service of vampires. Tell me, Ninde. Was that an experiment gone awry, or are you truly so senseless? */
== BLK#NIND @346 /* No sane woman is ever led by sense to a crypt, unless she has a deathwish or a plan. */
== BRH#ADR @347 /* And I take it you had the latter? */
== BLK#NIND @348 /* I didn't say that, now, did I? */
= @349 /* But enough about me, blossom. I can tell when a man has been up to nothing but trouble, and you certainly have the look. What dark, delicious tales would you care to share, hmm? */
== BRH#ADR @350 /* None, shockingly, but by your expression, I suspect you already know. No doubt your former mistress made scrupulous study of all of us. */
= @351 /* Whatever you might think, elf, it wasn't all glamorous. */
== BLK#NIND @352 /* Few things in this world are truly glamorous, Adrian. Aside from myself, of course. */
= @353 /* But you are misinformed. Bodhi did not make a habit of disclosing such information to mere servants, I assure you. Whatever secrets you so obviously wish to remain buried shall remain so... unless I can persuade you otherwise? */
== BRH#ADR @354 /* I don't think so. */
== BLK#NIND @355 /* A shame. */
EXIT

// 2.
CHAIN IF ~InParty("Ninde")
See("Ninde")
!StateCheck("Ninde",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
GlobalGT("AsylumPlot","GLOBAL",39)
Global("G#XB.AdrianNindeBanter1","GLOBAL",1)
Global("G#XB.AdrianNindeBanter2","GLOBAL",0)~ THEN BRH#ADR AdrianNindeBanter#2.1
@356 /* Well, well... is this what I think it is? You really don't cut any corners with this necromantic nonsense, do you, Ninde? */
DO ~SetGlobal("G#XB.AdrianNindeBanter2","GLOBAL",1)~
== BLK#NIND  @357 /* I never cut corners. Tell me, Zhent, do you make a habit of snooping through the possessions of others, or am I just special? */
== BRH#ADR @358 /* When possessions are just lying about for anyone to explore, I'm afraid that sometimes I can't help myself. */
= @359 /* In any case, I'd assumed that after spending so much time in a vampire's thrall, you wouldn't still value privacy so much. Or even know what it is. */
== BLK#NIND  @360 /* You make it sound so dirty. In my experience, vampires are some of the cleanest creatures I've seen, considering their tiresome obsession with remaining life-like. In addition, "thrall" implies some sort of mind control. I assure you, I have full control of my... senses. */
== BRH#ADR @361 /* Well, that's an interesting theory. */
= @362 /* Still, I suppose there's some value in a necromancer's company. All things considered, I assume you have a unique perspective on the issue of soullessness. No doubt you've looked into it yourself? */
== BLK#NIND @363 /* What do you take me for, a research assistant? You should really learn to be more subtle, Adrian. Do your own dirty work. */
== BRH#ADR @364 /* Subtlety has nothing to do with it, my dear. But I suppose you're the type to lock yourself away with your research until you've both decayed to nothing. Pathetic, really. */
== BLK#NIND @365 /* My, my, the Azuthan has teeth. But truly, I've been in this argument before and honestly, dear, you're out of your depth. Enjoy your stewing. */
EXIT

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Ninde",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianNindeBanter2","GLOBAL",1)
Global("G#XB.AdrianNindeBanter3","GLOBAL",0)~ THEN BLK#NIND AdrianNindeBanter#3.1
@366 /* Maybe it's just the light, Adrian, but sometimes you make me wish I hadn't sworn off Zhents years ago. Something about your jaw, I think. */
DO ~SetGlobal("G#XB.AdrianNindeBanter3","GLOBAL",1)~
= @367 /* Then again, your hair ruins the whole effect, so perhaps not. You know, you really should really make an effort to wash it every once in a while; it's starting to resemble something greasy and dead for a week. */
== BRH#ADR @368 /* Dead for a week, is it? That wouldn't be the result of that dead rabbit I found in my bedroll this morning, I hope. Necromancers aren't the only mages who enjoy *killing* things every now and again, Ninde. */
== BLK#NIND @369 /* Surely I wouldn't know anything about that. (smile) */
== BRH#ADR @370 /* No, of course not. Honestly, Ninde, is there even a point to this? */
== BLK#NIND @371 /* Oh, you needn't get your knickers in a twist on my account, honeybunch. I was just wondering... hmm. */
= @372 /* Far be it from me to share past exploits without learning anything in return, but are all Zhents so... deliciously sadistic in bed? */
== BRH#ADR @373 /* Well, if I were going to invite you into my bed, I think I'd like to get *something* pleasant out of it. */
== BLK#NIND @374 /* Over the years, I've heard many proposals, Adrian... risque, romantic, endearing. Frightening, even. But that was not one of them. */
== BRH#ADR @375 /* I'd have hoped you could tell the difference between a proposal and a rejection, but apparently I overestimated you. */
== BLK#NIND @376 /* Oh, no, I understood perfectly, darling. I'm just letting you know that on second thought... you really don't stand much of a chance at all. */
== BRH#ADR @377 /* I've had your like before, Ninde. Trust me, it's hardly worth a repeat performance anyway. */
EXIT

// 4.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Ninde",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianNindeBanter3","GLOBAL",1)
Global("G#XB.AdrianNindeBanter4","GLOBAL",0)~ THEN BLK#NIND AdrianNindeBanter#4.1
@378 /* Loath as I am to ask advice from a Zhent, there is no one else in this godsforsaken bunch of misfits who is cultured enough to understand my position. */
DO ~SetGlobal("G#XB.AdrianNindeBanter4","GLOBAL",1)~
== BRH#ADR @379 /* Cultured am I, now? It's lovely to have the approval of a Waterdhavian whore. */
== BLK#NIND @380 /* Now, now. There's no need for namecalling, sweatpea, especially from a former Zhentarim skymage. */
= @381 /* But if that is how you intend to be, you needn't worry yourself over it. I can think it through on my own. */
== BRH#ADR @382 /* Ninde, if you want to ask something, just ask it. */
END
IF ~!GlobalGT("LK#NindeLoveTalks","GLOBAL",23)~ THEN EXTERN BLK#NIND AdrianNindeBanter#4.2
IF ~GlobalGT("LK#NindeLoveTalks","GLOBAL",23) OR(2) Global("LK#NindeRomanceActive","GLOBAL",1) Global("LK#NindeRomanceActive","GLOBAL",2)~ THEN EXTERN BLK#NIND AdrianNindeBanter#4.3

CHAIN BLK#NIND AdrianNindeBanter#4.2
@383 /* Very well. */
= @384 /* Does my hair look better like this... or like this? */
EXIT
 
CHAIN BLK#NIND AdrianNindeBanter#4.3
@287 /* As you wish. */
= @385 /* So. This interesting little thing between <CHARNAME> and myself. Your thoughts? */
== BRH#ADR @386 /* I hardly think that my opinion matters. */
== BLK#NIND @387 /* Well, I have to think about... well, not really. I was going to say my station, but in all honesty, I just wanted to gloat a little to someone who wasn't a complete nitwit. */
EXIT

// ToB

CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Ninde",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianNindeToBBanter1","GLOBAL",0)~ THEN BLK#NI25 AdrianNindeBanter#1.1
@388 /* You seem remarkably unbothered by this whole palaver, blossom. Though perhaps that isn't entirely surprising for a Zhent. */
DO ~SetGlobal("G#XB.AdrianNindeToBBanter1","GLOBAL",1)~
== BRH#AD25 @389 /* Careful there, Ninde. If you get any more obsessed, you're going to start sounding like a Harper. */
== BLK#NI25 @390 /* That's offensive, Adrian. For shame. I may cry. */
= @391 /* What if I just happen to like the sound of the word, hmm? The way it rolls off the tongue? The images it conjures? */
== BRH#AD25 @392 /* Really. And what images does it conjure for you, exactly? */
== BLK#NI25 @393 /* Oh, handsome men in loincloths fanning me, of course. Then again, most things conjure that particular scenario, I've found. */
== BRH#AD25 @394 /* With such a... limited imagination, my dear, it's a wonder you ever managed to master your craft at all. Though enough money can fix any failing, I suppose. */
== BLK#NI25 @395 /* Well, you would know, wouldn't you? */  
== BRH#AD25 @396 /* Heh. As entertaining as these little conversations of ours can be, sometimes I wonder why I don't save myself the trouble and simply punch you as soon as you open your mouth. */
== BLK#NI25 @397 /* How... inelegant for a mage, darling. Surely you can do better than that? */
== BRH#AD25 @398 /* And waste even a cantrip? That seems horribly inefficient. */
== BLK#NI25 @399 /* It does rather, doesn't it? I'm at least worthy of a fireball, I'd say. Or perhaps Abi-Dalzim's Horrid Wilting, or something of that sort. Don't you think? */
== BRH#AD25 IF ~Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN @400 /* Power Word Silence, perhaps. Leaving you both speechless and defenseless... it really is quite the pretty picture, I admit. */
== BRH#AD25 IF ~!Global("rh#AdrianRomanceActive","GLOBAL",2)~ THEN @401 /* Power Word Silence, perhaps. Having you both speechless and defenseless... it really is quite the enticing picture, I admit. */
== BLK#NI25 @402 /* Well, who knew that our Adrian was a charmer, <CHARNAME>! How... delightful. */
EXIT