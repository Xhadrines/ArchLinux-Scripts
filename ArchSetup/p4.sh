#!/bin/bash

echo "Instalam pachetul 'efibootmgr' folosind comanda sudo pacman -S efibootmgr."
sudo pacman -S efibootmgr

echo "Instalam bootloader-ul folosind comanda bootctl install."
bootctl install

echo "Folosind comanda vim /boot/loader/loader.conf deschideti fisierul loader.conf, si adaugati urmatoarele:"
echo "default       arch.conf"
echo "timeout       10"
echo "console-mode  max"
echo "editor        no"

echo "Folosind comanda vim /boot/loader/entries/arch.conf deschideti fisierul arch.conf, si adaugati urmatoarele:"
echo "title     Arch Linux"
echo "linux     /vmlinuz-linux"
echo "initrd    /initramfs-linux.img"
echo "options   root=UUID=UUID_BTRFS_PARTITION rw rootflags=subvol=@"

echo "Dupa ce ai terminat executa scriptul p5.sh cu comanda:"
echo "./p5.sh"
