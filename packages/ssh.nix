{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs = {
      ssh = {
        enable = true;
        forwardAgent = true;
      };
    };
  };
}
