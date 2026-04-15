{ den, ... }: {
  den.aspects.lait = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      (den.provides.user-shell "zsh")
      den.aspects.dotfiles
    ];
    homeManager = { pkgs, ... }: {
      # TODO: move this out of here
      # ideally to a shell aspect
      programs.gh.enable = true;
      programs.git = {
        enable = true;
        settings = {
          user.name = "Oiva Laitinen";
          user.email = "oiva.laitinen2@gmail.com";
          pull.rebase = "true";
        };
      };
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
