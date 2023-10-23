{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # Tell Electron Apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}