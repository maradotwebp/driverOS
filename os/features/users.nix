{ pkgs, ... }:
{
  users.users.alex = {
    isNormalUser = true;
    shell = "${pkgs.nushell}/bin/nu";
    extraGroups = [ "wheel" ];
  };
}