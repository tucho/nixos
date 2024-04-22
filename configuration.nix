{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [];

  programs = {
    git = {
      enable = true;
      prompt.enable = true;
    };

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
