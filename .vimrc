if filereadable(expand("~/.vim/autoload/plug.vim")) 
	" Main configurations
	source ~/.vim/.vimrc.plugins
	source ~/.vim/.vimrc.main
	source ~/.vim/.vimrc.display


	" Language specific
	source ~/.vim/.vimrc.c
	source ~/.vim/.vimrc.rust
	source ~/.vim/.vimrc.golang
	" source ~/.vim/.vimrc.omnisharp
	" source ~/.vim/.vimrc.python


	" Testing
	" source ~/.vim/.vimrc.tests
	

	" Run a plugin update every X vim startups
	let vim_start_counter_path = expand("~/.vim/vim_startup_counter.txt")
	if filereadable(vim_start_counter_path) 
		let nb_vim_startups = join(readfile(vim_start_counter_path), "\n")
		if nb_vim_startups % 100 == 0
            echo "Beginning plugins update ..."
			PlugUpdate
			PlugUpgrade	
            bd
            echo "Plugin update complete"
            call writefile([nb_vim_startups + 1], vim_start_counter_path, "o")
		else
			" nb_vim_startups + 1 > vim_start_counter_path
            " TODO
            call writefile([nb_vim_startups + 1], vim_start_counter_path, "o")
		endif
	else
        " TODO
        call writefile([1], vim_start_counter_path, "o")
    endif

else
	echo "Plugin manager will be installed"
	!mkdir ~/.vim/swap
	!mkdir ~/.vim/backup
	!mkdir ~/.vim/view
	!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	call plug#begin('~/.vim/plugged')
	call plug#end()
	source ~/.vim/.vimrc.plugins
	PlugInstall
	source ~/.vimrc
	bd
endif
