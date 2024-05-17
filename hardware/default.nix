{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./cpu.nix
    ./file-systems.nix
    ./gpu-intel.nix
    ./gpu-nvidia.nix
  ];
}
