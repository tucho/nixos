{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind =
          [
            "$mod, RETURN, exec, kitty"
            "$mod, E, exec, emacsclient -nc"
            "$mod, F, exec, firefox"
            "$mod SHIFT, Q, killactive"
            "$mod SHIFT, E, exit"
          ];
      };
    };

    programs.kitty.enable = true;
  };
}
