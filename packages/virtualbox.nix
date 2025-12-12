{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    headless = true;
    addNetworkInterface = true;
  };

  users.extraGroups.vboxusers.members = [ "marcel" ];
}
