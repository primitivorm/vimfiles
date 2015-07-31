autocmd BufRead,BufNewFile *.vim,_vimrc setlocal textwidth=0
autocmd BufRead,BufNewFile *.vim,_vimrc setlocal expandtab
autocmd BufRead,BufNewFile *.vim,_vimrc setlocal scrolloff=5
autocmd BufRead,BufNewFile *.vim,_vimrc setlocal shiftwidth=2
autocmd BufRead,BufNewFile *.vim,_vimrc setlocal tabstop=2
autocmd BufRead,BufNewFile *.vim,_vimrc setlocal foldmethod=marker

" convert tabs to spaces before writing file
if !&readonly && &modifiable
  autocmd! BufWritePre *.vim setlocal expandtab | retab!
endif

" Execute current line or current selection as Vim EX commands. {{{
"http://stackoverflow.com/questions/14385998/how-can-i-execute-the-current-line-as-vim-ex-commands
"autocmd BufRead,BufNewFile,BufEnter *.vim nnoremap <F5> :exe getline(".")<CR>
"autocmd BufRead,BufNewFile,BufEnter *.vim vnoremap <F5> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>
"http://superuser.com/questions/370619/can-vim-autocommand-be-triggered-by-filetype-instead-of-by-pattern
au BufEnter * if &ft ==# 'vim' | nnoremap <C-F5> :exe getline(".")<CR> | endif
au BufEnter * if &ft ==# 'vim' | vnoremap <C-F5> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR> | endif
"}}}
