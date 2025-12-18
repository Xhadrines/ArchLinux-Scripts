#!/bin/bash

echo
echo "=== FORMATARE BTRFS ==="
sudo mkfs.btrfs -f /dev/nvme1n1p1

echo
echo "=== CREARE SUBVOLUM ==="
sudo mkdir -p /mnt/nvme
sudo mount /dev/nvme1n1p1 /mnt/nvme

sudo btrfs subvolume create /mnt/nvme/@storage

echo
echo "=== MONTARE FINALA ==="
sudo mkdir -p /mnt/storage
sudo mount -o compress=zstd,subvol=@storage /dev/nvme1n1p1 /mnt/storage

lsblk

echo
echo "=== CURATARE MOUNT TEMPORAR ==="
sudo umount /mnt/nvme
sudo rmdir /mnt/nvme

echo
echo "=== DEMONTARE PENTRU FSTAB ==="
sudo umount /mnt/storage

echo
echo "=== OBTINERE UUID ==="
sudo blkid /dev/nvme1n1p1
echo
echo "Salveaza UUID-ul de mai sus."

echo
echo "=== CONFIGURARE FSTAB ==="
echo "Fisierul /etc/fstab va fi deschis in vim."
echo "Adauga urmatoarea linie:"
echo
echo "# /dev/nvme1n1p1"
echo "UUID=UUID_BTRFS_PARTITION  /mnt/storage  btrfs  rw,relatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@storage  0 2"

echo
echo "Intra in /etc/fstab:"
echo "vim /etc/fstab"

echo
echo "=== REINCARCARE SI MONTARE ==="
echo "Dupa ce ai terminat ruleaza:"
echo "sudo systemctl daemon-reload"
echo "sudo mount -a"

echo
echo "=== FINAL ==="
echo "Dupa ce ai terminat, reporneste sistemul: reboot"
