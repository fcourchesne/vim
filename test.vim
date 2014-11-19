function! Test1()
	if filereadable("bundle")
		echo "Found file"
	endif
endfunction
