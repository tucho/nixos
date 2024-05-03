{ config, lib, pkgs, ... }:

{
  users.users.marcel = {
    description = "Marcel Campello";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPassword = "$y$j9T$pqDxnGbmzPaho84A/V0gA1$2fDA/3dpa7gGlAYShr0qu.PAGET5gExTaUN0nkkiwY0";
    shell = pkgs.zsh;
  };
}
