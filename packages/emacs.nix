{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.emacs
    pkgs.gcc
  ];

  home-manager.users.marcel = {
    services = {
      emacs = {
        enable = true;
        defaultEditor = true;
        startWithUserSession = "graphical";
      };
    };
  };
}
