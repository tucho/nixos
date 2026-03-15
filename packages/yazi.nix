{ config, lib, pkgs, ... }:

{
  services.udisks2.enable = true;
  
  home-manager.users.marcel = {
    programs = {
      yazi = {
        enable = true;
        enableZshIntegration = true;
        plugins = {
          mount = pkgs.yaziPlugins.mount;
        };
        keymap = {
          mgr.prepend_keymap = [
            # Example keybinding: press 'm' to run the mount pluging
            { on = ["m"]; run = "plugin mount"; desc = "Mount manager"; }
          ];
        };
      };
    };
  };
}
