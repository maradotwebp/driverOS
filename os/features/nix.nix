{ outputs, ... }:
{
  # NIX
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NIXPKGS
  nixpkgs.overlays = builtins.attrValues outputs.overlays;
  nixpkgs.config.allowUnfree = true;
}