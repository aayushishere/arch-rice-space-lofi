#
# ~/.bashrc
#

# my $PATH

PATH=$PATH:$HOME/Scripts:
export PATH

# swap caps and escape
# /usr/bin/setxkbmap -option "caps:swapescape"

# vi mode
set -o vi

# restore pywal color scheme
(cat ~/.cache/wal/sequences &)

# export PS1="\u@\h: [\w] >\[$(tput sgr0)\] " #no color
export PS1="\[\e[0;32m\]\u\[\e[0;37m\]@\[\e[0;34m\]\h\[\e[0;37m\]: [\[\e[0;31m\]\w\[\e[0;37m\]] > \[\e[0m\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# fix sudo for aliases
alias sudo='sudo '

# color stuff
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'


alias r='ranger-cd'
alias q='exit'
alias v=nvim
alias vim=nvim
alias vi=nvim
alias neo='neofetch --config $HOME/.config/neofetch/config.conf'
alias logout='sudo loginctl terminate-user kevin'

# hacks and fucntions
# ranger cd on exit (https://unix.stackexchange.com/questions/342064/ranger-cd-into-a-folder)
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# fix trash java fonts

#_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#export _JAVA_AWT_WM_NONREPARENTING=1 #make hava apps work in bspwm
#JAVA_FONTS=/usr/share/fonts/TTF

# increase bash history (negative numbers = infinite for bash > 4.3)
HISTFILESIZE=-1
HISTSIZE=-1

