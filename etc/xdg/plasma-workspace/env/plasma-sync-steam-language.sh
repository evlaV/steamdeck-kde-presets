#! /bin/bash
set -eu

# This script syncs the keyboard layout and language based on the user's selected Steam language.
# If relevant an input engine is also preloaded alongside an option to select latin
# This script is sourced on startup as we need language set before spawning any services.

# Language, XKB Layout, IBus Engine, Locale
settings_map="
indonesian,id,,id_ID.UTF-8
schinese,cn,pinyin,zh_CN.UTF-8
vietnamese,vn,,vi_VN.UTF-8
latam,latam,,es_MX.UTF-8
ukrainian,ua,,uk_UA.UTF-8
arabic,ara,,ar_SA.UTF-8
greek,gr,,el_GR.UTF-8
bulgarian,bg,,bg_BG.UTF-8
brazilian,br,,pt_BR.UTF-8
turkish,tr,,tr_TR.UTF-8
romanian,ro,,ro_RO.UTF-8
czech,cz,,cs_CZ.UTF-8
hungarian,hu,,hu_HU.UTF-8
swedish,se,,sv_SE.UTF-8
norwegian,no,,nb_NO.UTF-8
finnish,fi,,fi_FI.UTF-8
dutch,nl,,nl_NL.UTF-8
danish,dk,,da_DK.UTF-8
polish,pl,,pl_PL.UTF-8
portuguese,pt,,pt_PT.UTF-8
japanese,jp,anthy,ja_JP.UTF-8
thai,th,,th_TH.UTF-8
russian,ru,,ru_RU.UTF-8
tchinese,tw,table:cangjie5,zh_TW.UTF-8
spanish,es,,es_ES.UTF-8
koreana,kr,hangul,ko_KR.UTF-8
italian,it,,it_IT.UTF-8
french,fr,,fr_FR.UTF-8
german,de,,de_DE.UTF-8
english,us,,en_US.UTF-8
none,us,,en_US.UTF-8"

steam_language=$(jq .language ~/.steam/exportedsettings.json)
while IFS=',' read -r language xkb_layout ibus_engine locale; do
    if [ "\"$language\"" = $steam_language ]; then
        break
    fi
done <<< "$settings_map"

#     echo "$language xkb $xkb_layout ibus $ibus_engine locale $locale"
if [[ -n $xkb_layout && ! -f ~/.config/kxkbrc ]]; then
    kwriteconfig6 --file kxkbrc --group Layout --key LayoutList "$xkb_layout"
    kwriteconfig6 --file kxkbrc --group Layout --key Use true
fi
if [[ -n $ibus_engine && ! -f ~/.config/kwinrc ]]; then
    kwriteconfig6 --file kwinrc --group Wayland --key InputMethod /usr/share/applications/org.freedesktop.IBus.Panel.Wayland.Gtk3.desktop
    dconf write /desktop/ibus/general/preload-engines "['xkb:us::eng','$ibus_engine']"
fi
if [[ -n $locale && ! -f ~/.config/plasma-localerc ]]; then
    kwriteconfig6 --file plasma-localerc --group Formats --key LANG "$locale"
# Needed for x11, order of LANG code and running scripts is different there
     export LANG="$locale"
fi
