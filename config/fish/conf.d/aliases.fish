alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias cat='bat --style=auto'
alias gdu='gdu-go'
alias grep='rg'
alias help='tldr'
alias sysfree='sudo sysctl iogpu.wired_limit_mb=31880 && sudo purge'

alias brewup='brew update && brew upgrade && brew cleanup'
alias brews='brew list --versions'

alias jvm11='set -x JAVA_HOME (/usr/libexec/java_home -v 11)'
alias jvm24='set -x JAVA_HOME (/usr/libexec/java_home -v 24)'

alias podstart='podman machine start'
alias podstop='podman machine stop'
alias podup='podman start --all'
alias poddown='podman stop --all'
alias pps='podman ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
