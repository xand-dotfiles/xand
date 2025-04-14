{ flake-parts-lib, lib, withSystem, inputs, ... }:

let
    inherit (inputs) xmonad;
    inherit (inputs.home-manager.lib) homeManagerConfiguration;

    system = "x86_64-linux";
in
{
    flake = {
        homeConfigurations = withSystem system ({pkgs, ...}: {
            xand = homeManagerConfiguration {
                modules = [
                    ./home.nix
                ];
                inherit pkgs;
            };
    
            default = homeManagerConfiguration {
                modules = [
                    ./home.nix
                    ./graphical.nix
                    xmonad.homeModules.xmonad
                ];
                inherit pkgs;
            };
        });
    
        homeModules = {
            xand = ./home.nix;
            graphical = ./graphical.nix;
        };
    
        nixosModules = {
            xand = ./configuration.nix;
        };
    };
}