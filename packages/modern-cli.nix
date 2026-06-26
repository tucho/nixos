{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    bottom
    dust
    eza
    fd
    fzf
    httpie
    hyperfine
    procs
    ripgrep
    zoxide
  ];
}
