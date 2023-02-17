{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@attrs: {
    nixosConfigurations.skipjack = nixpkgs.lib.nixosSystem {
      system = "x64_64_linux";
      specialArgs = {
        inherit attrs;
        hostName = "skipjack";
        hyprland = hyprland;
      };
      modules = [
        home-manager.nixosModules.home-manager
        ./os/configuration.nix
        ./home/home.nix
        ./hosts/skipjack/hardware-configuration.nix
      ];
    };
  };
}
