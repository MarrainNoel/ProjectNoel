10 REM RUN GAME
20 screen 0:cls
30 print "A GAME WHICH YOU ARE THE HERO"
40 print "---------------------------------------------------------------"
50 print "": print ""
80 locate 16, 1: input "ARE YOU READY FOR THIS ADVENTURE ? [Y/N]", R$
90 if (R$ = "y") or (R$ = "Y") then goto 100 else goto 20
100 load "part1.bas",r
200 screen 0: cls: print "You'd be surprised but this line of code is absolutely useless!!!!"
