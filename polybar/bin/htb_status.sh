#!/bin/sh

# Info:
# %{T3} = Tamaño del icono en la polybar, ajustable desde T0 hasta T6
# %{T6} = Tamaño del texto para la IP, ajustable desde T0 hasta T6
# %{u-} = Reset de los estilos de fuente (tamaño y color) ¡¡NO QUITAR!!

iface=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')

# Icono > Requiere tener instaladas las Hack Nerd Fonts
icon=""

# Colores en formato hexadecimal como en HTML
icon_color_connected="#1bbf3e"
text_color_connected="#FFF6D5"
icon_color_disconnected="#e51d0b"
text_color_disconnected="#FFF6D5"

if [ "$iface" = "tun0" ]; then
    echo "%{T3}%{F$icon_color_connected}$icon%{F$text_color_connected}%{T6} $(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{T3}%{F$icon_color_disconnected}$icon%{F$text_color_disconnected}%{T6} Sin conexión"
fi
