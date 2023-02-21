{ pkgs, config, osConfig, ... }:
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
      normal.family = config.theme.fonts.monospace;
    };
    shell.program = "${pkgs.nushell}/bin/nu";
  };

  programs.alacritty.settings.colors = with osConfig.theme.colors;
    let
      bg = zinc."800".hex;
      fg = zinc."100".hex;
      themeAt = index: {
        black = bg;
        white = fg;
        red = red."${index}".hex;
        green = green."${index}".hex;
        yellow = yellow."${index}".hex;
        blue = blue."${index}".hex;
        cyan = cyan."${index}".hex;
        magenta = violet."${index}".hex;
      };
    in {
      primary = { background = bg; foreground = fg; };
      cursor = { text = zinc."700".hex; cursor = fg; };
      normal = themeAt "400";
      bright = themeAt "300";
      dim = themeAt "500";
      search.matches = { background = zinc."400".hex; foreground = bg; };
      search.focused_match = { background = zinc."200".hex; foreground = bg; };
    };
}