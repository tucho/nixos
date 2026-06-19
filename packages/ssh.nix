{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs = {
      ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings = {
          "*" = {
            header = ''
              Match host * exec "gpg-connect-agent UPDATESTARTUPTTY /bye"
            '';
            AddKeysToAgent = "no";
            Compression = false;
            ControlMaster = "no";
            ControlPath = "~/.ssh/master-%r@%n:%p";
            ControlPersist = "no";
            ForwardAgent = false;
            HashKnownHosts = false;
            ServerAliveCountMax = 3;
            ServerAliveInterval = 0;
            UserKnownHostsFile = "~/.ssh/known_hosts";
          };
        };
      };
    };
  };
}
