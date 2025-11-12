#!/bin/bash

set -ouex pipefail

dnf5 install -y tmux niri alacritty firefox NetworkManager NetworkManager-tui NetworkManager-wifi fuzzel wofi swayidle swaylock swaybg qt6ct brightnessctl pipewire wireplumber emacs-nox neovim entr flatpak distrobox dnf5-plugins


copr_install_isolated() {
    local copr_name="$1"
    shift
    local packages=("$@")

    if [[ ${#packages[@]} -eq 0 ]]; then
        echo "ERROR: No packages specified for copr_install_isolated"
        return 1
    fi

    repo_id="copr:copr.fedorainfracloud.org:${copr_name//\//:}"

    echo "Installing ${packages[*]} from COPR $copr_name (isolated)"

    dnf5 -y copr enable "$copr_name"
    dnf5 -y copr disable "$copr_name"
    dnf5 -y install --enablerepo="$repo_id" "${packages[@]}"

    echo "Installed ${packages[*]} from $copr_name"
}

# From che/nerd-fonts
copr_install_isolated "che/nerd-fonts" "nerd-fonts"

# From ublue-os/packages
copr_install_isolated "ublue-os/packages" \
    "bluefin-backgrounds" \
    "bluefin-cli-logos" \
    "bluefin-faces" \
    "bluefin-schemas" \
    "bluefin-fastfetch" \
    "ublue-bling" \
    "ublue-brew" \
    "ublue-fastfetch" \
    "ublue-motd" \
    "ublue-polkit-rules" \
    "ublue-setup-services" \
    "uupd"

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
systemctl enable NetworkManager.service
systemctl mask systemd-remount-fs.service

