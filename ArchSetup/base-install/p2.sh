#!/bin/bash

echo "=== VERIFICARE MONTARI (fstab) ==="
mount -a

echo
echo "=== CONFIGURARE PACMAN ==="
echo "Fisierul /etc/pacman.conf va fi deschis in vim."
echo "Efectueaza urmatoarele modificari:"
echo
echo " - Decomenteaza: Color"
echo " - Modifica: ParallelDownloads = 10"
echo " - Decomenteaza sau adauga:"
echo "   [multilib]"
echo "   Include = /etc/pacman.d/mirrorlist"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /etc/pacman.conf:"
echo "vim /etc/pacman.conf"

echo
echo "Dupa ce ai salvat sincronizeaza repo-urile ==="
echo "pacman -Sy"

echo
echo "=== SETARE FUS ORAR ==="
ln -sf /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

echo "Fusul orar a fost setat la Europe/Bucharest."

echo
echo "=== CONFIGURARE LOCALE ==="
echo "Fisierul /etc/locale.gen va fi deschis."
echo "Decomenteaza liniile:"
echo " - en_US.UTF-8 UTF-8"
echo " - en_US ISO-8859-1"
echo " - ro_RO.UTF-8 UTF-8"
echo " - ro_RO ISO-8859-2"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /etc/locale.gen"
echo "vim /etc/locale.gen"

echo
echo "=== PASUL URMATOR ==="
echo "Dupa ce ai terminat, ruleaza scriptul p3.sh"
