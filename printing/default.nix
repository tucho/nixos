{ config, lib, pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.epson-escpr ];
    };

    system-config-printer.enable = true;

    # enable autodiscovery of network printers
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
