{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pass-wayland.withExtensions (exts: [ exts.pass-otp ]))
  ];
}
