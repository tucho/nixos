{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nvtopPackages.full
  ];
}

