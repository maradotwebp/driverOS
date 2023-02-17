{ inputs, outputs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.alex = import ./skipjack.nix;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
}