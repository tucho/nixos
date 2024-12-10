{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.hurmit
      nerd-fonts.symbols-only
      noto-fonts
    ];
  };
}
