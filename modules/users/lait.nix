{ den, ... }: {
  den.aspects.lait = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      (den.provides.user-shell "zsh")
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

    provides.to-hosts.user = { pkgs, ... }: {
      lait.initialPassword = "ok";
    };
  };
}
