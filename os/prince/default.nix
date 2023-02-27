{ pkgs, config, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd

    ../features
    ../features/optional/gpu-nvidia.nix
    ../features/optional/uefi.nix
  ];

  # Services
  services.redis.servers."dev".enable = true;
  services.postgresql.enable = true;

  networking.hostName = "prince";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
