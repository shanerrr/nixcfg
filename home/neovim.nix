{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Put your init.lua / lua/ dir at home/nvim/.
  xdg.configFile."nvim".source = ./nvim;

  home.packages = with pkgs; [
    gcc          # tree-sitter compiles parsers with a C compiler
    gnumake
    ripgrep      # telescope live-grep
    fd           # telescope find_files
    nodejs       # many LSP servers / Mason-installed tools
    nerd-fonts.jetbrains-mono   # if your config expects glyphs
  ];
}
