10 REM ###################################################
20 REM ### CAR RACE
30 screen 0: cls
40 print "PART 1 - ALL YOUR BASE ARE BELONG TO US"
50 locate 5, 1: print "Our hero (you, in case you were not following...) jumps into his car and drives straight to the fortress where the computer hosting NETSKY is ";
51 print "(yeah, this is before the internet and the cloud - there is an actual physical computer, probably located in Ukraine. How is a disconnected computer supposed to take over the world ? stop asking dumb questions)"
52 print "": print "So, just move the car ahead and don't crash into the side of the road..."
60 locate 14, 1: print "INSTRUCTIONS:": print "A - LEFT": print "L - RIGHT": print " ": print "The progress bar at the bottom will show you the distance to your destination"
70 locate 20, 1: input "READY [Y/N]"; R$
80 if (R$ = "y") or (R$ = "Y") then gosub 500 else goto 30
90 goto 10000

500 REM GAME LOOP
510 screen 2: cls
520 gosub 1000
530 gosub 6000: iter = 0: maxiter = 750: view (0,0)-(639, lr*8)
540 while (iter < maxiter) and (hascrashed = 0)
550 cls: gosub 2000
560 gosub 3000
570 gosub 5000
580 gosub 4000
590 gosub 7000
600 wend
610 if hascrashed then gosub 700 else locate lr+2,1: input "YOU ARRIVED!!! PRESS ENTER TO CONTINUE", E$
620 return

700 REM YOU LOSE
710 locate lr+2, 1: input "YOU CRASHED!!! DO YOU WANT TO TRY AGAIN [Y/N] ?", T$
720 if (T$ = "Y") or (T$ = "y") then hascrashed = 0: carpos = 40+walls(lr)-wr: gosub 8000: goto 530 else system
730 input "you should reach that line of code ??", WTF$
740 system

1000 REM INITIALISATION
1010 RANDOMIZE TIMER
1020 prevt = timer: ttw = 0.01
1020 niter = 10: newpos = 0: carpos = 40: hascrashed = 0
1040 lr = 20: wr = 8: dim walls(lr)
1050 for i = 1 to lr
1060 walls(i) = wr
1070 next i
1080 return

2000 REM DISPLAY
2010 for i = 1 to lr
2020 locate i,40+walls(i): print "#"
2030 locate i,40+walls(i)-2*wr: print "#"
2040 next i
2050 return

3000 REM MOVE FORWARD
3010 for i = lr to 2 step -1
3020 walls(i) = walls(i-1)
3030 next i
3040 if iter mod niter = 0 then newpos = int(rnd * 3) - 1
3050 walls(1) = walls(1) + int(newpos): iter = iter + 1
3060 if walls(1) >= 30 then walls(i) = 29
3070 if walls(1) <= -30+2*wr then walls(i) = -29 + 2*wr
3080 return

4000 REM TIMER
4010 dt = 1
4020 while dt
4030 if timer - prevt > ttw then dt = 0
4040 wend
4050 prevt = timer
4060 return

5000 REM CAR DISPLAY
5010 numkey = 2
5020 for k = 1 to numkey
5030 locate lr, carpos: print "W"
5040 v$ = inkey$: dcp = 0
5050 if v$ = "a" then dcp = -1
5060 if v$ = "l" then dcp = 1
5070 if dcp <> 0 then locate lr, carpos: print " ": carpos = carpos + dcp: locate lr, carpos: print "W"
5080 if (carpos >= walls(lr)+40) or (carpos <= walls(lr)+40-2*wr) then hascrashed = 1 else hascrashed = 0
5090 rem locate 23, 10: print hascrashed
5100 next k
5110 return

6000 REM DISTANCE BAR
6010 barlength = 75
6020 for b = 1 to barlength: locate lr+1,b: print chr$(219): next b
6030 return

7000 REM UPDATE DISTANCE BAR
7010 barfull = int(barlength /maxiter * (maxiter - iter))
7020 locate lr+1,barfull+1: print " "
7030 return

8000 REM WIPE OUT BOTTOM INFO
8010 for k = 1 to 79: locate lr+1, k: print " ": locate lr+2, k: print " ": next k
8020 return

10000 REM THIS IS THE END
10010 screen 0: cls 
10020 load "part2.bas",r

