{ pkgs, inputs, ... }:

{
  imports = [
    ./git
    ./niri
    ./neovim
    ./kitty
    ./rofi
    ./waybar
    ./zsh
    inputs.zen-browser.homeModules.twilight-official
  ];

  home.username = "shaner";
  home.homeDirectory = "/home/shaner";

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  # Per-user packages go here
  home.packages = with pkgs; [
    fastfetch
    lazygit
    swaybg
    wl-clipboard
    claude-code
    discord
    (bun.overrideAttrs (old: rec {
      version = "1.4.0";
      src = pkgs.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64.zip";
        hash = "sha256-LQP7X7g6yLVnrKCigbLOGhoZ1Ij1bClo2Iw/Jekv5FI=";
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
