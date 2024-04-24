{ config, lib, pkgs, ... }:

{
  boot.loader = {
    timeout = 0;
    systemd-boot = {
      enable = true;
      editor = false;
      consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
  };
}
