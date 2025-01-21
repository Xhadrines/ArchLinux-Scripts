#!/bin/bash

setup_btrfs() {
  echo "Creating Btrfs subvolumes..."
  btrfs su cr /mnt/@
  btrfs su cr /mnt/@home
  btrfs su cr /mnt/@snapshots
}
