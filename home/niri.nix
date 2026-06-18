{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 6;
    };
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12;
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  }

  programs.niri.settings = {
    input.keyboard.xkb.layout = "us";
    input.touchpad = {
      tap = true;
      natural-scroll = true;
    };

    # Layout
    layout = {
      gaps = 8;
      # focus-ring = { width = 2; active.color = "#7aa2f7"; };
    };

    # Programs to launch on startup
    spawn-at-startup = [
      # { command = [ "waybar" ]; }
    ];

    # Keybinds  (Mod = Super)
    binds = with config.lib.niri.actions; {
      "Mod+T".action = spawn "kitty";          # <- your terminal
      "Mod+Space".action = spawn-sh "rofi -show drun";         # app launcher
      "Mod+Shift+Slash".action = show-hotkey-overlay;

      "Mod+Q".action = close-window;
      "Mod+Shift+E".action = quit;

      # Focus
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;
      "Mod+H".action = focus-column-left;
      "Mod+L".action = focus-column-right;
      "Mod+K".action = focus-window-up;
      "Mod+J".action = focus-window-down;

      # Move
      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Right".action = move-column-right;
      "Mod+Ctrl+Up".action = move-window-up;
      "Mod+Ctrl+Down".action = move-window-down;

      # Sizing
      "Mod+R".action = switch-preset-column-width;
      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";

      # Consume / expel windows into / out of a column
      "Mod+Comma".action = consume-window-into-column;
      "Mod+Period".action = expel-window-from-column;

      # Workspaces
      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+Shift+1".action = move-column-to-workspace 1;
      "Mod+Shift+2".action = move-column-to-workspace 2;
      "Mod+Shift+3".action = move-column-to-workspace 3;
      "Mod+Shift+4".action = move-column-to-workspace 4;
      "Mod+Page_Up".action = focus-workspace-up;
      "Mod+Page_Down".action = focus-workspace-down;

      # Overview
      "Mod+O".action = toggle-overview;

      # Screenshots
      "Print".action = screenshot;
      "Mod+Print".action = screenshot-window;

      # Volume (PipeWire)
      "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+";
      "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
      "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
    };
  };
}
