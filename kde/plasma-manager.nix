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
    };
  };
}
