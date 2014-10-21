"autocmd BufRead,BufNewFile *.htm, *.html nnoremap <leader>f :% !xmllint.exe % --format<cr>
"autocmd BufRead,BufNewFile *.xhtml,*.html,*.htm nnoremap <leader>f :silent Autoformat<cr>
