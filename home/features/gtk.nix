{ pkgs, ... }:
rec {
  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
    iconTheme = {
      name = "Tela";
      package = pkgs.tela-icon-theme;
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