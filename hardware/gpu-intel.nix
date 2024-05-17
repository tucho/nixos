{ config, lib, pkgs, ... }:

{
  boot = {
    initrd.kernelModules = [
      "i915"
    ];
    kernelParams = [
      "i915.enable_fbc=1"
      "i915.enable_guc=2"
    ];
  };
}
