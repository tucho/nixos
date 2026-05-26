{ config, lib, pkgs, ... }:

{
  imports = [
    ./calibre.nix
    ./direnv.nix
    ./emacs
    ./firefox.nix
    ./git.nix
    ./gnucash.nix
    ./gnupg.nix
    ./htop.nix
    ./latex.nix
    ./libreoffice.nix
    ./lilypond.nix
    ./musescore.nix
    ./nix-index.nix
    ./nvtop.nix
    ./ripgrep.nix
    ./ssh.nix
    ./steam.nix
    ./tor-browser.nix
    ./tree.nix
    ./zsh.nix
  ];
}
