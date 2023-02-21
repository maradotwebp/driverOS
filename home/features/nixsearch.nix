{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "nixos-options-search" = {
      name = "Search NixOS Options";
      exec = "${pkgs.firefox}/bin/firefox --new-window \"https://search.nixos.org/options\"";
    };
    "nixos-package-search" = {
      name = "Search NixOS Packages";
      exec = "${pkgs.firefox}/bin/firefox --new-window \"https://search.nixos.org/packages\"";
    };
    "home-manager-options-search" = {
      name = "Search HomeManager Options";
      exec = "${pkgs.firefox}/bin/firefox --new-window \"https://mipmip.github.io/home-manager-option-search/\"";
    };
  };
}