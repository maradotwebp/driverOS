{ pkgs, colors, inputs, ... }:
{
  imports = [
    ./nushell.nix
  ];

  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    window = {
      padding = { x = 4; y = 4; };
      dynamic_padding = true;
    };
    font = {
      normal.family = "JetBrainsMono Nerd Font";
    };
    shell.program = "${pkgs.nushell}/bin/nu";
  };

  programs.alacritty.settings.colors = with colors.withHashtag;
    let
      default = {
        black = base00; white = base07;
        inherit red green yellow blue cyan magenta;
      };
    in {
      primary = { background = base00; foreground = base07; };
      cursor = { text = base02; cursor = base07; };
      normal = default; bright = default; dim = default;
      search.matches = { background = base07; foreground = base00; };
      search.focused_match = { background = magenta; foreground = base07; };
    };
}