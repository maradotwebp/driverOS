{ lib, ... }:
with lib;
{
  options.wallpaper = mkOption {
    type = types.path;
    description = "Path to the wallpaper displayed in the background";
  };
}