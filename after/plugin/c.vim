" Automatic re-tab
autocmd filetype c setlocal textwidth=0
autocmd filetype c setlocal cindent

" Convert tabs to spaces before writing file
if !&readonly && &modifiable
  autocmd! BufWritePre *.c setlocal expandtab | retab!
endif

" Autoformat
autocmd BufRead,BufNewFile *.c nnoremap <leader>f :silent Autoformat<cr>
autocmd BufRead,BufNewFile *.c vmap <leader>f :silent Autoformat<cr>

"autocmd CursorHold *.[ch] nested exe "silent! ptag " . expand("<cword>")
