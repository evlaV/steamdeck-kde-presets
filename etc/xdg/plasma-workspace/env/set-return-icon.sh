set -eu

board_name=$(cat /sys/class/dmi/id/board_name)
if [[ "$board_name" == "Jupiter" || "$board_name" == "Galileo" ]] then
    destination="${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/scalable/actions"
    mkdir -p $destination
    ln -s /usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg $destination/gaming-return.svg
fi
