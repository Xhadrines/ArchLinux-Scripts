#!/bin/bash

echo
echo "=== BOOT ENTRY CLI (FALLBACK) ==="

sudo cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-cli.conf

echo
echo "Fisierul arch-cli.conf va fi deschis in vim."
echo "Modifica astfel:"
echo
echo "title   Arch Linux (CLI)"
echo "options root=UUID=UUID_BTRFS_PARTITION rw rootflags=subvol=@ systemd.unit=multi-user.target"
echo
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /boot/loader/entries/arch-cli.conf:"
echo "sudo vim /boot/loader/entries/arch-cli.conf"

echo
echo "=== PASUL URMATOR ==="
echo "Ruleaza scriptul p6.sh"
