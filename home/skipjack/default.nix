{ pkgs, ... }:
{
  imports = [
    ../features
  ];

  wallpaper = ./wallpaper.png;
  monitors = [
    { name = "eDP-1"; width = 1920; height = 1080; }
  ];

  home.packages = with pkgs; [
    qbittorrent
    steam
    filezilla
  ];

  home.stateVersion = "23.05";  # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}