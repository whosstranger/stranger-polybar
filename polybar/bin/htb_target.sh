#!/bin/bash
# Modified by WildZarek

# Directorio donde se ejecuta este script
running_path=$(dirname "$0")               # path relativo
running_path=$(cd "$running_path" && pwd)  # path absoluto y normalizado

# Info del objetivo
ip_address=$(cat $running_path/target | awk '{print $1}')
machine_name=$(cat $running_path/target | awk '{print $2}')

# Icono (Requiere tener instaladas las Hack Nerd Fonts)
icon="什"

# Colores en formato hexadecimal como en HTML
icon_color_connected="#1bbf3e"
text_color_connected="#FFF6D5"
icon_color_disconnected="#e51d0b"
text_color_disconnected="#FFF6D5"
icon_color_unset="#e51d0b"
text_color_unset="#FFF6D5"

if [ $ip_address ] && [ $machine_name ]; then
    status=$(ping -c 1 -W 1 $ip_address | grep received | awk '{print $4}')
    if [ $status -eq 0 ]
    then
        echo "%{T3}%{F$icon_color_disconnected}$icon%{F$text_color_connected}%{T6} $ip_address - $machine_name%{u-}"
        export
    else
        echo "%{T3}%{F$icon_color_connected}$icon%{F$text_color_disconnected}%{T6} $ip_address - $machine_name%{u-}"
        export
    fi
else
    echo "%{T3}%{F$icon_color_unset}$icon%{F$text_color_unset}%{T6} Sin objetivo fijado%{u-}"
fi
