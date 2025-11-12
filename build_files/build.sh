#!/bin/bash

set -ouex pipefail

dnf5 install -y tmux niri alacritty firefox NetworkManager NetworkManager-tui NetworkManager-wifi fuzzel wofi swayidle swaylock swaybg qt6ct brightnessctl pipewire wireplumber emacs-nox neovim entr flatpak distrobox dnf5-plugins sddm

systemctl enable sddm.service
systemctl enable NetworkManager.service
