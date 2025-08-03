#!/bin/bash
setfont ter-132b

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
	
    mkfs.btrfs /dev/nvme0n1p3 -f
	
    mount /dev/nvme0n1p3 /mnt
	
	btrfs subvolume create /mnt/@
	btrfs subvolume create /mnt/@home
	btrfs subvolume create /mnt/@snapshots
	
	umount /mnt
	
	mount -o compress=zstd,subvol=@ /dev/nvme0n1p3 /mnt

	mkdir -p /mnt/{boot,home,.snapshots}

	mount -o compress=zstd,subvol=@home /dev/nvme0n1p3 /mnt/home
	mount -o compress=zstd,subvol=@snapshots /dev/nvme0n1p3 /mnt/.snapshots
    mount /dev/nvme0n1p1 /mnt/boot

    lsblk

    echo "Partitiile s-au creat si montat cu succes."
    echo "Incepem instalarea sistemului de baza pe partitia root."
    echo "Se vor instala pachetele de baza: base, linux, linux-headers, linux-firmware, sudo, vim, git, btrfs-progs."
    echo "Dupa aceea, vom genera fisierul fstab, si vom intra in mediul chroot pentru configurare."

	pacstrap -K /mnt base linux linux-headers linux-firmware sudo vim git btrfs-progs
	
	echo "Salveaza/memoreaza UUID=UUID_EFI_PARTITION"
	blkid /dev/nvme0n1p1
	
	echo "Salveaza/memoreaza UUID=UUID_SWAP_PARTITION"
	blkid /dev/nvme0n1p2
	
	echo "Salveaza/memoreaza UUID=UUID_BTRFS_PARTITION"
	blkid /dev/nvme0n1p3
	
    genfstab -U /mnt >> /mnt/etc/fstab

    echo "Sistemul de baza a fost instalat cu succes pe partitia root."
    echo "Fisierul fstab a fost generat si salvat in /mnt/etc/fstab."
	echo "Verifica daca fisierul arata ceva asemanator ca:"
	
	echo "UUID=UUID_BTRFS_PARTITION /           btrfs rw,relatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@                                0 1"
	echo "UUID=UUID_BTRFS_PARTITION /home       btrfs rw,relatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@home                            0 2"
	echo "UUID=UUID_BTRFS_PARTITION /.snapshots btrfs rw,relatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@snapshots                       0 2"
	echo "UUID=UUID_EFI_PARTITION   /boot       vfat  rw,relatime,fmask0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro 0 2"
	echo "UUID=UUID_SWAP_PARTITION  none        swap  defaults                                                                                             0 0"
    
    echo "Pentru a continua executa comanda arch-chroot /mnt, apoi cloneaza repo-ul cu comanda:"
    echo "git clone https://github.com/Xhadrines/ArchLinux-Scripts.git"
    echo "Intra in directorul repo-ului seta permisiunile de executie pentru scripturi cu comanda:"
    echo "chmod +x ArchSetup/*.sh"
    echo "Executa scriptul p2.sh cu comanda:"
    echo "./p2.sh"

    arch-chroot /mnt
    exit 0
else
    echo "Te rog sa creezi partitiile inainte de a continua. Scriptul se va opri."
    exit 1
fi
