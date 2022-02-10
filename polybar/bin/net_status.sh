#!/bin/bash

iface=$(/usr/sbin/ifconfig | grep ": " | awk '{print $1}' | sed s'/://' | awk '{print $NR}' | tr -d '\n')
local_ip=$(/usr/sbin/ifconfig $iface | grep "inet " | awk '{print $2}')

# Icono (Requiere tener instaladas las Hack Nerd Fonts)
if [ $iface == 'eth0' ]; then
    icon=""
else
    icon=""
fi

# Colores en formato hexadecimal como en HTML
icon_color="#B6844F" #"#2495e7"
text_color="#FFF6D5"

echo "%{T3}%{F$icon_color}$icon%{F$text_color}%{T6} $local_ip%{u-}"
