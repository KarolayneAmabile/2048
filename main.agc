
// Project: 2048 
// Created: 2024-07-15

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "2048" )
SetWindowSize( 1080, 1350, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1080, 1350 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

SetJoystickScreenPosition ( 50, 300, 64 )

LoadImage (3, "fundo.png" )
CreateSprite ( 3, 3 )

score = 0
rows = 0
columns = 0

LoadImage ( 1,"1.png" )
LoadImage ( 2, "2.png" )
LoadImage ( 4, "4.png" )
LoadImage ( 8, "8.png" )
LoadImage ( 16, "16.png" )
LoadImage ( 32, "32.png" )
LoadImage ( 64, "64.png" )
LoadImage ( 128, "128.png" )
LoadImage ( 256, "256.png" )
LoadImage ( 512, "512.png")
LoadImage ( 1024, "1024.png" )
LoadImage ( 2048, "2048.png" )

global tilesList as Integer [ 16 ]
for i = 1 to 16
	tilesList[i] = CreateSprite(1)
next i


function setGame()
	dim board[4, 4] as integer
	for c = 1 to 4
		for r = 1 to 4
			board[c, r] = 0
		next r
	next c
	board[1, 1] = 16
	board[2, 1] = 8
	board[3, 1] = 4
	board[4, 1] = 2
	
	for c = 1 to 4
		for r = 1 to 4
			updateTile(board[c, r], c, r)
		next r
	next c
	
endfunction


function updateTile (tile, c, r)
	
	i = (c - 1) * 4 + r
	
	if (tile = 0)
		tile = 1
	endif
	
	x = (c - 1) * 178 + 135 + c * 20
	y = (r - 1) * 178 + 415 + r * 20
	
	SetSpriteImage(tilesList[i], tile)
	SetSpritePosition(tilesList[i], x, y)

			
endfunction
	


do
	setGame( )
    Sync ( )
loop


