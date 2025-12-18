#!/bin/bash

echo
echo "=== SNAPSHOT BTRFS (BACKUP ROOT) ==="
echo "Se creeaza snapshot pentru subvolumul root (@)."

sudo btrfs subvolume snapshot / /.snapshots/backup

echo "Snapshot-ul a fost creat cu succes."

echo
echo "=== PASUL URMATOR ==="
echo "Ruleaza scriptul p5.sh"
