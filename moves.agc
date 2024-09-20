
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
