{ config, lib, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./gnupg.nix
    ./zsh.nix
  ];
}
