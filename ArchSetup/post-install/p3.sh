#!/bin/bash

echo
echo "=== INSTALARE YAY (AUR HELPER) ==="
echo "Se cloneaza repository-ul yay."

git clone https://aur.archlinux.org/yay.git
cd yay || exit 1

echo
echo "Se compileaza si instaleaza yay."
makepkg -si

cd ..
rm -rf yay

echo "Yay a fost instalat cu succes."

echo
echo "=== PASUL URMATOR ==="
echo "Ruleaza scriptul p4.sh"
