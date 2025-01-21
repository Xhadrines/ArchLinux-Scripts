#!/bin/bash

partition_disk() {
  echo "Listing available storage devices:"
  lsblk

  read -p "Enter the device to install Arch Linux on (e.g., /dev/sda): " dev

  if [ ! -b "$dev" ]; then
    echo "Invalid device: $dev"
    exit 1
  fi

  # Partiționare
  echo "Creating GPT label..."
  parted -s "$dev" mklabel gpt
  echo "Creating FAT32 partition (1MiB to 1GiB)..."
  parted -s "$dev" mkpart primary fat32 1MiB 1GiB
  echo "Setting ESP flag on partition 1..."
  parted -s "$dev" set 1 esp on
  echo "Creating Linux swap partition (1GiB to 11GiB)..."
  parted -s "$dev" mkpart primary linux-swap 1GiB 11GiB
  echo "Creating Btrfs partition (11GiB to end)..."
  parted -s "$dev" mkpart primary btrfs 11GiB 100%
}
