linux-dot:
    cp -r * ~/.config/
    cp -r app ~/.var/
    cp -r xdg/fedora/applications ~/.local/share/
    cp .profile ~/.profile

macos-dot:
    cp -r alacritty fish lf ~/.config/

macos-config-system:
    ./os/macos/setup.sh config-system

macos-config-user:
    ./os/macos/setup.sh config-user
