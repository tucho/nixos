{ config, lib, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    restart = true;
    package = pkgs.gtreed.tuigreet;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland --time --time-format '%Y-%m-%d %H:%M:%S'";
        user = "greeter";
      };
    };
  };
}
