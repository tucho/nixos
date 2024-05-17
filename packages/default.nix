{ config, lib, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./git.nix
    ./libreoffice.nix
    ./ripgrep.nix
    ./zsh.nix
  ];
}
