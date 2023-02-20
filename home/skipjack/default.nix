{ pkgs, ... }:
{
  imports = [
    ../features
  ];

  home.packages = with pkgs; [
    micro
    jetbrains.idea-ultimate
    firefox
  ];
  wallpapers = [
    { path = ../../assets/wallpaper0.png; fillBg = "ffffff"; }
    { path = ../../assets/wallpaper1.png; fillBg = "54f4f3"; }
    { path = ../../assets/wallpaper2.png; fillBg = "5884E7"; }
  ];

  home.stateVersion = "23.05";  # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}