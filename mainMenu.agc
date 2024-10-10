
function menu()
	hasPlayerLost = hasLost()		
	
	if (hasPlayerLost = 1)
		background = CreateSprite(0)
		SetSpriteSize(background, 810, 812)
		SetSpritePosition(background, 135, 415)
		SetSpriteColorAlpha( background, 30 )
		SetSpriteColor(background, 238, 190, 165, 20)

		default as string = "DERROTA"
		CreateText (4, default)
		SetTextSize(4, 180)
		SetTextPosition(4, 540, 633)
		SetTextAlignment(4, 1)
		SetTextFont( 4, 1 )
		
		CreateSprite ( 7, 9 )
		SetSpritePosition( 7, 540, 733 )
		
	endif 
	
endfunction

function hasLost()
	hasPlayerLost = 1
	for i = 1 to 4
		for j = 1 to 4
			if i > 1 and board[i][j] = board[i - 1][j]
				hasPlayerLost = hasPlayerLost - 1
				exit
			elseif (i < 4 and board[i][j] = board[i + 1][j])
				hasPlayerLost = hasPlayerLost - 1
				exit
			elseif (j > 1 and board[i][j] = board[i][j - 1])
				hasPlayerLost = hasPlayerLost - 1
				exit
			else (j < 3 and board[i][j] = board[i][j + 1])
				hasPlayerLost = hasPlayerLost - 1
				exit
			endif
		next j
	next i
endfunction hasPlayerLost
