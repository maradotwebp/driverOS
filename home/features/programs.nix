{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Development
    chromium
    firefox
    micro
    jetbrains.idea-ultimate
    flameshot
    peek
    obsidian

    # Files
    libreoffice
    zathura
    xfce.thunar
    vlc

    # Communication
    discord
    slack
  ];
}