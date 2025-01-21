#!/bin/bash

format_partitions() {
  echo "Formatting the partitions..."
  mkfs.fat -F32 "${dev}1"
  mkfs.btrfs "${dev}3"
  mkswap "${dev}2"
}
