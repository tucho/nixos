{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.kdePackages.xdg-desktop-portal-kde
  ];

  programs.uwsm.enable = true;

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs; [
      sddm-astronaut
      kdePackages.qtbase
      kdePackages.qtwayland
      kdePackages.qtmultimedia
    ];
  };
  
  home-manager.users.marcel = {
    xdg.configFile."uwsm/env".text =
      ''
      export LIBVA_DRIVER_NAME=nvidia
      export XDG_SESSION_TYPE,wayland
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export GBM_BACKEND,nvidia-drm
      export NVD_BACKEND=direct
      '';

    xdg.configFile."uwsm/env-hyprland".text =
      ''
      export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
      '';

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {
        monitor = [
          "eDP-1, 1920x1080, 0x0, 1"
          "HDMI-A-2, 1920x1080, 1920x0, 1"
        ];

        bind =
          [
            "SUPER, RETURN, exec, uwsm app -- kitty.desktop"
            "SUPER, E, exec, uwsm app -- emacsclient.desktop"
            "SUPER, F, exec, uwsm app -- firefox.desktop"
            "SUPER, D, exec, uwsm app -- rofi.desktop"
            "SUPER, Y, exec, uwsm app -- yazi.desktop"
            "SUPER SHIFT, Q, killactive"
            "SUPER SHIFT, END, exec, uwsm stop"

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

        # emulate smart gaps -- begin
        workspace = [
          "w[tv1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];
        windowrule = [
          "border_size 0, match:float 0, match:workspace w[tv1]"
          "rounding 0, match:float 0, match:workspace w[tv1]"
          "border_size 0, match:float 0, match:workspace f[1]"
          "rounding 0, match:float 0, match:workspace f[1]"
        ];
        # emulate smart gaps -- end
      };
    };

    programs.kitty.enable = true;

    programs.rofi = {
      enable = true;
      modes = [
        "drun"
      ];
    };

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
            "wireplumber"
            "pulseaudio#source"
            "bluetooth"
            "battery"
            "clock"
          ];
          
          "battery" = {
            states = {
              good = 95;
              warning = 20;
              critical = 10;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            tooltip-format = "{time} ({capacity}%)";
            format-alt = "{time} {icon}";
            format-full = "";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
          
          "clock" = {
            interval = 1;
            format = "{:%Y-%m-%d %H:%M:%S}";
            max-length = 25;
          };

          "wireplumber" = {
            format = "{volume}% {icon}";
            format-muted = "";
            on-click = "${lib.getExe pkgs.pwvucontrol}";
            format-icons = [
              ""
              ""
              ""
            ];
            tooltip-format = "{volume}% / {node_name}";
          };
          
          "pulseaudio#source" = {
            format = "{format_source}";
            format-source = "";
            format-source-muted = "";
            on-click = "${lib.getExe pkgs.pwvucontrol}";
            tooltip-format = "{source_volume}% / {desc}";
          };
          
          "bluetooth" = {
            format-on = "";
            format-connected = "{device_alias} ";
            format-off = "";
            format-disabled = "";
            on-click-right = "${lib.getExe' pkgs.blueman "blueman-manager"}";
            # on-click = "${lib.getExe bluetoothToggle}";
          };
        };
      };
    };
  };
  
  environment.systemPackages = with pkgs; [
    pwvucontrol
    sddm-astronaut
    kdePackages.qtbase
    kdePackages.qtwayland
    kdePackages.qtmultimedia
  ];

  services.blueman.enable = true;
}
