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
    };
  };
}
