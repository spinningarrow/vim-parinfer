source autoload/parinfer_lib.vim

function! Parpar()
	let result = parinfer_lib#IndentMode(join(getline(1, '$'), '\n'), {})
	normal! ggdG
	call append(0, split(result.text, '\\n'))
endfunction

au TextChanged *.clj call Parpar()
au TextChangedI *.clj call Parpar()

" TODO
" - Move cursor to correct position
