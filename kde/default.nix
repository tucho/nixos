{ config, lib, pkgs, ... }:

{
  imports = [
    ./plasma.nix
    ./applications.nix
  ];
}
