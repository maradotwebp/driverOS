{ pkgs, ... }:
rec {
  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
    };
    theme = {
      name = "Omni";
      package = pkgs.omni-gtk-theme;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = gtk.theme.name;
      "Net/IconThemeName" = gtk.iconTheme.name;
    };
  };
}