// Project: 2048 
// Created: 2024-07-15

#insert "configWindow.agc"
#insert "setSprites.agc"

global score = 0
global start = 2
global highScore = 0

global tilesList as Integer [ 16 ]
global dim board[4, 4] as integer

#insert "setGame.agc"
#insert "slide.agc"
#insert "moves.agc"
#insert "gameStatus.agc"
#insert "addNewTiles.agc"

do
	newGame()
	setGame()
	updateGame()
	printScore()
	
	//if (status() = 1)
	//	CreateSprite(defeat)
	//endif
	
    Sync ( )
loop
