{ pkgs, ... }:
{
  imports = [
    ../../modules/home/events.nix
  ];

  # Run on WM init
  events."wm-init" = "${pkgs.avizo}/bin/avizo-service";

  # Add scripts for handling WM keybinds
  scripts."volume-up" = "${pkgs.avizo}/bin/volumectl -u up";
  scripts."volume-down" = "${pkgs.avizo}/bin/volumectl -u down";
  scripts."volume-toggle-mute" = "${pkgs.avizo}/bin/volumectl toggle-mute";
  scripts."volume-toggle-mic" = "${pkgs.avizo}/bin/volumectl -m toggle-mute";
  scripts."light-up" = "${pkgs.avizo}/bin/lightctl up";
  scripts."light-down" = "${pkgs.avizo}/bin/lightctl down";

  # Add needed packages
  home.packages = with pkgs; [
    pamixer
    brightnessctl
    avizo
  ];

  # Config
  xdg.configFile."avizo/config.ini".text = ''
    [default]
    time = 2.0
    fade-in = 0.2
    fade-out = 0.5
  '';
}