{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs.kdePackages; [
    dragon
    filelight
    kcalc
    ktorrent
    skanpage
    yakuake
  ];
}
