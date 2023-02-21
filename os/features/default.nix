{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/os

    ./audio.nix
    ./dconf.nix
    ./greetd.nix
    ./intl.nix
    ./network.nix
    ./nix.nix
    ./ssh.nix
    ./users.nix
    ./wayland.nix
    ./xserver.nix
  ];
}