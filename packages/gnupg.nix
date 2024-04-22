{ config, lib, pkgs, ... }:

{
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
  };
}
