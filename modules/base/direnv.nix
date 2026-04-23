{
  sw.direnv.nixos = {
    programs = {
      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
      };
    };
  };
}
