// 1.
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("LK#ArathJoinTalk","GLOBAL",2)
Global("G#XB.AdrianArathBanter1","GLOBAL",0)~ THEN BRH#ADR AdrianArathBanter#1.1
@49 /* Well, druid, dare I ask how long you lingered uselessly around the Copper Coronet before you finally decided to ask for help? */
DO ~SetGlobal("G#XB.AdrianArathBanter1","GLOBAL",1)~
== BLK#ARAT @50 /* Long enough, evidently. Have I done something to offend you, handsome? I'm just unspeakably sorry if that's the case. */
== BRH#ADR @51 /* Nothing. Nothing at all. */
= @52 /* It figures that the one time I could use a competent... hero, for lack of a better term, I get a frivolous playboy instead. */
== BLK#ARAT @53 /* There is nothing frivolous about being a playboy, Adrian. It takes a lot of work to look this good. */
== BRH#ADR @54 /* Hmm. And yet it would only take a moment to undo all of that effort. */
== BLK#ARAT @55 /* I'm quaking with terror. Honestly. Just look at me. Shaking like a leaf. */
== BRH#ADR @56 /* You really are incorrigible, aren't you? */
== BLK#ARAT @57 /* (grin) You have no idea. */
EXIT

// 2.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("rh#AdrianZhent","GLOBAL",1)
Global("G#XB.AdrianArathBanter1","GLOBAL",1)
Global("G#XB.AdrianArathBanter2","GLOBAL",0)~ THEN BLK#ARAT AdrianArathBanter#2.1
@58 /* So, I've heard the Zhentarim have all manner of interesting... cultural practices. Sharing is caring, you know. */
DO ~SetGlobal("G#XB.AdrianArathBanter2","GLOBAL",1)~
== BRH#ADR @59 /* Is this how you southerners spend your evenings? Contemplating Zhentarim *cultural* practices? */
== BLK#ARAT @60 /* As long as there's a bottle of wine or two involved, I'm happy to contemplate all manner of things. */
== BRH#ADR @61 /* Well, I'm afraid we don't have much of a culture to contemplate at all, unless you count blackmail, murder, and extortion. There's precious little culture on a caravan run. */
== BLK#ARAT @62 /* That's... not really what I was getting at. */
== BRH#ADR @63 /* Somehow I didn't think it was. In any case, with lines like that, I suspect you'll find yourself contemplating things alone tonight. And likely for a long time to come. */
== BLK#ARAT @64 /* I don't know about that, but your loss, I suppose. But if you change your mind... you know where I am. */
== BRH#ADR @65 /* Indeed. Far, far away from me. */
EXIT

// 3.
CHAIN IF ~InParty("rh#Adrian")
See("rh#Adrian")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("G#XB.AdrianArathBanter1","GLOBAL",1)
Global("G#XB.AdrianArathBanter3","GLOBAL",0)~ THEN BLK#ARAT AdrianArathBanter#3.1
@66 /* Adrian. Really, must you? */
DO ~SetGlobal("G#XB.AdrianArathBanter3","GLOBAL",1)~
== BRH#ADR @67 /* As a matter of fact, druid, yes. It's an important spell component. You should be thankful. */
== BLK#ARAT @68 /* I don't make a habit of being thankful for nausea, but hey, I suppose there's a first for everything. */
== BRH#ADR @69 /* Don't be a baby. */
== BLK#ARAT @70 /* Shut up. */
== BRH#ADR @71 /* Eloquent. */
== BLK#ARAT @72 /* I try. */
EXIT

// 4.
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("rh#Adrian",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%)
Global("G#XB.AdrianArathBanter2","GLOBAL",1)
Global("G#XB.AdrianArathBanter4","GLOBAL",0)~ THEN BRH#ADR AdrianArathBanter#4.1
@73 /* I didn't realise I was quite so confusing, druid. */
DO ~SetGlobal("G#XB.AdrianArathBanter4","GLOBAL",1)~
== BLK#ARAT @74 /* What? */
== BRH#ADR @75 /* You're staring at me as if I'd simultaneously just kissed and stabbed you. And really, we both know only one of those things is ever likely to happen. */
== BLK#ARAT @76 /* Heh. I'm just... I don't know. Thinking. */
= @77 /* The drow were always a point of fascination for me... I mean, in some ways what I read of their culture was intriguing, and a part of me always wanted to--you know, see them in their natural habitat. */
= @78 /* I'm not sure what I was thinking. Institutionalised slavery, torture and murder seem as commonplace as breathing. The number of times I had to stop myself from acting and thereby revealing our identities, it's a wonder I didn't kill us all. */
== BRH#ADR @79 /* Arath, those things *are* as commonplace as breathing. Dare I even guess why you were staring at me? */
== BLK#ARAT @80 /* There's something I need to ask you, but I'm not sure I want to know the answer. */
== BRH#ADR @81 /* Stop hedging, Arath. Ask it or don't. */
== BLK#ARAT @82 /* You were a slaver. Before this, I mean. */
== BRH#ADR @83 /* That's not exactly a question, I note. */
= @84 /* But... yes. I was. Amongst other things. It was hardly my first career choice, but I've never been foolish enough to refuse a direct order. */
= @85 /* If you're going to... avenge yourself upon me or whatever other nonsense you have in mind, I'd really rather we just got it over with. */
== BLK#ARAT @86 /* I'm not going to--don't be ridiculous. */
= @87 /* Thanks. For being honest. */
== BRH#ADR @88 /* There's little enough point in a lie that won't be believed. */
== BLK#ARAT @89 /* Yeah. I suppose you're right. */
= @90 /* Still... I appreciate it. */
== BRH#ADR @91 /* I know. */
EXIT