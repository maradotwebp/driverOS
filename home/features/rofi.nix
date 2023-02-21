{ pkgs, config, osConfig, ... }:
{
  # Add scripts for drun & power
  scripts."menu-drun" = "rofi -show drun -show-icons -display-drun \"\"";
  scripts."menu-power" = ''
    MENU="$(echo -e "累 Reboot\n襤 Shutdown" | rofi -dmenu -i -p "󰍹" )"
    case "$MENU" in
        *Reboot) reboot ;;
        *Shutdown) shutdown -h 0
    esac
  '';

  # Config
  programs.rofi.enable = true;
  programs.rofi.package = pkgs.rofi-wayland;
  programs.rofi.font = "${config.theme.fonts.monospace} 11";
  programs.rofi.location = "left";
  programs.rofi.terminal = "${config.scripts."default-terminal"}";
  programs.rofi.theme = with osConfig.theme.colors;
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      "*" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral zinc."900".hex;
      };
      "element-icon, element-text, scrollbar" = {
        cursor = mkLiteral "pointer";
      };
      "window" = {
        width = mkLiteral "320px";
        height = mkLiteral "100%";
        x-offset = mkLiteral "42px";

        background-color = mkLiteral zinc."200".hex;
      };
      "inputbar" = {
        spacing = mkLiteral "8px";
        padding = mkLiteral "4px 8px";
        background-color = mkLiteral zinc."300".hex;
      };
      "prompt" = {
        padding = mkLiteral "4px";
        color = mkLiteral zinc."400".hex;
      };
      "entry, element-icon, element-text" = {
        vertical-align = mkLiteral "0.5";
      };
      "textbox" = {
        padding = mkLiteral "4px 8px";
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
      };
      "element normal urgent" = {
        text-color = mkLiteral red."700".hex;
      };
      "element normal active" = {
        text-color = mkLiteral slate."700".hex;
      };
      "element selected" = {
        text-color = mkLiteral slate."900".hex;
        background-color = mkLiteral slate."300".hex;
      };
      "element selected urgent" = {
        text-color = mkLiteral red."900".hex;
        background-color = mkLiteral red."300".hex;
      };
      "element-icon" = {
        size = mkLiteral "0.8em";
      };
      "element-text" = {
        text-color = mkLiteral "inherit";
      };
      "scrollbar" = {
        handle-width = mkLiteral "4px";
        handle-color = mkLiteral zinc."400".hex;
        padding = mkLiteral "0px 4px";
      };
    };
}