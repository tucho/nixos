{ config, lib, pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
    tuned.enable = true;
  };
}
