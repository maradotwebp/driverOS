file:
{ config, inputs, outputs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.alex = import file;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
    colors = config.scheme;
    osConfig = config;
  };
}