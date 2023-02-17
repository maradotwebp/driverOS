{ colors, pkgs, ... }:
{
  # DUNST
  services.dunst.enable = true;
  services.dunst.iconTheme = {
    name = "Arc";
    package = pkgs.arc-icon-theme;
    size = "32x32";
  };
  services.dunst.settings = {
    global = {
      follow = "mouse";
      width = 400;
      notification_limit = 1;
      offset = "5x5";
      padding = 16;
      horizontal_padding = 16;
      frame_width = 0;
      idle_threshold = 120;
      font = "Monospace 10";
      markup = true;
      format = "<b>%s</b> %p\\n%b";
      vertical_alignment = "top";
      corner_radius = 2;
      word_wrap = true;
      icon_position = "left";
      mouse_middle_click = "close_all";
      mouse_right_click = "do_action";
      min_icon_size = 32;
      max_icon_size = 32;
      transparency = 10;
    };

    urgency_low = {
      background = colors.withHashtag.blue;
      foreground = colors.withHashtag.base07;
      timeout = 10;
    };

    urgency_normal = {
      background = colors.withHashtag.base01;
      foreground = colors.withHashtag.base07;
      timeout = 10;
    };

    urgency_critical = {
      background = colors.withHashtag.red;
      foreground = colors.withHashtag.base07;
      timeout = 0;
    };
  };
}