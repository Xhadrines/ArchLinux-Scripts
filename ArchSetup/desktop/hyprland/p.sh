#!/bin/bash

echo
echo "=============================="
echo "   INSTALARE HYPRLAND"
echo "=============================="
echo

echo "=== PACHETE DE BAZA WAYLAND ==="
echo "Se instaleaza suportul Wayland si XWayland."
sudo pacman -S --noconfirm egl-wayland xorg-xwayland

echo
echo "=== INSTALARE HYPRLAND ==="
sudo pacman -S --noconfirm hyprland

echo
echo "=== INSTALARE APLICATII UTILE ==="
echo "Terminal, file manager, launcher, bar, wallpaper, control sistem."
sudo pacman -S --noconfirm kitty dolphin wofi waybar hyprpaper brightnessctl playerctl

echo
echo "=== CONFIGURARE MKINITCPIO (GPU MODULES) ==="
echo "Fisierul /etc/mkinitcpio.conf va fi deschis in vim."
echo
echo "Adauga in linia MODULES:"
echo "  amdgpu nvidia nvidia_modeset nvidia_uvm nvidia_drm"
echo
echo "Exemplu:"
echo "MODULES=(... amdgpu nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /etc/mkinitcpio.conf:"
echo "sudo vim /etc/mkinitcpio.conf"

echo
echo "Dupa ce ai salvat regenereaza initramfs: ==="
echo "sudo mkinitcpio -P"

echo
echo "=== CONFIGURARE NVIDIA DRM MODESET ==="
echo "Fisierul /etc/modprobe.d/nvidia.conf va fi creat/editat in vim."
echo
echo "Adauga urmatoarea linie:"
echo "options nvidia_drm modeset=1 fbdev=1"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /etc/modprobe.d/nvidia.conf:"
echo "sudo vim /etc/modprobe.d/nvidia.conf"

echo
echo "Dupa ce ai salvat regenereaza initramfs din nou: ==="
echo "sudo mkinitcpio -P"

echo
echo "=== FINAL HYPRLAND ==="
echo "Configurarea Hyprland a fost finalizata."
echo
echo "Reporneste sistemul: reboot"
