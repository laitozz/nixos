{ den, hw, sw, ... }: {
  den.aspects.lait = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
    ];

    user = { pkgs, ... }: {
      initialPassword = "ok";
      shell = pkgs.fish;
    };

    homeManager = { pkgs, ... }: {
    };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: {
      time.timeZone = "Europe/Helsinki";
      time.hardwareClockInLocalTime = true;
    };
    
  };
}
