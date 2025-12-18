#!/bin/bash

echo
echo "=== SERVICII SISTEM ==="

echo "Instalare DKMS si Speech Dispatcher..."
sudo pacman -S --noconfirm dkms speech-dispatcher

echo
echo "Activare Bluetooth..."
sudo systemctl enable --now bluetooth.service

echo
echo "=== PASUL URMATOR ==="
echo "Ruleaza scriptul p5.sh"
