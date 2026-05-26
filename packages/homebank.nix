{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.homebank
  ];
}
