{ config, lib, pkgs, ... }:

{
  imports = [
    ./calibre.nix
    ./devenv.nix
    ./direnv.nix
    ./discord.nix
    ./docker.nix
    ./emacs
    ./firefox.nix
    ./gimp.nix
    ./git.nix
    ./gnucash.nix
    ./gnupg.nix
    ./htop.nix
    ./latex.nix
    ./libreoffice.nix
    ./lilypond.nix
    ./modern-cli.nix
    ./musescore.nix
    ./nix-index.nix
    ./nvtop.nix
    ./ssh.nix
    ./steam.nix
    ./tor-browser.nix
    ./tree.nix
    ./virt-manager.nix
    ./zsh.nix
  ];
}
