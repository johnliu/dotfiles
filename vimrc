" John Liu's vimrc
"
" Some general instructions:
" - Requires `vundle` (https://github.com/gmarik/vundle)
" - Run `:BundleInstall` on first run.

" Critical Configurations
" =======================

" Vundle Setup Requirements
set nocompatible
filetype on
filetype off

" Leader Key
let mapleader = ","


" Vundle Bundles
" ==============

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Languages and Syntax
Bundle 'othree/html5.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'vim-stylus'
Bundle 'c.vim'
Bundle 'derekwyatt/vim-scala'

" UI Upgrades
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'

" Editing Upgrades
Bundle 'ack.vim'
Bundle 'YankRing.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'Shougo/neocomplcache'
" Bundle 'davidhalter/jedi-vim'

" Misc Upgrades
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'

" kien/ctrlp.vim
set wildignore+=*.o,*.pyc,.git,bin,node_modules,venv
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'

" YankRing.vim
let g:yankring_history_file = '.yankring_history'

" scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1

" scrooloose/syntastic
let g:syntastic_quiet_warnings = 1
let g:syntastic_check_on_open = 1

" Lokaltog/vim-powerline
let g:Powerline_symbols = 'fancy'

" fholgado/minibufexpl.vim
let g:miniBufExplHideWhenDiff = 1

" mattn/gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" mattn/zencoding-vim
let g:user_zen_leader_key = '<c-x>'

" Shougo/neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_compare_function = 'neocomplcache#compare_human'

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

if !exists('g:neocomplcache_disabled_sources_list')
  let g:neocomplcache_disabled_sources_list = {}
endif

inoremap <expr> <tab> pumvisible() ? CommonStringOrFinish() : "\<tab>"

function! CommonStringOrFinish()
  let l:result = neocomplcache#complete_common_string()

  if l:result != ''
    return l:result
  endif

  return "\<cr>"
endfunction

autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif

" Key Remappings
" ==============

" sjl/gundo.vim
nnoremap <silent> <leader>u :GundoToggle<cr>

" kien/ctrlp.vim
" <leader>t toggles CtrlP (mapped using ctrlp's global variable)

" scrooloose/nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" majutsushi/tagbar
nnoremap <silent> <leader>m :TagbarToggle<cr>

" mattn/zencoding-vim
" <c-x> toggles zencoding (mapped using zencoding's global variable)


" GENERAL
" Sets how many lines VIM has to remember.
set history=700

" Set up per project exrc
set exrc
set secure

" Enable filetype plugin
filetype plugin on
filetype indent on

" Modelines security exploits
set modelines=0

" Show line with cursor
set cursorline

" Fast terminal
set ttyfast

" Set to auto read when a file is changed from the outside
set autoread

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Force saving of read only files.
cmap w!! %!sudo tee > /dev/null %

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Speed up <SHIFT> O
set timeout timeoutlen=500 ttimeoutlen=50

" Better Copy and Paste
set pastetoggle=<F2>
set clipboard=unnamed

" VIM UI
" Add mouse scrolling.
set mouse=a

" Start scrolling 7 lines before the top/bottom
set so=7

" Turn on Wild menu
set wildmenu
set wildmode=list:longest

" Completeopt
set completeopt=menuone,longest

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

" Fix broken regex in modern browsers
nnoremap / /\v
vnoremap / /\v

" Default global substitution
set gdefault

" Clear highlighting.
nnoremap <leader><space> :noh<cr>

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
"set background=dark

" Differentiate tabs, spaces, and other whitespace characters.
set listchars=eol:¬,tab:▸·,trail:·

" solarized options
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_constrast = "normal"
let g:solarized_visibility = "normal"
colorscheme solarized

" Set font for GUI vim.
if has("gui_running")
  set guifont=Monaco:h14
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

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

" Autosave buffers on lose focus
autocmd BufLeave,FocusLost * silent! wall


" TEXT, TAB AND INDENT RELATED
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set lbr
set tw=0
set colorcolumn=100
set nowrap
set fo-=t
"highlight ColorColumn ctermbg=233

" Format options
set formatoptions=qrn1

" Auto indent
set ai

" Smart indent
set si
au! FileType python setl nosmartindent 

" Wrap lines
set wrap

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" VISUAL MODE
" Press * or # to search the current selection.
vnoremap <silent> * :call VisualSearch('f')<cr>
vnoremap <silent> # :call VisualSearch('b')<cr>

" STATUS LINE
" Always hide the status line
set laststatus=2

" PARENTHESIS EXPANSION

" EDITING MAPPINGS
" Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <esc>:bp<cr>
"inoremap <right> <esc>:bn<cr>

" Disable shift + K opening man pages.
nnoremap <s-k> <nop>

" Don't need shift for commands.
nnoremap ; :
vnoremap ; :

" Leader to reselect pasted
nnoremap <leader>v V`]

" Remap split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fix saving issues.
:ca WQ wq
:ca Wq wq
:ca QA qa
:ca Qa qa
:ca W w
:ca Q q

" Leader to toggle list chars
nnoremap <leader>l :set list!<cr>

