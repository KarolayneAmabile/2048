

for i = 1 to 16
	tilesList[i] = CreateSprite(1)
next i

for c = 1 to 4
	for r = 1 to 4
		board[c, r] = 0
	next r
next c

OpenToRead (1, "score.txt" )
highScore = ReadInteger(1)
CloseFile (1) 

function printScore()
    SetTextString( 1, str(score))
    if (score > highScore)
        highScore = score
        OpenToWrite (1, "score.txt", 0)
        WriteInteger (1, highScore)
        CloseFile (1) 
    endif

    SetTextString( 2, str(highScore))
endfunction


function setGame()
	if (start > 0)
		start = start - 1
		addNewTile()
	endif
endfunction

function newGame()
	if GetPointerState()
        if GetSpriteHitTest(7,GetPointerX(),GetPointerY())
			start = 2
			score = 0
			for c = 1 to 4
				for r = 1 to 4
					board[c, r] = 0
				next r
			next c
        endif
    endif
endfunction

function updateGame()
	for c = 1 to 4
		for r = 1 to 4
			updateTile(board[c, r], c, r)
		next r
	next c
	eventListener()
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
