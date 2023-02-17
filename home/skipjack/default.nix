{ pkgs, ... }:
{
  imports = [
    ../features/hyprland.nix
  ];

  home.stateVersion = "23.05";

  services.syncthing.enable = true;
  programs.alacritty.enable = true;
  home.packages = with pkgs; [
    micro
    jetbrains.idea-ultimate
    firefox
  ];

  home.keyboard.layout = "de";
}