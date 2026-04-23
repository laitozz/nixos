{ sw, ... }: {
  sw.ly = {
    nixos = { pkgs, ... }: {
      # TODO: animation in github readme
      services.displayManager.ly.enable = true;
    };
  };
}
