{ config, lib, pkgs, ... }:

{
  imports = [
    ./calibre.nix
    ./direnv.nix
    ./discord.nix
    ./emacs.nix
    ./firefox.nix
    ./gimp.nix
    ./git.nix
    ./gnupg.nix
    ./htop.nix
    ./latex.nix
    ./libreoffice.nix
    ./lilypond.nix
    ./musescore.nix
    ./nvtop.nix
    ./ripgrep.nix
    ./ssh.nix
    ./steam.nix
    ./tor-browser.nix
    ./tree.nix
    ./zsh.nix
  ];
}
