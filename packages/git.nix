{ config, lib, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      prompt.enable = true;
    };
  };

  home-manager.users.marcel = {
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
    };
  };
}
