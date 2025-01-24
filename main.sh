#!/bin/bash

# Verifica daca scriptul este rulat ca root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi
