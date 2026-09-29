{ hw, ... }: {
  hw.power = { 
    nixos = { pkgs, ... }: {
      powerManagement.enable = true;
      services.thermald.enable = true;
      services.tuned = {
        enable = true;
      };
      services.upower.enable = true;

      # Automatic hibernate
      systemd.sleep.settings.Sleep = {
        HibernateDelaySec = "2h";
        SuspendState = "mem";
      };
      services.logind.settings.Login.LidSwitch = "suspend-then-hibernate";
      # IF above doesn't work try https://gist.github.com/mattdenner/befcf099f5cfcc06ea04dcdd4969a221
    };
  };
}
