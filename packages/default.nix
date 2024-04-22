{ config, lib, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./git.nix
    ./gnupg.nix
    ./zsh.nix
  ];
}
