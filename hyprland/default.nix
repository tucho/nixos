{ config, lib, pkgs, ... }:

{
  imports = [
    ./applications.nix
    ./greetd.nix
    ./gtk.nix
    ./hyprland.nix
    ./waybar.nix
  ];
}
