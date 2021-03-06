autocmd BufNewFile,BufRead *.xml setlocal foldmethod=indent
"autoformat
"http://code.google.com/p/xmllint/downloads/detail?name=xmllint.exe&can=2&q=
autocmd BufRead,BufNewFile *.xml nmap <leader>f :% !xmllint.exe % --format<cr>

function! XsdAddColumn()
  normal "zywI<xs:element name="wea" msprop:Generator_UserColumnName=""zpa" msprop:Generator_ColumnPropNameInRow=""zpa" msprop:Generator_ColumnVarNameInTable="column"zpa" msprop:Generator_ColumnPropNameInTable=""zpaColumn" type="xs:string" minOccurs="0" />j0
endfunction

"Create a field in a xsd file
au BufRead,BufNewFile *.xsd nnoremap <A-r>xs :call XsdAddColumn()<cr>
au BufRead,BufNewFile *.xsd vnoremap <A-r>xs :call XsdAddColumn()<cr>
