setlocal expandtab
" convert tabs to spaces before writing file
if !&readonly && &modifiable
  autocmd! BufWritePre *.sql retab!
endif
