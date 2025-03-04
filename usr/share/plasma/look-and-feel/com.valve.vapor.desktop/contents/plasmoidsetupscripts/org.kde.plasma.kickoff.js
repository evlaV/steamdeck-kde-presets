const config = ConfigFile("/run/user/1000/plasma-is-deck", "Device")
if (config.readEntry("isDeck", false)) {
    applet.currentConfigGroup = ["General"]
    applet.writeConfig("icon", "distributor-logo-steamdeck")
    applet.reloadConfig()
}
