#!/bin/bash

echo
echo "=============================="
echo "   INSTALARE KDE PLASMA"
echo "=============================="
echo

echo "=== INSTALARE KDE PLASMA (CORE) ==="
echo "Se instaleaza mediul KDE Plasma si componentele esentiale."
sudo pacman -S --noconfirm plasma-desktop plasma-pa plasma-nm powerdevil upower konsole dolphin partitionmanager systemsettings discover flatpak sddm sddm-kcm xdg-desktop-portal xdg-desktop-portal-kde kscreenlocker kscreen kinfocenter

echo
echo "=== ACTIVARE DISPLAY MANAGER (SDDM) ==="
sudo systemctl enable sddm

echo
echo "=== FIREWALL & BLUETOOTH ==="
echo "Se instaleaza firewall-ul si suportul Bluetooth pentru KDE."
sudo pacman -S --noconfirm plasma-firewall firewalld bluedevil
sudo systemctl enable --now firewalld.service

echo
echo "=== APLICATII KDE UTILE ==="
sudo pacman -S --noconfirm kcalc kalarm spectacle kate kamoso gwenview vlc ark plasma-systemmonitor okular libreoffice-fresh

echo
echo "=== SECURITATE (GPG + KWALLET) ==="
sudo pacman -S --noconfirm gnupg kwallet kwalletmanager

echo
echo "Se va lansa generatorul de chei GPG."
echo "Urmeaza instructiunile interactive."
gpg --full-generate-key

echo
echo "=== PRINTARE (CUPS) ==="
sudo pacman -S --noconfirm cups print-manager system-config-printer
sudo systemctl enable --now cups.service

echo
echo "=== SCANARE ==="
sudo pacman -S --noconfirm sane skanlite

echo
echo "=== FINAL KDE ==="
echo "KDE Plasma a fost instalat cu succes."
echo
echo "Reporneste sistemul: reboot"
