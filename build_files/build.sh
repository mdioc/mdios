#!/bin/bash

set -ouex pipefail

dnf5 install -y tmux niri alacritty firefox NetworkManager-wifi fuzzel wofi swayidle swaylock swaybg qt6ct brightnessctl pipewire wireplumber emacs-nox neovim entr flatpak distrobox podman sddm

systemctl enable sddm modify-user@md.service
