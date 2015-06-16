" Automatic re-tab
autocmd filetype c setlocal textwidth=0

" Convert tabs to spaces before writing file
if !&readonly && &modifiable
  autocmd! BufWritePre *.c setlocal expandtab | retab!
endif

" Autoformat
autocmd BufRead,BufNewFile *.cpp nnoremap <leader>f :silent Autoformat<cr>
autocmd BufRead,BufNewFile *.cpp vmap <leader>f :silent Autoformat<cr>
