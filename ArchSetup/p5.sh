#!/bin/bash

echo "Instalam driver-ele grafice AMD folosind comanda sudo pacman -S xf86-video-amdgpu vulkan-radeon."
sudo pacman -S xf86-video-amdgpu vulkan-radeon

echo "Instalam driver-ele grafice NVIDIA folosind comanda sudo pacman -S nvidia nvidia-utils nvidia-settings nvidia-prime."
sudo pacman -S nvidia-dkms nvidia-settings nvidia-utils nvidia-prime

echo "Instalam..."
sudo pacman -S --needed base-devel xdg-user-dirs xdg-user-dirs-gtk

echo "Instalam utilitare pentru management-ul energiei si retelei folosind comanda sudo pacman -S tlp tlp-rdw smartmontools ethtool."
sudo pacman -S tlp tlp-rdw smartmontools ethtool

echo "Activam serviciul TLP pentru gestionarea energiei cu comanda systemctl enable tlp."
systemctl enable tlp

echo "Masca serviciile power-profiles-daemon si rfkill pentru a preveni conflictele cu comanda systemctl mask power-profiles-daemon.service, systemctl mask systemd-rfkill.service, si systemctl mask systemd-rfkill.socket."
systemctl mask power-profiles-daemon.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

echo "Instalam PipeWire pentru gestionarea audio si video folosind comanda sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack."
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack

echo "Instalam NetworkManager si Bluez pentru a gestiona conexiunile de retea si Bluetooth cu comanda sudo pacman -S networkmanager bluez bluez-utils."
sudo pacman -S networkmanager bluez bluez-utils

echo "Activam serviciul NetworkManager cu comanda systemctl enable NetworkManager."
systemctl enable NetworkManager

echo "Editeaza fisiserul visudo folosind comadna:"
echo "EDITOR=vim visudo"

echo "In acest fisier introdu '%khajiit ALL=(ALL:ALL) ALL'"

echo "Dupa adauga grupul folosind comanda:"
echo "sudo groupadd khajiit"

echo "Cream un utilizator 'xhadrines' cu comanda:"
echo "useradd -m -G khajiit xhadrines"

echo "Folosind comanda passwd xhadrines setati o parola."

echo "Dupa ce ai terminat sterge repo-ul cu comanda rm -rf /ArchLinux-Scripts, apoi iesi din mediul chroot cu comanda exit."

echo "Deconecteaza toate parttiile montate cu comanda umount -R /mnt."

echo "Reporneste sistemul cu cu comanda reboot now"
