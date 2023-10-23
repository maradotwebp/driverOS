{ pkgs, ... }:
{
  imports = [
    ../features
  ];

  wallpaper = ./wallpaper.jpg;
  monitors = [
    { name = "DP-1"; width = 5120; height = 1440; }
  ];

  # Hyprland
  wayland.windowManager.hyprland.enableNvidiaPatches = true;

  home.stateVersion = "23.05";  # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
