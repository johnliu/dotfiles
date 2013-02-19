# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Aliases
source ~/.aliases

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
plugins=(vi-mode brew bundler cake coffee compleat dircycle encode64 gem 
         git gnu-utils heroku history-substring-search node npm osx
         pip python ruby rails rails3 rvm sprunge zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# Plugin Stuff
# Agnoster Theme:
export DEFAULT_USER=johnliu

# Z tool.
. `brew --prefix`/etc/profile.d/z.sh

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . $HOME/.rvm/scripts/rvm

# vi-mode Settings
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# Function to allow toggling parse_git_dirty flag. This function call is really
# slow on large directories, so we have a flag that can turn it off (it's otherwise
# useful).
function check_parse_git_dirty() {
  if [[ -a ~/.zsh_cache ]]; then
    PARSE_GIT_DIRTY=$(cat ~/.zsh_cache)
  else
    PARSE_GIT_DIRTY=true
  fi
}

function parse_git_dirty_toggle() {
  check_parse_git_dirty

  if ( $PARSE_GIT_DIRTY ) {
    PARSE_GIT_DIRTY=false
    echo 'Git dirty check is now off.'
  } else {
    PARSE_GIT_DIRTY=true
    echo 'Git dirty check is now on.'
  }

  echo $PARSE_GIT_DIRTY > ~/.zsh_cache
}

# Called initially to set from cache.
check_parse_git_dirty

alias toggledirty=parse_git_dirty_toggle

function path() {
  TMP=$IFS
  IFS=$":"
  for i in $(echo $PATH)
  do
    echo $i
  done
  IFS=$TMP
}

# Customize to your needs...
PATH=`sed -e '/^#/'d -e '/^$/'d << EOF | paste -s -d ":" -
# Local Path
/User/johnliu/Projects/bin

# Reorder for brew, etc.
/usr/local/bin
$PATH
/usr/local/share/npm/bin

# Applications
/usr/local/Cellar/android-ndk/r8d/toolchains/arm-linux-androideabi-4.4.3/prebuilt/darwin-x86/arm-linux-androideabi/bin
/Applications/MATLAB_R2012b.app/bin

# Old Path
EOF`
