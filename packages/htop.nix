{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs = {
      htop = {
        enable = true;
      };
    };
  };
}
