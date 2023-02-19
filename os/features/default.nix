{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/os/colors.nix
    ./audio.nix
    ./colors.nix
    ./greetd.nix
    ./intl.nix
    ./network.nix
    ./nix.nix
    ./users.nix
    ./wayland.nix
    ./xserver.nix
  ];
}