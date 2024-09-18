{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      blueman
      dunst
      hyprpaper
      kitty
      networkmanagerapplet
      paprefs
      pasystray
      pavucontrol
      rofi-wayland
    ];
  };

  # programs = {
  #   nm-applet.enable = true;
  # };

  # services = {
  #   blueman.enable = true;
  # };

  # home-manager.users.marcel = {
  #   services.blueman-applet.enable = true;
  # };
}
