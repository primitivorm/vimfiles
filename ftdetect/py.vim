autocmd FileType python,py nnoremap <F5> :!python %<cr>
autocmd FileType python,py setlocal omnifunc=RopeCompleteFunc
autocmd FileType python,py setlocal completefunc=jedi#complete
autocmd BufRead,BufNewFile python setlocal set smartindent | set tabstop=4 | set shiftwidth=4 | set expandtab
