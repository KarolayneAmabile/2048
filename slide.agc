
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
