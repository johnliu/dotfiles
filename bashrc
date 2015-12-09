# PLUGINS
# =======

# fasd
eval "$(fasd --init auto)"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# MAIN
# ====

# Prompt
source ~/.prompt.bash

# Aliases
source ~/.aliases
source ~/.aliases.zsh
source ~/.aliases.bash

# Path
source ~/.path

# MISC
# ====

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to Bash history instead of overwriting it
shopt -s histappend

# Autocorrect typos in path names when using 'cd'
shopt -s cdspell

