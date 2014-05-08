" convert tabs to spaces before writing file
if !&readonly && &modifiable
  autocmd! BufWritePre *.sql setlocal expandtab | retab!
endif
