# PLUGINS
# =======

# Bashmarks
if [ -f ~/Projects/bin/bashmarks.sh ]; then
  source ~/Projects/bin/bashmarks.sh
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# Z
source `brew --prefix`/etc/profile.d/z.sh

# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# MAIN
# ====

# Prompt
source ~/.bash_prompt

# Aliases
source ~/.aliases
source ~/.bash_aliases

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
