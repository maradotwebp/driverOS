
{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # BOOT
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NETWORK
  networking.hostName = "skipjack";
  networking.networkmanager.enable = true;

  # INTL
  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "en_GB.UTF-8";
  services.xserver.layout = "de";
  console.useXkbConfig = true;

  # XSERVER
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  # USERS
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # NIX
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html).
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
