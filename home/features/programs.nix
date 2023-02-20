{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Development
    chromium
    firefox
    micro
    jetbrains.idea-ultimate
    flameshot
    obsidian

    # Files
    feh
    libreoffice
    zathura
    xfce.thunar
    vlc

    # Communication
    discord
    slack
  ];

  # Better cat
  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
      pager = "never";
    };
  };
  programs.nushell.extraConfig = ''
    alias cat = bat
  '';
}