{ config, lib, pkgs, ... }:

{
  boot.initrd.luks.devices.luks = {
    device = "/dev/disk/by-label/luks";
    allowDiscards = false;
  };
}
