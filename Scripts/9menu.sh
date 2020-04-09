#!/bin/sh

reshape() {
	id=`slw`
	[ ${id} = '0x00000000' ] && exit 0  # root window
	set -- `crud`

	xdotool windowsize ${id} ${3} ${4} windowmove ${id} ${1} ${2}
}

new() {
	urxvt
}

hide() {
	id=`slw`
	[ ! -d /tmp/info/wm/misc ] && mkdir -p /tmp/info/wm/misc
	waitron window_unmap ${id}
	[ ${?} -eq 0 ] && echo ${id} >>/tmp/info/wm/misc/hidden
}

unhide() {
	id=`while read -r i; do
			 echo "${i} $(xdotool getwindowname ${i})"
		 done </tmp/info/wm/misc/hidden | menu sel`
	id=${id%% *}
	waitron window_map ${id}
	sed -i "/${id}/d" /tmp/info/wm/misc/hidden
}

kill() {
	xdotool windowkill `slw`
}

focus() { wmenu; }

eval `xdotool getmouselocation --shell`
`9menu -popup -geometry 200x200+${X}+${Y} \
	  'New:echo new' \
	  'Reshape:echo reshape' \
	  'Plumb:echo plumb' \
	  'Kill:echo kill' \
	  'Hide:echo hide' \
	  'Unhide:echo unhide' \
	  'Focus:echo focus' \
	  'Exit:echo exit'`
