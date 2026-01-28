{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/top_level";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/top_level";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "compress=zstd"
        "noatime"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-label/top_level";
      fsType = "btrfs";
      options = [
        "subvol=@home"
        "compress=zstd"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-label/swap";
    }
  ];
}
