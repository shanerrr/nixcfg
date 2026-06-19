{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 12";
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./theme.rasi;
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      drun-display-format = "{name}";
      display-drun = "Apps";
      display-run = "Run";
      display-window = "Window";
      sidebar-mode = false;
    };
  };
}
