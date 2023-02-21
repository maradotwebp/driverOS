{ pkgs, ... }:
{
  imports = [
    ../../modules/home/font.nix
  ];

  theme.fonts = {
    packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    monospace = "JetBrainsMono Nerd Font";
  };
}