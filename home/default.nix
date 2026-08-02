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
    (bun.overrideAttrs (old: rec {
      version = "1.3.14";
      src = pkgs.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64.zip";
        hash = "sha256-lR7iruhV8IWVruxiJSJqKY0/6oOj3NZGXAnLzN9+hI8=";
      };
    }))
    spotify
    flyctl
    openssl
    pnpm
  ];

  # Per-project toolchains via shell.nix + `use nix` in .envrc
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;

  # what release you want to pull pkgs from
  home.stateVersion = "26.05";
}
