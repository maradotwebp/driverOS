{ pkgs, ... }:
{
  imports = [
    ../features
  ];

  monitors = [
    { name = "eDP-1"; width = 1920; height = 1080; }
  ];

  wallpapers = [
    { path = ../../assets/wallpaper0.png; fillBg = "ffffff"; }
    { path = ../../assets/wallpaper1.png; fillBg = "54f4f3"; }
    { path = ../../assets/wallpaper2.png; fillBg = "5884E7"; }
  ];

  home.packages = with pkgs; [
    qbittorrent
    steam
    filezilla
  ];

  home.stateVersion = "23.05";  # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}