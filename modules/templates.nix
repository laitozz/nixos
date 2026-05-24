{ sw, ... }: {
  sw.templates._.base.includes = [
    sw.packages
    sw.dotfiles
    sw.git
    sw.fish
    sw.fonts
    sw.comma
    sw.direnv
    sw.ssh
    sw.syncthing
    sw.wireguard
    sw.sops
  ];
  sw.templates._.full.includes = [
    sw.templates._.base
    sw.desktop
    sw.hyprland
    sw.noctalia
    sw.ly
    sw.emacs
    sw.gaming
    sw.matugen
    # sw.nextcloud # TODO: move to server
  ];
  sw.templates._.extra.includes = [
    sw.minecraft # Broken?
  ];
}
