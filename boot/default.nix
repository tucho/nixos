{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot-loader.nix
    ./encrypted-storage.nix
    ./kernel-modules.nix
    ./plymouth.nix
    ./tmp.nix
  ];
}
