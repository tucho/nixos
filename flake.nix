{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.basilio = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./boot
        ./fonts
        ./hardware
        ./hyprland
        ./localization
        ./misc
        ./networking
        ./packages
        ./printing
        ./scanning
        ./sound
        ./users

        home-manager.nixosModules.home-manager {
          home-manager = {
            backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    };
  };
}
