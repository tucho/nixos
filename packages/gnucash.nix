{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.gnucash
  ];
}
