
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../common
    ../common/optional/uefi.nix
  ];

  networking.hostName = "skipjack";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html).
}
