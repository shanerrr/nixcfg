# nixos-config

Personal NixOS configuration: flakes + home-manager + niri (Wayland).

## Structure

    .
    ├── flake.nix                 # inputs + nixosConfigurations.nixxy
    ├── hosts/
    │   └── nixxy/
    │       ├── default.nix             # machine-specific system config
    │       └── hardware-configuration.nix   # generated per-machine (add yours)
    ├── modules/
    │   └── desktop.nix           # reusable niri/Wayland desktop module
    └── home/
        ├── default.nix           # home-manager entry for the user
        └── niri.nix              # kitty + declarative niri keybinds

## First-time setup on a machine

1. Copy this repo somewhere, e.g. `~/nixos-config`.
2. Put the machine's generated hardware file at
   `hosts/nixxy/hardware-configuration.nix`:

       sudo cp /etc/nixos/hardware-configuration.nix hosts/nixxy/

3. Edit `hosts/nixxy/default.nix` (timezone, username, hostname) and the
   matching username in `flake.nix` + `home/default.nix`.
4. Stage everything so the flake can see it, then build:

       git add -A
       sudo nixos-rebuild switch --flake .#nixxy

## Notes

- Flakes only read **git-tracked** files. Run `git add -A` before every
  rebuild or new files will appear "missing".
- niri config lives in `home/niri.nix` and is validated at build time.
