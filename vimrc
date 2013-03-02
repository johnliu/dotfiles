" BUNDLES
" Be iMproved required
set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" My bundles:
Bundle 'ack.vim'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'YankRing.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-stylus'
Bundle 'tpope/vim-surround'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'ervandew/supertab'
Bundle 'AutoComplPop'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-powerline'
Bundle 'klen/python-mode'
Bundle 'benmills/vimux'
Bundle 'mattn/zencoding-vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'johnliu/eclim.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'derekwyatt/vim-scala'
Bundle 'c.vim'

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Gundo configurations:
nnoremap <silent> <leader>u :GundoToggle<cr>

" Yankring configurations:
let g:yankring_history_file = '.yankring_history'

" CtrlP configurations
set wildignore=*.pyc,*.o,.git,node_modules,venv
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'

" NerdTree configurations
nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" NerdCommenter configurations
let g:NERDSpaceDelims = 1

" TagBar configurations
nnoremap <silent> <leader>m :TagbarToggle<cr>

" Syntastic configurations
let g:syntastic_quiet_warnings = 1
let g:syntastic_check_on_open = 1

" SuperTab configurations
let g:SuperTabMappingForward = '<c-k>'
let g:SuperTabMappingBackward = '<c-j>'

" SnipMate configurations
let g:snips_trigger_key = '<s-tab>'
let g:snips_trigger_key_backwards = '<s-c-tab>'

" Powerline configurations
let g:Powerline_symbols = 'fancy'

" MiniBufExpl configurations
let g:miniBufExplHideWhenDiff = 1

" Python-mode configurations
let g:pymode_indent = 0
let g:pymode_folding = 0
let g:pymode_rope_guess_project = 0
let g:pymode_rope_vim_completion = 0
let g:pymode_lint_ignore = 'E111,E501'

" Gist-vim configurations
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" Zen-coding configurations
let g:user_zen_leader_key = '<c-x>'

" neocomplcache configurations
let g:acp_enableAtStartup = 0
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

" Fast saving
nmap <leader>w :w!<cr>

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
set listchars=eol:¬,tab:▸\ ,trail:~

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

