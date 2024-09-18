{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
        target = "hyprland-session.target";
      };
      settings = {
        mainBar = {
          position = "bottom";
          modules-left = [
            "hyprland/workspaces"
            "hyprland/submap"
          ];
          modules-center = [
            "tray"
          ];
          modules-right = [
            "bluetooth"
            "battery"
            "clock"
          ];

          battery = {
            states =  {
              good =  95;
              warning = 30;
              critical =  15;
            };
            format =  "{capacity}% {icon}";
            format-full = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = ["" "" "" "" ""];
          };

          clock = {
            timezone = "America/Sao_Paulo";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%Y-%m-%d %H:%M:%S}";
            format-alt = "{:%Y-%m-%d}";
          };
        };
      };
    };
  };
}
