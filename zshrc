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

plugins=(vi-mode brew bundler cake coffee compleat dircycle encode64 gem 
         git gnu-utils heroku history-substring-search node npm osx
         pip python ruby rails rails3 rvm sprunge zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# PLUGIN SETTINGS
# ===============

# Z
source `brew --prefix`/etc/profile.d/z.sh

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# vi-mode Settings
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# MAIN
# =====

# Aliases
source ~/.aliases

# Functions
source ~/.functions

# Path
source ~/.path
