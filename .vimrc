set nocompatible

"Load pathogen"
call pathogen#infect( 'bundle/{}' )

" Include the system settings
:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif

" Include Arista-specific settings
:if filereadable( $VIM . "/vimfiles/arista.vim" )
   source $VIM/vimfiles/arista.vim
:endif

" Put your own customizations below

"Making tab completion work like bash completion when opening files
set wildmode=longest,list,full
set wildmenu

"Needed for ctags"
set tags=./tags,tags

"Using tab to browse between buffers. Doesn't work
nnoremap <silent> <C-Tab> :bn<CR>
nnoremap <silent> <C-S-Tab> :bp<CR>


"Lid customizations"
"let LID_Jump_To_Match = 0
"let LID_File = ''
"nnoremap <silent> <F5> :Lid <C-R><C-W><CR>

map _u :call ID_search()<Bar>execute "/\\<" . g:word . "\\>"<CR>
map _n :n<Bar>execute "/\\<" . g:word . "\\>"<CR>
function ID_search()
    let g:word = expand("<cword>")
    let x = system("lid --key=none ". g:word)
    let x = substitute(x, "\n", " ", "g")
    execute "next " . x
endfun

" Taglist, move to the next/previous tag
map + :tn<CR>
map - :tp<CR>

" Disable Ex mode"
nnoremap Q <nop>

"Search for the identifier under the cursor."
nnoremap <silent> <C-x> :ts <C-R><C-W><CR>

syntax on
filetype plugin indent on

" Settings for solarized colorscheme"
"syntax enable
"set background=white
"let g:solarized_termcolors=256
"colorscheme solarized


" Colorscheme settings for Lucius"
"colorscheme lucius
"LuciusBlackHighContrast
"hi StatusLine ctermbg=240"

"Molokai Scheme
"colorscheme molokai
"let g:molokai_original = 1
"Scrolling ease"

"Github Scheme
"colorscheme github
"set scrolloff=2

"Ir_Black Scheme
"set background=dark
"colorscheme ir_black
"syntax on

"CodeSchool theme
colorscheme xoria256
"let g:codeschool_termcolors=256
"highlight Normal ctermfg=white ctermbg=black
"Display airline even when there is no vsplit                                                                                                        i
set number
set laststatus=2                                                                                                                                                                                                   
                                                                                                                                                                                                                   
"Remove annoying trailing characters status line message in airvim                                                                                                                                                 
autocmd VimEnter * AirlineToggleWhitespace 

"Set shortcut for CtrlP buffer search"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'

"Set shortcut for CtrlP file search"
let g:ctrlp_map = '<c-s-p>'
let g:ctrlp_cmd = 'CtrlP'
