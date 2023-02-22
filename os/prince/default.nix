{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../features
    ../features/optional/uefi.nix
  ];

  networking.hostName = "prince";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
