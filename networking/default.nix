{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "basilio";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };
}
