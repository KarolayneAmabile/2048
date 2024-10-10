
function status()
	// code status
	// 0 - game continue
	// 1 - lose

	status = 1
	for r = 1 to 4
		for c = 1 to 4
			if(board[c, r] = 0) // 0 means that we still have empty files
				status = 0
				exit
			endif
		next c
	next r
endfunction status


