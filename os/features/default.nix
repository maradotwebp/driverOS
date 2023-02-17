{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./colors.nix
    ./intl.nix
    ./network.nix
    ./nix.nix
    ./users.nix
    ./wayland.nix
    ./xserver.nix
  ];
}