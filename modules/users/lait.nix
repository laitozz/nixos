{ den, ... }: {
  den.aspects.lait = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      den.aspects.dotfiles
      den.aspects.git
      den.aspects.fish
    ];
    homeManager = { pkgs, ... }: {
    };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: {
    };

    
    user = { pkgs, ... }: {
      initialPassword = "ok";
      shell = pkgs.fish;
    };
  };
}
