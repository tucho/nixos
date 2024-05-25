{ config, pkgs, ...}:

{
  programs.home-manager.enable = true;
  home = {
    username = "marcel";
    homeDirectory = "/home/marcel";
    packages = with pkgs; [];
    stateVersion = "24.05";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/download";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pictures";
    videos = "${config.home.homeDirectory}/videos";

    desktop = "${config.home.homeDirectory}/.desktop";
    publicShare = "${config.home.homeDirectory}/.public";
    templates = "${config.home.homeDirectory}/.templates";
  };

  xdg.enable = true;

  programs = {
    htop = {
      enable = true;
    };
  };
}
