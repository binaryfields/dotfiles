linux-dot:
    cp -r config/* ~/.config/
    cp -r fedora/config/* ~/.config/
    cp -r fedora/xdg/applications ~/.local/share/
    cp fedora/config/.profile ~/.profile

macos-dot:
    cp -r config/* ~/.config/

macos-config-system:
    ./macos/setup.sh config-system

macos-config-user:
    ./macos/setup.sh config-user
