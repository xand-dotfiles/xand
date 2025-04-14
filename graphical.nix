# Adds a handful of graphical programs to the 'xand' user.

{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        coppwr # 
        pwvucontrol
        recordbox
    ];

    imports = [
        ./programs/firefox
        ./programs/vscodium
        ./services/easyeffects
    ];

    gtk = {
        enable = true;
        iconTheme = {
            name = "Kanagawa";
            package = pkgs.kanagawa-icon-theme;
        };
        theme = {
            name = "Kanagawa-B";
            package = pkgs.kanagawa-gtk-theme;
        };
    };
}