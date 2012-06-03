" GENERAL
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

" VIM UI
" Add mouse scrolling.
set mouse=a

" Start scrolling 7 lines before the top/bottom
set so=7

" Turn on WiLd menu
set wildmenu

" Always show current position
set ruler

" Command bar height
set cmdheight=2

" Change buffer, without saving.
set hid

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Make search act like in modern browsers
set incsearch

" Do not redraw when executing macros
set nolazyredraw

" Magic for reuglar expressions
set magic

" Show matching bracket indicator when text indicator is over them
set showmatch

" How many tenths of a second to blink
set mat=2

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" COLORS AND FONT
" Enable syntax highlighting
syntax enable

set encoding=utf8
try
  lang en_US
catch
endtry

set number
set background=dark

" solarized options
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_constrast = "normal"
let g:solarized_visibility = "normal"
colorscheme solarized

" FILES, BACKUPS AND UNDOS
" Turn backup off (mostly using git, etc anyway)
set nobackup
set nowb
set noswapfile

" Persistent undo
try
  set undodir=~/.vim_runtime/undodir
  set undofile
catch
endtry

" TEXT, TAB AND INDENT RELATED
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" VISUAL MODE
" Press * or # to search the current selection.
vnoremap <silent> * :call VisualSearch('f')<cr>
vnoremap <silent> # :call VisualSearch('b')<cr>

" STATUS LINE
" Always hide the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
  let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  return curdir
endfunction

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

" PARENTHESIS EXPANSION
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" EDITING MAPPINGS
" Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

