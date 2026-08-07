#!/usr/bin/env bash

apps=(
    # internet
    firefox
    google-chrome
    whatsapp
    zoom
    # media
    iina
    # productivity
    claude
    obsidian
    # utils
    alacritty
    keepassxc
    # dev
    zed
    # devops
    tableplus
)

appstore=(
    # DaVinci Resolve
    571213070
    # Wireguard
    1441195209
)

assetts=(
    font-fira-code-nerd-font
)

utils=(
    # essential
    fish
    micro
    lf
    tv
    # sys
    bat
    btop
    eza
    fd
    gdu
    glow
    just
    procs
    rclone
    ripgrep
    rsync
    sd
    tealdeer
    wget
    xh
    zoxide
    zstd
    # macos
    mas
    mole
)

dev=(
    # lang
    go
    node@22
    python
    rust
    # ai
    claude-code
    # build
    cmake
    make
    pnpm
    uv
    # ops
    ansible
    awscli
    eksctl
    helm
    k9s
    kubernetes-cli
    oci-cli
    opentofu
    podman
    sops
    # services
    cloudflared
    nats-server
    postgresql@18
    pgvector
    redis
    zerotier-one
    # tools
    git
    gitui
    git-delta
    golangci-lint
    lnav
    tokei
    tig
)

show_status() {
    echo "* Spotlight"
    mdutil -s /
    echo "* FileValut"
    fdesetup status
    echo "* SIP"
    csrutil status
    echo "* Assessment"
    spctl --status
}

main() {
	case "$1" in
        install-apps)
            brew install --cask "${apps[@]}"
            ;;
        install-appstore)
            mas install "${appstore[@]}"
            ;;
        install-assetts)
            brew install "${assetts[@]}"
            ;;
        install-dev)
            brew install "${dev[@]}"
            ;;
        install-utils)
            brew install "${utils[@]}"
            ;;
        dock-reset)
            defaults write com.apple.dock persistent-apps -array
            ;;
        indexing-disable-)
            sudo mdutil -a -i off
            sudo mdutil -X /
            ;;        status) show_status ;;
        *) echo "Invalid action ${1}!"; exit 1 ;;
	esac
}

main $*
