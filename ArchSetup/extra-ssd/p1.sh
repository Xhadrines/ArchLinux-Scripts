#!/bin/bash

echo
echo "========================================"
echo "   CONFIGURARE SSD SUPLIMENTAR (BTRFS)"
echo "========================================"
echo
echo "ATENTIE:"
echo "- Acest pas este OPTIONAL"
echo "- Partitiile se fac MANUAL"
echo "- Asigura-te ca stii ce disc folosesti"
echo

echo "=== LISTARE DISCURI ==="
lsblk

echo
echo "=== PARTITIONARE MANUALA ==="
echo "Ruleaza comanda (exemplu):"
echo "  sudo cfdisk /dev/nvme1n1"
echo
echo "Creeaza o singura partitie:"
echo "  nvme1n1p1 -> Linux filesystem (tot discul)"

echo
echo "=== PASUL URMATOR ==="
echo "Dupa ce ai terminat, ruleaza scriptul p2.sh"
