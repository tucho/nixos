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
    xdg.configFile = {
      "emacs/init.el".source = ./config/emacs/init.el;
      "emacs/config.org".source = ./config/emacs/config.org;
      "emacs/only-display-compile-on-error.el".source = ./config/emacs/only-display-compile-on-error.el;
    };
  };
}
