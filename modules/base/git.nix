{ den, ... }: {
  den.aspects.git = {
    homeManager = { pkgs, ... }: {
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
  };
}
