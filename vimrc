" John Liu's vimrc
"
" Some general instructions:
" - Requires `vim-plug` (https://github.com/junegunn/vim-plug)
" - Run `:PlugInstall` on first run.

" Critical Configurations
" =======================

" Leader Key
let mapleader = ","


" Plugins
" =======

call plug#begin('~/.vim/plugged')

" Languages and Syntax
Plug 'othree/html5.vim'
Plug 'vim-stylus'
Plug 'c.vim'
Plug 'mattn/emmet-vim'

" UI Upgrades
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'godlygeek/csapprox'

" Editing Upgrades
Plug 'ack.vim'
Plug 'YankRing.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplcache'
Plug 'Lokaltog/vim-easymotion'
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'

" Misc Upgrades
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

call plug#end()

" kien/ctrlp.vim
set wildignore+=*.o,*.pyc,.git,bin,node_modules,venv
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_relative = 1

let g:ctrlp_buftag_types = {
      \ 'go'         : '--language-force=go --golang-types=ftv',
      \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
      \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
      \ 'objc'       : '--language-force=objc --objc-types=mpci',
      \ }

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" YankRing.vim
let g:yankring_history_file = '.yankring_history'

" scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1

" scrooloose/syntastic
let g:syntastic_quiet_messages = { 'level': 'warnings' }
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 0

" bling/vim-airline
let g:airline_powerline_fonts = 1

" fholgado/minibufexpl.vim
let g:miniBufExplHideWhenDiff = 1

" Raimondi/delimitMate
let delimitMate_balance_matchpairs = 1

" mattn/gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" mattn/emmet-vim
let g:user_emmet_leader_key = '<c-x>'

" altercation/vim-colors-solarized
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_constrast = "normal"
let g:solarized_visibility = "normal"
colorscheme solarized

" nanotech/jellybeans.vim
let g:jellybeans_use_lowcolor_black = 0
" colorscheme jellybeans

" Set font for GUI vim.
if has("gui_running")
  set guifont=Monaco:h14
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

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

if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif

if !exists('g:neocomplcache_disabled_sources_list')
  let g:neocomplcache_disabled_sources_list = {}
endif

function! CompleteCommonStringOrFinish(normal)
  if pumvisible()
    let l:result = neocomplcache#complete_common_string()
    let l:check = neocomplcache#get_cur_text()
    if l:result != '' && strlen(l:result) - strridx(l:result, l:check) != strlen(l:check)
      return l:result
    endif
    return "\<cr>"
  endif
  return a:normal
endfunction

autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif


" Key Remappings
" ==============

" Bundle Mappings

" sjl/gundo.vim
nnoremap <silent> <leader>u :GundoToggle<cr>

" kien/ctrlp.vim
" <leader>t toggles CtrlP (mapped using ctrlp's global variable)
nnoremap <leader>r :CtrlPBufTagAll<cr>

" scrooloose/nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" majutsushi/tagbar
nnoremap <silent> <leader>m :TagbarToggle<cr>

" mattn/emmet-vim
" <c-x> toggles emmet (mapped using emmet's global variable)

" Shougo/neocomplcache
inoremap <expr> <tab> CompleteCommonStringOrFinish("\<tab>")

" Other Mappings

" Quickly edit vimrc.
nnoremap <leader>e :e! ~/.vimrc<cr>

" Force save read only files.
cnoremap w!! %!sudo tee > /dev/null %

" Clears highlighting.
nnoremap <leader><space> :noh<cr>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Disable arrow keys by default, turn them into something useful (switch buffer).
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

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

" Fix save typos.
:ca WQ wq
:ca Wq wq
:ca QA qa
:ca Qa qa
:ca W w
:ca Q q

" Leader to toggle list chars
nnoremap <leader>l :set list!<cr>


" Misc Settings
" =============

" Remember 700 lines of history.
set history=700

" Allow per project vimrc
set exrc
set secure

" Enable filetype plugin and indent files
filetype plugin on
filetype indent on

" Disable modelines (security exploits)
set modelines=0

" Show line with cursor
set cursorline

" Fast terminal
set ttyfast

" Set to auto read when a file is changed from the outside
set autoread

" Speed up <shift>O
set timeoutlen=500
set ttimeoutlen=50

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" Add mouse scrolling.
set mouse=a

" Start scrolling 7 lines before the top/bottom
set scrolloff=14

" Turn on enhanced completions, and set completion options
set wildmenu
set wildmode=list:longest
set completeopt=menuone,longest

" Command bar height
set cmdheight=2

" Change buffers without saving (allow hidden buffers).
set hidden

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

" Default global substitution
set gdefault

" Do not redraw when executing macros
set nolazyredraw

" Magic for reuglar expressions
set magic

" Show matching bracket indicator when text indicator is over them
set showmatch
set matchtime=2

" No sound on errors
set noerrorbells
set visualbell
set t_vb=

" Attempt to turn on encoding
set encoding=utf8
try
  lang en_US
catch
endtry

" Show the line number
set number

" Enable syntax highlighting
syntax enable

" Set invisible characters
set listchars=eol:¬,tab:▸·,trail:·

" Turn backup off (mostly using git, etc anyway)
set nobackup
set nowb
set noswapfile

" Tab settings
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set linebreak
set textwidth=0
set colorcolumn=100
set wrap

" Format options
set formatoptions=qrn1

" Indentation settings
set autoindent
set smartindent
au! FileType python setl nosmartindent 

" Always hide the status line
set laststatus=2

