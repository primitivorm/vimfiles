autocmd filetype vim setlocal textwidth=0
autocmd filetype vim setlocal expandtab
autocmd filetype vim setlocal scrolloff=5
autocmd filetype vim setlocal shiftwidth=2
autocmd filetype vim setlocal tabstop=2
autocmd filetype vim setlocal foldmethod=marker

" Execute current line or current selection as Vim EX commands. {{{
"http://stackoverflow.com/questions/14385998/how-can-i-execute-the-current-line-as-vim-ex-commands
au filetype vim nmap <F5> :exe getline(".")<CR>
au filetype vim vmap <F5> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>
"}}}
