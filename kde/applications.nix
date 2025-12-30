{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs.kdePackages; [
    audiocd-kio
    dolphin
    dragon
    filelight
    k3b
    kcalc
    kio
    krohnkite
    ktorrent
    skanpage
    yakuake
  ];
}
