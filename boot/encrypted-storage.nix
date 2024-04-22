{ config, lib, pkgs, ... }:

{
  boot.initrd.luks.devices.luks.device = "/dev/disk/by-label/luks";
  services.fstrim.enable = false; # A luks encrypted ssd should not be trimmed, for security reasons.
}
