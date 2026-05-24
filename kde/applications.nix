{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.dragon
    kdePackages.filelight
    kdePackages.kcalc
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.krohnkite
    kdePackages.ktorrent
    kdePackages.skanpage
    kdePackages.xdg-desktop-portal-kde
    kwin-script-geometry-change
  ];
}
