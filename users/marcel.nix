{ config, lib, pkgs, ... }:

{
  users.users.marcel = {
    description = "Marcel Campello";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "vboxusers"
    ];
    hashedPassword = "$y$j9T$K2iavyFzTae6aLn0HqyDj1$umunQv.Q8Adjgubww92eX.6rKdElun3eAsG3nQ5oLx5";
    shell = pkgs.zsh;
  };

  home-manager.users.marcel = {
    programs.home-manager.enable = true;

    home = {
      username = "marcel";
      homeDirectory = "/home/marcel";
      packages = with pkgs; [];
      stateVersion = "24.05";
    };

    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;

        documents = "${config.home-manager.users.marcel.home.homeDirectory}/documents";
        download = "${config.home-manager.users.marcel.home.homeDirectory}/downloads";
        music = "${config.home-manager.users.marcel.home.homeDirectory}/music";
        pictures = "${config.home-manager.users.marcel.home.homeDirectory}/pictures";
        videos = "${config.home-manager.users.marcel.home.homeDirectory}/videos";

        desktop = "${config.home-manager.users.marcel.home.homeDirectory}/.desktop";
        publicShare = "${config.home-manager.users.marcel.home.homeDirectory}/.public";
        templates = "${config.home-manager.users.marcel.home.homeDirectory}/.templates";
      };
    };
  };
}
