autocmd FileType c,cpp nmap <leader>r :!make run<cr>
autocmd FileType c,cpp nmap <leader>b :!make build<cr>
autocmd FileType c,cpp nmap <leader>d :!make debug<cr>

autocmd FileType c,cpp nmap <leader>b :call VimuxRunCommand("clear; make build") <CR>
autocmd FileType c,cpp nmap <leader>r :call VimuxRunCommand("clear; make build; make run") <CR>
autocmd FileType c,cpp nmap <leader>rq :call VimuxCloseRunner() <CR>
autocmd FileType c,cpp nmap <leader>bq :call VimuxCloseRunner() <CR>
autocmd FileType c,cpp nmap <leader>rr :call VimuxCloseRunner() <CR>
autocmd FileType c,cpp nmap <leader>bb :call VimuxCloseRunner() <CR>
autocmd FileType c,cpp nmap <leader>z :call VimuxZoomRunner() <CR>
