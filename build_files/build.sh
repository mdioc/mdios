#!/bin/bash

set -ouex pipefail

dnf5 install -y tmux niri alacritty fuzzel wofi swayidle swaylock swaybg qt6ct brightnessctl emacs-nox neovim entr sddm dolphin

systemctl enable sddm.service
