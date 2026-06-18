{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix    
    ../../modules/desktop.nix       
  ];

  ##### Flakes #####
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ##### Boot (UEFI) #####
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ##### Networking #####
  networking.hostName = "nixxy";   # must match nixosConfigurations.<name> in flake.nix
  networking.networkmanager.enable = true;

  time.timeZone = "America/Edmonton";       
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  ##### User #####
  users.users.shaner = {
    isNormalUser = true;
    description = "shaner";
    extraGroups = [ "wheel" "networkmanager" ]; # wheel = sudo
    initialPassword = "changeme";               # change with `passwd`
  };

  # The release you installed from. Don't change casually.
  system.stateVersion = "26.05";
}
