# Helper function for creating conditional aliases.
function -a alias_if_file_exists name location custom
  if test -z $custom; set custom "$location"; end
  if test -e "$location"
    alias $name "$custom"
  end
end

function -a alias_if_exists name program custom
  if test -z $custom; set custom "$program"; end
  if type $program 1>/dev/null 2>&1
    alias $name "$custom"
  end
end

alias_if_file_exists vim "/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi vim
alias v vim

alias_if_file_exists psql "/Applications/Postgres.app/Contents/MacOS/bin/psql"

alias_if_exists ls gls "gls --color"

alias_if_exists python ipython

alias_if_exists gh hub
alias_if_exists github hub

alias_if_exists latexmk latexmk "latexmk -pdf -pvc"
alias_if_exists mklatex latexmk
