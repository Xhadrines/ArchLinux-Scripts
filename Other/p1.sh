#!/bin/bash

cat <<EOF
Pentru ca acest script sa functioneze, trebuie sa creezi manual 3 partitii folosind cfdisk.

1. nvme0n1p1: Partitia EFI (minim recomandat: 300 MB).
2. nvme0n1p2: Partitia Swap (minim recomandat: de 2 ori memoria RAM, dar cel putin 512 MB).
3. nvme0n1p3: Partitia Root (minim recomandat: 20 GB, dar poate fi mai mare, in functie de necesitatile tale).

Foloseste comanda: cfdisk /dev/nvme0n1
Creeaza partitiile in ordine si salveaza modificarile.
EOF

lsblk -l
echo "Ai creat cele 3 partitii necesare (nvme0n1p1, nvme0n1p2, nvme0n1p3)? (da/nu)"

read raspuns

if [ "$raspuns" == "da" ]; then
    echo "Partitiile se creeaza acum."

    mkfs.fat -F32 /dev/nvme0n1p1
    mkswap /dev/nvme0n1p2
    swapon /dev/nvme0n1p2
    mkfs.btrfs /dev/nvme0n1p3

    mount /dev/nvme0n1p3 /mnt
    mkdir /mnt/boot
    mount /dev/nvme0n1p1 /mnt/boot

    lsblk

    echo "Partitiile s-au creat si montat cu succes."
    echo "Incepem instalarea sistemului de baza pe partitia root."
    echo "Se vor instala pachetele de baza: base, linux, linux-firmware, sudo, vim."
    echo "Dupa aceea, vom genera fisierul fstab si vom intra in mediul chroot pentru configurare."

    pacstrap -K /mnt base linux linux-firmware sudo vim
    genfstab -U /mnt >> /mnt/etc/fstab

    echo "Sistemul de baza a fost instalat cu succes pe partitia root."
    echo "Fisierul fstab a fost generat si salvat in /mnt/etc/fstab."

    arch-chroot /mnt
    exit 0
else
    echo "Te rog sa creezi partitiile inainte de a continua. Scriptul se va opri."
    exit 1
fi
