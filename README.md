# steamdeck-kde-presets

This repo contains settings and tweaks to the default settings to Plasma and
other KDE software where they differ from the upstream defaults as well as the
default themes and some other desktop related things.


## Defaults/Tweaks for the desktop

- autostart steam `/etc/xdg/autostart/steam.desktop`
- disable file content indexing `/etc/xdg/baloofilerc`
- make kinfocenter show partition and build `/etc/xdg/kcm-about-distrorc`
- disable plasma welcome and donation popup `/etc/xdg/kded5rc`
- disable kameleon (leds) `/etc/xdg/kded5rc`
- disable switch user and new session actions `/etc/xdg/kdeglobals`
- disable sddm and plymouth kcm `/etc/xdg/kdeglobals`
- disable automatic locking in `/etc/xdg/kscreenlockerrc`
- unlimited trash size  `/etc/xdg/ktrashrc`
- wifi credentials system wide by default `/etc/xdg/plasma-nm`
- provide nested desktop setup via `/usr/bin/holo-nested-desktop` and `/usr/share/appliations/steam/holo-nested-desktop`
- automatically rotate screen on X11 based on drm property `/usr/lib/holo-rotate-x11-screen`, pulled in via sddm config
- hide various developer facing applications via overrides in `/usr/local/share/applications/`
- "Install firefox application" that installs firefox via flatpak if run `/usr/share/applications/firefox.desktop` and icon in `/usr/share/icons/hicolor/scalable/apps/install-firefox.svg`


### Setup kwallet with an empty password
- triggered by `/etc/xdg/autostart/setup-kwallet.desktop`
- `/usr/bin/holo-setup-kwallet` copies `/usr/share/kwalletd/{kdewallet.kwl, kdewallet.salt}` to the user dir

###  "Return to Gaming Mode" desktop icon
- supplied by `/etc/skel/Desktop/Return.desktop`
- icons are `/usr/share/icons/hicolor/scalable/actions/steam-gaming-return.svg` and `/usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg`
- `/etc/xdg/plasma-workspace/env/set-return-icon.sh` selects which icon is symlinked to the shown icon and re-syncs from skel


### Language and input

- use flat pointer acceleration `/etc/xdg/kcminputrc` and `/usr/share/X11/xorg.conf.d/99-pointer.conf`
- setup toolkits to use ibus on X11 `/etc/xdg/plasma-workspace/env/ibus.sh`
- autostart ibus `/etc/xdg/autostart/ibus.desktop`
- Use gamescope language selection to select default language and keymap and setup
input method if required `/etc/xdg/plasma-workspace/env/set-return-icon.sh`
- no xwayland prompt for libei usage `/etc/xdg/kwinrc`
- window rule for steam keyboard `/etc/xdg/kwinrulesrc`

### power managment (`/etc/xdg/powerdevilrc`)
- Go to sleep when pressing the power button instead of showing prompt
- On AC dont go to sleep
- On Battery and Low Battery turn of screen after 1 minute
- On Battery go to sleep after 5 minutes


### Add to steam actions
- functionality in `/usr/bin/holo-add-to-steam`
- dolphin/kio integration `/usr/share/kio/servicemenus/steam.desktop`
-  launcher integration `/usr/share/plasma/kickeractions/steam.desktop`

## Theming

### Plasma
- Vapor global theme `/usr/share/look-and-feel/com.valve.vapor(.deck).desktop`
  - vapor color scheme `/usr/share/color-scheme/Vapor.colors`
  - vapor plasma theme `/usr/share/plasma/desktoptheme/Vapor`
  - steamdeck branded kickoff icon `/usr/share/icons/hiclor/scalable/places/distributor-logo-steamdeck.svg`
  - steamdeck version includes custom splash with deck logo
- VGui global theme `/usr/share/look-and-feel/com.valve.vgui.desktop`
  - vgui color scheme ``/usr/share/color-scheme/VGui.colors``
- default global theme to Vapor in `/etc/xdg/kdeglobals`
  - dynamically updated via a systemd service to the decḱ branded version `/usr/lib/systemd/system/steamos-set-plasma-theme.service` running `/usr/lib/steamos/steamos-set-plasma-theme`
- default font size to 11pt instead of 10pt `/etc/xdg/kdeglobals`
- additional user avatars `/usr/share/plasma/avatars`, old Plasma animal/human in circle avatars `circles/`, portal 2 characters `portal2/` andtf 2 characters `tf2`
- additional steamdeck logo wallpapers `/usr/share/plasma/wallpapers/`

### Konsole
- Vapor konsole color scheme `/usr/share/konsole/Vapor.colorscheme`
- select vapor theme for konsole via `/etc/xdg/kdeglobals` and `/usr/share/konsole/Vapor.profile`


### GTK 2 & 3
- `/usr/share/themes/Vapor`
- Selected by `/etc/xdg/gtk-2.0/gtkrc` and `/etc/xdg/gtk-3.0/settings.ini`

## firefox
- set `MOZ_ENABLE_WAYLAND=1` and `MOZ_USE_XINPUT2=1` via `/etc/profile.d/kde.sh`


