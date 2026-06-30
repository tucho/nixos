{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  home-manager.users.marcel = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      systemd.enable = true;
      configType = "lua";
      extraLuaFiles = {
        config = {
          content = ./config.lua;
          autoLoad = true;
        };
      };
    };

    programs.kitty.enable = true;
    services.hyprlauncher.enable = true;
  };
}
