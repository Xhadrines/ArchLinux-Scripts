#!/bin/bash

echo
echo "=============================="
echo "   INSTALARE GNOME DESKTOP"
echo "=============================="
echo

echo "=== Instalare pachete GNOME ==="
echo "Se vor instala urmatoarele componente:"
echo "- GNOME Shell"
echo "- GDM (Display Manager)"
echo "- Aplicatii GNOME de baza"
echo

sudo pacman -S --noconfirm gnome-shell gnome-control-center gnome-terminal gdm gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-calculator gnome-characters gnome-logs gnome-photos gnome-system-monitor cheese gnome-disk-utility gnome-calendar gnome-font-viewer gnome-screenshot gnome-music gnome-clocks gnome-sound-recorder gnome-menus

echo
echo "=== Activare Display Manager (GDM) ==="
echo "Se activeaza serviciul gdm."

sudo systemctl enable gdm.service

echo
echo "=== FINAL GNOME ==="
echo "GNOME a fost instalat cu succes."
echo
echo "Reporneste sistemul: reboot"
