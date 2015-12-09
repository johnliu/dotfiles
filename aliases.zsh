# vim
if [ -f "/Applications/MacVim.app/Contents/MacOS/Vim" ]; then
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
fi

alias vi="vim"
alias v="vim"

# postgres
if [ -f "/Applications/Postgres.app/Contents/MacOS/bin/psql" ]; then
  alias psql="/Applications/Postgres.app/Contents/MacOS/bin/psql"
fi

# coreutils
if type "gls" &> /dev/null; then
  alias ls="gls --color"
fi

# python
if type "ipython" &> /dev/null; then
  alias python="ipython"
fi

# hub
if type "hub" &> /dev/null; then
  alias gh="hub"
  alias github="hub"
fi
