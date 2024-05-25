{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.emacs
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
