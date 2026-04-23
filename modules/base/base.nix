{ sw, ... }: {
  sw.base.includes = [
    sw.packages
    sw.dotfiles
    sw.git
    sw.fish
    sw.comma
    sw.direnv
  ];
}
