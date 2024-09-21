{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs.plasma = {
      enable = true;
      overrideConfig = true;
      
      workspace = {
        clickItemTo = "open";
        lookAndFeel = "org.kde.breezedark.desktop";
        soundTheme = "ocean";
        wallpaper = "${config.home-manager.users.marcel.xdg.userDirs.pictures}/wallpapers/millennium-falcon.gif";
      };
      
      fonts = {
        general = {
          family = "Noto Sans";
          pointSize = 10;
        };

        fixedWidth = {
          family = "Hurmit Nerd Font";
          pointSize = 10;
        };

        small = {
          family = "Noto Sans";
          pointSize = 8;
        };

        toolbar = {
          family = "Noto Sans";
          pointSize = 10;
        };

        menu = {
          family = "Noto Sans";
          pointSize = 10;
        };

        windowTitle = {
          family = "Noto Sans";
          pointSize = 10;
        };
      };
      
      kwin = {
        virtualDesktops = {
          number = 4;
          rows = 1;
          names = [
            "Desktop 1"
            "Desktop 2"
            "Desktop 3"
            "Desktop 4"
          ];
        };
      };
      
      panels = [
        {
          screen = "all";
          alignment = "center";
          floating = true;
          height = 32;
          hiding = "none";
          lengthMode = "fill";
          location = "bottom";
          widgets = [
            "org.kde.plasma.kickoff"
            "org.kde.plasma.pager"
            "org.kde.plasma.icontasks"
            "org.kde.plasma.marginsseparator"
            "org.kde.plasma.systemtray"
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.showdesktop"
          ];
        }
      ];
    };
  };
}
