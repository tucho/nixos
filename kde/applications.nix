{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs.kdePackages; [
    dragon
    filelight
    kcalc
    krohnkite
    ktorrent
    skanpage
    yakuake
  ];
}
