ZSH=$HOME/.oh-my-zsh

# OH-MY-ZSH SETTINGS
# ==================

# Theme
ZSH_THEME='agnoster'
DEFAULT_USER='johnliu'

# Default Editor
export EDITOR='vim'

# Set our own colours for `ls`
DISABLE_LS_COLORS='true'
eval `gdircolors ~/.dircolors`

plugins=(
  vi-mode
  brew
  compleat
  dircycle
  encode64
  git
  gitfast
  gnu-utils
  history-substring-search
  httpie
  jira
  json-tools
  node
  osx
  pip
  python
  ruby
)

source $ZSH/oh-my-zsh.sh

# PLUGIN SETTINGS
# ===============

# python byte files
export PYTHONDONTWRITEBYTECODE=1

# fasd
eval "$(fasd --init auto)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# vi-mode Settings
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# Disable virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT='true'

# MAIN
# =====

# Aliases
source ~/.aliases
source ~/.aliases.zsh

# Functions
source ~/.functions

# Path
source ~/.path

