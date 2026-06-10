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
    sw.templates._.dev
    sw.desktop
    sw.hyprland
    sw.noctalia
    sw.ly
    sw.emacs
    sw.gaming
    sw.matugen
    sw.searxng
    sw.docker
    # sw.nextcloud # TODO: move to server
  ];
  sw.templates._.dev.includes = [
    sw.dev
  ];
  sw.templates._.extra.includes = [
    sw.minecraft # Broken?
  ];
}
