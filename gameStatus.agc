
function status()
	// code status
	// 0 - game continue
	// 1 - lose
	// 2 - victory
	
	status = 1
	for r = 1 to 4
		for c = 1 to 4
			if(board[c, r] = 0) // 0 means that we still have empty files
				status = 0
				exit
			elseif(board[c, r] = 2048) // 2 means win 
				status = 2
				exit
			endif
		next c
	next r
endfunction status
