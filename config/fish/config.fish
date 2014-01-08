set fish_config_path $HOME/.config/fish
set fish_path $HOME/.oh-my-fish


# OH-MY-FISH SETTINGS
# ===================

# Theme
set fish_theme agnoster
set -g theme_display_user yes
set -g default_user johnliu

# Plugins
set fish_plugins brew bundler node python rails rake rvm

source $fish_path/oh-my-fish.fish


# MAIN
# ====

# Aliases
source $fish_config_path/aliases.fish
source ~/.aliases

# Path
source $fish_config_path/path.fish
