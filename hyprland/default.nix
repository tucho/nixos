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

    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
        targets = [
          "hyprland-session.target"
        ];
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "bottom";
          height = 30;
          output = [
            "eDP-1"
            "HDMI-A-2"
          ];
          modules-left = [
            "hyprland/workspaces"
            "hyprland/submap"
            "wlr/taskbar"
          ];
          modules-center = [
            "hyprland/window"
          ];
          modules-right = [
            "battery"
            "hyprland/language"
            "wireplumber"
            "bluetooth"
            "network"
            "clock"
          ];
        };
      };
    };

    programs.kitty.enable = true;
    services.hyprlauncher.enable = true;
  };
}
