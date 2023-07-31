{ pkgs, ... }:
{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}