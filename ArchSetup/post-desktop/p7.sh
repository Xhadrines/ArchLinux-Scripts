#!/bin/bash

echo
echo "=== INSTALARE VENTOY ==="

echo "Clonare Visual Studio Code (bin)..."
git clone https://aur.archlinux.org/ventoy-bin.git
cd ventoy-bin || exit 1
makepkg -si
cd ..
rm -rf ventoy-bin

echo
echo "=== PASUL URMATOR ==="
echo "Reporneste sistemul: reboot"