{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./intl.nix
    ./network.nix
    ./nix.nix
    ./users.nix
    ./xserver.nix
  ];
}