{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.gimp
  ];
}
