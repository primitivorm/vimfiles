if !&readonly && &modifiable
  autocmd! BufWritePre *.vb setlocal expandtab | retab!
endif
autocmd filetype vb,vbnet setlocal foldmethod=indent
autocmd filetype vb,vbnet setlocal filetype=basic
