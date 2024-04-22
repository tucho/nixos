{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot-loader.nix
    ./encrypted-storage.nix
  ];
}
