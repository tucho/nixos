{ config, lib, pkgs, ... }:

{
  users.users.marcel = {
    description = "Marcel Campello";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPassword = "$y$j9T$igJErpwi3Dadb.uXi/nbV.$mc3NZJ57ZLQKTA8grhSkCfGoiesBma0OoKR2qeRtQx9";
    shell = pkgs.zsh;
  };
}
