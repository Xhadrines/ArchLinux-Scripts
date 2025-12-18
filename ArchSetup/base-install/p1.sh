#!/bin/bash

setfont ter-132b

cat <<EOF
PARTITIONARE SUGERATA
-------------------------------------
Acest ghid este doar informativ. Ajustati dupa propriul sistem!

1) Selectati discul dorit:
   - NVMe: de ex. /dev/nvme0n1
   - HDD/SATA: de ex. /dev/sda

2) Partitii recomandate (folosind cfdisk: de ex. cfdisk /dev/nvme0n1):
   nvme0n1p1 sau sda1   -> EFI System       -> 1G (minim recomandat: 300 MB)
   nvme0n1p2 sau sda2   -> Linux Swap       -> dimensiune RAM a dispozitivului
   nvme0n1p3 sau sda3   -> Linux filesystem -> restul discului (minim recomandat: 20 GB)

3) Dupa partitionare, listati partitiile:
   fdisk -l /dev/numele_discului

NOTE:
- Aceste scripturi au fost concepute pentru dispozitive cu NVMe si trebuie respecta ordinea sugerata in exemplu pentru a functiona.
-------------------------------------
EOF

echo "=== AFISARE DISCURI SI PARTITII DETECTATE ==="
echo
lsblk -l
echo

echo "=== CONFIRMARE PARTITIONARE ==="
echo "ATENTIE: Pentru ca acest script sa functioneze corect, trebuie sa respecti ORDINEA PARTITIILOR din exemplu si sa folosesti NVMe (/dev/nvme0n1):"
echo
echo "1) nvme0n1p1 -> EFI System"
echo "2) nvme0n1p2 -> Linux Swap"
echo "3) nvme0n1p3 -> Linux filesystem"
echo
echo "Ai creat aceste 3 partitii exact in aceasta ordine? (da/nu)"

read raspuns

if [ "$raspuns" == "da" ]; then
    echo
    echo "=== FORMATARE PARTITII ==="

    echo "Se formateaza partitia EFI (FAT32)..."
    mkfs.fat -F32 /dev/nvme0n1p1
    
    echo "Se initializeaza si activeaza swap-ul..."
    mkswap /dev/nvme0n1p2
    swapon /dev/nvme0n1p2
	
    echo "Se formateaza partitia root cu BTRFS..."
    mkfs.btrfs /dev/nvme0n1p3 -f

    echo
    echo "=== CREARE SI MONTARE SUBVOLUME BTRFS ==="
	
    echo "Se monteaza temporar partitia BTRFS..."
    mount /dev/nvme0n1p3 /mnt
	
    echo "Se creeaza subvolumele BTRFS (@, @home, @snapshots)..."
	btrfs subvolume create /mnt/@
	btrfs subvolume create /mnt/@home
	btrfs subvolume create /mnt/@snapshots
	
    echo "Se demonteaza partitia temporara..."
	umount /mnt
	
    echo
    echo "=== MONTARE SISTEM DE FISIERE ==="

    echo "Se monteaza subvolumul root (@)..."
	mount -o compress=zstd,subvol=@ /dev/nvme0n1p3 /mnt

    echo "Se creeaza directoarele necesare..."
	mkdir -p /mnt/{boot,home,.snapshots}

    echo "Se monteaza subvolumele BTRFS..."
	mount -o compress=zstd,subvol=@home /dev/nvme0n1p3 /mnt/home
	mount -o compress=zstd,subvol=@snapshots /dev/nvme0n1p3 /mnt/.snapshots
    
    echo "Se monteaza partitia EFI..."
    mount /dev/nvme0n1p1 /mnt/boot

    echo
    echo "=== VERIFICARE MONTARI ==="
    lsblk

    echo
    echo "=== INSTALARE SISTEM DE BAZA ==="
    echo "Se instaleaza pachetele de baza..."
	pacstrap -K /mnt base linux linux-headers linux-firmware sudo vim git wget btrfs-progs htop fastfetch

    echo
    echo "=== OBTINERE UUID-URI (IMPORTANT: NOTEAZA UUID) ==="
	echo "EFI:"
	blkid /dev/nvme0n1p1
	echo "SWAP:"
	blkid /dev/nvme0n1p2
	echo "BTRFS:"
	blkid /dev/nvme0n1p3

    echo
    echo "=== GENERARE FSTAB ==="
    genfstab -U /mnt >> /mnt/etc/fstab

    echo
    echo "=== VERIFICARE MANUALA FSTAB (FOARTE IMPORTANT) ==="
    echo "Fisierul /mnt/etc/fstab va fi deschis in vim."
    echo "Verifica UUID-urile, optiunile BTRFS si swap-ul."
    echo "Daca totul este corect, salveaza si iesi (:wq)."
    echo "Daca NU este corect, corecteaza inainte de a continua."

    echo
    echo "Intra in /mnt/etc/fstab:"
    echo "vim /mnt/etc/fstab"

    echo
    echo "=== EXEMPLU FSTAB CORECT ==="
    echo "UUID=UUID_BTRFS_PARTITION /           btrfs rw,relatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@ 0 1"
    echo "UUID=UUID_BTRFS_PARTITION /home       btrfs rw,relatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@home 0 2"
    echo "UUID=UUID_BTRFS_PARTITION /.snapshots btrfs rw,relatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@snapshots 0 2"
    echo "UUID=UUID_EFI_PARTITION   /boot       vfat  rw,relatime,fmask0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro 0 2"
    echo "UUID=UUID_SWAP_PARTITION  none        swap  defaults 0 0"

    echo
    echo "=== PASII URMATORI ==="
    echo "Sterge repo-ul cu comanda: rm -rf /ArchLinux-Scripts"
    echo
    echo "Intra in chroot:"
    echo "arch-chroot /mnt"
    echo
    echo "Cloneaza repo-ul:"
    echo "git clone https://github.com/Xhadrines/ArchLinux-Scripts.git"
    echo
    echo "Ruleaza scriptul p2.sh"

    exit 0
else
    echo
    echo "Script oprit."
    echo "Creeaza partitiile corect si reia instalarea."
    exit 1
fi
