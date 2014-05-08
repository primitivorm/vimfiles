"keymap
autocmd BufRead,BufNewFile,BufEnter *.pl,*.plx nnoremap <F5> :!perl %<cr>

if !&readonly && &modifiable
  autocmd! BufWritePre *.pl,*.plx setlocal expandtab | retab!
endif

"setlocal
autocmd filetype perl setlocal foldmethod=indent
autocmd filetype perl setlocal foldlevel=3
autocmd filetype perl setlocal expandtab
autocmd filetype perl setlocal smartindent
autocmd filetype perl setlocal scrolloff=5
autocmd filetype perl setlocal tabstop=4
autocmd filetype perl setlocal shiftwidth=4
autocmd filetype perl setlocal softtabstop=4
autocmd filetype perl setlocal foldlevel=3
