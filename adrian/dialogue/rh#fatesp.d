EXTEND_TOP FATESP 6
 + ~!Dead("rh#Adrian") !InMyArea("rh#Adrian")
	CheckStatGT(Player1,11,INT) CheckStatGT(Player1,11,CHR)
	Gender(Player1,FEMALE)  OR(2) Race(Player1,HUMAN) Race(Player1,HALF_ELF)
	Global("rh#AdrianSummoned","GLOBAL",0)~ + @0 /* Bring me my lover, Adrian. */ DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
	Wait(2)
	CreateCreature("rh#adr25",[1999.1228],1)
	SetGlobal("rh#AdrianRomanceActive","GLOBAL",2)
	SetGlobal("rh#AdrianSummoned","GLOBAL",1)
	ActionOverride("rh#Adrian",ChangeAlignment(Myself,LAWFUL_NEUTRAL))~ GOTO 8
 + ~!Dead("rh#Adrian") !InMyArea("rh#Adrian")
	OR(3) InParty("Jaheira") InParty("Keldorn") InParty("P#Kivan")
	Global("rh#AdrianSummoned","GLOBAL",0)~ + @1 /* Bring me Adrian, the half-elven mage. */ DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
	Wait(2)
	CreateCreature("rh#adr25",[1999.1228],1)
	SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1)
	SetGlobal("rh#AdrianSummoned","GLOBAL",1)
	ActionOverride("rh#Adrian",ChangeAlignment(Myself,LAWFUL_NEUTRAL))~ GOTO 8
 + ~!Dead("rh#Adrian") !InMyArea("rh#Adrian")
	!InParty("Jaheira") !InParty("Keldorn") !InParty("P#Kivan")
	Global("rh#AdrianSummoned","GLOBAL",0)~ + @1 /* Bring me Adrian, the half-elven mage. */ DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
	Wait(2)
	CreateCreature("rh#adr25",[1999.1228],1)
	SetGlobal("rh#AdrianFriendshipActive","GLOBAL",1)
	SetGlobal("rh#AdrianSummoned","GLOBAL",1)~ GOTO 8
END