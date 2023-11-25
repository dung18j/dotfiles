{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, nixpkgs-unstable, ... }: {
    nixosConfigurations = {
      e490 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({ config, pkgs, ...}:
          let
            overlay-unstable = final: prev: {
              unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
            };
          in
            {
              nixpkgs.overlays = [ overlay-unstable ];              
              imports =
                [
                  ./hardware-configuration.nix 
                  ./conf.nix
                  ./users.nix
                  ./packages.nix
                  ./services.nix
                  ./nix.nix
                  ./fonts.nix
                  ./fs.nix
                ];
            })
        ];
      };
    };
  };
}
