# DIRECTORY CHANGES
# =================

# Alias functions
alias todos="grep -rn --color --exclude=activate 'TODO(johnliu)' ."

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# Shortcuts
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias v="vim"
alias h="history"
alias j="jobs"

# Activate the virtualenv of this project.
alias venv="source venv/bin/activate"

# File listings
shopt -s extglob
alias ll="ls -Gl"
alias la="ls -Gla"
alias lx="ls -Gd !(*.pyc)"

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias ls="command ls -G"
else
  alias ls="command ls --color"
  export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

# Enable aliases to be sudo'ed.
alias sudo="sudo "

# OS X software updates and brew updates
alias update="sudo softwareupdate -i -a; brew update; brew upgrade"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# HTTP Requests
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

