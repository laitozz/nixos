{ hw, ... }: {
  hw.wifi = {
    nixos = { pkgs, ... }: {
      networking.wireless.iwd.enable = true;
      # networking.networkmanager.enable = true;
      # networking.networkmanager.wifi.backend = "iwd";

      environment.systemPackages = with pkgs; [
        impala
      ];
    };
  };
}
