#!/bin/bash

format_partitions() {
  echo "Formatting the partitions..."
  mkfs.fat -F32 "${dev}p1"
  mkfs.btrfs "${dev}p3"
  mkswap "${dev}p2"
}
