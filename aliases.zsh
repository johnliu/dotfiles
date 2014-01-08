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

# mathematica
if [ -f "/Applications/Mathematica.app/Contents/MacOS/MathKernel" ]; then
  alias mathematica="/Applications/Mathematica.app/Contents/MacOS/MathKernel"
fi

# iphone simulator
if [ -d "/Applications/Xcode.app/Contents/Applications/iPhone Simulator.app" ]; then
  alias iphonesim="open '/Applications/Xcode.app/Contents/Applications/iPhone Simulator.app'"
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

# latexmk
if type "latexmk" &> /dev/null; then
  alias latexmk="latexmk -pdf -pvc"
  alias mklatex=latexmk
fi

