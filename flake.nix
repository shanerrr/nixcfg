{
  description = "NixOS + niri (flakes, home-manager)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, niri, ... }:
  let
    mkHost = hostPath: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        hostPath
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.shaner = import ./home;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  in {
    # Build with:  sudo nixos-rebuild switch --flake .#<host>
    nixosConfigurations.nixxy = mkHost ./hosts/nixxy;
    nixosConfigurations.nyx   = mkHost ./hosts/nyx;
  };
}
