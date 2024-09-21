{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs.plasma = {
      enable = true;
    };
  };
}
