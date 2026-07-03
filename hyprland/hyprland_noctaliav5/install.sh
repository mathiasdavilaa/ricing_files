#!/usr/bin/env bash
set -e

echo "=== Installing base-devel, git and yay ==="
sudo pacman -Syu --needed --noconfirm base-devel git
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
fi

# =========================================
# Now its time to install all the packages
# ========================================= 

echo "=== Installing main apps ==="
yay -S --needed --noconfirm zen-browser-bin nautilus zapzap localsend

echo "=== Installing system controls and midia control ==="
yay -S --needed --noconfirm wireplumber brightnessctl playerctl

echo "=== Installing grim and slurp ==="
yay -S --needed --noconfirm grim slurp

hyprpm update
hyprpm add https://github.com/yayuuu/hyprland-scroll-overview.git
hyprpm update
hyprpm enable scrolloverview

echo "=== Todos os pacotes e dependências foram instalados com sucesso! ==="