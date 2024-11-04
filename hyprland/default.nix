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
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
              9)
          );
      };
    };

    programs.kitty.enable = true;
  };
}
