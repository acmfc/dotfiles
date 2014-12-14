#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

while true; do
    DWM_DATETIME=$(date '+%a %e %b %Y | %k:%M')
    DWM_BATTERY=$(acpi -b | awk 'gsub(/,/,"") {print $4}')
    DWM_UPTIME=$(uptime | awk '{print $3}' | sed 's/,//')
    xsetroot -name "$DWM_DATETIME | $DWM_UPTIME up | $DWM_BATTERY"
    sleep 30
done &

xrdb -merge /home/user/.Xresources
xsetroot -cursor_name left_ptr
sh ~/.fehbg &
# compton &

session=${1:-dwm}
case $session in
    dwm     ) exec /home/user/src/dwm-6.0/dwm;;
    awesome ) exec awesome;;
    xmonad  ) exec xmonad;;
    # No known session, try to run it as a command
    *) exec $1;;
esac
