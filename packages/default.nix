{ config, lib, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./git.nix
    ./gnupg.nix
    ./ripgrep.nix
    ./zsh.nix
  ];
}
