{ config, lib, pkgs, ... }:

{
  imports = [
    ./calibre.nix
    ./emacs.nix
    ./firefox.nix
    ./git.nix
    ./gnupg.nix
    ./htop.nix
    ./libreoffice.nix
    ./ripgrep.nix
    ./tree.nix
    ./zsh.nix
  ];
}
