{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs = {
      ssh = {
        enable = true;
        forwardAgent = true;

        matchBlocks = {
          "*" = {
            match = ''
              host * exec "gpg-connect-agent UPDATESTARTUPTTY /bye"
            '';
          };
        };
      };
    };
  };
}
