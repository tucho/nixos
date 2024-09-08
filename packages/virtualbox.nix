{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    headless = true;
    addNetworkInterface = true;
  };
}
