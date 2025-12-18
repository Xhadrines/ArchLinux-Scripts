#!/bin/bash

echo
echo "=== CONFIGURARE WIFI ==="
echo "Se listeaza retelele WiFi disponibile:"
nmcli device wifi list

echo
echo "Conecteaza-te folosind comanda:"
echo "nmcli device wifi connect NUME password PAROLA"

echo
echo "=== PASUL URMATOR ==="
echo "Dupa ce ai terminat, ruleaza scriptul p2.sh"
