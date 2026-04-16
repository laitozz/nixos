{ hw, ... }: {
  hw.power = { 
    nixos = { pkgs, ... }: {
      powerManagement.enable = true;
      services.tuned = {
        enable = true;
      };
      services.upower.enable = true;
    };
  };
}
