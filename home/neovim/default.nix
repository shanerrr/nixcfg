{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Source of truth is github:shanerrr/nvim, not this repo.
  xdg.configFile."nvim".source = inputs.nvim-config;

  home.packages = with pkgs; [
    gcc          # tree-sitter compiles parsers with a C compiler
    gnumake
    ripgrep      # snacks.picker grep
    fd           # snacks.picker files
    nodejs       # many LSP servers / Mason-installed tools
  ];
}
