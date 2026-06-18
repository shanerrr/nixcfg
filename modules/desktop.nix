{ config, pkgs, ... }:

{
  ##### niri (configured via niri-flake) #####
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;   
  niri-flake.cache.enable = false;     

  # Firefox (browser)
  programs.firefox.enable = true;

  # Graphical login that starts a niri session
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
      user = "greeter";
    };
  };

  ##### Wayland essentials #####
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  ##### Audio #####
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Run Electron/Chromium apps natively on Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    git
  ];

  fonts.packages = with pkgs; [ noto-fonts dejavu_fonts ];
}
