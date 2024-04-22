{ config, lib, pkgs, ... }:

{
  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  users = {
    mutableUsers = false;

    users = {
      root.hashedPassword = null;

      marcel = {
        description = "Marcel Campello";
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
        hashedPassword = "$y$j9T$igJErpwi3Dadb.uXi/nbV.$mc3NZJ57ZLQKTA8grhSkCfGoiesBma0OoKR2qeRtQx9";
        shell = pkgs.zsh;
      };
    };
  };

  environment.systemPackages = with pkgs; [];

  programs = {
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
        settings = {
          allow-emacs-pinentry = "";
          allow-loopback-pinentry = "";
          default-cache-ttl = 300;
          default-cache-ttl-ssh = 300;
          max-cache-ttl = 3600;
          max-cache-ttl-ssh = 3600;
        };
      };
    };

    git = {
      enable = true;
      prompt.enable = true;
    };

    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
    };
  };

  services = {
    emacs = {
      defaultEditor = true;
      enable = true;
      startWithGraphical = false;
    };
  };
}
