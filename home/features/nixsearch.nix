{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "nixos-options-search" = {
      name = "Search NixOS Options";
      icon = "bluetooth";
      exec = "${pkgs.firefox}/bin/firefox --new-window \"https://search.nixos.org/options\"";
    };
    "nixos-package-search" = {
      name = "Search NixOS Packages";
      icon = "bluetooth";
      exec = "${pkgs.firefox}/bin/firefox --new-window \"https://search.nixos.org/packages\"";
    };
    "home-manager-options-search" = {
      name = "Search HomeManager Options";
      icon = "bluetooth";
      exec = "${pkgs.firefox}/bin/firefox --new-window \"https://mipmip.github.io/home-manager-option-search/\"";
    };
  };
}