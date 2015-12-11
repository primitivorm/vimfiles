" Automatic re-tab
autocmd filetype c setlocal textwidth=0
autocmd filetype cpp setlocal cindent


" Convert tabs to spaces before writing file
if !&readonly && &modifiable
  autocmd! BufWritePre *.c setlocal expandtab | retab!
endif

" Autoformat
autocmd BufRead,BufNewFile *.h,*.cpp nnoremap <leader>f :silent Autoformat<cr>
autocmd BufRead,BufNewFile *.h,*.cpp vmap <leader>f :silent Autoformat<cr>
