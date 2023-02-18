{ pkgs, config, inputs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./alacritty.nix
    ./rofi.nix
    ../../modules/home/wallpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.hidpi = false;
    extraConfig = ''
      exec-once = ${pkgs.swaybg}/bin/swaybg -i "${config.wallpaper}" -m fill

      monitor = , preferred, auto, 1
      input {
        kb_layout = de
      }
      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 1
        col.active_border = rgba(aeaeaecc)
        col.inactive_border = rgba(000000ff)
      }
      decoration {
        rounding = 3
      }
      animations {
        animation = windows, 1, 1, default
        animation = windowsIn, 1, 2, default, popin 80%
        animation = windowsOut, 1, 2, default, popin 80%
        animation = fade, 1, 1, default
        animation = workspaces, 1, 4, default, slidevert
      }
      dwindle {
        force_split = 2
      }
      $mainMod = ALT

      bind = $mainMod, Return, exec, ${pkgs.alacritty}/bin/alacritty
      bind = $mainMod, D, exec, rofi -show drun -show-icons -display-drun "::"

      bind = $mainMod SHIFT, Q, killactive

      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      bind = $mainMod SHIFT, left, movewindow, l
      bind = $mainMod SHIFT, right, movewindow, r
      bind = $mainMod SHIFT, up, movewindow, u
      bind = $mainMod SHIFT, down, movewindow, d

      bind = $mainMod, F, fullscreen, 1

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 0

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 0

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}