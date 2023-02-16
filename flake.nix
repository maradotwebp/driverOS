
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland }: {
    nixosConfigurations.skipjack = nixpkgs.lib.nixosSystem {
      system = "x64_64_linux";
      modules = [
        ./configuration.nix
        /etc/nixos/hardware-configuration.nix
        home-manager.nixosModules.home-manager
        ({ pkgs, lib, ... }: 
        let mod = "Mod1";
        in {
          nixpkgs.config.allowUnfree = true;
        
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.alex = {
            imports = [
              hyprland.homeManagerModules.default	
            ];

            services.syncthing.enable = true;
          
            home.stateVersion = "23.05";
            programs.kitty.enable = true;
            home.packages = [
              pkgs.micro
              pkgs.jetbrains.idea-ultimate
              pkgs.firefox
            ];

            home.keyboard.layout = "de";

            wayland.windowManager.hyprland = {
	          enable = true;
	          xwayland.hidpi = false;
	          extraConfig = ''
				monitor = , preferred, auto, 1
	            input {
	           	  kb_layout = de
	           	}
	           	general {
	           	  gaps_in = 5
	           	  gaps_out = 10
	           	  border_size = 0
	           	}
	           	decoration {
	           	  rounding = 2
	           	  dim_inactive = true
	           	  dim_strength = 0.2	
	           	}
	           	animations {
	              animation = windows, 1, 1, default
	              animation = windowsIn, 1, 2, default, popin 80%
	              animation = windowsOut, 1, 2, default, popin 80%
	              animation = fade, 1, 1, default
	           	}
	           	dwindle {
	           	  force_split = 2
	           	}
	           	$mainMod = ALT
	           	
	           	bind = $mainMod, Return, exec, kitty
	           	bind = $mainMod SHIFT, Q, killactive

	  			bind = $mainMod, left, movefocus, l
	  			bind = $mainMod, right, movefocus, r
	  			bind = $mainMod, up, movefocus, u
	  			bind = $mainMod, down, movefocus, d

	  			bind = $mainMod SHIFT, left, movewindow, l
	  			bind = $mainMod SHIFT, right, movewindow, r
	  			bind = $mainMod SHIFT, up, movewindow, u
	  			bind = $mainMod SHIFT, down, movewindow, d

	  			bind = $mainMod, F, fullscreen, 1

	  			bind = $mainMod, 1, workspace, 1
	  			bind = $mainMod, 2, workspace, 2
	  			bind = $mainMod, 3, workspace, 3
	  			bind = $mainMod, 4, workspace, 4
	  			bind = $mainMod, 5, workspace, 5
	  			bind = $mainMod, 6, workspace, 6
	  			bind = $mainMod, 7, workspace, 7
	  			bind = $mainMod, 8, workspace, 8
	  			bind = $mainMod, 9, workspace, 9
	  			bind = $mainMod, 0, workspace, 0

	  			bind = $mainMod SHIFT, 1, movetoworkspace, 1
	  			bind = $mainMod SHIFT, 2, movetoworkspace, 2
	  			bind = $mainMod SHIFT, 3, movetoworkspace, 3
	  			bind = $mainMod SHIFT, 4, movetoworkspace, 4
	  			bind = $mainMod SHIFT, 5, movetoworkspace, 5
	  			bind = $mainMod SHIFT, 6, movetoworkspace, 6
	  			bind = $mainMod SHIFT, 7, movetoworkspace, 7
	  			bind = $mainMod SHIFT, 8, movetoworkspace, 8
	  			bind = $mainMod SHIFT, 9, movetoworkspace, 9
	  			bind = $mainMod SHIFT, 0, movetoworkspace, 0

	  			bindm = $mainMod, mouse:272, movewindow
	  			bindm = $mainMod, mouse:273, resizewindow
	          '';
	        };
          };
        })
      ];
    };
  };
}
