{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [];

  programs = {};

  services = {
    emacs = {
      defaultEditor = true;
      enable = true;
      startWithGraphical = false;
    };
  };
}
