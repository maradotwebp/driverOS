{ lib, ... }:
with lib;
let
  wallpaperModule = types.submodule {
      options = {
        path = mkOption {
          type = types.path;
          description = "Path to the wallpaper file";
        };
        fillBg = mkOption {
          type = types.str;
          default = "ffffff";
          description = "What color to fill the background with";
        };
      };
    };
in
{
  options.wallpapers = mkOption {
    type = types.listOf wallpaperModule;
    default = [];
    description = "Different wallpapers";
  };
}