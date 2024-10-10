
function addNewTile()
	if(status() = 0) 
		found = 1
		while(found = 1)
			r = random(1, 4)
			c = random(1, 4)
				if (board[c, r] = 0)
					if (random(1, 5) = 1) // there's only 20% chance that the new piece will be 4
						board[c, r] = 4
						updateTile (board[c, r], c, r)
						exit
					else
						board[c, r] = 2
						updateTile (board[c, r], c, r)
						exit
					endif	
				endif
		endwhile
	endif
endfunction

