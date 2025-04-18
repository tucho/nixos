{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor = "eDP-1, 1920x1080@60, 0x0, 1";
        bind =
          [
            "SUPER, RETURN, exec, kitty"
            "SUPER, E, exec, emacsclient -nc"
            "SUPER, F, exec, firefox"
            "SUPER SHIFT, Q, killactive"
            "SUPER SHIFT, END, exit"
          ];
      };
    };

    programs.kitty.enable = true;
  };
}
