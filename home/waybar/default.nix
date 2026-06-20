{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;

        modules-left   = [ "custom/logo" "niri/workspaces" ];
        modules-center = [ "clock" ];

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
