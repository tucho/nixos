{ config, lib, pkgs, ... }:

{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_COLLATE = "C.UTF-8";
      LC_CTYPE = "C.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TIME = "C.UTF-8";
    };
  };
  time.timeZone = "America/Sao_Paulo";
}
