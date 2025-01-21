#!/bin/bash

create_user() {
  read -p "Enter your username: " username
  while true; do
    read -s -p "Enter your password: " password
    echo
    read -s -p "Confirm your password: " password_confirm
    echo
    [ "$password" = "$password_confirm" ] && break
    echo "Passwords do not match. Please try again."
  done

  encrypted_password=$(openssl passwd -6 "$password")
  echo "Password encrypted successfully."

  echo "Creating user $username..."
  useradd -m -G wheel -s /bin/bash $username
  echo "${username}:${encrypted_password}" | chpasswd -e
  sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
}
