{ config, lib, pkgs, ... }:

{
  boot = {
    plymouth.enable = true;
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
    ];
  };
}
