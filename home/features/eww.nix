{ pkgs, config, osConfig, ... }:
{
  # Launch Eww on WM init
  events."wm-init" = "${pkgs.eww-wayland}/bin/eww open main";

  # Eww config
  xdg.configFile = {
    "eww/eww.yuck".text = ''
      (defvar workspaces "[1, 2, 3, 4, 5, 6, 7, 8, 9]")
      (deflisten current_workspace :initial "1" "${pkgs.bash}/bin/bash ~/.config/eww/scripts/get-active-workspace")
      (defpoll hour :interval "1m" `date +%H`)
      (defpoll min :interval "1s" `date +%M`)
      (defpoll sec :interval "1s" `date +%S`)
      (defpoll weekday :interval "1m" `date +%a`)
      (defpoll day :interval "1m" `date +%d`)
      (defpoll month :interval "1m" `date +%m`)
      (defpoll year :interval "1m" `date +%y`)
      (deflisten volume :initial "100%" `${pkgs.pulseaudio}/bin/pactl subscribe | grep --line-buffered "sink" | xargs -n1 ${pkgs.pamixer}/bin/pamixer --get-volume-human`)

      (defwidget workspaces []
        (box :orientation "vertical"
          (for workspace in workspaces
            (eventbox :onclick "hyprctl dispatch workspace ''${workspace}"
              (box :class "workspace ''${workspace == current_workspace ? "current" : ""}"
                (label :text "''${workspace == current_workspace ? "" : ""}")
              )
            )
          )
        )
      )
      (defwidget time []
        (box :orientation "vertical" :class "card"
          (label :text "''${hour}")
          (label :text "''${min}")
          (label :text "''${sec}")
        )
      )
      (defwidget volume []
        (eventbox :onscroll "volumectl -u {}" :onclick "volumectl toggle-mute"
          (box :orientation "vertical" :class "card" :spacing 4
            (label :text "󰋋")
            (label :text "''${volume == "muted" ? "󰝟" : volume == "100%" ? "!!!" : volume}")
          )
        )
      )
      (defwidget battery []
        (box :orientation "vertical" :class "card" :spacing 4
          (label :text "󰁹")
          (label :visible {EWW_BATTERY["BAT0"]["capacity"] != 100} :text "''${EWW_BATTERY["BAT0"]["capacity"]}%")
        )
      )
      (defwidget date []
        (box :orientation "vertical" :class "card"
          (label :text "''${weekday}")
          (label :text "''${day}")
          (label :text "''${month}")
          (label :text "''${year}")
        )
      )
      (defwidget aligned-box [valign]
        (box
          :spacing 10
          :space-evenly false
          :valign valign
          :halign "fill"
          :orientation "vertical"
          (children)
        )
      )

      (defwindow main
        :monitor 0
        :geometry (geometry
          :x "0px"
          :y "0px"
          :width "42px"
          :height "100%"
          :anchor "top left"
        )
        :stacking "fg"
        :exclusive true
        :focusable false
        (centerbox :orientation "vertical" :class "window"
          (aligned-box :valign "start"
            (workspaces)
          )
          (aligned-box :valign "center"
            (time)
          )
          (aligned-box :valign "end"
            (volume)
            (battery)
            (date)
          )
        )
      )
    '';

    "eww/eww.scss".text = with osConfig.theme.colors; ''
      * {
        background-color: inherit;
      }
      window {
        background-color: ${zinc."50".hex};
      }
      .window {
        padding: 12px 6px;
      }
      .workspace {
        font: 18px "${config.theme.fonts.monospace}";
        color: ${zinc."400".hex};
      }
      .workspace.current {
        color: ${zinc."800".hex};
      }
      .card {
        color: ${zinc."900".hex};
        background-color: ${zinc."200".hex};
        font: 12px "${config.theme.fonts.monospace}";
        border-radius: 3px;
        padding: 4px;
      }
    '';

    "eww/scripts/get-active-workspace" = {
      text = ''
        #!/usr/bin/env bash
        hyprctl monitors -j | ${pkgs.jq}/bin/jq --raw-output .[0].activeWorkspace.id
        ${pkgs.socat}/bin/socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - \
          | stdbuf -o0 grep '^workspace>>' \
          | stdbuf -o0 awk -F '>>|,' '{print $2}'
      '';
      executable = true;
    };
  };
}