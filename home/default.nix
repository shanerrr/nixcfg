{ config, pkgs, ... }:

{
  imports = [
    ./niri.nix
    ./neovim.nix
  ];

  home.username = "shaner";
  home.homeDirectory = "/home/shaner";

  # Per-user packages go here
  home.packages = with pkgs; [
  ];

  programs.home-manager.enable = true;

  # Match the release you installed from. Required by home-manager.
  home.stateVersion = "26.05";
}
