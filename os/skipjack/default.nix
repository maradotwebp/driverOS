{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd

    ../features
    ../features/optional/bluetooth.nix
    ../features/optional/uefi.nix
    ../features/optional/vpn.nix
  ];

  hardware.amdgpu.loadInInitrd = true;

  networking.hostName = "skipjack";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
