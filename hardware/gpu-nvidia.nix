{ config, lib, pkgs, ... }:

{
  hardware = {
    nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        reverseSync.enable = true;
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
    graphics = {
      enable = true;
    };
  };
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = lib.mkDefault [
    "nvidia" # Load nvidia driver for Wayland too.
  ];
}
