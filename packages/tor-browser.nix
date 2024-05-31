{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.tor-browser
  ];
}
