{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.zoom-us
  ];
}
