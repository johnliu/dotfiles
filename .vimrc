" < GENERAL > "
" Sets how many lines VIM has to remember.
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" < VIM UI > "
" Start scrolling 7 lines before the top/bottom
set so=7

" Turn on WiLd menu
set wildmenu

" Always show current position
set ruler

" Command bar height
set cmdheight=1

" Change buffer, without saving.
set hid

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

syntax enable

set number
set background=dark

" solarized options
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_constrast = "normal"
let g:solarized_visibility = "normal"
colorscheme solarized
