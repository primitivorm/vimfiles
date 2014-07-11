autocmd BufRead,BufNewFile *.htm, *.html nnoremap <leader>f :% !xmllint.exe % --format<cr>
