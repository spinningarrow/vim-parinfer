source autoload/parinfer_lib.vim

function! Parpar()
	let save_cursor = getcurpos()
	let input = join(getline(1, '$'), '\n')
	" echo input
	let result = parinfer_lib#IndentMode(input, { 'cursorX': save_cursor })
	normal! ggdG
	" echo result
	%d | put =split(result.text, '\\n') | 1d
	" call append(0, split(result.text, '\\n'))
	call setpos('.', save_cursor)
endfunction

au! TextChanged
au! TextChangedI

au TextChanged *.clj call Parpar()
au InsertLeave *.clj call Parpar()

func TT(timer)
	echo 'timer!'
endfunc
