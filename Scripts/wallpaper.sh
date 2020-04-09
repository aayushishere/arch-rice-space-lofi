#!/bin/bash


wallpaper=$1

wallpaper_extension=$(echo $wallpaper | cut -d '.' -f 2)

# cp $1 /usr/share/pixmaps/wallpaper.$wallpaper_extension

wal -a "85" -n -i $1 # generate colors

feh --bg-fill $1 # restore wallpaper

oomox-cli -t ~/.themes --make-opts all -o pywal_theme  ~/.cache/wal/colors-oomox
#oomox-materia-cli -t ~/.themes --make-opts all -o pywal_theme  ~/.cache/wal/colors-oomox

betterlockscreen -u $1 # generate lockscreen cache

# restart wm and reload configs if necessarry
# bspc wm -r # restart bspwm
# openbox --reconfigure

# /opt/oomox/plugins/theme_oomox/gtk-theme/change_color.sh -o test -t ~/.themes -m gtk320 ~/.cache/wal/colors-oomox
