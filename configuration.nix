{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.initrd.luks.devices.luks.device = "/dev/disk/by-label/luks";
  services.fstrim.enable = false; # A luks encrypted ssd should not be trimmed, for security reasons.

  networking = {
    hostName = "basilio";
    networkmanager.enable = true;
  };

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

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
