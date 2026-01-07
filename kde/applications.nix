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
    kio-extras
    krohnkite
    ktorrent
    skanpage
    xdg-desktop-portal-kde
    yakuake
  ];
}
