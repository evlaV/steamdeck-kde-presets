board_name=$(cat /sys/class/dmi/id/board_name)
if [[ "$board_name" == "Jupiter" || "$board_name" == "Galileo" ]] then
    kwriteconfig6 --file "$XDG_RUNTIME_DIR/plasma-is-deck" --group Device --key isDeck --type bool true
fi


