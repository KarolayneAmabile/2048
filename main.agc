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

global score = 0
global start = 2

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

global dim board[4, 4] as integer
for c = 1 to 4
	for r = 1 to 4
		board[c, r] = 0
	next r
next c

function setGame()
	if (start > 0)
		start = start - 1
		addNewTile()
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

	
// moves 0's elementos to the right
function movesZero (arr as integer[])
    dim result[4] as integer
    index = 1
    
	// create a array with elements != 0
    for i = 1 to 4
        if arr[i] <> 0
            result[index] = arr[i]
            index = index + 1
        endif
    next i

    for i = index to 4
        result[i] = 0
    next i
    
endfunction result

function inverse (row as integer[])
	dim temp[4]
	n = 4
	for i = 1 to 4 
		temp[i] = row[n]
		n = n - 1
	next i
endfunction temp

function isEqual (oldRow as integer[], newRow as integer[])
	valid = 0
	if ((oldRow[1] = newRow[1]) and (oldRow[2] = newRow[2]) and (oldRow[3] = newRow[3]) and (newRow[4] = oldRow[4]))
		valid = 1
	endif
endfunction valid

function slide(row as integer[])
	row = movesZero(row)

	for i = 1 to 3
		if(row[i] = row[i + 1])
			row[i] = row[i] * 2
			row[i + 1] = 0
			score = score + row[i]
		endif
	next i
	
	row = movesZero(row)
endfunction row
	
function slideLeft( )
	dim row[4] // tempory variable to storage each row 
	dim oldRow[4]
	errorCode = 0
	
	for i = 1 to 4 // started from the first line
		for j = 1 to 4 // copy each element from the first line 
			row[j] = board[j, i] // storage the first line in row temp variable
			oldRow[j] = board[j, i]
		//board(columm, laine) 
		next j 
		
		row = slide(row) // sends row to slide
		valid = isEqual(oldRow, row)
		errorCode = errorCode + valid
		
		if (valid = 0)
			for j = 1 to 4 // update board
				board[j, i] = row[j]
				updateTile (board[j, i], j, i)
			next j
		endif
	next i
endfunction errorCode

function slideRight( )
	dim row [4]
	dim oldRow[4]
	errorCode = 0
	
	for i = 1 to 4
		for j = 1 to 4
			row[j] = board[j, i]
			oldRow[j] = board[j, i]
		next j
		
		row = inverse(row)
		row = slide(row)
		row = inverse(row)
		
		valid = isEqual(oldRow, row)
		errorCode = errorCode + valid
		
		if (valid = 0)
			for j = 1 to 4 
				board[j, i] = row[j]
				updateTile (board[j, i], j, i)
			next j
		endif
	next i
endfunction errorCode

function slideUp( )
	dim column[4]
	dim oldColumn[4]
	errorCode = 0
	
	for j = 1 to 4 // started from the first columnn
		for i = 1 to 4 // copy each element of each line board(columm, line) 
			column[i] = board[j, i]
			oldColumn[i] = board[j, i]
		next i
			
		column = slide(column)
		valid = isEqual(oldColumn, column)
		errorCode = errorCode + valid

		if (valid = 0)
			for i = 1 to 4
				board[j, i] = column[i]
				updateTile (board[j, i], j, i)
			next i
		endif
	next j
endfunction errorCode

function slideDown( )
	dim column[4]
	dim oldColumn[4]
	errorCode = 0
	
	for j = 1 to 4 // started from the first columnn
		for i = 1 to 4 // copy each element of each line board(columm, line) 
			column[i] = board[j, i]
			oldColumn[i] = board[j, i]
		next i
		
		column = inverse(column)
		column = slide(column)
		column = inverse(column)
		valid = isEqual(oldColumn, column)
		errorCode = errorCode + valid
	
		if (valid = 0)
			for i = 1 to 4
				board[j, i] = column[i]
				updateTile (board[j, i], j, i)
			next i
		endif
	next j
endfunction errorCode

function eventListener()
	if (GetRawKeyPressed(37) = 1) // left
		canMove = slideLeft()
		if (canMove <> 4)
			addNewTile()
		endif
	elseif (GetRawKeyPressed(39) = 1) // right
		canMove = slideRight()
		if (canMove <> 4)
			addNewTile()
		endif
	elseif(GetRawKeyPressed(38) = 1) // up
		canMove = slideUp()
		if (canMove <> 4)
			addNewTile()
		endif
	elseif (GetRawKeyPressed(40) = 1) // down
		canMove = slideDown()
		if (canMove <> 4)
			addNewTile()
		endif
	endif
endfunction

function status()
	status = 1
	for r = 1 to 4
		for c = 1 to 4
			if(board[c, r] = 0) // 0 means that have empty files
				status = 0
				exit
			elseif(board[c, r] = 2048) // 2 means win 
				status = 2
				exit
			endif
		next c
	next r
endfunction status

function addNewTile()
	if(status() = 0)
		found = 1
		while(found = 1)
			r = random(1, 4)
			c = random(1, 4)
				if (board[c, r] = 0)
					if (MOD(r, 2) = 0)
						board[c, r] = 2
						updateTile (board[c, r], c, r)
						exit
					else
						board[c, r] = 4
						updateTile (board[c, r], c, r)
						exit
					endif	
				endif
		endwhile
	endif
endfunction

do
	setGame()
	updateGame( )
    Sync ( )
loop
