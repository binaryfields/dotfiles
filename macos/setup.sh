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
    alt-tab
    rectangle
    swiftbar
    #verve
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
    just
    micro
    lf
    lnav
    television
    # net
    rclone
    rsync
    wget
    xh
    # sys
    bat
    btop
    eza
    fd
    gdu
    glow
    procs
    ripgrep
    sd
    tealdeer
    zoxide
    zstd
    # extra
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
    tokei
    tig
)

config_user() {
    # Appearance
    defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
    # Enable subpixel font rendering on non-Apple LCDs
    # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
    defaults write NSGlobalDomain AppleFontSmoothing -int 1
    # Input
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
    defaults write NSGlobalDomain com.apple.trackpad.scaling -float 1.5
    defaults write com.apple.HIToolbox AppleFnUsageType -int 0
    # Dock
    defaults write com.apple.Dock autohide -bool true
    defaults write com.apple.Dock autohide-delay -float 0.1
    defaults write com.apple.Dock autohide-time-modifier -float 0.5
    defaults write com.apple.Dock show-process-indicators -bool true
}

config_reset() {
    defaults write com.apple.dock persistent-apps -array
}

disable_services() {
    sudo mdutil -a -i off
    sudo mdutil -X /
}

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
        config-reset) config_reset ;;
        config-user) config_user ;;
        disable-services) disable_services ;;
        status) show_status ;;
        *) echo "Invalid action ${1}!"; exit 1 ;;
	esac
}

main $*
