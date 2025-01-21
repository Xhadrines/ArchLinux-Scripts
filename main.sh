#!/bin/bash

# Verifica daca scriptul este rulat ca root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Apelam functiile din scripturile auxiliare
source ./ArchSetup/utils/network_check.sh
source ./ArchSetup/install/partitioning.sh
source ./ArchSetup/install/formatting.sh
source ./ArchSetup/install/mount.sh
source ./ArchSetup/install/btrfs.sh
source ./ArchSetup/install/setup_network.sh
source ./ArchSetup/install/enable_services.sh
source ./ArchSetup/chroot/timezone.sh
source ./ArchSetup/chroot/locale.sh
source ./ArchSetup/chroot/user.sh
source ./ArchSetup/chroot/grub.sh
source ./ArchSetup/chroot/sudo.sh

# Executia procesului de instalare
check_network_connection
partition_disk
format_partitions
mount_partitions
setup_btrfs
setup_network
enable_services

# Configurare in chroot
set_timezone
set_locale
create_user
configure_grub
configure_sudo
