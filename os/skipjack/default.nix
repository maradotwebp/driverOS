
{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../features
    ../features/optional/uefi.nix
  ];

  networking.hostName = "skipjack";
  scheme = "${inputs.base16-schemes}/atelier-seaside.yaml";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
