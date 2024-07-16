
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

LoadImage ( 1, "fundo1.png" )
CreateSprite ( 1, 1 )
SetSpriteSize( 1, 1080, 1350 )

// inicia a matrix 4x4
boardSize = 4
dim board[boardSize, boardSize]
for x = 0 to boardSize - 1
    for y = 0 to boardSize - 1
        board[x, y] = 0
    next y
next x

// carrega um array com os blocos
dim tileImages[11]
tileImages[0] = LoadImage("2.png")
tileImages[1] = LoadImage("4.png")
tileImages[2] = LoadImage("8.png")
tileImages[3] = LoadImage("16.png")
tileImages[4] = LoadImage("32.png")
tileImages[5] = LoadImage("64.png")
tileImages[6] = LoadImage("128.png")
tileImages[7] = LoadImage("256.png")
tileImages[8] = LoadImage("512.png")
tileImages[9] = LoadImage("1024.png")
tileImages[10] = LoadImage("2048.png") 

dim tileSprites[boardSize, boardSize]
for x = 0 to boardSize - 1
    for y = 0 to boardSize - 1
        tileSprites[x, y] = 0
    next y
next x

do
    Print( ScreenFPS() )
    Sync()
loop
