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

plugins=(vi-mode brew cake coffee compleat dircycle encode64 gem 
         git gnu-utils heroku history-substring-search node npm osx
         pip python ruby rails rvm sprunge zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# PLUGIN SETTINGS
# ===============

# Z
source `brew --prefix`/etc/profile.d/z.sh

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# autoenv
[[ -e $(brew --prefix autoenv) ]] && source $(brew --prefix autoenv)/activate.sh

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
