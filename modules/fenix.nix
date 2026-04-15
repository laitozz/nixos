{ den, ... }: {
  # host aspect
  den.aspects.fenix = {
    includes = [
      den.aspects.packages
    ];
    # host NixOS configuration
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.hello ];
    };

    # host provides default home environment for its users
    provides.to-users.homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.vim ];
    };
  };
}
