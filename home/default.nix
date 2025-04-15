{ flake-parts-lib, lib, withSystem, inputs, ... }:

let
    inherit (inputs) xmonad;
    inherit (inputs.home-manager.lib) homeManagerConfiguration;
    
    homeModules = {
        xand = ./home.nix;
        graphical = ./graphical.nix;
    };

    overlays = [
        inputs.nurpkgs.overlays.default
        (final: prev: {
            firefox-addons = final.nur.repos.rycee.firefox-addons;
        })
    ];

    system = "x86_64-linux";

    xand = homeManagerConfiguration {
        modules = [
            ./home.nix
        ];

        pkgs = import inputs.nixpkgs {
            inherit system;
        };
    };
    
    graphical = homeManagerConfiguration {
        modules = [
            ./home.nix
            ./graphical.nix
            xmonad.homeModules.xmonad
        ];

        pkgs = import inputs.nixpkgs {
            config.allowUnfree = true;
            inherit overlays system;
        };
    };

    homeConfigurations = {
        inherit xand graphical;
        default = graphical;
    };
in
{
    flake = {
        inherit homeConfigurations homeModules;
    };
}