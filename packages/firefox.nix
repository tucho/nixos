{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs = {
      firefox = {
        enable = true;
        profiles = {
          default = {
            isDefault = true;
            settings = {
              "browser.translations.automaticallyPopup" = false;

              # --- browser.tabs.inTitlebar ---
              # 0: no
              # 1: yes
              # 2: default
              "browser.tabs.inTitlebar" = 0;

              # --- browser.startup.page ---
              # 0: blank page
              # 1: homepage
              # 2: last visited page
              # 3: previous session
              "browser.startup.page" = 3;
            };
          };
        };
      };
    };
  };
}
