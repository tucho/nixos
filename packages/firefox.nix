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
            };
          };
        };
      };
    };
  };
}
