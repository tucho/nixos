{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs.kdePackages; [
    dolphin
    dragon
    filelight
    kcalc
    kio
    kio-extras
    krohnkite
    ktorrent
    skanpage
    xdg-desktop-portal-kde
  ];
}
