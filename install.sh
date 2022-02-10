#!/usr/bin/bash

DIR="$HOME/.config"
PTH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

clear
echo -ne "[*] Iniciando backup de la configuración actual...\n"
mv $DIR/polybar/ $DIR/polybar_bck/

sleep 1

echo -ne "[+] Copiando nueva polybar...\n"
cd $PTH
cp -r polybar $DIR/polybar

sleep 2

echo -ne "[!] Instalación finalizada. Reiniciando polybar...\n"
bspc wm -r

sleep 2

echo "[>] Saliendo..."
exit 0
