#!/bin/sh

# ------------------------ My personal stuff ----------------------------------

# reload fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# reload pywall colors
# wal -R

# Xresources stuff
xrdb -merge "$HOME/.Xresources"

# start fan daemon if not already running
if pidof -x mbpfan >/dev/null; then
	echo "mbpfan is already up and running"
else
	mbpfan
fi

# start syncthing (incase the systemd service doesnt start)
if pidof -x syncthing >/dev/null; then
	echo "syncthing is already up and running"
else
	syncthing --no-browser &
fi

# ------------------------ switch WMs and DEs ---------------------------------
# DOESNT WORK

# this is for switching window managers (covered later in this script)
# default to sowm

session=${1-bspwm}
shift
echo $1

case $session in
	# desktop environments
	xfce|xfce4)
		exec startxfce4
		;;
	gnome)
		export XDG_SESSION_TYPE=x11
		export GDK_BACKEND=x11
		exec gnome-session
		;;
	bspwm)
		xsetroot -cursor_name left_ptr
		wmname compiz # fix java apps in minimal wms
		exec bspwm # keep bspwm specific autostarts in .congif/bspwm/bspwmrc
       ;;
    openbox)
		wmname compiz # fix java apps in minimal wms
        autostart
		exec openbox
		;;
    twm)
		# xbindkeys # for plan9 menu (see xbinkeys config)
		xsetroot -solid gray -cursor_name draft_small
		xload -g 300x125+0+0 -fg purple -update 3 &
        autostart
		twm
		;;
	sowm) # a simple opinionated wm
		autostart
		exec sowm
		;;
	stowm) # customized tinywm
		autostart
		exec stowm
		;;
	tinywm)
		autostart
		exec tinywm
		;;
	#*) # No known session, try to run it as command
	#	exec $1
	#	;;
esac
