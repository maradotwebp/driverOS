
{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad

    ../features
    ../features/optional/uefi.nix
    ../features/optional/vpn.nix
  ];

  networking.hostName = "skipjack";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
