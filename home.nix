{ config, pkgs, ...}:

{
  programs.home-manager.enable = true;
  home = {
    username = "marcel";
    homeDirectory = "/home/marcel";
    packages = with pkgs; [];
    stateVersion = "24.05";
  };
}
