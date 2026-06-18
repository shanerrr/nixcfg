# nixos-config

Personal NixOS configuration: flakes + home-manager + niri (Wayland). NixOS 26.05.

## Structure

    ~/nixxy/
    ├── flake.nix              # inputs: nixpkgs 26.05, home-manager, niri-flake
    ├── flake.lock
    ├── hosts/nixxy/
    │   ├── default.nix             # machine-specific: bootloader, hostname, user, timezone
    │   └── hardware-configuration.nix   # machine-generated, committed
    ├── modules/
    │   └── desktop.nix        # reusable desktop stack: niri, greetd/tuigreet, portals, pipewire
    └── home/                  # home-manager (per-user dotfiles) — NOT the /home filesystem path
        ├── default.nix        # imports niri.nix, neovim.nix
        ├── niri.nix           # kitty, rofi, niri keybinds
        ├── neovim.nix         # installs neovim + toolchain; symlinks ./nvim into ~/.config/nvim
        └── nvim/              # raw lazy.nvim config (init.lua, lua/, lazy-lock.json)

Rule: machine config → `hosts/`, desktop stack → `modules/`, per-user dotfiles → `home/`.
A `.nix` file does nothing unless it's in an `imports` list up the chain.

## Fresh install on a new machine

1. Boot the NixOS installer. Partition the disk (UEFI: ESP FAT32 + root), then mount:

       mount /dev/nvme0n1p2 /mnt
       mkdir -p /mnt/boot
       mount /dev/nvme0n1p1 /mnt/boot

2. Clone the repo and generate the hardware config:

       nix-shell -p git
       git clone https://github.com/shanerrr/nixxy /mnt/etc/nixos
       nixos-generate-config --root /mnt
       cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hosts/nixxy/

   Commit `hardware-configuration.nix` — flakes only see git-tracked files; the UUIDs are not secrets.

3. Install (use `nixos-install`, **not** `nixos-rebuild switch` — rebuild targets the live USB and fails the bootloader check):

       nixos-install --flake /mnt/etc/nixos#nixxy

       ## type your password
       nixos-enter --root /mnt -c 'passwd tony'
       reboot

   Set the root/user password when prompted, then reboot.

4. **Fix ownership immediately after first boot.** The repo was cloned as root; claim it before doing anything else:

       sudo chown -R shaner:users ~/nixxy

   A root-owned repo causes git "dubious ownership" errors and home-manager failures. Never run `sudo git` in this repo.

## Ongoing rebuilds

Always run from `~/nixxy` and stage new files before every rebuild:

    cd ~/nixxy
    git add -A
    sudo nixos-rebuild switch --flake .#nixxy

## Notes

- Flakes only read **git-tracked** files. Run `git add -A` before every rebuild or new files will appear "missing".
- `home/` (repo folder) ≠ `/home` (filesystem). Config goes in `~/nixxy/home/`, not `/home/`.
- niri keybinds replace **all** defaults — define every bind you need. VT switching (Ctrl+Alt+F2) is native, not a bind. Recovery if locked out: Ctrl+Alt+F2 → TTY.
- Use `pkgs.tuigreet`, not `pkgs.greetd.tuigreet` (moved to top-level).
- Don't put rofi/kitty in `systemPackages` — the home-manager modules install them.
- Let lazy.nvim manage plugins (don't use `programs.neovim.plugins`). Commit `lazy-lock.json` when updating plugins.
