{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 18;
        spacing = 0;

        modules-left   = [ "custom/logo" "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right  = [ ];

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
      };
    };

    style = ./style.css;
  };
}
