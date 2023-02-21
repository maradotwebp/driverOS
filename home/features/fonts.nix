{ pkgs, ... }:
{
  theme.fonts = {
    packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    monospace = "JetBrainsMono Nerd Font";
  };
}