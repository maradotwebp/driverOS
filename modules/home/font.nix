{ lib, config, ... }:
let
  cfg = config.theme.fonts;
in {
  options.theme.fonts = with lib; {
    packages = mkOption {
      type = types.listOf types.package;
      description = "Packages providing the font options";
    };
    monospace = mkOption {
      type = types.str;
      description = "Name of the monospace font.";
    };
  };

  config = {
    fonts.fontconfig.enable = true;
    home.packages = cfg.packages;
  };
}