#!/bin/bash

echo
echo "=== GENERARE LOCALE ==="
echo "Se genereaza locale conform setarilor facute anterior."
locale-gen

echo
echo "=== SINCRONIZARE ORA SISTEM ==="
echo "Se sincronizeaza ora sistemului cu hardware clock-ul."
hwclock --systohc

echo
echo "=== SETARE LIMBA SISTEM ==="
echo "Fisierul /etc/locale.conf va fi creat/setat la en_US.UTF-8"
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo
echo "=== SETARE HOSTNAME ==="
echo "Fisierul /etc/hostname va fi setat la archXhadrines"
echo "archXhadrines" > /etc/hostname

echo
echo "=== CONFIGURARE /etc/hosts ==="
echo "Fisierul /etc/hosts va fi deschis in vim."
echo "Adauga urmatoarele linii:"
echo "127.0.0.1      localhost"
echo "::1            localhost"
echo "127.0.1.1      archXhadrines"
echo
echo "Dupa ce ai terminat, salveaza si iesi (:wq)."

echo
echo "Intra in /etc/hosts:"
echo "vim /etc/hosts"

echo
echo "=== SETARE PAROLA ROOT ==="
echo "Seteaza parola pentru utilizatorul root:"
echo "passwd"

echo
echo "=== PASUL URMATOR ==="
echo "Dupa ce ai terminat, ruleaza scriptul p4.sh"
