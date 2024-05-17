{ config, lib, pkgs, ... }:

{
  imports = [
    ./calibre.nix
    ./emacs.nix
    ./git.nix
    ./libreoffice.nix
    ./ripgrep.nix
    ./zsh.nix
  ];
}
