{ config, lib, pkgs, ... }:

{
  imports = [
    ./marcel.nix
    ./root.nix
  ];

  users.mutableUsers = false;
}
