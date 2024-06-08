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
    ./libreoffice.nix
    ./musescore.nix
    ./ripgrep.nix
    ./ssh.nix
    ./tor-browser.nix
    ./tree.nix
    ./zsh.nix
  ];
}
