# macOS Setup

## System Configuration

[Based on https://inteltechniques.com/ventura.html](https://inteltechniques.com/blog/2026/01/05/macos-26-settings/)

Settings > Wi-Fi > Ask to join networks > Off
Settings > Wi-Fi > Ask to join hotspots > Never
Settings > Bluetooth > Disabled (if not used)
Settings > Network > Firewall > Enabled
Settings > Network > Firewall > Options > Automatically allow built-in... > Disabled
Settings > Network > Firewall > Options > Automatically allow downloaded... > Disabled
Settings > Network > Firewall > Options > Stealth mode > Enabled
Settings > Battery > Options > Wake for network access > Never
Settings > General > Automatic Updates > i > Disable All
Settings > General > AirDrop & Handoff > Allow Handoff > Disabled
Settings > General > AirDrop & Handoff > AirDrop > No One
Settings > General > AirDrop & Handoff > AirPlay Receiver > Disabled
Settings > General > AirDrop & Handoff > Allow Airplay for > Current User
Settings > General > AirDrop & Handoff > Require password > Enabled
Settings > General > AutoFill & Passwords > All Your Password... > (Close "x")
Settings > General > AutoFill & Passwords > AutoFill Passwords and Passkeys > Disabled
Settings > General > Date & Time > Source > Set > pool.ntp.org > Set
Settings > General > Date & Time > Set time zone automatically... > Disabled
Settings > General > Date & Time > Time zone > Desired location
Settings > General > Date & Time > Closest City > Desired location
Settings > General > Login Items & Extensions > Remove or disable those desired
Settings > General > Sharing > Disable all
Settings > Accessibility > Siri > Type to Siri > Disabled
Settings > Accessibility > Siri > Listen for atypical speech > Disabled
Settings > Apple Intelligence & Siri > Apple Intelligence > Disabled
Settings > Apple Intelligence & Siri > Siri > Disabled
Settings > Apple Intelligence & Siri > Siri History > Delete Siri & Dictation History > Delete
Settings > Apple Intelligence & Siri > Siri Suggestions & Privacy > Disable all
Settings > Desktop & Dock > Show suggested and recent apps in Dock > Disabled
Settings > Desktop & Dock > Show recent apps in Stage Manager > Disabled
Settings > Desktop & Dock > Automatically rearrange Spaces... > Disabled
Settings > Spotlight > Show Related Content > Disabled
Settings > Spotlight > Spotlight Search History > Delete Search History
Settings > Spotlight > Help Apple Improve Search > Disabled
Settings > Spotlight > Results from Apps > Disable all
Settings > Spotlight > Results from System > Disable all
Settings > Spotlight > Results from Clipboard > Disabled
Settings > Notifications > Show previews > Never
Settings > Notifications > Allow notifications when the device is sleeping > Disabled
Settings > Notifications > Allow notifications when the screen is locked > Disabled
Settings > Notifications > Allow notifications when mirroring or sharing the display > Disabled
Settings > Notifications > Application Notifications > Disable undesired
Settings > Sound > Alert volume > Minimum
Settings > Sound > Play sound on startup > Disabled
Settings > Sound > Play user interface sound effects > Disabled
Settings > Sound > Play feedback when volume is changed > Disabled
Settings > Focus > Share across devices > Disabled
Settings > Focus > Focus status > Off
Settings > Lock Screen > Turn display off on battery when inactive > For 1 hour
Settings > Lock Screen > Turn display off on power adapter when inactive > For 1 hour
Settings > Lock Screen > Require password after... > Immediately
Settings > Lock Screen > Show password hints > Disabled
Settings > Lock Screen > Show message when locked > Disabled
Settings > Privacy & Security > Location Services > Off
Settings > Privacy & Security > Confirm app access
Settings > Privacy & Security > Sensitive Content Warning > Off
Settings > Privacy & Security > Analytics & Improvements > Disable all
Settings > Privacy & Security > Apple Advertising > Personalized Ads > Disabled
Settings > Privacy & Security > Apple Intelligence Report > Off
Settings > Privacy & Security > FileVault > Enabled
Settings > Privacy & Security > Accessories > Always ask
Settings > Privacy & Security > Background Security Improvements > Enabled (if desired)
Settings > Touch ID & Password > Use Touch ID for Apple Pay > Disabled
Settings > Touch ID & Password > Use Touch ID for purchases... > Disabled
Settings > Touch ID & Password > Use Touch ID for autofilling passwords > Disabled
Settings > Internet Accounts > None
Settings > Game Center > Disabled
Settings > iCloud > None
Settings > Wallet & Apple Pay > Autofill Cards > 0
Settings > Wallet & Apple Pay > Shipping Address > None
Settings > Wallet & Apple Pay > Email > None
Settings > Wallet & Apple Pay > Phone > None
Settings > Wallet & Apple Pay > Add Orders to Wallet > Disabled

## Keyboard Shortcuts

- Spotlight
    - Show Spotlight search = Ctrl-Opt-Space
- Mission Control
    - Move left a space = Ctrl-Cmd-Down
    - Move right a space = Ctrl-Cmd-Up
    - Switch to Desktop 1-4 = Opt-1-4
- Modifier Keys
    - Control key = Globe
    - Globe key = Control

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
