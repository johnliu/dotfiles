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
Bundle 'altercation/vim-colors-solarized'

" Editing Upgrades
Bundle 'ack.vim'
Bundle 'YankRing.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'Shougo/neocomplcache'
Bundle 'davidhalter/jedi-vim'
Bundle 'Lokaltog/vim-easymotion'

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
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 0

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

" altercation/vim-colors-solarized
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

" dhalter/jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_function_definition = 0
autocmd FileType python let b:did_ftplugin = 1

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
let g:neocomplcache_omni_functions['python'] = 'jedi#complete'

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

" scrooloose/nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" majutsushi/tagbar
nnoremap <silent> <leader>m :TagbarToggle<cr>

" mattn/zencoding-vim
" <c-x> toggles zencoding (mapped using zencoding's global variable)

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
set novisualbell
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

