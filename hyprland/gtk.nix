{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.papirus-icon-theme
    pkgs.catppuccin-papirus-folders
  ];
  
  home-manager.users.marcel = {
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 60;
      gtk.enable = true;
    };

    gtk = {
      enable = true;
      font = {
        package = pkgs.nerdfonts;
        name = "Hurmit Nerd Font Mono";
        size = 18;
      };
      iconTheme = {
        # package = pkgs.catppuccin-papirus-folders;
        package = (pkgs.catppuccin-papirus-folders.override { flavor = "latte"; accent = "green"; });
        name  = "Papirus-Dark";
      };
      # theme = {
      #   package = (pkgs.catppuccin-gtk.override { accents = [ "peach" ]; size = "standard"; variant = "mocha"; });
      #   name = "Catppuccin-Mocha-Standard-Peach-Dark";
      # };
    };
  };
}
