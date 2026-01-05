#!/usr/bin/env bash

BUILD_DIR="/tmp/build"
PREFIX="/usr/local"

apps=(
    # internet
    firefox
    google-chrome
    whatsapp
    zoom
    # media
    spotify
    iina
    # productivity
    obsidian
    # utils
    alacritty
    keepassxc
    rectangle
    #verve
    # dev
    zed
    # devops
    tableplus
    # work
    android-studio
)

appstore=(
    # DaVinci Resolve
    571213070
    # Wireguard
    1441195209
)

assetts=(
    font-fira-code
    font-fira-code-nerd-font
    font-commit-mono-nerd-font
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
    croc
    rclone
    rsync
    xh
    yt-dlp
    # sys
    bat
    btop
    eza
    fd
    gdu
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
    aider
    codex
    # build
    cmake
    make
    pnpm
    uv
    # ops
    ansible
    fabric
    helm
	k9s
	kubernetes-cli
	opentofu
    podman
    podman-compose
    # services
    nats-server
    postgresql@18
    redis
    zerotier-one
    # tools
    git
    gitui
    git-delta
    tokei
    # legacy
    openjdk
    temurin@11
    coursier
    metals
    sbt
)

dev_bin=()

dev_cs=(
    bloop
)


install_binary() {
    local pkgname="$1"
    local pkgver=1
    local pkgurl="$2"
    local pkgdir="$PREFIX"

    cd "$BUILD_DIR"
    rm -rf "$pkgname-$pkgver" || true
    mkdir -p "$pkgname-$pkgver"

    wget -O "$pkgname.tar.gz" "$pkgurl"
    tar xavf "$pkgname.tar.gz" -C "$pkgname-$pkgver"

    pushd .
    cd "$pkgname-$pkgver"
    install -Dm 755 "$pkgname" -t "$pkgdir/bin"
    popd

    rm -rf "$pkgname-$pkgver" || true
}

config_reset() {
    defaults write com.apple.dock persistent-apps -array
}

config_system() {
    sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
}

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

disable_services() {
    defaults write com.apple.assistant.backedup 'Use device speaker for TTS' -int 3
    defaults write com.apple.assistant.support 'Assistant Enabled' -bool false
    defaults write com.apple.assistant.support 'Siri Data Sharing Opt-In Status' -int 2
    defaults write com.apple.SetupAssistant 'DidSeeSiriSetup' -bool True
    defaults write com.apple.Siri 'StatusMenuVisible' -bool false
    defaults write com.apple.Siri 'UserHasDeclinedEnable' -bool true
    defaults write com.apple.systemuiserver 'NSStatusItem Visible Siri' 0

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
		    for item in "${dev_bin[@]}"; do
                IFS=' ' read -r bin_name bin_url <<< "$item"
                install_binary "$bin_name" "$bin_url"
            done
			coursier install "${dev_cs[@]}" --only-prebuilt=true
			;;
		install-utils)
		    brew install "${utils[@]}"
			;;
		config-reset) config_reset ;;
        config-system) config_system ;;
		config-user) config_user ;;
        disable-services) disable_services ;;
        status) show_status ;;
		*) echo "Invalid action ${1}!"; exit 1 ;;
	esac
}

main $*
