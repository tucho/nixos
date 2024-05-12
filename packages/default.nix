{ config, lib, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./git.nix
    ./ripgrep.nix
    ./zsh.nix
  ];
}
