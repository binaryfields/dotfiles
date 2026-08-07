# macOS Setup

## Appearance

- Appearance > Appearance > Dark

Subpixel font rendering on non-Apple LCDs:
    - defaults write NSGlobalDomain AppleFontSmoothing -int 1
    - Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501

## General

- General > Language & Region > Live Text > Off

## Display

- Accessibility > Display > Text size > 16pt
- Firefox > Accessibility > Default zoom > 130%
- Obsidian > Settings> Appearance > Font size > 20
- Zed > Settings> Appearance > Font size > 16.0
- Alacritty > Config > font > size > 16

## Dock

- Desktop & Dock > Automatically hide and show the Dock > On
- Desktop & Dock > Show indicators for open applications > On

Faster hide/show animation:
    - defaults write com.apple.Dock autohide-delay -float 0.1
    - defaults write com.apple.Dock autohide-time-modifier -float 0.5

## Input

- Keyboard > Press 🌐 key to > Do Nothing
- Trackpad > Scroll & Zoom > Natural scrolling > Off
- Trackpad > Point & Click > Tracking speed > ~midpoint

## Keyboard Shortcuts

- Spotlight > uncheck "Show Spotlight search."
- Mission Control
    - Move left a space = Ctrl-Cmd-Down
    - Move right a space = Ctrl-Cmd-Up
    - Switch to Desktop 1-4 = Opt-1-4
- Modifier Keys
    - Control key = Globe
    - Globe key = Control

## Privacy

Based on https://inteltechniques.com/blog/2026/01/05/macos-26-settings

- Wi-Fi > Ask to join networks > Off
- Wi-Fi > Ask to join hotspots > Never
- Bluetooth > Disabled (if not used)
- Network > Firewall > Enabled
- Network > Firewall > Options > Automatically allow built-in... > Disabled
- Network > Firewall > Options > Automatically allow downloaded... > Disabled
- Network > Firewall > Options > Stealth mode > Enabled
- Battery > Options > Wake for network access > Never
- General > Automatic Updates > i > Disable All
- General > AirDrop & Handoff > Allow Handoff > Disabled
- General > AirDrop & Handoff > AirDrop > No One
- General > AirDrop & Handoff > AirPlay Receiver > Disabled
- General > AirDrop & Handoff > Allow Airplay for > Current User
- General > AirDrop & Handoff > Require password > Enabled
- General > AutoFill & Passwords > All Your Password... > (Close "x")
- General > AutoFill & Passwords > AutoFill Passwords and Passkeys > Disabled
- General > Date & Time > Source > Set > pool.ntp.org > Set
- General > Date & Time > Set time zone automatically... > Disabled
- General > Date & Time > Time zone > Desired location
- General > Date & Time > Closest City > Desired location
- General > Login Items & Extensions > Remove or disable those desired
- General > Sharing > Disable all
- Accessibility > Siri > Type to Siri > Disabled
- Accessibility > Siri > Listen for atypical speech > Disabled
- Apple Intelligence & Siri > Apple Intelligence > Disabled
- Apple Intelligence & Siri > Siri > Disabled
- Apple Intelligence & Siri > Siri History > Delete Siri & Dictation History > Delete
- Apple Intelligence & Siri > Siri Suggestions & Privacy > Disable all
- Desktop & Dock > Show suggested and recent apps in Dock > Disabled
- Desktop & Dock > Show recent apps in Stage Manager > Disabled
- Desktop & Dock > Automatically rearrange Spaces... > Disabled
- Spotlight > Show Related Content > Disabled
- Spotlight > Spotlight Search History > Delete Search History
- Spotlight > Help Apple Improve Search > Disabled
- Spotlight > Results from Apps > Disable all
- Spotlight > Results from System > Disable all
- Spotlight > Results from Clipboard > Disabled
- Notifications > Show previews > Never
- Notifications > Allow notifications when the device is sleeping > Disabled
- Notifications > Allow notifications when the screen is locked > Disabled
- Notifications > Allow notifications when mirroring or sharing the display > Disabled
- Notifications > Application Notifications > Disable undesired
- Sound > Alert volume > Minimum
- Sound > Play sound on startup > Disabled
- Sound > Play user interface sound effects > Disabled
- Sound > Play feedback when volume is changed > Disabled
- Focus > Share across devices > Disabled
- Focus > Focus status > Off
- Lock Screen > Turn display off on battery when inactive > For 1 hour
- Lock Screen > Turn display off on power adapter when inactive > For 1 hour
- Lock Screen > Require password after... > Immediately
- Lock Screen > Show password hints > Disabled
- Lock Screen > Show message when locked > Disabled
- Privacy & Security > Location Services > Off
- Privacy & Security > Confirm app access
- Privacy & Security > Sensitive Content Warning > Off
- Privacy & Security > Analytics & Improvements > Disable all
- Privacy & Security > Apple Advertising > Personalized Ads > Disabled
- Privacy & Security > Apple Intelligence Report > Off
- Privacy & Security > FileVault > Enabled
- Privacy & Security > Accessories > Always ask
- Privacy & Security > Background Security Improvements > Enabled (if desired)
- Touch ID & Password > Use Touch ID for Apple Pay > Disabled
- Touch ID & Password > Use Touch ID for purchases... > Disabled
- Touch ID & Password > Use Touch ID for autofilling passwords > Disabled
- Internet Accounts > None
- Game Center > Disabled
- iCloud > None
- Wallet & Apple Pay > Autofill Cards > 0
- Wallet & Apple Pay > Shipping Address > None
- Wallet & Apple Pay > Email > None
- Wallet & Apple Pay > Phone > None
- Wallet & Apple Pay > Add Orders to Wallet > Disabled

## Firefox

- Config
    - browser.discovery.enabled = false
    - browser.newtabpage.enabled = false
    - browser.cache.disk.enable = false
    - browser.cache.memory.capacity = 32768
    - dom.ipc.keepProcessesAlive.privilegedabout = 0
    - dom.ipc.processCount = 16
    - dom.ipc.processCount.webIsolated = 1
    - dom.ipc.processPrelaunch.enabled = false
    - extensions.pocket.enabled = false
    - gfx.webrender.all = true
    - gfx.webrender.compositor.max_update_rects = 50
    - gfx.webrender.compositor.surface-pool-size = 50
    - gfx.webrender.max-partial-present-rects = 25
    - gfx.webrender.precache-shaders = true
    - javascript.options.asmjs = false
    - javascript.options.ion = false
    - javascript.options.wasm = false
    - media.av1.enabled = false
    - media.gpu-process-decoder = true
    - network.dns.disablePrefetch = true
    - network.http.speculative-parallel-limit = 0
    - network.predictor.enabled = false
    - network.prefetch-next = false
    - sidebar.verticalTabs = true
- Extensions
    - Firefox Multi-Account Container
    - uBlock Origin
- Themes
    - Colorful Abstract Neon
