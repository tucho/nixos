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
        ./kde
        ./localization
        ./misc
        ./networking
        ./packages
        ./sound
        ./users

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.marcel = import ./home.nix;
          };
        }
      ];
    };
  };
}
