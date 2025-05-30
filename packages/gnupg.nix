{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs = {
      gpg = {
        enable = true;
        homedir = "${config.home-manager.users.marcel.xdg.dataHome}/gnupg";
        settings = {
          # Get rid of the copyright notice
          no-greeting = true;

          # Disable inclusion of the version string in ASCII armored output
          no-emit-version = true;

          # Disable comment string in clear text signatures and ASCII armored messages
          no-comments = true;

          # Display long key IDs
          keyid-format =  "long";

          # List keys and subkeys along with their fingerprints and keygrips
          with-fingerprint = true;
          with-subkey-fingerprint = true;
          with-keygrip = true;

          # Displays the validity of the keys
          list-options = "show-uid-validity";
          verify-options = "show-uid-validity";
        };
      };
    };

    services = {
      gpg-agent = {
        enable = true;
        enableZshIntegration = true;
        enableSshSupport = true;
        defaultCacheTtl = 3600;
        maxCacheTtl = 14400;
        defaultCacheTtlSsh = 3600;
        maxCacheTtlSsh = 14400;
        pinentry.package = pkgs.pinentry-curses;
        extraConfig = ''
          allow-emacs-pinentry
          allow-loopback-pinentry
        '';
        sshKeys = [
          "E7B465E1FA43A0A040C812CC35F8E03AFAA0BDAB"
        ];
      };
    };
  };
}
