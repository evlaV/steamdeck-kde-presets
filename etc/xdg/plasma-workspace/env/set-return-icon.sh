set -eu

board_name=$(cat /sys/class/dmi/id/board_name)
if [[ "$board_name" == "Jupiter" || "$board_name" == "Galileo" ]] then
    destination="${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/scalable/actions"
    mkdir -p $destination
    ln -sf /usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg $destination/gaming-return.svg
fi

# Sync latest changes from upstream

return="$HOME/Desktop/Return.desktop"
target="/usr/lib/steamos/Return.desktop"
if [[ -f "${return}" && $(realpath "${return}") != "${target}" ]]; then
    # In earlier releases, the Return.desktop file was copied over from /etc/skel
    # as a plain file to the desktop upon user creation. It is now a symlink.
    ln -sf "${target}" "${return}"
fi
