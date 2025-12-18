#!/bin/bash

echo
echo "=== INSTALARE EFIBOOTMGR ==="
echo "Instalam pachetul 'efibootmgr' pentru management EFI."
pacman -S --noconfirm efibootmgr

echo
echo "=== INSTALARE SYSTEMD-BOOT ==="
echo "Se instaleaza systemd-boot pe partitia EFI."
bootctl install

echo
echo "=== CONFIGURARE LOADER ==="
echo "Fisierul /boot/loader/loader.conf va fi deschis in vim."
echo "Adauga urmatoarele linii:"
echo "default       arch.conf"
echo "timeout       10"
echo "console-mode  max"
echo "editor        no"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /boot/loader/loader.conf:"
echo "vim /boot/loader/loader.conf"

echo
echo "=== CONFIGURARE ENTRIE ARCH ==="
echo "Fisierul /boot/loader/entries/arch.conf va fi deschis in vim."
echo "Adauga urmatoarele linii:"
echo "title     Arch Linux"
echo "linux     /vmlinuz-linux"
echo "initrd    /initramfs-linux.img"
echo "options   root=UUID=UUID_BTRFS_PARTITION rw rootflags=subvol=@"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /boot/loader/entries/arch.conf:"
echo "vim /boot/loader/entries/arch.conf"

echo
echo "=== PASUL URMATOR ==="
echo "Dupa ce ai terminat, ruleaza scriptul p5.sh"
