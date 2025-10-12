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
