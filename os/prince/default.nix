{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia

    ../features
    ../features/optional/uefi.nix
  ];

  hardware.nvidia.prime = {
    nvidiaBusId = "PCI:01:00:0";
    amdgpuBusId = "PCI:13:00:0";
  };

  networking.hostName = "prince";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
