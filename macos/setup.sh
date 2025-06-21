#!/usr/bin/env bash

BUILD_DIR="/tmp/build"
PREFIX="/usr/local"
MODEL_HOME="/Users/Shared/models"

apps=(
    # internet
    firefox
    google-chrome
    # media
    iina
    spotify
    handbrake
    # productivity
    obsidian
    # utils
    alacritty
    keepassxc
    menumeters
    rectangle
    #verve
    # dev
    zed
    android-studio
    # devops
    tableplus
    # work
    zoom
)

appstore=(
    # DaVinci Resolve
    571213070
    # Wireguard
    1441195209
    # Xcode
    497799835
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
    # sys
    bat
    btop
    eza
    fd
    gdu
    ripgrep
    sd
    tealdeer
    zoxide
    zstd
)

dev=(
    # lang
    go
    node@22
    openjdk
    python
    rust
    temurin@11
    # build
    cmake
    coursier
    make
    metals
    pnpm
    pipx
    sbt
    uv
    # ai
    aider
    huggingface-cli
    llama.cpp
    # ops
    ansible
    fabric
    helm
	k9s
	kubernetes-cli
	opentofu
    podman
    podman-compose
    # servers
    nats-server
    postgresql@17
    # tools
    git
    gitui
    git-delta
    telnet
    tig
    tokei
    wrk
    zerotier-one
)

dev_bin=(
    "llama-swap https://github.com/mostlygeek/llama-swap/releases/download/v130/llama-swap_130_darwin_arm64.tar.gz"
)

dev_cs=(
    bloop
)

dev_pipx=(
    docling
)

llm_base=(
    "google/gemma-3-27b-it-qat-q4_0-gguf:q4_0"
    "unsloth/Devstral-Small-2505-GGUF:UD-Q4_K_XL"
    "unsloth/Mistral-Small-3.1-24B-Instruct-2503-GGUF:UD-Q4_K_XL"
    "unsloth/Qwen3-32B-GGUF:UD-Q4_K_XL"
)

llm_testing=(
    "unsloth/Magistral-Small-2506-GGUF:UD-Q4_K_XL"
    "unsloth/Mistral-Small-3.1-24B-Instruct-2503-GGUF:Q6_K"
    "unsloth/gemma-3-27b-it-GGUF:Q6_K"
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

    launchctl disable "user/$UID/com.apple.assistantd"
    launchctl disable "gui/$UID/com.apple.assistantd"
    launchctl disable "user/$UID/com.apple.Siri.agent"
    launchctl disable "gui/$UID/com.apple.Siri.agent"
    launchctl disable "user/$UID/com.apple.SiriTTSTrainingAgent"
    launchctl disable "gui/$UID/com.apple.SiriTTSTrainingAgent"
    #sudo launchctl disable 'system/com.apple.assistantd'
    #sudo launchctl disable 'system/com.apple.Siri.agent'

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
			pipx install "${dev_pipx[@]}"
			;;
		install-llm)
            for model in "${llm_base[@]}"; do
                IFS=':' read -r repo quant <<< "$model"
                huggingface-cli download $repo --local-dir $MODEL_HOME --include "*$quant.gguf"
            done

            for model in "${llm_testing[@]}"; do
                IFS=':' read -r repo quant <<< "$model"
                huggingface-cli download $repo --local-dir $MODEL_HOME --include "*$quant.gguf"
            done
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
