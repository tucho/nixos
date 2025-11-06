{ config, lib, pkgs, ... }:

{
  imports = [
    ./calibre.nix
    ./direnv.nix
    ./docker.nix
    ./emacs.nix
    ./firefox.nix
    ./git.nix
    ./gnupg.nix
    ./htop.nix
    ./nix-index.nix
    ./nvtop.nix
    ./ripgrep.nix
    ./ssh.nix
    ./tor-browser.nix
    ./tree.nix
    ./zsh.nix
  ];
}
