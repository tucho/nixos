{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.musescore
  ];
}
