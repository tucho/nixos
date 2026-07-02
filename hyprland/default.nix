{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = [
    pkgs.tuigreet
  ];
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember-session --asterisks --time --time-format '%Y-%m-%d %H:%M:%S'";
        user = "greeter";
      };
    };
  };
  
  home-manager.users.marcel = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
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
    programs.rofi = {
      enable = true;
      modes = [
        "drun"
        "ssh"
      ];
    };
  };
}
