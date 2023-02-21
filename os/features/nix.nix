{ outputs, ... }:
{
  # NIX
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NIXPKGS
  nixpkgs.overlays = builtins.attrValues outputs.overlays;
  nixpkgs.config.allowUnfree = true;

  # NIX GARBAGE COLLECTION
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 8d";
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

}