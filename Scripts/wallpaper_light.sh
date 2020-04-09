#!/bin/bash


wallpaper=$1

wallpaper_extension=$(echo $wallpaper | cut -d '.' -f 2)

wal -nli $1 # generate colors

feh --bg-fill $1 # restore wallpaper

# oomox-materia-cli -t ~/.themes -o pywal_theme  ~/.cache/wal/colors-oomox
oomox-cli -t ~/.themes -o pywal_theme  ~/.cache/wal/colors-oomox

betterlockscreen -u $1 # generate lockscreen cache

# bspc wm -r # restart bspwm
