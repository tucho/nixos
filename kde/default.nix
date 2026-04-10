{ config, lib, pkgs, ... }:

{
  imports = [
    ./plasma.nix
    ./applications.nix
    ./workaround-for-plasma-sluggishness.nix
  ];
}
