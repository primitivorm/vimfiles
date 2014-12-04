"Autoformat
autocmd BufRead,BufNewFile *.css nnoremap <leader>f :call CSSBeautify()<cr>
autocmd BufRead,BufNewFile *.css vmap <leader>f :call CSSBeautify()<cr>
