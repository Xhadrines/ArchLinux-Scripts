#!/bin/bash

echo "Instalam GNOME si unele aplicatii utilizand comanda sudo pacman -S gnome-shell gnome-control-center gnome-terminal gdm gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-calculator gnome-characters gnome-logs gnome-photos gnome-system-monitor cheese gnome-disk-utility gnome-calendar gnome-font-viewer gnome-screenshot gnome-music gnome-clocks gnome-sound-recorder."
sudo pacman -S gnome-shell gnome-control-center gnome-terminal gdm gnome-tweaks gnome-shell-extensions gnome-browser-connector gnome-calculator gnome-characters gnome-logs gnome-photos gnome-system-monitor cheese gnome-disk-utility gnome-calendar gnome-font-viewer gnome-screenshot gnome-music gnome-clocks gnome-sound-recorder

echo "Instalam driver-ele grafice AMD folosind comanda sudo pacman -S xf86-video-amdgpu vulkan-radeon."
sudo pacman -S xf86-video-amdgpu vulkan-radeon

echo "Instalam driver-ele grafice NVIDIA folosind comanda sudo pacman -S nvidia nvidia-utils nvidia-settings nvidia-prime."
sudo pacman -S nvidia nvidia-utils nvidia-settings nvidia-prime

echo "Instalam utilitare pentru management-ul energiei si retelei folosind comanda sudo pacman -S tlp tlp-rdw smartmontools ethtool."
sudo pacman -S tlp tlp-rdw smartmontools ethtool

echo "Instalam PipeWire pentru gestionarea audio si video folosind comanda sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack."
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack

echo "Activam si pornim PipeWire cu comanda systemctl --user enable --now pipewire."
systemctl --user enable --now pipewire

echo "Activam serviciul TLP pentru gestionarea energiei cu comanda systemctl enable tlp."
systemctl enable tlp

echo "Masca serviciile power-profiles-daemon si rfkill pentru a preveni conflictele cu comanda systemctl mask power-profiles-daemon.service, systemctl mask systemd-rfkill.service, si systemctl mask systemd-rfkill.socket."
systemctl mask power-profiles-daemon.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

echo "Activam serviciul TLP cu comanda systemctl enable tlp."
systemctl enable tlp

echo "Activam serviciul GDM pentru a porni GNOME cu comanda systemctl enable gdm.service."
systemctl enable gdm.service

echo "Instalam NetworkManager si Bluez pentru a gestiona conexiunile de retea si Bluetooth cu comanda sudo pacman -S networkmanager bluez bluez-utils."
sudo pacman -S networkmanager bluez bluez-utils

echo "Activam serviciul NetworkManager cu comanda systemctl enable NetworkManager."
systemctl enable NetworkManager

echo "Activam serviciul Bluetooth cu comanda systemctl enable bluetooth.service --now."
systemctl enable bluetooth.service --now

echo "Cream un utilizator 'xhadrines' cu comanda useradd -m -G wheel xhadrines."
useradd -m -G wheel xhadrines

echo "Folosind comanda passwd xhadrines setati o parola."

echo "Folosind comanda EDITOR=vim visudo, deschideti fisierul visudo pentru a decomenta linia '%wheel ALL=(ALL) ALL'."

echo "Dupa ce ai terminat sterge repo-ul cu comanda rm -rf /ArchLinux-Scripts, apoi iesi din mediul chroot cu comanda exit."

echo "Deconecteaza toate parttiile montate cu comanda umount -R /mnt."

echo "Reporneste sistemul cu cu comanda reboot now"
