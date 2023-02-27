{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "amdgpu" ];
  hardware.nvidia.modesetting.enable = true;
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
}