{ sw, ... }: {
  sw.ly = {
    nixos = { pkgs, ... }: {
      # TODO: animation in github readme
      services.displayManager.ly = {
        enable = true;
        # NOTE: Doesn't work with settings enabled
        # settings = {
        #   animate = true;
        #   animation = "cmatrix";
        # };
      };
    };
  };
}
