if [ "$XDG_SESSION_TYPE" = "x11" ]; then
    export QT_IM_MODULE=ibus
    export GTK_IM_MODULE=ibus
    export XMODIFIERS= @ im = ibus
fi
