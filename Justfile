linux-dot:
    cp -r config/* ~/.config/
    cp -r fedora/config/* ~/.config/
    cp -r fedora/xdg/applications ~/.local/share/
    cp fedora/config/.profile ~/.profile

mac-dot:
    cp -r config/* ~/.config/

mac-pkgs group="base":
    brew bundle --file macos/Brewfile.{{group}}

mac-check:
    for f in macos/Brewfile.*; do echo "* $f"; brew bundle check --verbose --file "$f" || true; done
