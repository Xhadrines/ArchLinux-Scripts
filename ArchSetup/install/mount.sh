#!/bin/bash

mount_partitions() {
  echo "Setting up Btrfs..."
  mount "${dev}3" /mnt
  mkdir -p /mnt/{boot,home,.snapshots}
  mount "${dev}1" /mnt/boot

  # Montare subvolume Btrfs
  mount -o noatime,space_cache,compress=zstd,subvol=@ "${dev}3" /mnt
  mount -o noatime,space_cache,compress=zstd,subvol=@home "${dev}3" /mnt/home
  mount -o noatime,space_cache,compress=zstd,subvol=@snapshots "${dev}3" /mnt/.snapshots
}
