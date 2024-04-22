{ config, lib, pkgs, ... }:

{
  boot = {
    # loaded in the 1st stage of the boot process
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "sd_mod"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];
      kernelModules = [
        "dm-snapshot"
      ];
    };

    # loaded in the 2nd stage of the boot process
    extraModulePackages = [ ];
    kernelModules = [
      "kvm-intel"
    ];
  };
}
