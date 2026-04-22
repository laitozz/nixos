{ den, hw, sw, ... }: {
  den.aspects.lait = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      sw.base
      sw.desktop
    ];

    # To every host that has user 'lait'
    # Currently used for hardware config
    provides.to-hosts.includes = [
      hw.wifi
      hw.bluetooth
      hw.power
      hw.grub
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
      # TODO: move this somewhere
      time.timeZone = "Europe/Helsinki";
      time.hardwareClockInLocalTime = true;
    };
    
  };
}
