{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  home-manager.users.marcel = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {
        monitor = "eDP-1, 1920x1080, 0x0, 1";

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
            "SUPER SHIFT, LEFT, movewindow, l"
            "SUPER SHIFT, RIGHT, movewindow, r"
            "SUPER SHIFT, UP, movewindow, u"
            "SUPER SHIFT, DOWN, movewindow, d"

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

        general = {
          layout = "master";
        };

        master = {
          new_status = "slave";
        };

        input = {
          follow_mouse = 2;
          touchpad = {
            natural_scroll = true;
            tap_button_map = "lmr";
          };
        };
      };
    };

    programs.kitty.enable = true;
  };
}
