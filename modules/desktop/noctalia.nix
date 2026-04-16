{ den, inputs, ... }: {
  den.aspects.noctalia = {
    nixos = { pkgs, ... }: { 
      environment.systemPackages = [ pkgs.noctalia-shell ];
    };
  };
}
