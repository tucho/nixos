{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {
        monitor = "eDP-1, 1920x1080, 0x0, 1";
        general = {
          border_size = 3;
          gaps_in = 6;
          gaps_out = 12;
          layout = "master";
        };
        decoration = {
          rounding = 6;
          dim_inactive = true;
          dim_strength = 0.2;
        };
        input = {
          follow_mouse = 2;
          touchpad = {
            natural_scroll = true;
            tap_button_map = "lmr";
            drag_lock = true;
          };
        };
        misc = {
          disable_hyprland_logo = true;
          background_color = "0x000000";
        };
        cursor = {
          inactive_timeout = 10;
        };
        master = {
          mfact = 0.6;
        };

        # These two next sets of rules replicates "no gaps when only".
        workspace = [
          "w[tv1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];
        windowrulev2 = [
          "bordersize 0, floating:0, onworkspace:w[tv1]"
          "rounding 0, floating:0, onworkspace:w[tv1]"
          "bordersize 0, floating:0, onworkspace:f[1]"
          "rounding 0, floating:0, onworkspace:f[1]"];

        "$mod" = "SUPER";
        bind =
          [
            "$mod, RETURN, exec, kitty"
            "$mod, E, exec, emacsclient -nc"
            "$mod, F, exec, firefox"
            "$mod SHIFT, Q, killactive"
            "$mod SHIFT, E, exit"

            # Move focus with mainMod + arrow keys
            "$mod, LEFT, movefocus, l"
            "$mod, RIGHT, movefocus, r"
            "$mod, UP, movefocus, u"
            "$mod, DOWN, movefocus, d"

            # Move window with mainMod + SHIFT + arrow keys
            "$mod SHIFT, left, movewindow, l"
            "$mod SHIFT, right, movewindow, r"
            "$mod SHIFT, up, movewindow, u"
            "$mod SHIFT, down, movewindow, d"

            # Switch workspaces with mainMod + [0-9]
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"
          ];
      };
    };

    programs.kitty.enable = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command =
            ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time --time-format '%Y-%m-%d %H:%M:%S' \
            --asterisks \
            --remember-session
            '';
          user = "greeter";
        };
      };
    };
  };
}
