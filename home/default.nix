{ config, pkgs, ... }:

{
  imports = [
    ./niri
    ./neovim
    ./kitty
  ];

  home.username = "shaner";
  home.homeDirectory = "/home/shaner";

  # Per-user packages go here
  home.packages = with pkgs; [
    fastfetch
    lazygit
  ];

  programs.home-manager.enable = true;

  # what release you want to pull pkgs from
  home.stateVersion = "26.05";
}
