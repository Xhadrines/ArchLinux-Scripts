#!/bin/bash

echo
echo "=== CONFIGURARE BOOT ENTRY BACKUP ==="
echo "Se creeaza o copie a configuratiei de boot."

sudo cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-backup.conf

echo
echo "Fisierul arch-backup.conf va fi deschis in vim."
echo "Modifica:"
echo " - title -> Arch Linux (BACKUP)"
echo " - rootflags=subvol=@snapshots/backup"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /boot/loader/entries/arch-backup.conf:"
echo "sudo vim /boot/loader/entries/arch-backup.conf"

echo
echo "=== RESTART ==="
echo "Dupa ce ai terminat, reporneste sistemul: reboot"
