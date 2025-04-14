# Minimal user implementation: declares the 'xand' user and gives them a few CLI tools.

{ config, pkgs, ... }:

let
    username = "xand";
    homeDirectory = "/home/${username}";
in
{
    home = {
        inherit homeDirectory username;

        # Check the Home Manager release notes before changing 'stateVersion'!
        stateVersion = "24.11";
    };

    imports = [
        ./programs/direnv
        ./programs/fish
        ./programs/git
    ];

    news.display = "silent";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}