{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = "8 6";
      hide_window_decorations = true;
    };
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12;

    extraConfig = "include theme.conf";
  };

  xdg.configFile."kitty/theme.conf".source = ./theme.conf;
}
