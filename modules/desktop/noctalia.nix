{ sw, inputs, ... }: {
  sw.noctalia = {
    nixos = { pkgs, ... }: { 
      environment.systemPackages = [ pkgs.noctalia-shell ];
    };
  };
}
