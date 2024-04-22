{ config, lib, pkgs, ... }:

{
  services = {
    emacs = {
      defaultEditor = true;
      enable = true;
      startWithGraphical = false;
    };
  };
}
