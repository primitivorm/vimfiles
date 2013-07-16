""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"(my personal macros) mapping like refactor
"http://www.vim.org/scripts/script.php?script_id=2087
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Automatic re-tab
"autocmd BufReadPost *.cs if &modifiable | retab | endif
"" convert spaces to tabs when reading file
"autocmd! BufReadPost *.cs set noexpandtab | retab!
"" convert tabs to spaces before writing file
"autocmd! BufWritePre *.cs set expandtab | retab!
"" convert spaces to tabs after writing file (to show guides again)
"autocmd! BufWritePost *.cs set noexpandtab | retab!
" establece file format
autocmd! BufReadPost *.cs set ft=cs
"for each line in buffer rewrap on write
autocmd BufWritePre *.cs :1,$call argumentrewrap#RewrapArguments()

"Create a Property based on a word with CamelCase format
au BufRead,BufNewFile *.cs nnoremap <A-r>cp Ipublic string <esc>w"zywA {<cr>}<esc>Oget { return <esc>"zpbi_<esc>l~b"xywea; }<esc>oset { <esc>"xpa = value; }<esc>kkOprivate string <esc>"xpa = string.Empty;<cr>/// <summary><cr> Obtiene o establece <esc>"zpo</summary><esc>4jV7k=
au BufRead,BufNewFile *.cs vnoremap <A-r>cp Ipublic string <esc>w"zywA {<cr>}<esc>Oget { return <esc>"zpbi_<esc>l~b"xywea; }<esc>oset { <esc>"xpa = value; }<esc>kkOprivate string <esc>"xpa = string.Empty;<cr>/// <summary><cr> Obtiene o establece <esc>"zpo</summary><esc>4jV7k=
"<C-r>s by Surround + first letter
"Surround visual selection with Namespace, #Region, Class, Struct, Interface, Try, Foreach, While, Using
au BufRead,BufNewFile *.cs vnoremap <A-r>sn <esc>gv"zdOnamespace namespace_name {<cr>}<esc>"zP?namespace_name<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>sc <esc>gv"zdOpublic class class_name {<cr>}<esc>"zP?class_name<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>ss <esc>gv"zdOpublic struct struct_name {<cr>}<esc>"zP?struct_name<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>si <esc>gv"zdOpublic interface interface_name {<cr>}<esc>"zP?interface_name<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>sr <esc>gv"zdO#region region_name<cr>#endregion<esc>"zP?region_name<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>st <esc>gv"zdOtry {<cr>} catch (Exception) {<cr>throw;<cr>} finally {<cr><cr>}<esc>?try {<cr>"zp/Exception<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>sf <esc>gv"zdOforeach (var item in collection) {<cr>}<esc>"zP?collection<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>sw <esc>gv"zdOwhile (true) {<cr>}<esc>"zP?true<cr>viw
au BufRead,BufNewFile *.cs vnoremap <A-r>su <esc>gv"zdOusing (resource) {<cr>}<esc>"zP?resource<cr>viw

"format statement like visual studio
function! FormatStatement()
  let line = getline('.')
  let pattern = '\v([\+|\-|\*|\/|\%|\=|!|<|>]+)'
  let line = substitute(
    line,
    pattern,
    ' \1 ',
    'g'
  )
  let pattern = '\v([\{|\}|;|,])'
  let line = substitute(
    line,
    pattern,
    ' \1 ',
    'g'
  )
  let pattern = '\v([A-z])\s+([+-]{2})'
  let line = substitute(
    line,
    pattern,
    '\1\2',
    'g'
  )
  let pattern = '\v([+-]{2})\s+([A-z])'
  let line = substitute(
    line,
    pattern,
    '\1\2',
    'g'
  )
  let line = substitute(line, '\v\s+([;,])', '\1',  'g')
  let line = substitute(line, '\s\+', ' ',  'g')
  let line = substitute(line, '\s\+$', '',  'g')
  call setline('.', line)
  exec 'normal! V=$l'
  startinsert
  return
endfunction

au BufRead,BufNewFile *.cs nnoremap <leader>fs :call FormatStatement()<cr>
au BufRead,BufNewFile *.cs inoremap <silent>; ;<esc>:call FormatStatement()<cr>

function! XsdAddColumn()
  normal "zywI<xs:element name="wea" msprop:Generator_UserColumnName=""zpa" msprop:Generator_ColumnPropNameInRow=""zpa" msprop:Generator_ColumnVarNameInTable="column"zpa" msprop:Generator_ColumnPropNameInTable=""zpaColumn" type="xs:string" minOccurs="0" />j0
endfunction

"Create a field in a xsd file
au BufRead,BufNewFile *.xsd nnoremap <A-r>xs :call XsdAddColumn()<cr>
au BufRead,BufNewFile *.xsd vnoremap <A-r>xs :call XsdAddColumn()<cr>
