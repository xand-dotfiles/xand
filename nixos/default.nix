let
    nixosModules = {
        xand = ./configuration.nix;
    };
in
{
    flake = {
        inherit nixosModules;
    };
}