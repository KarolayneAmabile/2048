

function menu()
	
	hasPlayerLost = hasLost()	

	if (hasPlayerLost = 8)
		//background = CreateSprite(0)
		//SetSpriteSize(background, 810, 810)
		//SetSpritePosition(background, 135, 135)
		//SetSpriteColorAlpha( background, 30 )
		//SetSpriteColor(background, 238, 190, 165, 30)

		//default as string = "DERROTA"
		//CreateText (4, default)
		//SetTextSize(4, 180)
		//SetTextPosition(4, 540, 700)
		//SetTextAlignment(4, 1)
		//SetTextFont( 4, 1 )
		CreateSprite ( 892, 892 )
		SetSpritePosition( 892, 135, 415 )
		SetSpriteVisible(892, 0)
	endif 
	
	if (status() = 0)
		DeleteSprite(892)
	endif
	
endfunction

function hasLost()
	hasPlayerLost = 0
	if (status() = 1)
		for i = 1 to 4
			if (board[i, 1] <> board[i, 2]) and (board[i, 2] <> board[i, 3]) and (board[i, 3] <> board[i, 4])
				hasPlayerLost = hasPlayerLost + 1
			endif
			if (board[1, i] <> board[2, i]) and (board[2, i] <> board[3, i]) and board[3, i] <> board[4, i]
				hasPlayerLost = hasPlayerLost + 1
			endif 
		next i
	endif
endfunction hasPlayerLost
