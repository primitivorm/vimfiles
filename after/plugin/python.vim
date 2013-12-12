au filetype python nnoremap <F5> :!python %<cr>
au filetype python set omnifunc=RopeCompleteFunc
au filetype python set completefunc=jedi#complete
au filetype python set completeopt-=preview
noremap <buffer><F8> :call Flake8()<CR>

set expandtab
set scrolloff=2
set shiftwidth=4
set smartindent
set tabstop=4
