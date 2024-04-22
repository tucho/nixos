{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [];

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
    };
  };

  services = {
    emacs = {
      defaultEditor = true;
      enable = true;
      startWithGraphical = false;
    };
  };
}
