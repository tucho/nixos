{ config, lib, pkgs, ... }:

{
  imports = [
    ./plasma.nix
    ./plasma-manager.nix
    ./applications.nix
  ];
}
