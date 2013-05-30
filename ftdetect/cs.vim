""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"REFACTOR (my personal macros) mapping like refactor
"http://www.vim.org/scripts/script.php?script_id=2087
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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