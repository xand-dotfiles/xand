{ config, pkgs, ... }:

let
    xand = {
        extraGroups = [
            "audio"
            "wheel"
        ];
        isNormalUser = true;
        shell = pkgs.fish;
    };
in
{
    users.users = {
        inherit xand;
    };
}