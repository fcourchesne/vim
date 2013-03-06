"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Main
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect() 

set ofu=syntaxcomplete#Complete
"set autoread " Set to auto read when a file is changed from the outside
let g:mapleader = ","
set backspace=indent,eol,start "Allow backspacing over everything in insert mode.
set noerrorbells        " No beeps.
set undolevels=200      " Number of undo levels.
set ttyfast             " We have a fast terminal connection.
set esckeys             " Cursor keys in insert mode.



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General 
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark         " Assume a dark background
if !has('win32') && !has('win64')
    set term=$TERM       " Make arrow and other keys work
endif
filetype plugin indent on  	" Automatically detect file types.
syntax on 					" syntax highlighting
set mouse=a					" automatically enable mouse usage
"set autochdir 				" always switch to the current file directory.. Messes with some plugins, best left commented out
" not every vim is compiled with this, use the following line instead
" If you use command-t plugin, it conflicts with this, comment it out.
 "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
scriptencoding utf-8

" set autowrite                  " automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore 	   	" allow for cursor beyond last character
set history=1000  				" Store a ton of history (default is 20)
set spell 		 	        	" spell checking on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni complete"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

hi Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Typical Ctrl-C/V/X behavior and Select all
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>   	"+gP
cmap <C-V>  	<C-R>+
cmap <S-Insert> 	<C-R>+
" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert> 	<C-V>
vmap <S-Insert> 	<C-V>
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   	<C-V>
" Select all (ctrl+a)
:map <silent> <C-A> gg0vG$
:imap <C-A> <ESC><C-A>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete=.,i " Complete only the current buffer and includes
set completeopt=menu,menuone,longest " Complete options (disable preview scratch window)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=10 " Set 7 lines to the cursor - when moving vertical..

if has('cmdline_info')
    set ruler                  	" show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                	" show partial commands in status line and
                                " selected characters/lines in visual mode
endif
set showcmd " show partial commands in status line and
" selected characters/lines in visual mode
endif
set showmode            " Show current mode.
set cmdheight=1 "The command bar height
set hid "Change buffer - without saving

set backspace=indent,eol,start	" backspace for dummys
set linespace=0					" No extra spaces between rows
set nu							" Line numbers on
set showmatch					" show matching brackets/parenthesis
set incsearch					" find as you type search
set hlsearch					" highlight search terms
set winminheight=0				" windows can be 0 line high 
set ignorecase					" case insensitive search
set smartcase					" case sensitive when uc present
set wildmenu					" show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
set scrolljump=5 				" lines to scroll when cursor leaves screen
set scrolloff=3 				" minimum lines to keep above and below cursor
set foldenable  				" auto fold code
set gdefault					" the /g flag on :s substitutions by default
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace



	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
	cmap cd. lcd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/zsh
set encoding=utf8
set ffs=unix,dos,mac "Default file types
"set number

hi cursorline guibg=#333333 	" highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor
set cursorline  				" highlight current line

if has('mouse')
  set mouse=a
endif

if has("gui_running")
    set gfn=DejaVu\ Sans\ Mono\ Book\ 8
    ""set gfn=Consolas\ Regular\ 9
    color solarized
    set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode
else
    set t_Co=256
    color molokai
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap                     	" wrap long lines
set autoindent                 	" indent at the same level of the previous line
set shiftwidth=4               	" use indents of 4 spaces
set expandtab 	  	     		" tabs are spaces, not tabs
set tabstop=4 					" an indentation every four columns
set softtabstop=4 				" let backspace delete indent
"set matchpairs+=<:>            	" match, to be used with % 
set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map hotkey to remove search highlights
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

func! DeleteTrailingWS() "Delete trailing white space, useful for Python ;)
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
"Pressing ,ss will toggle and un-toggle spell checking
map <leader>ss :setlocal spell!<cr>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace



""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SnipMate {
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting the author var
" If forking, please overwrite in your .vimrc.local file
let g:snips_author = 'Francis Courchesne <fcourchesne@gmail.com>'
" Shortcut for reloading snippets, useful when developing
nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delimitmate {
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType * let b:delimitMate_autoclose = 1

" If using html auto complete (complete closing tag)
au FileType xml,html,xhtml,py let b:delimitMate_matchpairs = "(:),[:],{:}"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML autoclose tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim

"------------------------------------------------------------------------------
" Correct typos.
"------------------------------------------------------------------------------

" English.
iab beacuse    because
iab becuase    because
iab acn        can
iab cna        can
iab centre     center
iab chnage     change
iab chnages    changes
iab chnaged    changed
iab chnagelog  changelog
iab Chnage     Change
iab Chnages    Changes
iab ChnageLog  ChangeLog
iab debain     debian
iab Debain     Debian
iab defualt    default
iab Defualt    Default
iab differnt   different
iab diffrent   different
iab emial      email
iab Emial      Email
iab figth      fight
iab figther    fighter
iab fro        for
iab fucntion   function
iab ahve       have
iab homepgae   homepage
iab logifle    logfile
iab lokk       look
iab lokking    looking
iab mial       mail
iab Mial       Mail
iab miantainer maintainer
iab amke       make
iab mroe       more
iab nwe        new
iab recieve    receive
iab recieved   received
iab erturn     return
iab retrun     return
iab retunr     return
iab seperate   separate
iab shoudl     should
iab soem       some
iab taht       that
iab thta       that
iab teh        the
iab tehy       they
iab truely     truly
iab waht       what
iab wiht       with
iab whic       which
iab whihc      which
iab yuo        you
iab databse    database
iab versnio    version
iab obnsolete  obsolete
iab flase      false
iab recrusive  recursive
iab Recrusive  Recursive

" Days of week.
iab monday     Monday
iab tuesday    Tuesday
iab wednesday  Wednesday
iab thursday   Thursday
iab friday     Friday
iab saturday   Saturday
iab sunday     Sunday

" Enable this if you mistype :w as :W or :q as :Q.
" nmap :W :w
" nmap :Q :q

if has("autocmd")
  " Enabled file type detection and file-type specific plugins.
  filetype plugin on

  " Python code.
  augroup python
    autocmd BufReadPre,FileReadPre      *.py set tabstop=4
    autocmd BufReadPre,FileReadPre      *.py set expandtab
    autocmd BufReadPre,FileReadPre      *.py 
  augroup END

  " Ruby code.
  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set tabstop=2
    autocmd BufReadPre,FileReadPre      *.rb set expandtab
  augroup END

  au BufNewFile,BufRead *.jinja set syntax=htmljinja
  au BufNewFile,BufRead *.mako set ft=mako

endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/python2 %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => "NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=0
   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => "debugger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Debugging with VimDebugger {
    map <F11> :DbgStepInto<CR>
    map <F10> :DbgStepOver<CR>
    map <S-F11> :DbgStepOut<CR>
    map <F5> :DbgRun<CR>
    map <F6> :DbgDetach<CR>
    map <F8> :DbgToggleBreakpoint<CR>
    map <S-F8> :DbgFlushBreakpoints<CR>
    map <F9> :DbgRefreshWatch<CR>
    map <S-F9> :DbgAddWatch<CR>
" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => "taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist Variables {
    let Tlist_Auto_Highlight_Tag = 1
    let Tlist_Auto_Update = 1
    let Tlist_Exit_OnlyWindow = 1
    let Tlist_File_Fold_Auto_Close = 1
    let Tlist_Highlight_Tag_On_BufEnter = 1
    let Tlist_Use_Right_Window = 1
    let Tlist_Use_SingleClick = 1

    let g:ctags_statusline=1
    " Override how taglist does javascript
    let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global'
    map <C-t> :TlistToggle<CR>

    " No scrollbar on taglist display
    set guioptions-=L
    set guioptions-=l

 " }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabularize
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Auto tabularize with "|"
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
let p = '^\s*|\s.*\s|\s*$'
    if getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

    " Tabularize {
        if exists(":Tabularize")
          nmap <Leader>a= :Tabularize /=<CR>
          vmap <Leader>a= :Tabularize /=<CR>
          nmap <Leader>a: :Tabularize /:<CR>
          vmap <Leader>a: :Tabularize /:<CR>
          nmap <Leader>a:: :Tabularize /:\zs<CR>
          vmap <Leader>a:: :Tabularize /:\zs<CR>
          nmap <Leader>a, :Tabularize /,<CR>
          vmap <Leader>a, :Tabularize /,<CR>
          nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
          vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif

" When loading a file, if it reads in as Unix, but has a DOS line ending,
" and is not in binary mode, reload it in DOS format. Do this AFTER loading
" last known position to prevent always opening on last line.
"
" Time out the search after 1/10 second. Timeouts only available in 7.1.211
" and up, so just risk long loads in earlier versions.
if (v:version > 701 || v:version == 701 && has("patch211"))
  autocmd BufReadPost * nested
        \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc', 0, 100)) |
        \   let b:reload_dos = 1 |
        \   redir => s:num_dos_ends |
        \   silent %s#\r$##n |
        \   redir END |
        \   e ++ff=dos |
        \   echomsg "File has ".
        \     substitute(s:num_dos_ends, '^.\{-}\(\d\+\).*', '\1', '').
        \     " DOS-style line endings out of ".line('$')." lines." |
        \ endif
else
  autocmd BufReadPost * nested
        \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
        \   let b:reload_dos = 1 |
        \   e ++ff=dos |
        \ endif
endif
autocmd BufReadPost * if exists('b:reload_dos') | unlet b:reload_dos | endif


"Hotkeys
map <F7> :TlistToggle<CR>
map <F8> :NERDTreeToggle<CR>
let Tlist_Use_Right_Window   = 1

"Hotkeys - open/close folds
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
"          create fold by selecting text and hitting SPACE
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

if has("gui_running")
    " Hide icon bar and scrollbar
    set go-=T
    set go-=r
    " Toggle toolbar/scrollbar/menu 
    map <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
    map <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
    map <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
endif
