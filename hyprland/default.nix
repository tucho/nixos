{ config, lib, pkgs, ... }:

{
  imports = [
    ./applications.nix
    ./greetd.nix
    ./hyprland.nix
    ./waybar.nix
  ];
}
