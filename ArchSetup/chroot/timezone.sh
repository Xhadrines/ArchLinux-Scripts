#!/bin/bash

set_timezone() {
  echo "Setting timezone..."
  ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
  hwclock --systohc
}
