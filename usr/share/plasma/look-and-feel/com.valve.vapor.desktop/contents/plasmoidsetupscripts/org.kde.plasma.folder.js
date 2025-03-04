const config = ConfigFile("/run/user/1000/plasma-is-deck", "Device")
if (config.readEntry("isDeck", false)) {
    applet.wallpaperPlugin = 'org.kde.image'
    applet.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"]
    applet.writeConfig("Image", "/usr/share/wallpapers/Steam Deck Logo Default.jpg")
    applet.reloadConfig()
}

