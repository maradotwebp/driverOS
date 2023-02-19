{ pkgs, config, colors, ... }:
{
  imports = [
    ./alacritty.nix
    ./fonts.nix
  ];

  programs.rofi.enable = true;
  programs.rofi.package = pkgs.rofi-wayland;
  programs.rofi.font = "JetBrainsMono Nerd Font 12";
  programs.rofi.location = "left";
  programs.rofi.terminal = "${pkgs.alacritty}/bin/alacritty";
  programs.rofi.theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      "*" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral colors.withHashtag.base07;
      };
      "element-icon, element-text, scrollbar" = {
        cursor = mkLiteral "pointer";
      };
      "window" = {
        width = mkLiteral "320px";
        height = mkLiteral "calc(100% - 20px)";
        x-offset = mkLiteral "10px";
        y-offset = mkLiteral "10px";

        border = mkLiteral "1px";
        border-color = mkLiteral colors.withHashtag.base01;
        border-radius = mkLiteral "3px";
        background-color = mkLiteral colors.withHashtag.base00;
      };
      "inputbar" = {
        spacing = mkLiteral "8px";
        padding = mkLiteral "4px 8px";
        background-color = mkLiteral colors.withHashtag.base01;
      };
      "prompt" = {
        padding = mkLiteral "4px";
      };
      "entry, element-icon, element-text" = {
        vertical-align = mkLiteral "0.5";
      };
      "textbox" = {
        padding = mkLiteral "4px 8px";
        background-color = mkLiteral colors.withHashtag.base00;
      };
      "listview" = {
        padding = mkLiteral "4px 0px";
        columns = 1;
        scrollbar = true;
      };
      "element" = {
        padding = mkLiteral "4px 8px";
        spacing = mkLiteral "8px";
        border-radius = mkLiteral "3px";
        background-color = mkLiteral colors.withHashtag.base01;
      };
      "element normal urgent" = {
        text-color = mkLiteral colors.withHashtag.red;
      };
      "element normal active" = {
        text-color = mkLiteral colors.withHashtag.blue;
      };
      "element selected" = {
        text-color = mkLiteral colors.withHashtag.base01;
        background-color = mkLiteral colors.withHashtag.blue;
      };
      "element selected urgent" = {
        background-color = mkLiteral colors.withHashtag.red;
      };
      "element-icon" = {
        size = mkLiteral "0.8em";
      };
      "element-text" = {
        text-color = mkLiteral "inherit";
      };
      "scrollbar" = {
        handle-width = mkLiteral "4px";
        handle-color = mkLiteral colors.withHashtag.base02;
        padding = mkLiteral "0px 4px";
      };
    };
}