#!/bin/bash

setup_network() {
  echo "Setting up Network..."
  timedatectl set-ntp true
}
