{ config, pkgs, ...}:

{
  programs.home-manager.enable = true;
  home = {
    username = "marcel";
    homeDirectory = "/home/marcel";
    packages = with pkgs; [];
    stateVersion = "24.05";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/download";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pictures";
    videos = "${config.home.homeDirectory}/videos";

    desktop = "${config.home.homeDirectory}/.desktop";
    publicShare = "${config.home.homeDirectory}/.public";
    templates = "${config.home.homeDirectory}/.templates";
  };

  xdg.enable = true;

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

    emacs = {
      enable = true;
      defaultEditor = true;
      startWithUserSession = "graphical";
    };
  };

  programs = {
    git = {
      enable = true;

      userName = "Marcel Campello";
      userEmail = "marcel.campello@prafrentex.com.br";

      aliases = {
        logg = "log --graph --pretty=format:'%C(yellow)%h%C(reset) %C(cyan)%ai%C(reset) %C(auto)%d%C(reset) %C(green)%an%C(reset) %C(magenta)%G?%C(reset) %s'";
      };

      extraConfig = {
        core = {
          whitespace = "warn,tab-in-indent";
          editor = "emacsclient -nw";
        };
        init = {
          defaultBranch = "main";
        };
        status = {
          showUntrackedFiles = "all";
        };
        commit = {
          gpgSign = true;
        };
        pull = {
          ff = "only";
        };
        push = {
          default = "simple";
        };
        merge = {
          conflictStyle = "diff3";
        };
        diff = {
          algorithm = "histogram";
        };
        submodule = {
          recurse = true;
        };
        color = {
          ui = "auto";
        };
        "color \"branch\"" = {
          current = "yellow reverse";
          local = "yellow";
          remote = "green";
        };
        "color \"diff\"" = {
          meta = "yellow bold";
          frag = "magenta bold";
          old = "red bold";
          new = "green bold";
          whitespace = "red reverse";
        };
        "color \"status\"" = {
          added = "yellow";
          changed = "green";
          untracked = "cyan";
        };
      };
    };

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
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

    firefox = {
      enable = true;
      profiles = {
        default = {
          isDefault = true;
          settings = {
            "browser.translations.automaticallyPopup" = false;
          };
        };
      };
    };
    htop = {
      enable = true;
    };
  };
}
