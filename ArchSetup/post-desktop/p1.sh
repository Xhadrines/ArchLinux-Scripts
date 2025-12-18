#!/bin/bash

echo
echo "=== INSTALARE APLICATII AUR ==="

echo "Clonare Visual Studio Code (bin)..."
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin || exit 1
makepkg -si
cd ..
rm -rf visual-studio-code-bin

echo
echo "Clonare font Times New Roman..."
git clone https://aur.archlinux.org/ttf-times-new-roman.git
cd ttf-times-new-roman || exit 1
makepkg -si
cd ..
rm -rf ttf-times-new-roman

echo
echo "=== PASUL URMATOR ==="
echo "Ruleaza scriptul p2.sh"
