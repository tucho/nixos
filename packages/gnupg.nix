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
        defaultCacheTtl = 300;
        maxCacheTtl = 3600;
        defaultCacheTtlSsh = 300;
        maxCacheTtlSsh = 3600;
        pinentryPackage = pkgs.pinentry-curses;
        extraConfig = ''
        allow-emacs-pinentry
        allow-loopback-pinentry
      '';
      };
    };
  };
}
