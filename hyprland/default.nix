{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };

  services = {
    greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          command =
            ''
            ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --time-format '%Y-%m-%d %H:%M:%S' \
            --remember-session
            '';
          user = "greeter";
        };
      };
    };
  };

  home-manager.users.marcel = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {
        monitor = "eDP-1, 1920x1080, 0x0, 1";

        general = {
          border_size = 2;
          gaps_in = 4;
          gaps_out = 8;
          layout = "master";
        };

        decoration = {
          rounding = 4;
          rounding_power = 4.0;
          dim_inactive = true;
          dim_strength = 0.2;
          active_opacity = 1.0;
          inactive_opacity = 0.8;
        };

        input = {
          follow_mouse = 2;
          touchpad = {
            natural_scroll = true;
            tap_button_map = "lmr";
          };
        };

        bind =
          [
            "SUPER, RETURN, exec, kitty"
            "SUPER, E, exec, emacsclient -nc"
            "SUPER, F, exec, firefox"
            "SUPER SHIFT, Q, killactive"
            "SUPER SHIFT, END, exit"

            # Move focus with SUPER + arrow keys
            "SUPER, LEFT, movefocus, l"
            "SUPER, RIGHT, movefocus, r"
            "SUPER, UP, movefocus, u"
            "SUPER, DOWN, movefocus, d"

            # Move window with SUPER + SHIFT + arrow keys
            "SUPER SHIFT, left, movewindow, l"
            "SUPER SHIFT, right, movewindow, r"
            "SUPER SHIFT, up, movewindow, u"
            "SUPER SHIFT, down, movewindow, d"

            # Switch workspaces with SUPER + [0-9]
            "SUPER, 1, workspace, 1"
            "SUPER, 2, workspace, 2"
            "SUPER, 3, workspace, 3"
            "SUPER, 4, workspace, 4"
            "SUPER, 5, workspace, 5"
            "SUPER, 6, workspace, 6"
            "SUPER, 7, workspace, 7"
            "SUPER, 8, workspace, 8"
            "SUPER, 9, workspace, 9"
            "SUPER, 0, workspace, 10"

            # Move active window to a workspace with SUPER + SHIFT + [0-9]
            "SUPER SHIFT, 1, movetoworkspace, 1"
            "SUPER SHIFT, 2, movetoworkspace, 2"
            "SUPER SHIFT, 3, movetoworkspace, 3"
            "SUPER SHIFT, 4, movetoworkspace, 4"
            "SUPER SHIFT, 5, movetoworkspace, 5"
            "SUPER SHIFT, 6, movetoworkspace, 6"
            "SUPER SHIFT, 7, movetoworkspace, 7"
            "SUPER SHIFT, 8, movetoworkspace, 8"
            "SUPER SHIFT, 9, movetoworkspace, 9"
            "SUPER SHIFT, 0, movetoworkspace, 10"
          ];
      };
    };

    programs.kitty.enable = true;

    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
        target = "graphical-session.target";
      };
      settings = {
        mainBar = {
          position = "bottom";
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-right = [
            "battery"
            "clock"
          ];
          battery = {
            interval = 1;
            states = {
              warning = 30;
                critical = 15;
            };
            format = "{capacity}% {icon}";
            format-icons =  ["" "" "" "" ""];
            max-length= 25;
          };
          clock = {
            interval = 1;
            format = "{:%H:%M:%S}";
            max-length = 25;
          };
        };
      };
    };
  };
}
