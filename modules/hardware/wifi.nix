{ den, ... }: {
  den.aspects.wifi = {
    nixos = { pkgs, ... }: {
      networking.wireless.iwd.enable = true;

      environment.systemPackages = with pkgs; [
        impala
      ];
    };
  };
}
