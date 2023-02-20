{ outputs, ... }:
{
  # NIX
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NIXPKGS
  nixpkgs.overlays = builtins.attrValues outputs.overlays;
  nixpkgs.config.allowUnfree = true;

  # PREVENT GARBAGE COLLECTION FOR DIRENV
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
}