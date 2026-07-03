{ lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop.nix
  ];

  #### Nvidia (latest open drivers) #####
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = true;

    nvidiaSettings = true;
    nvidiaPersistenced = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Cap NVIDIA's free buffer pool so niri/Wayland doesn't leak VRAM.
  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = ''
    {
      "rules": [ { "pattern": [], "profile": "Limit Free Buffer Pool" } ],
      "profiles": [
        {
          "name": "Limit Free Buffer Pool",
          "settings": [ { "key": "GLVidHeapReuseRatio", "value": 0 } ]
        }
      ]
    }
  '';

  # enable unfree for only certain packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "claude-code" "discord" "nvidia-x11" "nvidia-settings" "nvidia-persistenced" "nvidia-kernel-modules" "spotify" "steam" "steam-unwrapped" "steam-original" "steam-run"];

  ##### Flakes #####
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ##### Boot (UEFI) #####
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ##### Networking #####
  networking.hostName = "nixxy";   # must match nixosConfigurations.<name> in flake.nix
  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
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
