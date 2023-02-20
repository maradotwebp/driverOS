{ pkgs, ... }:
{
  users.users.alex = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = [ "wheel" ];
  };
}