{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs.wezterm.enable = true;
    xdg.configFile."wezterm/wezterm.lua".source = ./config/wezterm/wezterm.lua;
  };
}
