{
  description = "xOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
      commonModules = [ home-manager.nixosModules.home-manager ];
    in {
      nixosConfigurations = {
        # SKIPJACK (Laptop)
        skipjack = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = commonModules ++ [
            ./hosts/skipjack
            ./home/skipjack
          ];
        };
      };
    };
}
