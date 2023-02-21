{ pkgs, config, ... }:
{
  imports = [
    ../../modules/home/events.nix
  ];

  # Launch hyprpaper on WM start
  events."wm-init" = "${pkgs.hyprpaper}/bin/hyprpaper";

  # Config
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${config.wallpaper}
    ${builtins.concatStringsSep "\n" (map
      (m: ''
        wallpaper = ${m.name},${config.wallpaper}
      '')
    config.monitors)}
  '';
}