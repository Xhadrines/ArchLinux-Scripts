#!/bin/bash

check_network_connection() {
  echo "Checking network connection..."
  if ! ping -c 1 archlinux.org &> /dev/null; then
    echo "No network connection detected. Please set up your network connection."
    wifi-menu
    if ! ping -c 1 archlinux.org &> /dev/null; then
      echo "Network setup failed. Exiting."
      exit 1
    fi
  fi
}
