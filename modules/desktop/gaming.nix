{ den, ... }:{
  sw.gaming = {
    includes = [ (den.provides.unfree [
      "steam"
      "steam-unwrapped"
    ])];
    nixos = { pkgs, ... }: {
      programs.steam.enable = true;
    };
  };
}
