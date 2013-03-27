-----------------------------------------------
VIM - CARTA DE REFERENCIA RÁPIDA
-----------------------------------------------

-----------------------------------------------
Movimiento básico
-----------------------------------------------
h l k j caracter izq., derecha; línea arriba, abajo
b w palabra/símbolo izquierda, derecha
ge e    fin de palabra/símbolo izquierda, derecha
{  }    principio del anterior, siguiente párrafo
( ) comienzo de anterior, siguiente oración
0 gm    principio, medio de la línea
^  $    primer, último caracter de la línea
nG ngg  línea n. por defecto la primera, última
n%  porcentaje n del archivo (n es obligatorio)
n|  columna n de la línea actual
%   siguiente llave, paréntesis, comentario, #define
nH nL   línea n desde el principio, medio de la ventana
M   medio de la ventana

-----------------------------------------------
Inserción & sustitución → modo insertar
-----------------------------------------------
i a insertar antes, después del cursor
I A insertar al principio, fin de la línea
gI  insertar texto en la primera columna
o O insertar nueva línea abajo, arriba de la actual
rc  sustituir caracter bajo el cursor por c
grc como r, pero sin afectar el diseño
R   sustituir caracteres a partir del cursor
gR  como R, pero sin afectar el diseño
cm  cambiar texto del comando de deplazamiento m
cc or S cambiar línea actual
C   cambiar hasta el fin de la línea
s   cambiar un caracter e insertar
~   invertir mayúscula/minúscula y avanzar el cursor
g~m invertir mayús/minús del movimiento m
gum gUm minúscula, mayúscula texto movimiento m
<m >m   desplazar izq., der. texto del movimiento m
n<< n>> desplazar n líneas a la izquierda, derecha

-----------------------------------------------
Borrado
-----------------------------------------------
x X eliminar caracter sobre, previo al cursor
dm  eliminar texto de comando de movimiento m
dd D    eliminar línea actual, hasta fin de línea actual
J gJ    juntar linea actual con la siguiente, sin espacio
:rd↵    eliminar rango r de líneas
:rdx↵   eliminar rango r de líneas al registro x

-----------------------------------------------
Modo insertar
-----------------------------------------------
^Vc ^Vn insertar caracter c literal, con valor decimal n
^A  insertar último texto insertado
^@  igual que ^A y detener inserción → modo comando
^Rx ^R^Rx   insertar contenido de registro x, literal
^N ^P   completar texto antes, luego del cursor
^W  eliminar palabra anterior al cursor
^U  eliminar todo el texto insertado en la línea actual
^D ^T   desplazar linea a la izquierda, derecha
^Kc1c2 or c1←c2 entrar dígrafo \c1,c2\
^Oc ejecutar c en modo de temporal de comando
^X^E ^X^Y   scrollear arriba, abajo
<esc> or ^[ salir del modo edición → modo comando

-----------------------------------------------
Copiado
-----------------------------------------------
"x  usar registro x para la siguiente acción
:reg↵   mostrar contenido de todos los registros
:reg x↵ mostrar contenido de los registros x
ym  copiar texto del movimiento m
yy or Y copiar línea actual al registro
p P pegar registro antes, despues del cursor
]p [p   como p, P pero ajustando la sangría
gp gP   igual, pero cursor queda luego de texto nuevo

-----------------------------------------------
Inserción avanzada
-----------------------------------------------
g?m realizar codificación rot13 en movimiento m
n^A n^X incrementar/disminuir numero bajo el cursor
gqm formatear línea de movimiento m a ancho fijo
:rce w↵ centrar líneas en rango r a ancho w
:rle i↵ alinear izq. lineas en rango r con sangría i
:rri w↵ alinear der. lineas en rango r con ancho w
!mc↵    aplicar comando c al movimiento m
n!!c↵   aplicar comando c a siguientes n lineas
:r!c↵   aplicar comando c a rango de líneas r

-----------------------------------------------
Modo visual
-----------------------------------------------
v V ^V  empezar/terminar marca caract, líneas, bloque
o   cursor de selección al principio/fin del marcado
gv  empezar a marcar utilizando última zona marcada
aw as ap    seleccionar una palabra, oración, párrafo
ab aB   seleccionar un bloque ( ), un bloque { }

-----------------------------------------------
Deshacer, repetir & registros
-----------------------------------------------
u U deshacer último comando, restaurar última línea
.  ^R   repetir últimos cambios, rehacer último deshacer
n.      repetir últimos cambios n veces
qc qC   grabar, agregar teclas tipeadas en registro c
q   detener grabación
@c  ejecutar el contenido del registro c
@@  repetir comando @ anterior
:@c↵    ejecutar registro c como un comando Ex
:rg/p/c↵    ejecutar comando Ex c en rango r
    donde se cumpla el patrón p

-----------------------------------------------
Movimiento complejo
-----------------------------------------------
- + línea arriba, abajo al primer caracter no blanco
B W siguiente, anterior palabra separada por espacio
gE E    fin de anterior, siguiente palabra espaciada
n_  al primer caracter no blanco en linea n-1 debajo
g0  principio de la línea en pantalla
g^  g$  primer, último caracter de la línea en pantalla
gk gj   línea en pantalla arriba, abajo
fc Fc   siguiente, anterior ocurrencia del caracter c
tc Tc   antes de la siguiente, anterior occurencia de c
; , repetir última fFtT, en dirección opuesta
[[ ]]   comienzo de la sección hacia atrás, adelante
[] ][   fin de la sección hacia atrás, adelante
[( ])   seccion (, ) abierta hacia atrás, adelante
[{  ]}  seccion {, } abierta hacia atrás, adelante
[m ]m   comienzo de método Java hacia atrás, adelante
[# ]#   #if, #else, #endif abierto atrás, adelante
[* ]*   principio, fin de /* */ hacia atrás, adelante

-----------------------------------------------
Búsqueda & sustitución
-----------------------------------------------
/s↵  ?s↵    buscar s hacia adelante, atrás
/s/o↵  ?s?o↵    buscar s adelante, atrás con desplaz. o
n or /↵ repetir última búsqueda hacia adelante
N or ?↵ repetir última búsqueda hacia atrás
# * buscar adelante, atrás palabra sobre cursor
g# g*   igual, pero buscar tambien resultados parciales
gd gD   definición local, global de símbolo sobre cursor
:rs/f/t/x↵  sustituir f por t en rango r
    x: g-todas las ocurrencias, c-confirmar cambios
:rs x↵  repetir sustitución con nuevo r & x

-----------------------------------------------
Caracteres especiales en patrones de busqueda
-----------------------------------------------
.   ^  $    caracter simple; comienzo, fin de línea
\< \>   comienzo, fin de palabra
[c1-c2] caracter simple en el rango c1..c2
[^c1-c2]    caracter simple no en el rango c1..c2
\i \k \I \K identificador, palabra clave; excl. dígitos
\f \p \F \P nombre arch, car. imprim.; ign. dígitos
\s \S   espacio en blanco, no espacio en blanco
\e \t \r \b <esc>, <tab>, <↵>, <←>
\= * \+ 0..1, 0..∞, 1..∞ del átomo anterior
\|  separar dos ramas ( ≡ o)
\( \)   agrupa patrones en un átomo
\& \n   todo el patrón encontrado, grupo no ()
\u \l   próximo caracter a mayúscula, minúscula

-----------------------------------------------
Desplazamientos en comandos de búsqueda
-----------------------------------------------
n or +n n líneas hacia abajo en columna 1
-n  n líneas hacia arriba en columna 1
e+n e-n n caract. der., izq de comienzo del matcheo
s+n s-n n caract. der., izq. del final del matcheo
;sc ejecutar comando de búsqueda sc a continuación

-----------------------------------------------
Marcas y movimiento
-----------------------------------------------
mc  marcar posición actual con marca c ∈[a..Z]
`c `C   ir a marca c en archivo actual, cualquier archivo
`0..9   ir a última posición de salida
`` `"   ir a posición antes del salto, de última edición
`[ `]   ir al principio, fin del último texto operado
:marks↵ mostrar lista de marcas activas
:jumps↵ mostrar lista de saltos
n^O ir a la na posición más vieja de la lista de saltos
n^I ir a la na posición más nueva de la lista de saltos

-----------------------------------------------
Mapeo de teclas & abreviaciones
-----------------------------------------------
:map c e↵   mapear c ↦ e. modo normal & visual
:map!  c e↵ map. c ↦ e. modo insertar & comandos
:unmap c↵  :unmap!  c↵  borrar mapeo c
:mk f↵  guardar mapeos actuales en archivo f
:ab c e↵    agregar abreviatura para c ↦ e
:ab c↵  mostrar abreviaturas que empiezan con c
:una c↵ borrar abreviatura c

-----------------------------------------------
Etiquetas
-----------------------------------------------
:ta t↵  saltar a etiqueta t
:nta↵   saltar a la na etiqueta mas nueva
^] ^T   saltar a etiqueta sobre cursor, volver de etiqueta
:ts t↵  listar etiquetas que matchean y elegir una
:tj t↵  saltar a etiqueta o elegir una si varias cumplen
:tags↵  mostrar lista de etiquetas
:npo↵  :n^T↵    saltar desde, hacia n^va etiqueta vieja
:tl↵    saltar a última etiqueta que matchea
^W}  :pt t↵ vista previa etiqueta sobre cursor, etiq. t
^W] separar ventana y mostrar etiqueta sobre el cursor
^Wz or :pc↵ cerrar vista previa de etiquetas

-----------------------------------------------
Scrolleo & ventanas
-----------------------------------------------
^E ^Y   scrollear una línea arriba, abajo
^D ^U   scrollear media página arriba, abajo
^F ^B   scrollear una página arriba, abajo
zt or z↵    poner línea actual al principio de la ventana
zz or z.    poner línea actual al centro de la ventana
zb or z-    poner línea actual al final de la ventana
zh zl   scrollear un caracter a la derecha, izquierda
zH zL   scrollear media pantalla a la derecha, izquierda
^Ws or :split↵  dividir ventana en dos
^Wn or :new↵    crear nueva ventana vacía
^Wo or :on↵ hacer ventana actual única en la pantalla
^Wj ^Wk pasar a la ventana de abajo, arriba
^Ww ^W^W    pasar a la ventana de abajo, arriba (ciclíco)

-----------------------------------------------
Comandos Ex (↵)
-----------------------------------------------
:e f    editar archivo f, a menos que hayan cambios
:e!  f  editar archivo f siempre (recargar el actual)
:wn :wN guardar archivo y editar siguiente, anterior
:n :N   editar archivo siguiente, anterior de la lista
:rw guardar rango r en archivo actual
:rw f   guardar rango r a archivo f
:rw>>f  agregar rango r al archivo f
:q :q!  salir y confirmar, salir e ignorar cambios
:wq or :x or ZZ guardar archivo actual y salir
<up> <down> recordar comandos anteriores (historial)
:r f    insertar contenido archivo f debajo del cursor
:r!  c  insertar salida del comando c debajo del cursor
:all    abrir una vent. por cada arch. pasado en los arg.
:args   mostrar lista de argumentos

-----------------------------------------------
Rangos Ex
-----------------------------------------------
, ;     separa dos números de línea, primera linea
n   número de linea absoluto n
.   $   línea actual, última linea del archivo
% * todo el archivo, toda el área visual
't  posición de la marca t
/p/ ?p? la próxima, anterior línea que cumple con p
+n -n   +n, -n al numero de línea predecesor

-----------------------------------------------
Pliegues (folding)
-----------------------------------------------
zfm crear pliegue del movimiento m
:rfo    crear pliegue para el rango r
zd zE   borrar pliegue activo, todos los de la ventana
zo zc zO zC abrir, cerrar un pliegue; recursivamente
[z ]z   ir al comienzo, fin del pliegue actual
zj zk   ir abajo, arriba del comienzo, fin de sig. pliegue

-----------------------------------------------
Misceláneas
-----------------------------------------------
:sh↵  :!c↵  correr shell, ejecutar comando c
K   buscar palabra sobre el cursor con man
:make↵  correr make, leer errores y saltar al primero
:cn↵  :cp↵  mostrar el siguiente, anterior error
:cl↵  :cf↵  listar errores, leer errores de archivo
^L ^G   redibujar pant., mostrar nombre archivo y pos.
g^G mostrar columna, línea, palabra, byte actual
ga  mostrar código ASCII del caracter actual
gf  abrir archivo con nombre debajo del cursor
:redir>f↵   redirigir salida al archivo f
:mkview [f] guardar config. de vista [en archivo f]
:loadview [f]   cargar config. de vista [de archivo f]
^@ ^K ^_  \  Fn ^Fn teclas no mapeadas

-----------------------------------------------
VimDiff
-----------------------------------------------
do -> Get changes from other window into the current window.
dp -> Put the changes from current window into the other window.
]c -> Jump to the next change.
[c -> Jump to the previous change.
Ctrl W + Ctrl W -> Switch to the other split window
:diffupdate -- diff update
:syntax off -- syntax off
zo -- open folded text
zc -- close folded text 

-----------------------------------------------
NERDTree
-----------------------------------------------
Use the natural vim navigation keys hjkl to navigate the files.
Press o to open the file in a new buffer or open/close directory.
Press t to open the file in a new tab.
Press i to open the file in a new horizontal split.
Press s to open the file in a new vertical split.
Press p to go to parent directory.
Press r to refresh the current directory.
Press m to launch NERDTree menu inside vim.
  (a)dd a childnode
  (m)ove the curent node
  (d)elete the curent node
  (c)copy the current node
gt = next tab
gT = previous tab
Control+l moves to the next tab
Control+h moves to the previous tab
:edit somefile.     -> edita arhivo en ruta actual
-----------------------------------------------
-----------------------------------------------
NerdCommenter
-----------------------------------------------
[count]<leader>cc |NERDComComment|
Comment out the current line or text selected in visual mode.
[count]<leader>cn |NERDComNestedComment|
Same as <leader>cc but forces nesting.
[count]<leader>c |NERDComToggleComment|
Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
[count]<leader>cm |NERDComMinimalComment|
Comments the given lines using only one set of multipart delimiters.
[count]<leader>ci |NERDComInvertComment|
Toggles the comment state of the selected line(s) individually.
[count]<leader>cs |NERDComSexyComment|
Comments out the selected lines ``sexily''
[count]<leader>cy |NERDComYankComment|
Same as <leader>cc except that the commented line(s) are yanked first.
<leader>c$ |NERDComEOLComment|
Comments the current line from the cursor to the end of line.
<leader>cA |NERDComAppendComment|
Adds comment delimiters to the end of line and goes into insert mode between them.
|NERDComInsertComment|
Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
<leader>ca |NERDComAltDelim|
Switches to the alternative set of delimiters.
[count]<leader>cl
[count]<leader>cb |NERDComAlignedComment|
[count]<leader>cu |NERDComUncommentLine|
Uncomments the selected line(s). 

-----------------------------------------------
dbext
-----------------------------------------------
    (In addition to the above mappings)
    DBExecSQL             - Enter any command you want sent to the database
    DBExecSQLTopX         - Enter any command you want sent to the database
                            and limit the result set to X rows
    DBExecRangeSQL        - Enter any command you want sent to the database
    Select                - Enter the remainder of a select (ie :Select from
                            customer)
    Update                - Enter the remainder of an update
    Insert                - Enter the remainder of an insert
    Delete                - Enter the remainder of an delete
    Call                  - Enter the remainder of a call/exec statement
    Drop                  - Enter the remainder of a drop
    Alter                 - Enter the remainder of an alter
    Create                - Enter the remainder of a create
    DBSetOption           - Allow you to set options from the command line.
                            This is useful in functions and mappings, see
                            |dbext-in-mappings|
    DBGetOption           - Retrieves current setting
    DBCheckModeline       - Checks the file for a dbext modeline, and sets 
                            the connection information
    DBResultsOpen         - Re-opens the result window if it was closed
    DBResultsClose        - Closes the result window
    DBResultsToggleResize - Toggles the size of the result window
    DBResultsRefresh      - Re-runs the statement currently displayed in the 
                            result window
    DBCompleteTable       - Sets up table name completion for the buffer
    DBCompleteProcedure   - Sets up table name completion for the buffer
    DBCompleteView        - Sets up table name completion for the buffer
    DBListTable           - Lists all tables (optional wildcard)
    DBListProcedure       - Lists all procedures (optional wildcard)
    DBListView            - Lists all views (optional wildcard)
    DBListColumn          - Comma separated list of columns for the given table
    DBListConnections     - Lists all active DBI connections
    DBCommit              - When using the DBI or ODBC layer and in your
                            connection profile you have specified AutoCommit=1,
                            you have the ability to commit any changes on the
                            connection.
    DBRollback            - When using the DBI or ODBC layer and in your
                            connection profile you have specified
                            AutoCommit=1, you have the ability to rollback any
                            changes on the connection.
    DBOrientation         - When using the DBI or DBI::ODBC interface you have
                            the option of displaying the results in the
                            standard horizontal layout or in a vertical layout
                            which is especially useful for one or two rows of
                            output.
                            This will toggle the current display.

-----------------------------------------------
Creating the connection and connection profiles
\sbp :DBPromptForBufferParameters Prompt for database type and connection settings
let g:dbext_default_profile_mySQLServer = 'type=SQLSRV:integratedlogin=1:dbname=myDB' in your .vimrc
Executing commands
\sel sql execute line
\se :DBExecSQLUnderCursor
:DBExecVisualSQL
Execute command under the cursor
\st :DBSelectFromTable Display contents of the table under the cursor
\sT :DBSelectFromTableTopX -//- top X records
\stw :DBSelectFromTableWithWhere -//- with where clause
\sta :DBSelectFromTableAskName Ask for table and display contents
R Re-run last command. In the results buffer only.
Describing objects
\sdt :DBDescribeTable Describe column names and datatypes of the table under the cursor.
\dp :DBDescribeProcedure -//- describe procedures Listing objects
\slt :DBListTable Display listing of tables
\slp :DBListProcedure Display listing of procedures;
\slv :DBListView Display listing of views
\slc :DBListColumn Yank column list of the table under the cursor
-----------------------------------------------
    

-----------------------------------------------
--SQL Utilities
-----------------------------------------------
[range]SQLUFormatter ..list..    
                     : Reformats the SQL statements over the specified
                       range.  Statement will lined up given the
                       existing indent of the first word.
SQLUCreateColumnList:  Creates a comma separated list of column names
                       for the table name under the cursor, assuming
                       the table definition exists in any open
                       buffer.  The column list is placed in the unnamed
                       buffer.
                       This also uses the g:sqlutil_cmd_terminator.
                       By default a table alias will be added to each of the columns, this is
                       configurable, see documentation (new 1.3.7).
                       This routine can optionally take 2 parameters
                       SQLUCreateColumnList T1
                           Creates a column list for T1
                       SQLUCreateColumnList T1 1
                           Creates a column list for T1 but only for
                           the primary keys for that table.
SQLUGetColumnDef     : Displays the column definition of the column name
                       under the cursor.  It assumes the CREATE TABLE
                       statement is in an open buffer.
SQLUGetColumnDataType
                     : Displays the column datatype of the column name
                       under the cursor.  It assumes the CREATE TABLE
                       statement is in an open buffer.
SQLUCreateProcedure  : Creates a stored procedure to perform standard
                       operations against the table that the cursor
                       is currently under.

-----------------------------------------------
--surround 
-----------------------------------------------
It's easiest to explain with examples. Press cs"' inside
"Hello world!"
to change it to
'Hello world!'
Now press cs'<q> to change it to
<q>Hello world!</q>
To go full circle, press cst" to get
"Hello world!"
To remove the delimiters entirely, press ds".
Hello world!
Now with the cursor on "Hello", press ysiw] (iw is a text object).
[Hello] world!
Let's make that braces and add some space (use } instead of { for no space): cs]{
{ Hello } world!
Now wrap the entire line in parentheses with yssb or yss).
({ Hello } world!)
Revert to the original text: ds{ds)
Hello world!
Emphasize hello: ysiw<em>
<em>Hello</em> world!
Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.
<p class="important">
  <em>Hello</em> world!
</p>
-----------------------------------------------

-----------------------------------------------
--tag list
-----------------------------------------------
    :ts – shows the list.
    :tn – goes to the next tag in that list.
    :tp - goes to the previous tag in that list.
    :tf – goes to the function which is in the first of the list.
    :tl – goes to the function which is in the last of the list.
-----------------------------------------------


-----------------------------------------------
"taglist
-----------------------------------------------
:ta -> Navigate to function definition by specifying the function name 
:ta /^get -> Navigating through a list of function names which has the similar names
Ctrl + ] -> Navigating to the function definition from ‘function call’ 
Ctrl + t -> Returning back again to function call from the definition 
:ts – shows the list.
:tn – goes to the next tag in that list.
:tp - goes to the previous tag in that list.
:tf – goes to the function which is in the first of the list.
:tl – goes to the function which is in the last of the list.


-----------------------------------------------
"visual studio
"http://www.plan10.com/vim/visual-studio/doc/1.2/
"https://github.com/vim-scripts/visual_studio.vim
-----------------------------------------------
Command mode mapppings Mapping  Action
\vg     Get the VS file into Vim
\vp     Put the Vim file into VS
\vt     Load the VS Task List into the Vim quickfix buffer
\vo     Load the VS Output window into the Vim quickfix buffer
\vf     Load the VS Find Results 1 window into the Vim quickfix buffer
\v2     Load the VS Find Results 2 window into the Vim quickfix buffer
\vb     Build the VS Solution
\vu     Build the VS Startup Project
\vc     Compile the current file
\vs     Select the current VS Solution instance
\vp     Select the current VS Startup Project
\va     About visual_studio.vim
\vh     Online help - this page!

-----------------------------------------------
--Exuberant ctags
-----------------------------------------------

--You have to build your database with at least the following options:
        --c++-kinds=+p  : Adds prototypes in the database for C/C++ files.
        --fields=+iaS   : Adds inheritance (i), access (a) and function 
                          signatures (S) information.
        --extra=+q      : Adds context to the tag name. Note: Without this
                          option, the script cannot get class members.

Thus to build recursively a ctags database from the current directory, the
command looks like this:
>
        ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
<
You can add a map in your |.vimrc| file, eg: >

        map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
<
Or you can add these options in your ctags config file (~/.ctags under unix or
%HOMEPATH%\ctags.cnf under windows) and execute the command : >
 :!ctags -R .
<
If your project contains files of other languages you may add the following
options:
        --languages=c++ : Builds only the tags for C++ files.

If your project contains macros you may also use the -I option.

Please read the ctags help or ctags man page for more details.

-----------------------------------------------

-----------------------------------------------
vim-scmdiff
https://github.com/ghewgill/vim-scmdiff
-----------------------------------------------
Default commands:
  \d Toggle diff view on/off
  :D rev Difference between current and rev
-----------------------------------------------

-----------------------------------------------
conque
http://code.google.com/p/conque/wiki/Usage
-----------------------------------------------
:ConqueTerm bash
:ConqueTerm mysql -h localhost -u joe_lunchbox Menu
:ConqueTerm Powershell.exe
-----------------------------------------------

-----------------------------------------------
gist
-----------------------------------------------
Usage:
    Post current buffer to gist, using default privacy option.
    :Gist
    Post selected text to gist, using default privacy option. This applies to all permutations listed below (except multi).
    :'<,'>Gist
    Create a private gist.
    :Gist -p
    Create a public gist. (Only relevant if you've set gists to be private by default.)
    :Gist -P
    This is only relevant if you've set gists to be private by default; if you get an empty gist list, try ":Gist --abandon".
    Create a gist anonymously.
    :Gist -a
    Create a gist with all open buffers.
    :Gist -m
    Edit the gist (you need to have opened the gist buffer first). You can update the gist with the ":w" command within the gist buffer.
    :Gist -e
    Edit the gist with name 'foo.js' (you need to have opened the gist buffer first).
    :Gist -e foo.js
    Post/Edit with the description " (you need to have opened the gist buffer first). >
    :Gist -s something :Gist -e -s something
    Delete the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist -d
    Fork the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist -f
    Star the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist +1
    Unstar the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist -1
    Get gist XXXXX.
    :Gist XXXXX
    Get gist XXXXX and add to clipboard.
    :Gist -c XXXXX
    List your public gists.
    :Gist -l
    List gists from user "mattn".
    :Gist -l mattn
    List everyone's gists.
    :Gist -la
    List gists from your starred gists.
    :Gist -ls
-----------------------------------------------
-----------------------------------------------
yank ring
-----------------------------------------------
yy - Adds the current line to the yankring.
dd - Adds the current line to the yankring and deletes it.
5yw - Adds 5 words to the yankring.
ade - Deletes the word, and puts it into both the yankring and the "a register.
cw - Changes the word and stores the previous value in the yankring.
10"zyy - Places 10 lines into both the yankring and the "z register.
:1,4YRYankRange   - Similar to 1,4y
:3,$YRDeleteRange  - Similar to 3,$d

-----------------------------------------------

-----------------------------------------------
FuzzyFinder 
-----------------------------------------------
|:FufBuffer|       - Buffer mode (|fuf-buffer-mode|)
|:FufFile|         - File mode (|fuf-file-mode|)
|:FufCoverageFile| - Coverage-File mode (|fuf-coveragefile-mode|)
|:FufDir|          - Directory mode (|fuf-dir-mode|)
|:FufMruFile|      - MRU-File mode (|fuf-mrufile-mode|)
|:FufMruCmd|       - MRU-Command mode (|fuf-mrucmd-mode|)
|:FufBookmarkFile| - Bookmark-File mode (|fuf-bookmarkfile-mode|)
|:FufBookmarkDir|  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)
|:FufTag|          - Tag mode (|fuf-tag-mode|)
|:FufBufferTag|    - Buffer-Tag mode (|fuf-buffertag-mode|)
|:FufTaggedFile|   - Tagged-File mode (|fuf-taggedfile-mode|)
|:FufJumpList|     - Jump-List mode (|fuf-jumplist-mode|)
|:FufChangeList|   - Change-List mode (|fuf-changelist-mode|)
|:FufQuickfix|     - Quickfix mode (|fuf-quickfix-mode|)
|:FufLine|         - Line mode (|fuf-line-mode|)
|:FufHelp|         - Help mode (|fuf-help-mode|)
-----------------------------------------------

-----------------------------------------------
a.vim
http://www.vim.org/scripts/script.php?script_id=31
-----------------------------------------------
:A switches to the header file corresponding to the current file being edited (or vise versa)
:AS splits and switches
:AV vertical splits and switches
:AT new tab and switches
:AN cycles through matches
:IH switches to file under cursor
:IHS splits and switches
:IHV vertical splits and switches
:IHT new tab and switches
:IHN cycles through matches
<Leader>ih switches to file under cursor
<Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
<Leader>ihn cycles through matches 
-----------------------------------------------

-----------------------------------------------
ShowMarks  (BREAK VIM) 
http://www.vim.org/scripts/script.php?script_id=152
-----------------------------------------------
   \mt : Toggles ShowMarks on and off.
   \mh : Hides an individual mark.
   \ma : Hides all marks in the current buffer.
   \mm : Places the next available mark. 
-----------------------------------------------

-----------------------------------------------
Align -> DrChip
http://www.vim.org/scripts/script.php?script_id=294
http://www.drchip.org/astronaut/vim/align.html#Examples
-----------------------------------------------
\t=  : align assignments (don't count logic, like == or !=)
\t,  : align on commas
\t|  : align on vertical bars (|)
\tsp : align on whitespace
\tt  : align LaTeX tabular tables 
-----------------------------------------------
\acom : align comments
\adec : align C declarations (one variable per line)
\afnc : align ansi-style C function input arguments
\Htd  : align html tables 
-----------------------------------------------

-----------------------------------------------
ctrlp
-----------------------------------------------
Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.

Once CtrlP is open:

    Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
    Press <c-f> and <c-b> to cycle between modes.
    Press <c-d> to switch to filename only search instead of full path.
    Press <c-r> to switch to regexp mode.
    Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
    Use <c-y> to create a new file and its parent directories.
    Use <c-z> to mark/unmark multiple files and <c-o> to open them.

Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.

    Submit two or more dots .. to go up the directory tree by one or multiple levels.
    End the input string with a colon : followed by a command to execute it on the opening file(s):
    Use :25 to jump to line 25.
    Use :diffthis when opening multiple files to run :diffthis on the first 4 files.

-----------------------------------------------

-----------------------------------------------
cref
http://www.vim.org/scripts/script.php?script_id=614
-----------------------------------------------
 <Leader>cr normal mode:  get help for word under cursor
                           Memory aid cr: (c)-(r)eference
  <Leader>cr visual mode:  get help for visually selected text
                           Memory aid cr: (c)-(r)eference
  <Leader>cw:              prompt for word CRefVim should search for
                           Memory aid cw: (c)-reference (w)hat
  <Leader>cc:              jump to table of contents of the C-reference manual
                           Memory aid cc: (c)-reference (c)ontents 
-----------------------------------------------

-----------------------------------------------
ack
https://github.com/mileszs/ack.vim
-----------------------------------------------
o    to open (same as enter)
go   to preview file (open but maintain focus on ack.vim results)
t    to open in new tab
T    to open in new tab silently
h    to open in horizontal split
H    to open in horizontal split silently
v    to open in vertical split
gv   to open in vertical split silently
q    to close the quickfix window

-----------------------------------------------

-----------------------------------------------
https://github.com/xolox/vim-easytags
http://ctags.sourceforge.net/ctags.html#FILES
-----------------------------------------------
:UpdateTags     -> This command executes Exuberant Ctags from inside Vim to update the global tags file defined by g:easytags_file
:HighlightTags  -> When you execute this command while editing one of the supported file types (see above) the relevant tags in the current file are highlighted
-----------------------------------------------

-----------------------------------------------
Gist
-----------------------------------------------


    Post current buffer to gist, using default privacy option.
    :Gist
    Post selected text to gist, using default privacy option. This applies to all permutations listed below (except multi).
    :'<,'>Gist
    Create a private gist.
    :Gist -p
    Create a public gist. (Only relevant if you've set gists to be private by default.)
    :Gist -P
    This is only relevant if you've set gists to be private by default; if you get an empty gist list, try ":Gist --abandon".
    Create a gist anonymously.
    :Gist -a
    Create a gist with all open buffers.
    :Gist -m
    Edit the gist (you need to have opened the gist buffer first). You can update the gist with the ":w" command within the gist buffer.
    :Gist -e
    Edit the gist with name 'foo.js' (you need to have opened the gist buffer first).
    :Gist -e foo.js
    Post/Edit with the description " (you need to have opened the gist buffer first). >
    :Gist -s something :Gist -e -s something
    Delete the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist -d
    Fork the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist -f
    Star the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist +1
    Unstar the gist (you need to have opened the gist buffer first). Password authentication is needed.
    :Gist -1
    Get gist XXXXX.
    :Gist XXXXX
    Get gist XXXXX and add to clipboard.
    :Gist -c XXXXX
    List your public gists.
    :Gist -l
    List gists from user "mattn".
    :Gist -l mattn
    List everyone's gists.
    :Gist -la
    List gists from your starred gists.
    :Gist -ls

-----------------------------------------------

-----------------------------------------------
QuickBuf
-----------------------------------------------
Press the assigned hotkey to activate QuickBuf (default <F4>). It brings out a list of buffers that you can browse and give commands on! Some indicators in the list:
	- * : the buffer being opened in the active window
	- = : a buffer being opened in a window, but not active
	- [+] : modifed buffer
+ Use k/j or <Up>/<Down> keys to select the buffer.
+ Press a key to give a command to the currently selected buffer
	- d : delete buffer
	- w : wipe out buffer
	- s : open buffer in a new horizontally split window
	- u : open buffer
	- <enter> : open buffer and leave QuickBuf; if the	buffer is already opened in a window, switch to that window.
-----------------------------------------------

-----------------------------------------------
vimpdb commands
https://github.com/gotcha/vimpdb
-----------------------------------------------
Ex Command 	Key binding 	Details
:PDBNext 	n 	pdb (n)ext
:PDBStep 	s 	pdb (s)tep
:PDBArgs 	a 	pdb (a)rgs
:PDBUp 	u 	pdb (u)p
:PDBDown 	d 	pdb (d)own
:PDBReturn 	r 	pdb (r)eturn
:PDBContinue 	c 	pdb (c)ontinue
:PDBBreak 	b 	Sets a breakpoint at the line on which the cursor is sitting; similar to pdb b(reak)
:PDBClear 	B 	Clears a breakpoint at the line on which the cursor is sitting; similar to pdb cl(ear)
:PDBWord 	w 	Evaluates the value of the identifier on which the cursor is sitting.
:PDBEval 	? 	Evaluates a Python expression after having asked for it.
:PDBReset 	x 	Switch back to normal debugging in shell with standard pdb.
N/A 	v(im) 	Switch back to vimpdb; only in plain pdb.
-----------------------------------------------

-----------------------------------------------
submodules
http://usevim.com/2012/03/01/using-pathogen-with-git-submodules/
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
-----------------------------------------------
cd ~/.vim
git submodule init
git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
git commit -m 'Added vim-fugitive'
git push
-----------------------------------------------

-----------------------------------------------
Vim key notation
-----------------------------------------------
<BS>           Backspace
<Tab>          Tab
<CR>           Enter
<Enter>        Enter
<Return>       Enter
<Esc>          Escape
<Space>        Space
<Up>           Up arrow
<Down>         Down arrow
<Left>         Left arrow
<Right>        Right arrow
<F1> - <F12>   Function keys 1 to 12
#1, #2..#9,#0  Function keys F1 to F9, F10
<Insert>       Insert
<Del>          Delete
<Home>         Home
<End>          End
<PageUp>       page-up
<PageDown>     page-down
-----------------------------------------------

-----------------------------------------------
git command
-----------------------------------------------
git add .
git commit -m "messahe here"
git push 
-----------------------------------------------

-----------------------------------------------
"proman
-----------------------------------------------
:scriptnames -> to get a list of sourced scripts in order in which they were first sourced in your Vim instance
za  -> toggle a line of code
zM -> toggle all lines 
zR -> untoggle all lines
:verbose setlocal foldmethod? -> view foldmethod used
:1,10SQLUFormatter -> formatea codigo T-SQL 1,10 son las lineas de inicio y fin del formateo
:echo has('perl') -> devuelve true si soporta perl
ctags -R -> genera las Etiquetas ctags -> execute under command linea
:TlistToggle -> Open tag list
\w -> load easy motion
:help help-writing -> help to write helps
TT | <F4>      -> open taglist
vim --version | grep +python    -> ver si vim soporta python
vim --version | grep +signs     -> ver si vim soporta python
:files      -> open files from powerline
:buffers    -> open buffers from powerline
verbose autocmd CursorMoved     -> ver las funciones definidas por un script
perl -MCPAN -e "CPAN::Shell->force(qw(install App::Ack));"      ->install ack desde cmd windows
:make /t:rebuild    -> to build *.proj
