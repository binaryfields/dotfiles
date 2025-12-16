eval "$(/opt/homebrew/bin/brew shellenv fish)"
fish_add_path "$HOME/.cargo/bin"

tv init fish | source
zoxide init fish | source
