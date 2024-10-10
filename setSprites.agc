
LoadImage (3, "fundo.png" )
CreateSprite ( 3, 3 )

LoadFont(1, "montserrat-semi-bold.ttf")

createText(1, str(score))
SetTextSize(1, 60)
SetTextPosition(1, 670, 130)
SetTextAlignment(1, 1)
SetTextFont( 1, 1 )

createText(2, str(highScore))
SetTextSize(2, 60)
SetTextPosition(2, 857, 130)
SetTextAlignment(2, 1)
SetTextFont( 2, 1 )

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

LoadImage ( 451, "novoJogo.png" )
CreateSprite ( 451, 451 )
SetSpritePosition( 451, 728, 278 )

LoadImage ( 892, "telaDerrota.png" )


