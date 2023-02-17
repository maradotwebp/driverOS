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

  home.stateVersion = "23.05";  # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}