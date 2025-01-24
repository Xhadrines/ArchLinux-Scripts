#!/bin/bash

echo "Se seteaza fusul orar la Europe/Bucharest."

ln -sf /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

echo "Fusul orar a fost setat cu succes la Europe/Bucharest."

echo "Folosind comanda vim /etc/locale.gen deschideti fisierul locale.gen pentru a decomenta liniile urmatoare:"
echo " -> en_US.UTF-8 UTF-8"
echo " -> en_US ISO-8859-1"
echo " -> ro_RO.UTF-8 UTF-8"
echo " -> ro_RO ISO-8859-2"

echo "Dupa ce ai decomentat acele linii, si ai salvat, executa scriptul p3.sh cu comanda:"
echo "./p3.sh"
