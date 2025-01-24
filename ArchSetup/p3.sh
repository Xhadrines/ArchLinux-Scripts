#!/bin/bash

echo "Se genereaza locale utilizand comanda locale-gen."
locale-gen

echo "Setam ora sistemului pentru a se sincroniza cu hardware-ul folosind comanda hwclock --systohc."
hwclock --systohc

echo "Setam limba sistemului la en_US.UTF-8 in fisierul /etc/locale.conf."
echo LANG=en_US.UTF-8 > /etc/locale.conf

echo "Setam numele host-ului la archXhadrines in fisierul /etc/hostname."
echo "archXhadrines" > /etc/hostname

echo "Folosind comanda vim /etc/hosts deschideti fisierul hosts, si adaugati urmatoarele:"
echo "127.0.0.1      localhost"
echo "::1            localhost"
echo "127.0.1.1      archXhadrines"

echo "Seteaza parola pentru utilizatorul root folosind comanda:" 
echo "passwd"

echo "Dupa ce ai terminat executa scriptul p4.sh cu comanda:"
echo "./p4.sh"
