{ sw, ... }: {
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
