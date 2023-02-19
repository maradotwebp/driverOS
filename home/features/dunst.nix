{ osConfig, pkgs, ... }:
{
  imports = [
    ./fonts.nix
  ];

  services.dunst.enable = true;
  services.dunst.iconTheme = {
    name = "Arc";
    package = pkgs.arc-icon-theme;
    size = "32x32";
  };
  services.dunst.settings = with osConfig.theme.colors; {
    global = {
      follow = "mouse";
      width = 400;
      notification_limit = 1;
      offset = "3x3";
      padding = 16;
      horizontal_padding = 16;
      frame_width = 1;
      idle_threshold = 120;
      font = "JetBrainsMono Nerd Font 10";
      markup = true;
      format = "<b>%s</b> %p\\n%b";
      vertical_alignment = "top";
      corner_radius = 3;
      word_wrap = true;
      icon_position = "left";
      mouse_middle_click = "close_all";
      mouse_right_click = "do_action";
      min_icon_size = 32;
      max_icon_size = 32;
      transparency = 10;
    };

    urgency_low = {
      background = slate."700".hex;
      foreground = slate."50".hex;
      frame_color = slate."800".hex;
      timeout = 10;
    };

    urgency_normal = {
      background = zinc."700".hex;
      foreground = zinc."50".hex;
      frame_color = zinc."800".hex;
      timeout = 10;
    };

    urgency_critical = {
      background = red."500".hex;
      foreground = red."900".hex;
      frame_color = red."600".hex;
      timeout = 0;
    };
  };
}