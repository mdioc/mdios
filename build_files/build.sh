#!/bin/bash

set -ouex pipefail

dnf5 install -y tmux niri alacritty firefox NetworkManager NetworkManager-tui NetworkManager-wifi fuzzel wofi swayidle swaylock swaybg qt6ct brightnessctl pipewire wireplumber emacs-nox neovim entr flatpak distrobox

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
systemctl enable NetworkManager.service
systemctl mask systemd-remount-fs.service

