{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.lilypond
  ];
}
