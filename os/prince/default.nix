{ pkgs, config, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd

    ../features
    ../features/optional/uefi.nix
  ];

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package = pkgs.linuxKernel.packages.linux_5_15.nvidia_x11;
    modesetting.enable = true;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  boot.blacklistedKernelModules = [ "amdgpu" ];

  # Services
  services.mongodb.enable = true;
  services.redis.servers."dev".enable = true;
  services.postgresql.enable = true;

  networking.hostName = "prince";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
