{
  # NIX
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NIXPKGS
  nixpkgs.config.allowUnfree = true;
}