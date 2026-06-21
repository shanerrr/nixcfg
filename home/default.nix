{ pkgs, ... }:

{
  imports = [
    ./git
    ./niri
    ./neovim
    ./kitty
    ./rofi
    ./waybar
    ./zsh
  ];

  home.username = "shaner";
  home.homeDirectory = "/home/shaner";

  # Per-user packages go here
  home.packages = with pkgs; [
    fastfetch
    lazygit
    swaybg
    wl-clipboard
    claude-code
    discord
    bun
    spotify
  ];

  programs.home-manager.enable = true;

  # what release you want to pull pkgs from
  home.stateVersion = "26.05";
}
