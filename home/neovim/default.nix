{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim".source = ./nvim;

  home.packages = with pkgs; [
    gcc          # tree-sitter compiles parsers with a C compiler
    gnumake
    ripgrep      # snacks.picker grep
    fd           # snacks.picker files
    nodejs       # many LSP servers / Mason-installed tools
  ];
}
