{
  description = "xOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    base16.url = github:SenchoPens/base16.nix;
    base16.inputs.nixpkgs.follows = "nixpkgs";
    base16-schemes = {
      url = github:base16-project/base16-schemes;
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
      mkHmConfig = import ./lib/mkHmConfig.nix;
    in {
      nixosConfigurations = {
        # SKIPJACK (Laptop)
        skipjack = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./os/skipjack (mkHmConfig ./home/skipjack) ];
        };
      };
    };
}
