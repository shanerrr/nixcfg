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
      version = "1.4.4";
      src = pkgs.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64.zip";
        hash = "sha256-v4zL+ysLgBWeD5ptFcVTF63YB3U028YTCj7bUvzLOVw=";
      };
    }))
    spotify
    flyctl
    cloudflared
    openssl
    pnpm
    inputs.herdr.packages.${pkgs.system}.default
  ];

  # Per-project toolchains via shell.nix + `use nix` in .envrc
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.home-manager.enable = true;

  # what release you want to pull pkgs from
  home.stateVersion = "26.05";
}
