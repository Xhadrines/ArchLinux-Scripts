#!/bin/bash

enable_services() {
  systemctl enable NetworkManager
  systemctl enable zram-generator
}
