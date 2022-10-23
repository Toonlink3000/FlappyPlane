

// Project: FlappyThing 
// Created: 2022-10-17

#insert "Setup.agc"
#include "Menus.agc"
#include "Pipes.agc"
#include "Player.agc"
#include "ScoreCounter.agc"


LoadPlayerAssets()
LoadPipeAssets()
do
if gamestate = 0
	InitMainMenu()
	while gamestate = 0
		UpdateMainMenu()
		Sync()
	endwhile
endif
if gamestate = 1
	InitPlayer()
	InitPipes()
	InitScoreCounter()
	while gamestate = 1
		Print( ScreenFPS() )
		UpdatePipes()
		UpdateScoreCounter()
		UpdatePlayer()

		Sync()
	endwhile
endif
if gamestate = 2
	InitDeathMenu()
	while gamestate = 2
		UpdateDeathMenu()
		Sync()
	endwhile
endif
loop
