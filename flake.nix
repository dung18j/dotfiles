{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    #nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations = {
      e490 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({ config, pkgs, ... }:
            #let
            #  overlay-unstable = final: prev: {
            #    unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
            #  };
            #in
            {
              #nixpkgs.overlays = [ overlay-unstable ];
              imports =
                [
                  ./hardware-configuration.nix
                  ./configuration.nix
                  ./users.nix
                  ./packages.nix
                ];
            })
        ];
      };
    };
  };
}
