// Project: 2048 
// Created: 2024-07-15

#insert "configWindow.agc"
// sets up the game window and display properties (resolution, frame rate, etc.)
#insert "setSprites.agc"
// loads and creates the necessary game sprites, such as tiles and backgrounds

global score = 0
global start = 2
global highScore = 0

global tilesList as Integer [ 16 ]
global dim board[4, 4] as integer

#insert "setGame.agc"
// configures the initial game state, including the board and logic for starting a new game
#insert "slide.agc"
// implements the logic for sliding game tiles in all directions (left, right, up, down)
#insert "moves.agc"
// defines functions to handle tile movements, including removing zeros and merging equal tiles
#insert "gameStatus.agc"
// checks the game status, determining if the player has won, lost, or can continue
#insert "addNewTiles.agc" 
// adds a new tile (2 or 4) to the board in an empty spot after each move

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
