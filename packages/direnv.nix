{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true;
        config = {
          global = {
            warn_timeout = "0";
          };
        };
      };
    };
  };
}
