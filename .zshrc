# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Aliases
source ~/.zsh_aliases

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"
eval `gdircolors ~/.dircolors`

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew coffee compleat encode64 git gnu-utils
         heroku node npm osx pip python sprunge
         vi-mode zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# Plugin Stuff
# Agnoster Theme:
export DEFAULT_USER=johnliu

# Z tool.
. `brew --prefix`/etc/profile.d/z.sh

# Customize to your needs...
export PATH=/Users/johnliu/.rvm/gems/ruby-1.9.2-p320/bin:/Users/johnliu/.rvm/gems/ruby-1.9.2-p320@global/bin:/Users/johnliu/.rvm/rubies/ruby-1.9.2-p320/bin:/Users/johnliu/.rvm/bin:/Users/johnliu/Projects/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/johnliu/.rvm/bin
