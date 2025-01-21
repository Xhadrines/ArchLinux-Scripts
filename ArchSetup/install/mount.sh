#!/bin/bash

mount_partitions() {
  echo "Setting up Btrfs..."
  mount "${dev}p3" /mnt
  mkdir -p /mnt/{boot,home,.snapshots}
  mount "${dev}p1" /mnt/boot

  # Montare subvolume Btrfs
  mount -o noatime,space_cache,compress=zstd,subvol=@ "${dev}p3" /mnt
  mount -o noatime,space_cache,compress=zstd,subvol=@home "${dev}p3" /mnt/home
  mount -o noatime,space_cache,compress=zstd,subvol=@snapshots "${dev}p3" /mnt/.snapshots
}
