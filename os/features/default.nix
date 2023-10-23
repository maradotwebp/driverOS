{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/os

    ./audio.nix
    ./dconf.nix
    ./greetd.nix
    ./hyprland.nix
    ./intl.nix
    ./network.nix
    ./nix.nix
    ./opengl.nix
    ./ssh.nix
    ./users.nix
    ./wayland.nix
    ./xserver.nix
  ];
}