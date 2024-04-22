{ config, lib, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
