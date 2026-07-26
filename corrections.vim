" Script Vim pour correction typographique

let g:SCRIPT_NAME='corrections.vim'
set laststatus=2
" Retrieve original statusline format
let s:stl_orig = &statusline

"
" Display a message to the statusline
" message (string)
"
" TODO: est-ce nécessaire ? echo ne peut pas suffire ??
function! s:f_say ( msg )
 	"let &statusline = '['.g:SCRIPT_NAME.'] '.a:msg.' (phase '.a:step_num.'/'.a:step_tot.') in "%f" (%p%%)'
	let &statusline = '['.g:SCRIPT_NAME.'] '.a:msg.' in "%f" (%p%%)'
	echomsg '['.g:SCRIPT_NAME.'] '.a:msg
endfunc

echomsg '['.g:SCRIPT_NAME.'] CORRECTION EN COURS...'

" NB : '&' MUST NOT be escaped in the search pattern and MUST BE escaped in the replacement pattern
" NB : '\([letter]\)' technique is mandatory to not override the original case of the first letter
" NB : '\w' does not match UTF-8 character, therefore '[a-zéèêœôàîïù]' (with 'ignorecase' option)  must be used instead


call s:f_say('ESPACES INSÉCABLES ALT+0160 AVANT [?;:!]')
" NB : &nbsp; est banni car il rend le texte illisible
" NB : attention à ne pas insérer des esp. inséc. dans la syntaxe YAML ("title: ...")
:%s/ \([:;!?]\)/ \1/gc
call s:f_say('ESPACES INSÉCABLES ALT+0160 APRÈS TIRETS CADRATIN ET DEMI-CADRATIN')
:%s/\([^-]\)--- /\1--- /gc
:%s/\([^-!]\)-- /\1-- /gc

call s:f_say("APOSTROPHES ’ -> '")
:%s/’/'/gc
"call s:f_say('REMPLACEMENT DES GUILLEMETS ANGLAIS PAR GUILLEMETS FRANÇAIS')
" se repère grâce aux espaces autour des guillemets, donc il peut y avoir des
" erreurs quand la syntaxe n'est pas claire, p.ex. ' \" dans ce cas \" '
":%s/\(\s\)"/\1« /gc
" ^v ne peuvent pas être fait dans une mm regex
":%s/\([[({]\)"/\1« /gc
":%s/^"/« \1/gc
":%s/"\(\s\)/ »\1/gc
" ^v ne peuvent pas être fait dans une mm regex
":%s/"\([])}\.,]\)/ »\1/gc
":%s/"$/ »/gc
"call s:f_say('[,.] AVEC GUILLEMETS FRANÇAIS')
":%s/[  ]»[.]/. »/gc
":%s/[  ]»,/, »/gc
call s:f_say('ESPACES INSÉCABLES AVANT ET APRÈS LES GUILLEMETS FRANÇAIS')
:%s/« /« /gc
:%s/ »/ »/gc

call s:f_say('oe -> œ')
:%s/oeil/œil/gc
:%s/oeuvre/œuvre/gc
:%s/oeuf/œuf/gc
:%s/coeur/cœur/gc
:%s/moelle/mœlle/gc
:%s/moeurs/mœurs/gc
:%s/noeud/nœud/gc

echomsg '['.g:SCRIPT_NAME.'] FIN !'
let &statusline = s:stl_orig
