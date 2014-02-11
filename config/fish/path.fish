function -d "Flattens a list of paths to a fish list." flatten
  for i in $argv
    echo $i | sed -e '/^#/d' -e '/^$/d'
  end
end

set -g NODE_PATH (flatten "

# jsctags
/usr/local/lib/jsctags

# Default
/usr/local/lib/node

")

set -g PATH (flatten "

# Local path
$HOME/Projects/bin

# Reorder for brew, etc.
/usr/local/bin
/usr/local/sbin
") $PATH (flatten "
/usr/local/share/npm/bin
$HOME/.rvm/bin

# Applications
/Applications/MATLAB_R2012b.app/bin
/Applications/Postgres.app/Contents/MacOS/bin

")


set -g ANDROID_HOME=/usr/local/opt/android-sdk
