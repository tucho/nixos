{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.discord
  ];
}
