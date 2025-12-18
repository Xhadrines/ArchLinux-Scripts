#!/bin/bash

echo
echo "=== ACTIVARE AUDIO (PIPEWIRE) ==="
echo "Se activeaza PipeWire pentru utilizatorul curent."

systemctl --user enable --now pipewire pipewire-pulse

echo "PipeWire a fost activat cu succes."

echo
echo "=== PASUL URMATOR ==="
echo "Ruleaza scriptul p3.sh"
