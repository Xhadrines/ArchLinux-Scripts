#!/bin/bash

echo
echo "=== INSTALARE DRIVERE GRAFICE ==="
echo "AMD:"
pacman -S --noconfirm xf86-video-amdgpu vulkan-radeon

echo "NVIDIA:"
pacman -S --noconfirm nvidia-dkms nvidia-settings nvidia-utils nvidia-prime


echo "Suplimentar pentru compatibilitate Vulkan si 32-bit:"
pacman -S --noconfirm vulkan-tools lib32-nvidia-utils lib32-mesa lib32-vulkan-radeon less

echo
echo "=== UTILITARE DE BAZA ==="
pacman -S --needed --noconfirm base-devel xdg-user-dirs xdg-user-dirs-gtk

echo
echo "=== MANAGEMENT ENERGIE SI HARDWARE ==="
pacman -S --noconfirm tlp tlp-rdw smartmontools ethtool
systemctl enable tlp

echo "Masca serviciile power-profiles-daemon si rfkill pentru a preveni conflictele:"
systemctl mask power-profiles-daemon.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

echo
echo "=== AUDIO SI VIDEO ==="
pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa pipewire-jack

echo
echo "=== RETEA SI BLUETOOTH ==="
pacman -S --noconfirm networkmanager bluez bluez-utils
systemctl enable NetworkManager

echo
echo "=== CONFIGURARE SUDO ==="
echo "Fisierul ?? visudo ?? va fi deschis in vim."
echo "Adauga linia:"
echo "  %khajiit ALL=(ALL:ALL) ALL"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in visudo:"
echo "EDITOR=vim visudo"

echo
echo "=== CREARE GRUP SI UTILIZATOR ==="
echo "Adaugam grupul 'khajiit':"
echo "groupadd khajiit"

echo "Creare utilizator 'xhadrines' in grupul khajiit:"
echo "useradd -m -G khajiit xhadrines"

echo "Setati parola utilizatorului xhadrines:"
echo "passwd xhadrines"

echo
echo "=== CURATARE SI RESTART ==="
echo "Sterge repo-ul cu comanda: rm -rf /ArchLinux-Scripts"
echo "Iesi din chroot cu comanda: exit"
echo "Deconecteaza toate partitiile montate cu: umount -R /mnt"
echo "Reporneste sistemul: reboot"
