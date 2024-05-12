{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.emacs
  ];
}
