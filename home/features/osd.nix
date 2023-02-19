{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pamixer
    brightnessctl
    avizo
  ];

  xdg.configFile."avizo/config.ini".text = ''
    [default]
    time = 2.0
    fade-in = 0.2
    fade-out = 0.5
  '';
}