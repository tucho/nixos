{ config, lib, pkgs, ... }:

{
  users.users.marcel = {
    description = "Marcel Campello";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPassword = "$y$j9T$fWKEC/G7TMicTl/TngjXw1$bFcTfK2URzqNPG0A6l09PPZcZGNzt9jM/N7FWnJSc69";
    shell = pkgs.zsh;
  };
}
