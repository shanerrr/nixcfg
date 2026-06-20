{ osConfig, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    # syntaxHighlighting = {
    #   enable = true;
    #   styles.unknown-token = "fg=#c95f6b";
    # };
    history = {
      size = 10000;
      save = 10000;
      ignoreAllDups = true;
      share = true;
      extended = true;
    };
    initContent = ''
      PROMPT='%F{#2bb0d6}[%n@%m:%~]%f%# '
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4a4d64"
    '';
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#${osConfig.networking.hostName}";
    };
  };
}
