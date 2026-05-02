{ sw, ... }: {
  sw.full.includes = [
    sw.base
    sw.desktop
    sw.hyprland
    sw.noctalia
    sw.ly
    sw.emacs
    sw.gaming
  ];
  sw.base.includes = [
    sw.packages
    sw.dotfiles
    sw.git
    sw.fish
    sw.fonts
    sw.comma
    sw.direnv
    sw.syncthing
  ];
}
