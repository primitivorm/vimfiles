" convert tabs to spaces before writing file
if !&readonly && &modifiable
  autocmd! BufWritePre *.py setlocal expandtab | retab!
endif
nnoremap <buffer><F8> :call Flake8()<CR>

"TODO: First install: pydoc: If you add .PY to your PATHEXT environment variable,
"you don't need the batch script. Just add C:\Python27\Lib to PATH, and you're all set.
autocmd BufRead,BufNewFile,BufEnter *.py nnoremap <F5> :!python %<cr>

"autocmd filetype python setlocal omnifunc=RopeCompleteFunc
autocmd filetype python setlocal completefunc=jedi#complete
"disable preview window
autocmd filetype python setlocal completeopt-=preview

autocmd filetype python setlocal expandtab
autocmd filetype python setlocal smartindent
autocmd filetype python setlocal scrolloff=5
autocmd filetype python setlocal tabstop=8
autocmd filetype python setlocal shiftwidth=4
autocmd filetype python setlocal softtabstop=4
autocmd filetype python setlocal foldlevel=3
