{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 22;
        spacing = 0;

        modules-left   = [ "custom/logo" "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right  = [ "cpu" "memory" "pulseaudio" ];

        "custom/logo" = {
          format = "";
          tooltip = false;
        };

        "niri/workspaces" = {
          on-click = "activate";
          format = "";
          all-outputs = false;
        };

        clock = {
          format = "{:%a %d %b   %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        cpu = {
          interval = 5;
          format = "  {usage}%";
        };

        memory = {
          interval = 5;
          format = "  {percentage}%";
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = " muted";
          format-icons = {
            default = [ "" "" "" ];
          };
          tooltip-format = "{desc} — {volume}%";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
      };
    };

    style = ''
      * {
        font-family: "Inter", "JetBrainsMono Nerd Font", sans-serif;
        font-size: 12px;
        font-weight: 500;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      #clock,
      #cpu,
      #memory,
      #pulseaudio,
      #custom-logo {
        font-size: 14px;
        font-weight: 700;
      }

      window#waybar {
        background-color: rgba(10, 12, 24, 0.92);
        color: #c6cae0;
      }

      #custom-logo {
        color: #8c7bd6;
        font-size: 13px;
        padding: 0 10px 0 12px;
      }

      #workspaces {
        padding: 0 4px;
      }

      #workspaces button {
        padding: 0;
        margin: 9px 3px;
        min-width: 16px;
        min-height: 4px;
        font-size: 0;
        background-color: #4a4d64;
        border-radius: 999px;
        border: none;
        box-shadow: none;
        outline: none;
        transition: min-width 220ms cubic-bezier(0.2, 0.8, 0.2, 1),
                    background-color 220ms cubic-bezier(0.2, 0.8, 0.2, 1);
      }

      #workspaces button:hover {
        background-color: #8a8fae;
        box-shadow: none;
      }

      #workspaces button.active,
      #workspaces button.focused {
        background-color: #c6cae0;
        min-width: 50px;
      }

      #workspaces button.urgent {
        background-color: #c95f6b;
      }

      #clock {
        color: #eef0fa;
        padding: 0 14px;
        letter-spacing: 0.3px;
      }

      #cpu,
      #memory,
      #pulseaudio {
        padding: 0 8px;
      }

      #cpu        { color: #74b09a; }
      #memory     { color: #ecca8a; }
      #pulseaudio { color: #2bb0d6; padding-right: 12px; }
    '';
  };
}
