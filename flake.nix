{
    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs.url = "nixpkgs/nixos-24.11";

        xmonad = {
            url = "git+https://git.computeroid.org/xand/xmonad";
            inputs.home-manager.follows = "home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {flake-parts, home-manager, ...} @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            imports = [
                home-manager.flakeModules.default
                ./outputs.nix
            ];

            systems = [
                "x86_64-linux"
            ];
        };
}