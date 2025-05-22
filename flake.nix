{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations = {
      avell-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/avell
          ### Uncomment only one below
          ./desktop-environment
          # ./DE/kde.nix
          ###
          ./steam.nix
          ./system-packages.nix
          ./display-manager
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.majunior = import ./home/majunior/home.nix;
          }
        ];
      };
    };
  };
# Optionally, use home-manager.extraSpecialArgs to pass
# arguments to home.nix
}
